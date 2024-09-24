+++
title = 'DLPSRVR:GetClientInfo'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000C0040\] |
| 1          | Node ID                    |

# Response

| Index Word | Description                                                      |
|------------|------------------------------------------------------------------|
| 0          | Header code                                                      |
| 1          | Result code                                                      |
| 2-11       | [NodeInfo structure](NWM_Services#NodeInfo_structure "wikilink") |

# Description

This gets the node information for a client with the given node ID.