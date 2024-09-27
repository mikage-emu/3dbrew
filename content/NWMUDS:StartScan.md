+++
title = 'NWMUDS:StartScan'
+++

# Request

| Index Word | Description                                                                                           |
|------------|-------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x000F0404\]                                                                            |
| 1          | Output buffer max size                                                                                |
| 2-14       | Input [ScanInputStruct](NWM_Services "wikilink").                                                     |
| 15         | [wlancommID](NWM_Services "wikilink")                                                                 |
| 16         | This is the ID also located at offset 0xE in the CTR-generation [structure](NWM_Services "wikilink"). |
| 17         | Value 0x0                                                                                             |
| 18         | Input event handle                                                                                    |
| 19         | (Size\<\<4) \| 12                                                                                     |
| 20         | Output [BeaconDataReply](NWM_Services "wikilink") buffer ptr                                          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This returns beacon data for all UDS wifi beacons received by this
system, with the specified wlancommID+ID8. See also the scaninput
struct.

Official user processes create a new event handle which is then passed
to this command. However, those user processes don't save that handle
*anywhere* afterwards.

This command can *only* be used when not connected to a network.