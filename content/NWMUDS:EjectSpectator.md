+++
title = 'NWMUDS:EjectSpectator'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00060000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This can be used by the host to force-disconnect the spectator(s). After
sending the network msg, this calls the same code used by
[NWMUDS:UpdateNetworkAttribute](NWMUDS:UpdateNetworkAttribute "wikilink")
internally, with bitmask=0x1 and flag=1. New spectator connections will
not be accepted any more after using this command, until that attribute
bit is cleared.

This sends a broadcast data packet to channel 0x104 with a single 0 byte
as data.