+++
title = 'NWMUDS:SetProbeResponseParam'
+++

# Request

| Index Word | Description                                                                                           |
|------------|-------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00210080\]                                                                            |
| 1          | 3-byte OUI followed by the the u8 OUI type(type0 normally). Hence, this field is normally 0x00321F00. |
| 2          | s8 data, can be zero.                                                                                 |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Used before using
[NWMUDS:CreateNetwork2](NWMUDS:CreateNetwork2 "wikilink").
