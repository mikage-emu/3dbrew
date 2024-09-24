+++
title = 'FS:StartDeviceMoveAsDestination'
+++

# Request

| Index Word | Description                                                             |
|------------|-------------------------------------------------------------------------|
| 0          | Header code \[0x08590240\]                                              |
| 1-8        | [Device Move Context](Filesystem_services#DeviceMoveContext "wikilink") |
| 9          | u8, 0 = don't clear, 1 = clear                                          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
