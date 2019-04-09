# LibreOffice Build Environment
## dockerimage-libreoffice-user

Docker image, which provides a build environment to build LibreOffice and can be executed/used by Jenkins.

## What does it provide?

This docker container provides all the stuff that is necessary to build LibreOffice from its git source. In addition it offers a JNLP slave for Jenkins. It is based on lobase-bionic:latest (see repo dockerimage-libreoffice-base).

## How to build the image?

    docker build -t lojenkins-bionic[:TAG] .

After this step you can tag and push it to your private registry f.e.:

    docker tag lojenkins-bionic[:TAG] portus.hibiki.eu/lojenkins-bionic[:TAG]
    docker login portus.hibiki.eu
    docker push portus.hibiki.eu/lojenkins-bionic[:TAG]
    docker logout

## How to use?

TODO (might include informations about the Jenkins setup as well)