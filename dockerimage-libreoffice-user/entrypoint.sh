#!/bin/bash

# Add local user
USER_ID=${LOCAL_USER_ID}
USER_GID=${LOCAL_USER_GID}

if [ -n "$USER_ID" ] && [ -n "$USER_GID" ]
then
    echo "Starting with UID $USER_ID and GID $USER_GID"
    groupadd -g $USER_GID user
    useradd --shell /bin/bash -u $USER_ID -g $USER_GID -o -c "" -m user
    export HOME=/home/user

    exec gosu user /bin/bash
else
    exec bash
fi
