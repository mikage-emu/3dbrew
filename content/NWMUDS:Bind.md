+++
title = 'NWMUDS:Bind'
+++

# Request

| Index Word | Description                                                                                                                                                                                                                                                                                                                                                                                             |
|------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00120100\]                                                                                                                                                                                                                                                                                                                                                                              |
| 1          | BindNodeID                                                                                                                                                                                                                                                                                                                                                                                              |
| 2          | u32 recv_buffer_size. Official user-processes require this to be \>=0x646. This is the *exact* size of the buffer allocated under sharedmem used for storing the received data which can then be loaded via [NWMUDS:PullPacket](NWMUDS:PullPacket "wikilink")(this includes header data). NWM-module itself *only* requires this size to be \>=0x5F4(this is only checked after allocating the buffer). |
| 3          | u8 data_channel                                                                                                                                                                                                                                                                                                                                                                                         |
| 4          | u16 NetworkNodeID probably. Likely for controlling which device this BindNodeID can communicate with, or all of them when the broadcast alias is used.                                                                                                                                                                                                                                                  |

# Response

| Index Word | Description                                                                                                                    |
|------------|--------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code                                                                                                                    |
| 1          | Result code                                                                                                                    |
| 2          | Value 0x0, handle transfer translate-header.                                                                                   |
| 3          | Output event handle. This is signaled every time data becomes available via [NWMUDS:PullPacket](NWMUDS:PullPacket "wikilink"). |

# Data Channel

This is an arbitrary value to use for data-frame filtering. This bind
will only receive data frames which contain a matching data_channel
value. The input data_channel value for this command must be non-zero,
otherwise error 0xE10113EA is returned.

# Description

This initializes a [BindNodeID](NWM_Services "wikilink") for use on this
device, etc. This can be done multiple times for initializing different
BindNodeIDs.
