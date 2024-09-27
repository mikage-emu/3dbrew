+++
title = 'NWMUDS:InitializeWithVersion'
+++

# Request

| Index Word | Description                                                                                           |
|------------|-------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x001B0302\]                                                                            |
| 1          | Sharedmem size.                                                                                       |
| 2-11       | Input [NodeInfo](NWM_Services "wikilink") structure.                                                  |
| 12         | u16 version. 0x400 is the latest one as of the latest NWM-module from [9.0.0-X](9.0.0-20 "wikilink"). |
| 13         | Value 0x0                                                                                             |
| 14         | Sharedmem handle.                                                                                     |

# Response

| Index Word | Description                                                                                                                                                        |
|------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code                                                                                                                                                        |
| 1          | Result code                                                                                                                                                        |
| 2          | Value 0x0                                                                                                                                                          |
| 3          | Output event handle. [NWMUDS:GetConnectionStatus](NWMUDS:GetConnectionStatus "wikilink") is used once this event is signaled for determining the event cause, etc. |

# Description

This initializes NWMUDS.

The sharedmem is created with mypermission=0x0, otherpermission=0x3. The
only buffer(s) that are allocated under this sharedmem is the
recv_buffer allocated by [NWMUDS:Bind](NWMUDS:Bind "wikilink").