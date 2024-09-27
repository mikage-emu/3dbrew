+++
title = 'RO:UnloadCRR'
+++

# Request

| Index Word | Description                                                                                     |
|------------|-------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00030042\]                                                                      |
| 1          | [CRR](CRR0 "wikilink") buffer pointer, in the specified(with the below handle) process' memory. |
| 2          | Must be zero                                                                                    |
| 3          | [KProcess](SVC "wikilink") handle                                                               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
