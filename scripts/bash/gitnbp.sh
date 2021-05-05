#! /bin/bash

# New Branch Push

# If current_branch is empty, the current folder is not in a git repo
current_branch=$(git rev-parse --abbrev-ref HEAD 2> null)
if [ "$current_branch" = "" ]; then
  echo Not a git repo
else
  read -p "New branch name: " branchname
  git checkout -b $branchname
  git push -u origin $branchname  
fi
