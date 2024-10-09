# Manual MacOS Security Steps

## Background

Not all security settings are automatable - make sure to follow these steps to ensure device security.

## Steps

### FileVault
 - Ensure FileVault is enabled and recovery key is saved securely

### Device Audit Logs
 - Ensure install.log Is Retained for 365 or More Days and No Maximum Size
    - From CIS: "Edit the `/etc/asl/com.apple.install` file and add or modify the `ttl` value to `365` or greater on the `file` line. Also, remove the `all_max=` setting and value from the `file` line."
- Ensure Security Auditing Retention Is Enabled
    - From CIS: "Edit the `/etc/security/audit_control` file so that `expire-after:` is at least `60d OR 5G`"

### `sudo`
 - Edit sudo config file: `sudo visudo`
 - Add/edit the following lines to the file:
    - Set `sudo` timeout to 30 seconds: 
        - `Defaults timestamp_timeout=0.5`
    - Ensure a Separate Timestamp Is Enabled for Each User/tty Combo:
        - `Defaults timestamp_type=tty`



