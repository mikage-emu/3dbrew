+++
title = 'DLPSRVR:DisconnectClient'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000A0040\] |
| 1          | Node ID                    |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This disconnects the client with the given node ID from the network.
