+++
title = 'AM:ReadTwlBackupInfoEx'
+++

# Request

| Index Word | Description                                                                                                                   |
|------------|-------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00280108\]                                                                                                    |
| 1          | Output Info Size (usually 0x20)                                                                                               |
| 2          | Banner Size (usually 0x4000)                                                                                                  |
| 3          | Working Buffer Size (must be at least 0x4500)                                                                                 |
| 4          | Unknown, not used                                                                                                             |
| 5          | 0x10                                                                                                                          |
| 6          | Export File Handle                                                                                                            |
| 7          | (Output Info Size \<\< 4) \| 0xC                                                                                              |
| 8          | [TwlBackupInfo](Application_Manager_Services#twlbackupinfo "wikilink") Pointer. No processing is done when this is left NULL. |
| 9          | (Banner Size \<\< 4) \| 0xC                                                                                                   |
| 10         | [DSiWare](DSiWare_Exports "wikilink") Banner Output Pointer. No processing is done when this is left NULL.                    |
| 11         | (Working Buffer Size \<\< 4) \| 0xC                                                                                           |
| 12         | Working Buffer Pointer                                                                                                        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is the same as
[AM:ReadTwlBackupInfo](AM:ReadTwlBackupInfo "wikilink"), except this
command is meant for use with Exports that use 12 content sections.
