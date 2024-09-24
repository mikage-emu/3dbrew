+++
title = 'LOADER:LoadProcess'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00010080\] |
| 1-2        | u64, Program Handle        |

# Response

| Index Word | Description     |
|------------|-----------------|
| 0          | Header code     |
| 1          | Result code     |
| 3          | KProcess handle |

# Description

This maps 0x10000000 and reads ExeFS:/.code there, then decompresses it
if needed. It uses the exheader information to find how many pages to
allocate for each section (text,rodata,data). The way the allocation
works is that it rounds each size field to the nearest page and then
assumes that the decompressed ExeFS:/.code fits each section to the
rounded size (NOT the size specified in the exheader if that size is not
page aligned!). This is different from how the sysmodules
(fs,loader,etc) are loaded. The size field for those modules are
actually used as-specified. This then uses svcCreateCodeSet and then
svcCreateProcess. Once finished this writes the KProcess handle to
cmdreply\[3\].