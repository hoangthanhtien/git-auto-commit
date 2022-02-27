#!/bin/bash
GIT_PATH=$1
cd $GIT_PATH
LAST_COMMIT_MESSAGE=$(git log -1 --pretty=%B | cat)
CURRENT_GIT_BRANCH=$(git branch --show-current)
if [ $CURRENT_GIT_BRANCH = "master" ] || [ $CURRENT_GIT_BRANCH = "main" ]; then
  echo  "ERROR: Auto commit on branch ${CURRENT_GIT_BRANCH} is disabled"
else
  AUTO_COMMIT_MESSAGE="[In Progress] ${LAST_COMMIT_MESSAGE}"
  echo 'LAST_COMMIT_MESSAGE' $LAST_COMMIT_MESSAGE
  echo 'AUTO_COMMIT_MESSAGE' $AUTO_COMMIT_MESSAGE
fi
#cd $GIT_PATH && git commit