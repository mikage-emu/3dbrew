+++
title = 'RO:Shutdown'
+++

# Request

| Index Word | Description                                                                                                                                                 |
|------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00080042\]                                                                                                                                  |
| 1          | [CRS](CRO0 "wikilink") buffer pointer originally used with [RO:Initialize](RO:Initialize "wikilink"), in the process memory specified via the below handle. |
| 2          | Must be zero                                                                                                                                                |
| 3          | [KProcess](SVC "wikilink") handle                                                                                                                           |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
