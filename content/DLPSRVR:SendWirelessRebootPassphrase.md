+++
title = 'DLPSRVR:SendWirelessRebootPassphrase'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000800C0\] |
| 1-3        | 9-byte passphrase          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This sends the specified passphrase over the DLP UDS network to the
clients.