# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000B0000\] |

# Response

| Index Word | Description                 |
|------------|-----------------------------|
| 0          | Header code                 |
| 1          | Result code                 |
| 2-13       | Output 0x30-byte structure. |

# Output structure

| Offset | Size | Description                                                                                                                                                   |
|--------|------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x4  | u32 status                                                                                                                                                    |
| 0x4    | 0x4  | Unknown u32. Official user-processes check for values: 0x0, 0x1, and non-zero.                                                                                |
| 0x8    | 0x2  | u16 NetworkNodeID for this device. This is the broadcast alias when connected as a spectator.                                                                 |
| 0xA    | 0x2  | u16, changed_nodes. This is a bitmask of the nodes that changed and triggered the update.                                                                     |
| 0xC    | 0x20 | u16 nodes\[16\]. Array of NetworkNodeIds, the values inside this array is what's passed to [NWMUDS:GetNodeInformation](NWMUDS:GetNodeInformation "wikilink"). |
| 0x2C   | 0x1  | u8 total_nodes.                                                                                                                                               |
| 0x2D   | 0x1  | u8 max_nodes, originally from the NetworkStruct.                                                                                                              |
| 0x2E   | 0x2  | u16 node_bitmask. This is a bitmask of NetworkNodeIDs: bit0 for NetworkNodeID 0x1(host), bit1 for NetworkNodeID 0x2(first original client), and so on.        |

Right after [initializing](NWMUDS:InitializeWithVersion "wikilink"),
this structure is all-zero except for the status which is value 0x3.

## Status values

| Type | Description                                                                                                                                           |
|------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x3  | Not connected to any network as a host/client, or just initialized.                                                                                   |
| 0x6  | Connected to a network as a host.                                                                                                                     |
| 0x9  | Connected to a network as a client.                                                                                                                   |
| 0xA  | Connected to a network as a spectator.                                                                                                                |
| 0xB  | For this value official user-processes use [NWMUDS:UpdateNetworkAttribute](NWMUDS:UpdateNetworkAttribute "wikilink") to clear attributes bitmask 0x6. |

# Description

This is mainly used when the event handle from
[NWMUDS:Initialize](NWMUDS:Initialize "wikilink") is signaled. This is
also used before using [NWMUDS:Bind](NWMUDS:Bind "wikilink"). For
certain user-processes this may be used during NWMUDS initialization as
well.

The event is not signaled when using
[NWMUDS:DestroyNetwork](NWMUDS:DestroyNetwork "wikilink") or
[NWMUDS:DisconnectNetwork](NWMUDS:DisconnectNetwork "wikilink"). However
the event does get signaled when creating or connecting to a network.