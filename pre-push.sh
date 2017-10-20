#!/bin/bash -u
# Copyright 2017, Reef Technologies (reef.pl), All rights reserved.

base_remote="${1:-origin}"
base_branch="${2:-master}"
base_remote_branch="${3:-master}"

function header
{
    echo
    echo "#"
    echo "# $*"
    echo "#"
}

header Unit Tests

if ./run-unit-tests.sh
then
    echo -e "\e[32mUnit tests PASSED\e[39m"
else
    echo -e "\e[31mUnit tests FAILED\e[39m"
    exit 1
fi

header Checking Formatting

if ! type yapf &> /dev/null
then
    echo -e "\e[31mPlease install yapf, then try again.\e[39m"
    exit 1
fi

if [ "$(git rev-parse ${base_branch})" != "$(git rev-parse ${base_remote}/${base_remote_branch})" ]; then
    echo -e """\e[33mrunning yapf in full mode, because an assumption that master and origin/master are the same, is broken. To fix it, do this:
git checkout master
git pull --ff-only
then checkout your topic branch and run $0.
If the base branch on github is not called 'origin', invoke as $0 proper_origin_remote_name. Then your remote needs to be synched with your master too.
\e[39m"""
    echo -n 'running yapf... '
    yapf --in-place --recursive --exclude "**/migrations/*" ./backend/src
    echo -e '\e[32mdone\e[39m'
else
    echo -e '\e[39mrunning yapf in incremental mode\e[39m'
    head=`mktemp`
    master=`mktemp`
    git rev-list --first-parent HEAD > "$head"  # list of commits being a history of HEAD branch, but without commits merged from master after forking
    git rev-list origin/master > "$master"  # list of all commits on history of master

    changed_files=`git diff --name-only "$(git rev-parse --abbrev-ref HEAD)..${base_remote}/${base_remote_branch}"`
    dirty_files=`git ls-files -m`
    files_to_check="$((echo "$changed_files"; echo "$dirty_files") | grep '\.py$' | sort -u)"
    if [ -z "$files_to_check" ]; then
        echo -e '\e[33mnothing to run yapf on after all\e[39m'
    else
        echo -n 'running yapf... '
        echo "$files_to_check" | (while read file
        do
            if [ -e "$file" ]; then
                # in case file was added since master, but then was removed
                yapf --in-place --exclude "**/migrations/*" "$file" &
            fi
        done
        wait
        )
        echo -e '\e[32mdone\e[39m'
    fi
fi

header Flake8

for d in backend/src
do
    if flake8 --max-line-length=120 "$d"
    then
        echo
        echo -e "\e[32mflake8 passed on $d\e[39m"
    else
        echo
        echo -e "\e[31mflake8 FAILED on $d\e[39m"
        exit 1
    fi
done
