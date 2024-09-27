+++
title = 'AM:GetRequiredSizeFromCia'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x040D0042\]                             |
| 1          | [Media Type](Filesystem_services#mediatype "wikilink") |
| 2          | 0x0 (Send-handle translate header)                     |
| 3          | File Handle                                            |

# Response

| Index Word | Description         |
|------------|---------------------|
| 0          | Header code         |
| 1          | Result code         |
| 2-3        | u64, Required Bytes |

# Description

This retrieves the number of bytes of free space required to install the
specified [CIA](CIA "wikilink") to the specified destination.
