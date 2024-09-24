+++
title = 'DLPSRVR:StartAccepting'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00050080\] |
| 1          | bool, Is manual accept     |
| 2          | u8 channel                 |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This creates the UDS network where the DLP child will be shared using
[NWMUDS:CreateNetwork2](NWMUDS:CreateNetwork2 "wikilink") (using the
input channel, id8=0x55, local_comm_id=0x2710, max_nodes=max_clients+1)
and [NWMUDS:Bind](NWMUDS:Bind "wikilink") (node_id=0xFFFF,
data_channel=0x2)
