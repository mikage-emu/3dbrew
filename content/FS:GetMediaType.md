+++
title = 'FS:GetMediaType'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08680000\] |

# Response

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code                                            |
| 1          | Result code                                            |
| 2          | [Media Type](Filesystem_services#mediatype "wikilink") |

# Description

This loads the u8 mediatype for the current application from already
initialized state, this u8 was originally loaded from the same data used
by [GetProgramLaunchInfo](FS:GetProgramLaunchInfo "wikilink"). This then
writes the u8 to response-word\[2\]. This is used with [Anti Savegame
Restore](Anti_Savegame_Restore "wikilink").
