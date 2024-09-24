+++
title = 'AMPXI:InstallFIRM'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00080080\] |
| 1-2        | u64, Title ID              |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00080040\] |
| 1          | Result code                |

# Description

This installs the data loaded from the specified [FIRM](FIRM "wikilink")
title's [NCCH](NCCH "wikilink") ExeFS, to the
[NAND](Flash_Filesystem "wikilink") FIRM partitions. The titleID
[uniqueID](Title_list "wikilink") must be zero, therefore only
NATIVE_FIRM can be installed with this command. When the firm0 partition
is not corrupted, firm1 is written first. Otherwise when firm0 is
corrupted, firm0 is written first.