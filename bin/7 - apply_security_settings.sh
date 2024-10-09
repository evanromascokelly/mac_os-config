#! /usr/bin/env bash

# Applies security settings (informed by CIS MacOS Benchmarks)

CURRENT_USER = $USER
LOCK_SCREEN_MESSAGE = "Device is reserved for authorized use and monitored  |   If found call +1-206-295-8499"

# 1. Software updates - Enable software updates.
printf "%s\n" "System - Enable software updates."
sudo softwareupdate --schedule on

# 2. Software updates - Ensure Auto Update Is Enabled
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true 

# 3. Software updates - Ensure Download New Updates When Available Is Enabled
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool true 

# 4. Software updates - Ensure Install Application Updates from the App Store Is Enabled
sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdate -bool TRUE

# 5. Software updates - Ensure Install Security Responses and System Files Is Enabled
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate ConfigDataInstall -bool true
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -bool true

# 6. Firewall - Ensure Firewall is Enabled
sudo defaults write /usr/bin/sudo /usr/bin/defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# 7. Firewall - Ensure Firewall Stealth Mode Is Enabled
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

# 8. System - Ensure Set Time and Date Automatically Is Enabled
sudo /usr/sbin/systemsetup -setnetworktimeserver time.apple.com
sudo /usr/sbin/systemsetup -setusingnetworktime on

# 9. System - Ensure the Time Service Is Enabled
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.timed.plist

# 10. Sharing - Ensure DVD or CD Sharing Is Disabled
sudo launchctl disable system/com.apple.ODSAgent
sudo launchctl bootout system/com.apple.ODSAgent

# 11. Sharing - Ensure Screen Sharing Is Disabled
## ??? Not sure if this should be disabled
# sudo launchctl disable system/com.apple.screensharing
# sudo launchctl bootout system/com.apple.screensharing

# 12. Sharing - Ensure File Sharing Is Disabled
sudo launchctl disable system/com.apple.smbd
sudo launchctl bootout system/com.apple.smbd

# 13. Sharing - Ensure Printer Sharing Is Disabled
sudo /usr/sbin/cupsctl --no-share-printers

# 14. Remote Access - Ensure Remote Login Is Disabled
sudo /usr/sbin/systemsetup -setremotelogin off

# 15. Remote Access - Ensure Remote Management Is Disabled
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -stop

# 16. Remote Access - Ensure Remote Apple Events Is Disabled
sudo /usr/sbin/systemsetup -setremoteappleevents off 

# 17. Sharing - Ensure Internet Sharing Is Disabled
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.nat NAT -dict Enabled -int 0

# 18. Sharing - Ensure Content Caching Is Disabled
sudo /usr/bin/AssetCacheManagerUtil deactivate

# 19. Sharing - Ensure Bluetooth Sharing Is Disabled
sudo -u $CURRENT_USER /usr/bin/defaults -currentHost write com.apple.Bluetooth PrefKeyServicesEnabled -bool false
sudo -u firstuser /usr/bin/defaults -currentHost write com.apple.Bluetooth PrefKeyServicesEnabled -bool false

# 20. Security - Ensure Gatekeeper is Enabled
sudo /usr/sbin/spctl --master-enable

# 21. UI - Ensure 'Show Location Icon in Control Center when System Services Request Your Location' Is Enabled
sudo defaults write /Library/Preferences/com.apple.locationmenu.plist ShowSystemServices -bool true

# 22. Lock Screen - Ensure an Inactivity Interval of 20 Minutes Or Less for the Screen Saver Is Enabled
sudo

# 23. Lock Screen - Require password immediately after sleep or screen saver begins
printf "%s\n" "System - Require password immediately after sleep or screen saver begins."
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# 24. Lock Screen - Ensure a Custom Message for the Login Screen Is Enabled
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText $LOCK_SCREEN_MESSAGE

# 25. Lock Screen - Ensure Show Password Hints Is Disabled
sudo defaults write /Library/Preferences/com.apple.loginwindow RetriesUntilHint -int 0

# 26. Login - Ensure Guest Account Is Disabled
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

# 27. Login - Ensure Automatic Login Is Disabled
sudo defaults delete /Library/Preferences/com.apple.loginwindow autoLoginUser

# 28. Auditing - Ensure Security Auditing Is Enabled
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.auditd.plist
sudo cp /etc/security/audit_control.example /etc/security/audit_control 

# 29. Auditing - Ensure Access to Audit Records Is Controlled
sudo /usr/sbin/chown -R root:wheel /etc/security/audit_control
sudo /bin/chmod -R o-rw /etc/security/audit_control
sudo /usr/sbin/chown -R root:wheel /var/audit/
sudo /bin/chmod -R o-rw /var/audit/

# 30. Auditing - Ensure Firewall Logging Is Enabled and Configured
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingopt detail

# 31. Network Services - Ensure HTTP Server Is Disabled
sudo /usr/sbin/apachectl stop
sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist

# 32. Network Services - Ensure NFS Server Is Disabled
sudo /sbin/nfsd stop
sudo launchctl disable system/com.apple.nfsd
sudo bin/rm /etc/exports

# 33. Root user - Ensure the "root" Account Is Disabled
printf "%s\n" "Root user - disabling root user..."
sudo /usr/bin/sudo /usr/sbin/dsenableroot -d
/usr/bin/dscl . -create /Users/root UserShell /usr/bin/false

# 34. Users - Ensure an Administrator Account Cannot Login to Another User's Active and Locked Session
printf "%s\n" "Users - ensuring Administrator cannot log into other user's active and locked session..."
sudo /usr/bin/security authorizationdb write system.login.screensaver authenticate-session-owner

# 35. Users - Ensure the Guest Home Folder Does Not Exist
sudo /bin/rm -R /Users/Guest

# 36. Security - Ensure XProtect is Running and Updated
sudo launchctl load -w /Library/Apple/System/Library/LaunchDaemons/com.apple.XProtect.daemon.scan.plist
sudo launchctl load -w /Library/Apple/System/Library/LaunchDaemons/com.apple.XprotectFramework.PluginService.plist
sudo /usr/sbin/softwareupdate -l --background-critical

# 37. Security - Ensure Home Folders Are Secure
sudo /bin/chmod -R og-rwx /Users/$CURRENT_USER

# 38. Security - Ensure System Integrity Protection Status (SIP) Is Enabled
sudo /usr/bin/csrutil enable

# 39. Security - Ensure Appropriate Permissions Are Enabled for System Wide Applications
sudo IFS=$'\n'
for apps in $( /usr/bin/find /System/Volumes/Data/Applications -iname "*\.app" -type d -perm -2 | grep -v Xcode.app ); do
 /bin/chmod -R o-w "$apps"
done

# 40. Security - Ensure No World Writable Folders Exist in the Library Folder
sudo IFS=$'\n'
for libPermissions in $( /usr/bin/find /System/Volumes/Data/Library -type d -perm -2 2>&1 | /usr/bin/grep -v Caches | /usr/bin/grep -v /Preferences/Audio/Data ); do
 /bin/chmod -R o-w "$libPermissions"
done

# 41. Security - Ensure Password Account Lockout Threshold Is Configured
sudo /usr/bin/pwpolicy -n /Local/Default -setglobalpolicy "maxFailedLoginAttempts=5"
sudo /usr/bin/pwpolicy -n /Local/Default -setglobalpolicy "policyAttributeMinutesUntilFailedAuthenticationReset=15"