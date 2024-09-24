+++
title = 'APT:GetWirelessRebootInfo'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00450040\] |
| 1          | Size                       |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description         |
|------------|---------------------|
| 0          | (Size \<\< 14) \| 2 |
| 1          | Output Buffer       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Same as
[NSS:SetWirelessRebootInfo](NSS:SetWirelessRebootInfo "wikilink") except
this loads the data instead. The state flag set by
[NSS:SetWirelessRebootInfo](NSS:SetWirelessRebootInfo "wikilink") must
have bit0 set, otherwise the output buffer is just cleared without
copying any data.

This is used by DLP-child titles.
