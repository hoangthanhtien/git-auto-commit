#!/bin/bash
GIT_PATH=$1
PUSH_MASTER_BRANCH=$2
cd $GIT_PATH
LAST_COMMIT_MESSAGE=$(git log -1 --pretty=%B | cat)
CURRENT_GIT_BRANCH=$(git branch --show-current)
if ([ $CURRENT_GIT_BRANCH = "master" ] || [ $CURRENT_GIT_BRANCH = "main" ]) && [ "$PUSH_MASTER_BRANCH" != "--push-master" ]; then
  echo  "ERROR: Auto commit on branch ${CURRENT_GIT_BRANCH} is disabled"
else
  if [[ $LAST_COMMIT_MESSAGE = "[In Progress]"* ]]; then
    AUTO_COMMIT_MESSAGE=$LAST_COMMIT_MESSAGE
  else
    AUTO_COMMIT_MESSAGE="[In Progress] ${LAST_COMMIT_MESSAGE}"
  fi
  git add .
  git commit -m "${AUTO_COMMIT_MESSAGE}"
  git push --set-upstream origin $CURRENT_GIT_BRANCH
fi