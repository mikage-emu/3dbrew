+++
title = 'APT:PrepareToStartApplication'
+++

# Request

| Index Word | Description                                                                                                                                                                                                                                                        |
|------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00150140\]                                                                                                                                                                                                                                         |
| 1-4        | [Program Info](Filesystem_services#ProgramInfo "wikilink")                                                                                                                                                                                                         |
| 5          | u8 (changed to u32 with [8.0.0-18](8.0.0-18 "wikilink")), Flags (usually zero, when zero, NS writes a title-info struct with Program ID = ~0 and [MediaType](Filesystem_services#MediaType "wikilink") = NAND to the [FIRM](FIRM "wikilink") parameters structure) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

When the input title-info programID is zero, NS will load the actual
programID via [AMNet:GetTitleIDList](AMNet:GetTitleIDList "wikilink").
After doing some checks with the programID, NS will then set a NS state
flag to value 1, then set the programID for AppID 0x300(application) to
the input programID(or the one from GetTitleIDList). A mediatype field
in NS state is also set to the input mediatype value(other state fields
are set at this point as well).

With [8.0.0-18](8.0.0-18 "wikilink"), NS will set an u8 NS state field
to value 1 when input flags bit8 is set. This is used with the PTMSYSM
0x040A0000 command code in NS, mentioned
[here](NCCH/Extended_Header "wikilink"). Note that the value of that NS
state field is unreliable: as of the [Home Menu](Home_Menu "wikilink")
version for system-version [9.8.0-25](9.8.0-25 "wikilink") the Home Menu
code still writes to the flags field for this
<APT:PrepareToStartApplication> command with an u8. Hence, the bit8
value that gets sent to NS is whatever was previously stored in the Home
Menu thread-local-storage.
