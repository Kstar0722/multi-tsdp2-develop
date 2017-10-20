#!/usr/bin/env bash
# Copyright 2017, Reef Technologies (reef.pl), All rights reserved.

if ! type inotifywait &> /dev/null
then
    echo -e "\e[31mPlease install inotify-tools, then try again.\e[39m"
    exit 1
fi

clear

while inotifywait -e create -e modify -e delete -r ./backend/src;
do
    clear
    ./run-unit-tests.sh
done
