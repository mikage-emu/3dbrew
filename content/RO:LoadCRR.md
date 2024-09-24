+++
title = 'RO:LoadCRR'
+++

# Request

| Index Word | Description                                                                                     |
|------------|-------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00020082\]                                                                      |
| 1          | [CRR](CRR0 "wikilink") buffer pointer, in the specified(with the below handle) process' memory. |
| 2          | CRR size                                                                                        |
| 3          | Must be zero                                                                                    |
| 4          | [KProcess](SVC "wikilink") handle                                                               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This loads a [CRR](CRR0 "wikilink") for the RO module, only one CRR can
be loaded at a time. Before RO verifies the input CRR, RO uses
[ControlProcessMemory](SVC "wikilink") to set the memory permissions of
the input buffer in the process to R--. If verification of the CRR
fails, the permissions are set to RW-.