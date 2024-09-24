+++
title = 'AM:GetDeviceId'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000A0000\] |

# Response

| Index Word | Description                           |
|------------|---------------------------------------|
| 0          | Header code                           |
| 1          | Result code                           |
| 2          | Secondary result code (0 -\> Success) |
| 3          | Device ID                             |

# Description

This retrieves the DeviceID, used in SOAP requests. The SOAP DeviceID is
a decimal u64, where the lower word is the retrieved DeviceID while the
upper word is the [platformID](Titles "wikilink")(NIM has that
hard-coded to 4 for DeviceId generation, in the code for
AM:GetDeviceId). The secondary result code does not seem to follow
standard Result code format.
