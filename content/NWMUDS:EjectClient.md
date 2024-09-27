+++
title = 'NWMUDS:EjectClient'
+++

# Request

| Index Word | Description                                                                   |
|------------|-------------------------------------------------------------------------------|
| 0          | Header code \[0x00050040\]                                                    |
| 1          | u16 NetworkNodeID. The broadcast alias can be used to disconnect all clients. |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This can be used by the host to force-disconnect client(s). On the wifi
network side this is done by just sending 802.11 deauthentication
frame(s).