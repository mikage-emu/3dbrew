+++
title = 'AM:CommitImportPrograms'
+++

# Request

| Index Word | Description                                                            |
|------------|------------------------------------------------------------------------|
| 0          | Header code \[0x040700C2\]                                             |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink")                 |
| 2          | Title count                                                            |
| 3          | u8, [Database](Title_Database "wikilink") (0 = title.db, 1 = tmp\*.db) |
| 4          | ((Title Count \* 8) \<\< 4) \| 0xA                                     |
| 5          | Title IDs Pointer                                                      |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

The input parameters for this are the same as
[AMNet:InstallTitlesFinish](AMNet:InstallTitlesFinish "wikilink"). This
is an interface for [AMPXI](Application_Manager_Services_PXI "wikilink")
command 0x002A00C2. The AMPXI command used here only finalizes the
install in the [database](Title_Database "wikilink"), the now-unused
files under /title for the title(s) are not deleted by this. These files
are deleted later.
