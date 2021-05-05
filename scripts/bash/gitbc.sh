#! /bin/bash

# Branch Cleanup
get_local_branches() {
  git branch --list --format '%(refname:lstrip=-1)'
}

get_remote_branches() {
  git branch -r --format '%(refname:lstrip=-1)'
}

contains() {
  local value="${1}"
  shift

  for item in $@; do
    [ "${item}" == "${value}" ] && return 0
  done

  return 1
}

# If current_branch is empty, the current folder is not in a git repo
current_branch=$(git rev-parse --abbrev-ref HEAD 2> null)
if [ "$current_branch" = "" ]; then
  echo Not a git repo
else
  git fetch --prune

  local_branches=("$(get_local_branches)")
  remote_branches=("$(get_remote_branches)")

  for branch in ${local_branches[@]}; do
    contains "${branch}" "${remote_branches[@]}" || git branch -D "${branch}"
  done  
fi
