+++
title = 'DLPSRVR:GetClientState'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000D0040\] |
| 1          | Node ID                    |

# Response

| Index Word | Description                                                  |
|------------|--------------------------------------------------------------|
| 0          | Header code                                                  |
| 1          | Result code                                                  |
| 2-4        | [ClientStatus structure](#clientstatus_structure "wikilink") |

# Description

This gets the state information for a client with the given node ID.

# ClientStatus structure

The "units" seem to be the number of fragments to send the DLP child CIA
to the client, as they correlate to the size of the CIA divided by the
MTU.

| Offset | Size | Description                      |
|--------|------|----------------------------------|
| 0x0    | 0x2  | u16 Node ID                      |
| 0x2    | 0x1  | u8 Unknown                       |
| 0x3    | 0x1  | u8 Client state                  |
| 0x4    | 0x4  | u32 Total units to be transfered |
| 0x8    | 0x4  | u32 Units that have been sent    |
