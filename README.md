:toc: macro
:toclevels: 5
:figure-caption!:

= macOS Configuration

Shell scripts for customized macOS machine setup and configuration.

This project provides a highly opinionated default configuration built upon the
link:https://www.alchemists.io/projects/mac_os[macOS] project. Should the configuration provided by
this project not be to your liking, feel free to fork and customize for your specific needs.

toc::[]

== Features

Due to the amount of tooling used, the following features are broken down into subsections for
easier navigation.

=== Homebrew Formulas

Installs the following link:https://brew.sh[formulas]:

* link:https://www.gnu.org/software/bash[Bash]
* link:https://git-scm.com[Git]
* link:https://savannah.gnu.org/projects/parallel[
* link:https://obsidian.md[Obsidian]
* link:https://code.visualstudio.com[Visual Studio Code]

=== App Store Applications

Installs the following link:https://www.apple.com/app-store[App Store] applications:

* link:https://1password.com[1Password]
* link:https://slack.com[Slack]
[https://apps.apple.com/us/app/messenger/id1480068668?mt=12]

### Non-App Store Applications

Installs the following macOS applications which are not located in the App Store:

**None**

### Application Extensions

Installs the following extensions to existing applications:

**None**


### Node Packages

Installs the following link:https://nodejs.org[Node] link:https://www.npmjs.com[packages]:

* link:https://github.com/tomekwi/elm-live[Elm Live]
* link:https://github.com/elm-explorations/test[Elm Test]

### Ruby Gems

Installs the following link:https://www.ruby-lang.org[Ruby] link:https://rubygems.org[gems]:

**None**

### Rust Crates

Installs the following link:https://www.rust-lang.org[Rust] link:https://crates.io[crates]:

**None**

### Requirements

. Apple Silicon hardware.
. link:https://www.alchemists.io/projects/mac_os[macOS]
. link:https://developer.apple.com/xcode[Xcode]

## Setup

To install, run:

[source,bash]



### Pre-Install

Ensure you have the following in place for your Silicon machine:

. Ensure a backup of your Apple, NAS, backup image, and Dropbox credentials are available.
. Ensure a recent backup of your machine exists and works properly.
. Ensure link:https://support.apple.com/en-us/HT208198[Startup Security Utility] is disabled.
.. Turn off your machine.
.. Start your machine by pressing and holding the `POWER` button until you see startup options being
   loaded.
.. Select Utilities → Startup Security Utility from the main menu.
.. Select _Reduced Security_.
.. Quit the utility and restart the machine.

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
    * Security & Privacy
        * General
        * Require password immediately after sleep or screen saver begins.
        * Enable message when screen is locked. Example: `+<url> | <email> | <phone>+`.
        * FileVault
            * Enable FileVault and save the recovery key in a secure location (i.e. 1Password).
        * Enable Firewall
    * Desktop and Screen Saver
        * Select _Desktop_, click `+`, and choose custom image.
    * Bluetooth

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


## Credits

Engineered by link:https://www.alchemists.io/team/brooke_kuhlmann[Brooke Kuhlmann].
