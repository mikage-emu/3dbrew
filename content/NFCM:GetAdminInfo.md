+++
title = 'NFCM:GetAdminInfo'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x04020000\] |

# Response

| Index Word | Description                                    |
|------------|------------------------------------------------|
| 0          | Header code \[0x04020440\]                     |
| 1          | Result code                                    |
| 2-17       | [AdminInfo](NFC_Services#AdminInfo "wikilink") |

# Description

This returns the NFC Amiibo admin info, from data already stored in
memory.
