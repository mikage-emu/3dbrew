+++
title = 'FS:CheckUpdatedDat'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x088600C0\] |
| 1          | u8 mediatype               |
| 2-3        | u64 titleID                |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | Output bool |

# Description

At the start this clears the output to 0. If this is all successful, it
then writes value 1 to the output.

This opens archive 0x2345678A, with the input params being used with the
lowpath. Then the title savedata is mounted. Then UTF-16 lowpath
"/updated.dat" is used with some FS operation with the savedata
(presumably to check whether the file exists).

The mere presence of an empty updated.dat is sufficient to prevent the
launch of the two public pre-Amiibo versions.
