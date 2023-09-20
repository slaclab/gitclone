#!/bin/bash -x

GIT_REPO=${GIT_REPO}

# shoudl probably fail if GIT_REPO not defined
if [ -z "${GIT_REPO}" ]; then
  echo "ERROR: environment variable GIT_REPO must be specified. Exiting."
  exit 2;
fi

GIT_RELEASE=${GIT_RELEASE:-main}
GIT_UPDATE_INTERVAL=${GIT_UPDATE_INTERVAL:-300}
GIT_PATH=${GIT_PATH:-/app}
GIT_CLONE_ONLY=${GIT_CLONE_ONLY:-0}

# always ensure there's some documentation
mkdir -p ${GIT_PATH}
cd ${GIT_PATH}
git status
STATUS=$?
if [ $STATUS -gt 0 ]; then
    git clone ${GIT_REPO} .
fi

# do some funky stuff with git remove here

git checkout ${GIT_RELEASE}
git fetch origin

if [ ! $GIT_CLONE_ONLY ]; then
while :
do
  echo "$(date '+%Y-%m-%d %H%M.%S %z%Z') Updating git repo ${GIT_REPO}:${GIT_RELEASE}"
  git pull -q origin ${GIT_RELEASE}
  sleep ${GIT_UPDATE_INTERVAL}
done
fi
