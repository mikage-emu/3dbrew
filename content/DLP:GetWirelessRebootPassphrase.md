+++
title = 'DLP:GetWirelessRebootPassphrase'
+++

# Request

| Index Word | Description                                          |
|------------|------------------------------------------------------|
| 0          | Header code \[CLNT = 0x00110000, FKCL = 0x000F0000\] |

# Response

| Index Word | Description                                   |
|------------|-----------------------------------------------|
| 0          | Header code                                   |
| 1          | Result code                                   |
| 2-4        | The 9-byte output passphrase is written here. |

# Description

This loads the passphrase from state if available. This is the
passphrase which was previously sent over the DLP UDS network.
