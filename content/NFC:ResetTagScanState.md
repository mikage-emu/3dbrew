+++
title = 'NFC:ResetTagScanState'
+++

# Request

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[Starting with 9.3.0-X: 0x00080000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This can only be used when the current
[tagstate](NFC:GetTagState "wikilink") is 5 or 6. This is used
internally by [NFC:StopTagScanning](NFC:StopTagScanning "wikilink") when
the current tagstate is 5 or 6.

If the tagstate is valid, it then sets the current tagstate to 3, then
calls a certain function. The returned result-code at this point is from
that function.
