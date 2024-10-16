#! /usr/bin/env bash

## Configures installed software.

# Bash
(
  chsh -s /bin/bash
)

# Homebrew
(
  cd "$(get_homebrew_root)"
  git config --local core.hooksPath /dev/null
  git config --global core.editor "nano"
)