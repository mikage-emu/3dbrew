+++
title = 'SSLC:StartConnection'
+++

# Request

| Index Word | Description                                    |
|------------|------------------------------------------------|
| 0          | Header code \[0x00130040\]                     |
| 1          | [contexthandle](SSLC:CreateContext "wikilink") |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This starts the actual TLS connection. Besides errors, this will not
return until the connection is ready for data-transfer via
[SSLC:Read](SSLC:Read "wikilink")/[SSLC:Write](SSLC:Write "wikilink").