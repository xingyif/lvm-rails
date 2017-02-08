#!/bin/sh

if [[ $TRAVIS_BRANCH = "master" && $TRAVIS_PULL_REQUEST = "false" ]]; then
  echo "Attempting to update CCS repo..."
  git clone git@github.com:LiteracyVolunteersOfMA/lvm-rails.git

  cd lvm-rails

  git remote add ccs_github https://$GH_TOKEN@github.ccs.neu.edu:CS4500Sp17/Literacy-Volunteers-of-Massachusetts.git

  git fetch ccs_github

  git reset --hard origin/master
  git push ccs_github -f
else
  echo "Skipping auto-sync of non master branch build."
fi
