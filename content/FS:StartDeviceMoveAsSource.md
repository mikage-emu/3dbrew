+++
title = 'FS:StartDeviceMoveAsSource'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08580000\] |

# Response

| Index Word | Description                                                             |
|------------|-------------------------------------------------------------------------|
| 0          | Header code                                                             |
| 1          | Result code                                                             |
| 2-9        | [Device Move Context](Filesystem_services#devicemovecontext "wikilink") |
