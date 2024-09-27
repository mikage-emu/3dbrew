+++
title = 'AM:GetSystemMenuDataFromCia'
+++

# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x04090004\]         |
| 1          | 0x0 (Send-handle translate header) |
| 2          | File Handle                        |
| 3          | (Size \<\< 4) \| 0xC               |
| 4          | Output Buffer Pointer              |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This loads the 0x36C0-byte [SMDH](SMDH "wikilink") icon from the meta
section of the specified [CIA](CIA "wikilink").

This is used by the DLP-sysmodule for loading the icon used with
[Download_Play](Download_Play "wikilink") hosting.