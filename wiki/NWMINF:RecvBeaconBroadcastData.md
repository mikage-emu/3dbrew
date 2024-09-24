# Request

| Index Word | Description                                                  |
|------------|--------------------------------------------------------------|
| 0          | Header code \[0x000603C4\]                                   |
| 1          | Output buffer max size                                       |
| 2-14       | Input [ScanInputStruct](NWM_Services "wikilink").            |
| 15         | u32, unknown                                                 |
| 16         | Value 0x0                                                    |
| 17         | Input handle                                                 |
| 18         | (Size\<\<4) \| 12                                            |
| 19         | Output [BeaconDataReply](NWM_Services "wikilink") buffer ptr |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This returns beacon data for *all* wifi beacons received by this system.