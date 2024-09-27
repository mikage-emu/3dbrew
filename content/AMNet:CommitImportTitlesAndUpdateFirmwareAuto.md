+++
title = 'AMNet:CommitImportTitlesAndUpdateFirmwareAuto'
+++

# Request

| Index Word | Description                                                            |
|------------|------------------------------------------------------------------------|
| 0          | Header code \[0x081B00C2\]                                             |
| 1          | [Media Type](Filesystem_services#mediatype "wikilink")                 |
| 2          | Title Count                                                            |
| 3          | u8, [Database](Title_Database "wikilink") (0 = title.db, 1 = tmp\*.db) |
| 4          | ((Title Count \* 8) \<\< 4) \| 0xA                                     |
| 5          | Title IDs Input Pointer                                                |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

See [this](Title_Data_Structure "wikilink") for how the system finalizes
title installation. When AM module handles this command, AM module will
use [AMPXI](Application_Manager_Services_PXI "wikilink") command
0x00420142 if a NATIVE_FIRM install is
[needed](AM:UpdateFirmwareAuto "wikilink"), regardless of whether the
NATIVE_FIRM titleID was specified in the input buffer. If the
NATIVE_FIRM titleID was specified in the input titleID list and the
title-version from [AMPXI:GetTitleList](AMPXI:GetTitleList "wikilink")
is the latest version, then if the version from
[AMPXI:GetTitleTemporaryInfo](AMPXI:GetTitleTemporaryInfo "wikilink") is
newer than the current version
[AMPXI](Application_Manager_Services_PXI "wikilink") command 0x00420142
is used. Otherwise when a NATIVE_FIRM install is not needed,
[AMPXI](Application_Manager_Services_PXI "wikilink") command 0x002A00C2
is used instead.
