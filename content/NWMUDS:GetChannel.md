+++
title = 'NWMUDS:GetChannel'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001A0000\] |

# Response

| Index Word | Description     |
|------------|-----------------|
| 0          | Header code     |
| 1          | Result code     |
| 2          | u8 Wifi channel |

# Description

This returns the wifi channel of the current network. This returns 0
when not connected to any network(host/client).
