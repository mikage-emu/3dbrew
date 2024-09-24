+++
title = 'NWMCEC:SendProbeRequest'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000D0082\] |
| 1          | ?                          |
| 2          | Size                       |
| 3          | (Size\<\<4) \| 10          |
| 4          | Input buffer ptr           |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This sends a [StreetPass](StreetPass "wikilink") probe request. The
input data is for the tag data, starting at offset 0x4 in the tag(that
is, the data following the OUI-type).
