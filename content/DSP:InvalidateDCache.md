+++
title = 'DSP:InvalidateDCache'
+++

# Request

| Index Word | Description                            |
|------------|----------------------------------------|
| 0          | Header code \[0x00140082\]             |
| 1          | Address                                |
| 2          | Size                                   |
| 3          | Value zero                             |
| 4          | [KProcess](KProcess "wikilink") handle |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00140040\] |
| 1          | Result code                |

# Description

This calls [svcInvalidateProcessDataCache](SVC "wikilink") with the
specified KProcess handle, address, and size. The address must be within
the application GSP [heap](Memory_layout "wikilink"), or the DSP region.
