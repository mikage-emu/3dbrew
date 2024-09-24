+++
title = 'PSPXI:GetDeviceId'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000B0000\] |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000B0000\] |
| 1          | Result code                |
| 2          | DeviceId                   |

# Description

This retrieves the DeviceId, which is also used internally for the first
hex word in the [CTCert](CTCert "wikilink") cert ID.
