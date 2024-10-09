#! /usr/bin/env bash

# Applies security settings (informed by CIS MacOS Benchmarks)

# 1. System - Require password immediately after sleep or screen saver begins
printf "%s\n" "System - Require password immediately after sleep or screen saver begins."
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# 2. System - Enable software updates.
printf "%s\n" "System - Enable software updates."
sudo softwareupdate --schedule on