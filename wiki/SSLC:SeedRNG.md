# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00100000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This can only be used if this session was previously initialized with
[SSLC:Initialize](SSLC:Initialize "wikilink") or
[SSLC:InitializeConnectionSession](SSLC:InitializeConnectionSession "wikilink").
After that, this just uses [PS:SeedRNG](PS:SeedRNG "wikilink").