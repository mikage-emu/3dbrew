+++
title = 'SSLC:ContextClearOpt'
+++

# Request

| Index Word | Description                                         |
|------------|-----------------------------------------------------|
| 0          | Header code \[0x001B0080\]                          |
| 1          | SSL [context](SSLC:CreateContext "wikilink") handle |
| 2          | u32 bitmask                                         |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This clears bits in an u32 field in the context using the specifed
bitmask.