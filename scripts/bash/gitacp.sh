#!/bin/bash
# Add Commit Push

# Try to save current branch name to variable
# Redirect stderr to null to keep output from being clogged
current_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

# If current_branch is empty, the current folder is not in a git repo
if [ "$current_branch" = "" ]; then
  echo Not a git repo
else
  read -p  "Commit message: [$current_branch] " message
  git add -A
  git commit -m "[$current_branch] $message"
  git push origin $current_branch  
fi