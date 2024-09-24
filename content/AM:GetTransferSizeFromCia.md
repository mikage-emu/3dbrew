+++
title = 'AM:GetTransferSizeFromCia'
+++

# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x040B0002\]         |
| 1          | 0x0 (Send-handle translate header) |
| 2          | File Handle                        |

# Response

| Index Word | Description      |
|------------|------------------|
| 0          | Header code      |
| 1          | Result code      |
| 2-3        | u64, Meta offset |

# Description

This retrieves the offset of the specified [CIA](CIA "wikilink")'s meta
section.
