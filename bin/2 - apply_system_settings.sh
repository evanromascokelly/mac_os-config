#! /usr/bin/env bash

# Applies system and application defaults.

printf "%s\n" "System - Disable boot sound effects."
sudo nvram SystemAudioVolume=" "

printf "%s\n" "System - Expand save panel by default."
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

printf "%s\n" "System - Avoid creating .DS_Store files on network volumes."
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

printf "%s\n" "Trackpad - Enable tap to click for current user and the login screen."
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

printf "%s\n" "Trackpad - Use CONTROL (^) with scroll to zoom."
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

printf "%s\n" "Trackpad - Follow keyboard focus while zoomed in."
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

defaults write com.apple.systemuiserver menuExtras -array \
  "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \

printf "%s\n" "Dock - Remove all default app icons."
defaults write com.apple.dock persistent-apps -array

printf "%s\n" "Dock - Don’t show Dashboard as a Space."
defaults write com.apple.dock "dashboard-in-overlay" -bool true

printf "%s\n" "iCloud - Save to disk by default."
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

printf "%s\n" "Finder - Show the $HOME/Library folder."
chflags nohidden $HOME/Library

printf "%s\n" "Finder - Show hidden files."
defaults write com.apple.finder AppleShowAllFiles -bool true

printf "%s\n" "Finder - Show filename extensions."
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

printf "%s\n" "Finder - Show path bar."
defaults write com.apple.finder ShowPathbar -bool true

printf "%s\n" "Finder - Show status bar."
defaults write com.apple.finder ShowStatusBar -bool true

printf "%s\n" "Finder - Use list view in all Finder windows."
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

printf "%s\n" "TextEdit - Use plain text mode for new documents."
defaults write com.apple.TextEdit RichText -int 0

printf "%s\n" "TextEdit - Open and save files as UTF-8 encoding."
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

printf "%s\n" "Disk Utility - Enable debug menu."
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

printf "%s\n" "Printer - Expand print panel by default."
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

printf "%s\n" "Printer - Automatically quit printer app once the print jobs complete."
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true


# Set PATH

# printf "%s\n" "Setting PATH variable."
# echo 'export PATH=$PATH:/opt/homebrew/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Users/evanromascokelly/techdna-tools/tools/bin' >> ~/.bash_profile