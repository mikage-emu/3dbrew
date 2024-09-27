+++
title = 'DSP:FlushDataCache'
+++

# Request

| Index Word | Description                            |
|------------|----------------------------------------|
| 0          | Header code \[0x00130082\]             |
| 1          | Address                                |
| 2          | Size                                   |
| 3          | Value zero                             |
| 4          | [KProcess](KProcess "wikilink") handle |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00130040\] |
| 1          | Result code                |

# Description

This calls [svcFlushProcessDataCache](SVC "wikilink") with the specified
KProcess handle, address, and size. The address must be within the
application GSP [heap](Memory_layout "wikilink").
