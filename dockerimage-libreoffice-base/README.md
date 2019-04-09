# LibreOffice Build Environment
## dockerimage-libreoffice-base

Docker image, which provides a basic build environment to build LibreOffice. This image is used as a base for my dockerimage-libreoffice-user and dockerimage-libreoffice-jenkins projects.

## What does it provide?

This docker container provides all the stuff that is necessary to build LibreOffice from its git source. It is based on ubuntu:devel and replaces the entries in the sources.list with bionic (at the point of coding this there is now bionic image available).

## How to build the image?

    docker build -t lobase-bionic[:TAG] .

After this step you can tag and push it to your private registry f.e.:

    docker tag lobase-bionic[:TAG] portus.hibiki.eu/lobase-bionic[:TAG]
    docker login portus.hibiki.eu
    docker push portus.hibiki.eu/lobase-bionic[:TAG]
    docker logout

If you want to use this image as a base for your own container and put it on your private registry you have to use

    FROM portus.hibiki.eu/lobase-bionic[:TAG]

in the Dockerfile of your deriving image (else it does connect to Docker Hub and searches it there).

## How to use?

    docker run -ti lobase-bionic[:TAG] bash
    # mkdir /home/user
    # cd /home/user
    # git clone git://anongit.freedesktop.org/libreoffice/core
    # cd core
    # make

If you want to use a directory of your host system it is recommended to use ther deriving image louser-bionic from dockerimage-libreoffice-user. If you want to use it with Jenkins head over to the project dockerimage-libreoffice-jenkins or use the image lojenkins-bionic.