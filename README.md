# macOS Configuration

Shell scripts for customized macOS machine setup and configuration.

This project provides a highly opinionated default configuration built upon the
[macOS](https://www.alchemists.io/projects/mac_os) project. Should the configuration provided by
this project not be to your liking, feel free to fork and customize for your specific needs.



## Table of Contents

[Features](#features)

[Setup](#setup)

[Credits](#credits)



## Features

Due to the amount of tooling used, the following features are broken down into subsections for
easier navigation.


### Homebrew Formulas

Installs the following [formulas](https://brew.sh):

* [Bash](https://www.gnu.org/software/bash)
* [Git](https://git-scm.com)
* [Parallels](https://www.parallels.com/)
* [Obsidian](https://obsidian.md)
* [Visual Studio Code](https://code.visualstudio.com)


### App Store Applications

Installs the following [App Store](https://www.apple.com/app-store) applications:

* [1Password](https://1password.com)
* [Slack](https://slack.com)
* [Facebook Messenger](https://apps.apple.com/us/app/messenger/id1480068668?mt=12)


### Non-App Store Applications
Installs the following macOS applications which are not located in the App Store: **None**

### Application Extensions
Installs the following extensions to existing applications: **None**

### Node Packages
Installs the following [Node](https://nodejs.org) [packages](https://www.npmjs.com): **None**

### Ruby Gems
Installs the following [Ruby](https://www.ruby-lang.org) [gems](https://rubygems.org): **None**

### Rust Crates
Installs the following [Rust](https://www.rust-lang.org) [crates](https://crates.io): **None**

### Requirements

* Apple Silicon hardware.


## Setup

To install, run:

### Pre-Install


### Install

1. Install Homebrew: https://brew.sh/
2. Install 1Password from the App Store, log in to 1Pass
3. Log into GitHub, create new SSH Key
    * Profile > SSH and GPG Keys
    * Create new SSH Key
    * Follow steps here: [GitHub - Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
    * Be sure to add a passphrase and save it in 1Pass
4. In Terminal from the home directory run
    `mkdir personal-tools`
    `cd personal-tools`
    `git clone git@github.com:evanromascokelly/mac_os-config.git`
    `cd mac_os-config`


### Post-Install

The following are additional steps, not easily automated, that are worth completing after the
install scripts have completed:

* System Preferences
    * Apple ID
    * Configure iCloud.
    * Enable Find My Mac.
    * General
        * Turn off Force Click and haptic feedback
    * Security & Privacy
        * General
        * Require password immediately after sleep or screen saver begins.
        * Enable message when screen is locked. Example: `+<url> | <email> | <phone>+`.
        * FileVault
            * Enable FileVault and save the recovery key in a secure location (i.e. 1Password).
        * Enable Firewall
        * Set device DNS to Google/CloudFlare (8.8.8.8 primary and 8.8.4.4 secondar for Google)
    * Desktop and Screen Saver
        * Select _Desktop_, click `+`, and choose custom image.
    * Bluetooth - connect headset

* Clone into Git Repos:
    * Tech DNA Tools: git@github.com:techdna/tools.git
    * Tech DNA Team Wiki: git@github.com:techdna/team-wiki.git

* Notifications
    * Do Not Disturb
        * Enable _Do Not Disturb_ from 9pm to 7am.
        * Enable _When display is sleeping_.
        * Enable _When screen is locked_.
        * Enable _When mirroring_.
        * Disable _Allow calls from everyone_.
        * Enable allow repeated calls.
    * Applications
        * Select _Banners_ for all apps.
        * Disable _Show notifications on lock screen_.
        * Disable _Play sounds for notifications_.

* Use pyenv to manage Python installations (install latest version, do any development in that version, not system version)
    * See https://towardsdatascience.com/homebrew-and-pyenv-python-playing-pleasantly-in-partnership-3a342d86319b



## Credits

Customized by Evan Romasco-Kelly
Engineered by [https://www.alchemists.io/team/brooke_kuhlmann[Brooke Kuhlmann]