+++
title = 'SSLC:GenerateRandomData'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00110042\] |
| 1          | Size                       |
| 2          | (Size\<\<4) \| 12          |
| 3          | Pointer to output data     |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This can only be used if this session was previously initialized with
[SSLC:Initialize](SSLC:Initialize "wikilink") or
[SSLC:InitializeConnectionSession](SSLC:InitializeConnectionSession "wikilink").
After that, this just uses [ps:ps](Process_Services "wikilink")
GenerateRandomData.