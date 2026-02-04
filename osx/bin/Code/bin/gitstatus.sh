#!/bin/bash

# Colors for better readability
RESET="\033[0m"
BOLD="\033[1m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"

printf "${BOLD}%-25s %-15s %s${RESET}\n" "DIRECTORY" "BRANCH" "STATUS"
echo "------------------------------------------------------------"

for dir in "$@"; do
  # Remove trailing slash and get folder name
  dir=${dir%/}

  if [ -d "$dir/.git" ]; then
    cd "$dir" || continue

    # Get current branch name
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

    # Check for changes
    if [ -z "$(git status --porcelain)" ]; then
      status="${GREEN}Clean${RESET}"
    else
      status="${YELLOW}Uncommitted Changes${RESET}"
    fi

    printf "%-25s %-15s %b\n" "$(basename "$dir")" "($branch)" "$status"

    cd - >/dev/null || exit
  else
    printf "%-25s %-15s %s\n" "$(basename "$dir")" "N/A" "Not a Git Repo"
  fi
done
