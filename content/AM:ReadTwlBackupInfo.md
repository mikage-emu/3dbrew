+++
title = 'AM:ReadTwlBackupInfo'
+++

# Request

| Index Word | Description                                                                                                                                     |
|------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x001E00C8\]                                                                                                                      |
| 1          | Output Info Size (usually 0x20)                                                                                                                 |
| 2          | Banner Size (usually 0x4000)                                                                                                                    |
| 3          | Working Buffer Size                                                                                                                             |
| 4          | 0x10 (Magic Word Header, 0x10 = HANDLE_MOVE, we are moving this handle into the IPC server)                                                     |
| 5          | [FSFile](Filesystem_services "wikilink") Handle                                                                                                 |
| 6          | (Output Info Size \<\< 4) \| 0xC                                                                                                                |
| 7          | [TwlBackupInfo](Application_Manager_Services#TwlBackupInfo "wikilink") Output Pointer. Processing is skipped for this when the pointer is NULL. |
| 8          | (Banner Size \<\< 4) \| 0xC                                                                                                                     |
| 9          | [DSiWare](DSiWare_Exports "wikilink") Banner Output Pointer. Processing is skipped for this when the pointer is NULL.                           |
| 10         | (Working Buffer Size \<\< 4) \| 0xC                                                                                                             |
| 11         | Working Buffer Pointer                                                                                                                          |

# Response

| Index Word | Description                                                                            |
|------------|----------------------------------------------------------------------------------------|
| 0          | Header code                                                                            |
| 1          | Result code                                                                            |
| 2          | (Output Info Size \<\< 4) \| 0xC                                                       |
| 3          | [TwlBackupInfo](Application_Manager_Services#TwlBackupInfo "wikilink") Output Pointer. |
| 4          | (Banner Size \<\< 4) \| 0xC                                                            |
| 5          | [DSiWare](DSiWare_Exports "wikilink") Banner Output Pointer.                           |
| 6          | (Working Buffer Size \<\< 4) \| 0xC                                                    |
| 7          | Working Buffer Pointer                                                                 |

# Description

The specified [file](DSiWare_Exports "wikilink") size must be at least
0x4500. This reads the DSiWare header+banner from the file, and
decrypts+verifies these sections.

It should be noted that this command is meant for use with Exports that
use 11 content sections.
