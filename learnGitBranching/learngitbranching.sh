#!/bin/bash

readonly IMAGE_NAME="learn_git_branching"
readonly CONTAINER_NAME="learn_git_branching"
readonly PORT="12345"

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
        echo "Script for starting a container for running a local instance of learnGitBranching (https://learngitbranching.js.org/)"
        echo "Call with argument: "
        echo
        echo "install   ... creates learnGitBranching container"
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
