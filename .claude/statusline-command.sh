#!/bin/bash
# Agnoster-style status line: user@hostname | git info | directory

input=$(cat)
model=$(echo "$input" | jq -r '.model.display_name')
cwd=$(echo "$input" | jq -r '.workspace.current_dir')
context_pct=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')
git_worktree=$(echo "$input" | jq -r '.workspace.git_worktree // empty')

# Git status (if in a git repo)
git_info=""
if [ -n "$git_worktree" ]; then
  git_info=" $git_worktree"
else
  # Check if in git repo using git -C to avoid needing cwd
  git_branch=$(git -C "$cwd" rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ -n "$git_branch" ]; then
    git_status=$(git -C "$cwd" status --porcelain 2>/dev/null | head -1)
    if [ -n "$git_status" ]; then
      git_info=" $git_branch*"
    else
      git_info=" $git_branch"
    fi
  fi
fi

# Context usage
context_info=""
if [ -n "$context_pct" ] && [ "$context_pct" != "null" ]; then
  context_info=" [${context_pct}%]"
fi

# Build status line
echo "$(whoami)@$(hostname -s)${git_info} $cwd${context_info} :: $model"