+++
title = 'NFC:StopCommunication'
+++

# Request

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[Starting with 9.3.0-X: 0x00040000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

With the Old3DS sysmodule this stops communication with the Old3DS NFC
hardware. The New3DS sysmodule just uses code used internally by
[NFC:StopTagScanning](NFC:StopTagScanning "wikilink") for this.
