+++
title = 'NFC:GetCommonInfo'
+++

# Request

| Index Word | Description                                                              |
|------------|--------------------------------------------------------------------------|
| 0          | Header code \[Starting with [9.3.0-X](9.3.0-21 "wikilink"): 0x00180000\] |

# Response

| Index Word | Description                                      |
|------------|--------------------------------------------------|
| 0          | Header code                                      |
| 1          | Result code                                      |
| 2-17       | [CommonInfo](NFC_Services#commoninfo "wikilink") |

# Description

This returns the NFC Amiibo common info, from data already stored in
memory.
