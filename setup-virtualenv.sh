#!/usr/bin/env bash
# Copyright 2017, Reef Technologies (reef.pl), All rights reserved.

PROJECT_DIR=`cd "$(dirname "${BASH_SOURCE[0]}")" && pwd`
PROJECT_NAME=`basename $PROJECT_DIR`

# Setup virtual environment
if [ -z $VIRTUAL_ENV ]; then
    # Source virtualenvwrapper if it's needed
    [[ $(type -t mkvirtualenv) == "function" ]] || source `which virtualenvwrapper.sh`

    if [ ! -d "${WORKON_HOME}/${PROJECT_NAME}" ];
    then
        eval "mkvirtualenv -a ${PROJECT_DIR} ${PROJECT_NAME}"
    fi

    eval "workon ${PROJECT_NAME}"
fi


# Install pip packages
if [ `pip freeze | wc -l` -le "1" ];
then
    echo "Installing pip development requirements"

    eval "pip install --upgrade -r ${PROJECT_DIR}/backend/src/requirements.txt -r ${PROJECT_DIR}/backend/src/requirements-dev.txt"
fi


# Set default docker-compose.yml file
ln -sf dc-virtualenv.yml docker-compose.yml


# Backup .env file
[[ ! -f "${PROJECT_DIR}/.env" ]] || mv "${PROJECT_DIR}/.env" "${PROJECT_DIR}/.env~"

# Load .envrc from backup
[[ ! -f "${PROJECT_DIR}/.envrc~" ]] || mv "${PROJECT_DIR}/.envrc~" "${PROJECT_DIR}/.envrc"

# Create .envrc from template
[[ -f "${PROJECT_DIR}/.envrc" ]] || cp "${PROJECT_DIR}/.envrc.template" "${PROJECT_DIR}/.envrc"


# Enable direnv
eval "direnv allow"
