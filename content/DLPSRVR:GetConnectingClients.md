+++
title = 'DLPSRVR:GetConnectingClients'
+++

# Request

| Index Word | Description                      |
|------------|----------------------------------|
| 0          | Header code \[0x000B0042\]       |
| 1          | Nodes array buffer length        |
| 2          | (nodes_array_size \<\< 4) \| 0xC |
| 3          | Nodes array buffer               |

# Response

| Index Word | Description     |
|------------|-----------------|
| 0          | Header code     |
| 1          | Result code     |
| 2          | Returned length |

# Description

This writes a list of incoming node IDs (u16) that are trying to connect
to the network. The length refers to the number of nodes that fit in the
array.
