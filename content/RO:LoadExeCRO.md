+++
title = 'RO:LoadExeCRO'
+++

# Request

| Index Word | Description                                                                                                                                     |
|------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x000402C2\] (\[0x000902C2\] for the new version)                                                                                 |
| 1          | Process-memory input [CRO](CRO0 "wikilink") address(usually located on the process heap).                                                       |
| 2          | Process-memory address where the CRO will be mapped, starting at the CRO header(normally in the 0x00100000-0x04000000 range).                   |
| 3          | Total size of input CRO.                                                                                                                        |
| 4          | Process-memory buffer address to use for the CRO .data section, all CRO .data section addresses are automatically adjusted to use this address. |
| 5          | Usually zero?                                                                                                                                   |
| 6          | .data section buffer size.                                                                                                                      |
| 7          | Process-memory buffer address to use for the CRO .bss section, all CRO .bss section addresses are automatically adjusted to use this address.   |
| 8          | .bss section buffer size.                                                                                                                       |
| 9          | Register as auto-link module if non-zero.                                                                                                       |
| 10         | Fix level.                                                                                                                                      |
| 11         | Usually zero?                                                                                                                                   |
| 12         | Must be zero ([translation descriptor](IPC#Message_Structure "wikilink"))                                                                       |
| 13         | [KProcess](SVC "wikilink") handle                                                                                                               |

# Response

| Index Word | Description           |
|------------|-----------------------|
| 0          | Header code           |
| 1          | Result code           |
| 2          | CRO size after fixing |

# Description

This loads a [CRO](CRO0 "wikilink"), and maps virtual memory for it with
the required memory-permissions.