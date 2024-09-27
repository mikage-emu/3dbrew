+++
title = 'APT:SendDspWakeUp'
+++

# Request

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code \[0x003D0042\]                            |
| 1          | Source [AppID](NS_and_APT_Services#AppIDs "wikilink") |
| 2          | 0x0                                                   |
| 3          | Handle                                                |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |