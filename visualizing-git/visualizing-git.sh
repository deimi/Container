#!/bin/bash

readonly IMAGE_NAME="visualizing-git"
readonly CONTAINER_NAME="visualizing-git"
readonly PORT="12346"

case ${1} in
    "install")
        docker build -t ${IMAGE_NAME}:latest .
        docker create -p ${PORT}:80 --name ${CONTAINER_NAME} ${IMAGE_NAME}
        ;;

    "start")
        docker start ${CONTAINER_NAME}
        ;;

    "stop")
        docker stop ${CONTAINER_NAME}
        ;;

    "uninstall")
        docker stop ${CONTAINER_NAME}
        docker container rm ${CONTAINER_NAME}
        docker image rm ${IMAGE_NAME}
        ;;

    *)
        echo "Script for starting a container for running a local instance of visualizing-git (http://git-school.github.io/visualizing-git/)"
        echo "Call with argument: "
        echo
        echo "install   ... creates visualizing-git container"
        echo "start     ... start container"
        echo "              On success you can call localhost:${PORT} in your browser"
        echo "stop      ... stop container"
        echo "uninstall ... removes container and image"
        exit 0
        ;;

esac

echo
echo "... script finished"
exit 0
