+++
title = 'NFC:GetModelInfo'
+++

# Request

| Index Word | Description                                                              |
|------------|--------------------------------------------------------------------------|
| 0          | Header code \[Starting with [9.3.0-X](9.3.0-21 "wikilink"): 0x001B0000\] |

# Response

| Index Word | Description                                    |
|------------|------------------------------------------------|
| 0          | Header code                                    |
| 1          | Result code                                    |
| 2-15       | [ModelInfo](NFC_Services#modelinfo "wikilink") |

# Description

This returns the NFC Amiibo model info, from data already stored in
memory.
