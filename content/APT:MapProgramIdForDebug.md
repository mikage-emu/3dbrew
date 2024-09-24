+++
title = 'APT:MapProgramIdForDebug'
+++

# Request

| Index Word | Description                                    |
|------------|------------------------------------------------|
| 0          | Header code \[0x001100C0\]                     |
| 1          | [AppID](NS_and_APT_Services#AppIDs "wikilink") |
| 2-3        | u64, Program ID                                |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This writes the specified programID to a NS programID array, to the
entry which has the specified AppID. This also sets a NS mediatype field
to value zero for NAND.
