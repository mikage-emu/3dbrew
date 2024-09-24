+++
title = 'CSND:StoreDataCache'
+++

# Request

| Index Word | Description                            |
|------------|----------------------------------------|
| 0          | Header code \[0x000A0082\]             |
| 1          | Address                                |
| 2          | Size                                   |
| 3          | Value zero                             |
| 4          | [KProcess](KProcess "wikilink") handle |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This calls [svcStoreProcessDataCache](SVC "wikilink") with the specified
KProcess handle, address, and size. The address(+size) must be within
LINEAR virtual [memory](Memory_layout "wikilink").
