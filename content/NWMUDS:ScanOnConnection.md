+++
title = 'NWMUDS:ScanOnConnection'
+++

# Request

| Index Word | Description                                                                                           |
|------------|-------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00220402\]                                                                            |
| 1          | Output buffer max size                                                                                |
| 2-14       | Input [ScanInputStruct](NWM_Services "wikilink").                                                     |
| 15         | [wlancommID](NWM_Services "wikilink")                                                                 |
| 16         | This is the ID also located at offset 0xE in the CTR-generation [structure](NWM_Services "wikilink"). |
| 17         | (Size\<\<4) \| 12                                                                                     |
| 28         | Output [BeaconDataReply](NWM_Services "wikilink") buffer ptr                                          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is about the same as
[NWMUDS:StartScan](NWMUDS:StartScan "wikilink") except this only returns
already received beacon data, and it can *only* be used when connected
to a network.