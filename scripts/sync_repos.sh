#!/bin/bash

if [[ $TRAVIS_BRANCH = "master" && $TRAVIS_PULL_REQUEST = "false" ]]; then
  echo "Attempting to update CCS repo..."
  git clone https://github.com/LiteracyVolunteersOfMA/lvm-rails.git

  cd lvm-rails

  GIT_SSL_NO_VERIFY=true git remote add ccs_github https://github.ccs.neu.edu/CS4500Sp17/Literacy-Volunteers-of-Massachusetts.git

  git fetch ccs_github

  git reset --hard origin/master
  GIT_SSL_NO_VERIFY=true git push ccs_github -f
else
  echo "Skipping auto-sync of non master branch build."
fi
