# LibreOffice Build Environment
## dockerimage-libreoffice-user

Docker image, which provides a build environment to build LibreOffice and also provides UID and GID mapping for mounted volumes.

## What does it provide?

This docker container provides all the stuff that is necessary to build LibreOffice from its git source. In addition the entrypoint.sh script provicdes an easy way to map UID and GID for mounted user volumes (f.e. for working with git and IDE in host and only building with docker). It is based on lobase-bionic:latest (see repo dockerimage-libreoffice-base).

## How to build the image?

    docker build -t louser-bionic[:TAG] .

After this step you can tag and push it to your private registry f.e.:

    docker tag louser-bionic[:TAG] portus.hibiki.eu/louser-bionic[:TAG]
    docker login portus.hibiki.eu
    docker push portus.hibiki.eu/louser-bionic[:TAG]
    docker logout

## How to use?

If you want to use the UID and GID mapping of the entrypoint.sh:

    docker run -it -v /pth/to/code:~/pth/to/mnt -e LOCAL_USER_ID=$(id -u $USER) -e LOCAL_USER_GID=$(id -g $USER) louser-bionic[:TAG] bash
    $ cd ~/pth/to/mnt
    $ make

or if you want to use the fancy mapping via /etc/passwd and /etc/group (doesn't work with LDAP, hence the UID and GID mapping with entrypoint.sh):

    docker run -ti -v /pth/to/code:~/pth/to/mnt -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -u $(id -u $USER):$(id -g $USER) louser-bionic[:TAG] bash
    $ cd ~/pth/to/mnt
    $ make

you can also execute this container without UID and GID mapping. But this can possibly screw up your mounted files if the IDs don't match with your host. This is only recommended if you don't use the volume mapping of the docker image:

    docker run -ti louser-bionic[:TAG] bash
    # mkdir /home/user
    # cd /home/user
    # git clone git://anongit.freedesktop.org/libreoffice/core
    # cd core
    # make

For this last usecase it is enough and recommended to use the lobase-bionic:latest image (see repo: dockerimage-libreoffice-base).