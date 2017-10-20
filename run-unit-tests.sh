#!/bin/bash -e
# Copyright 2017, Reef Technologies (reef.pl), All rights reserved.

PROJECT_DIR=`cd "$(dirname "${BASH_SOURCE[0]}")" && pwd`
PROJECT_NAME=`basename $PROJECT_DIR`

# Setup virtual environment
if [ -z $VIRTUAL_ENV ]; then
    echo "You must run tests from virtual environment!"
    exit 1
fi

eval "cd ${PROJECT_DIR}/backend/src && python ./manage.py test"

exit $?
