+++
title = 'CAMU:SetTrimmingParamsCenter'
+++

# Request

| Index Word | Description                             |
|------------|-----------------------------------------|
| 0          | Header code \[0x00120140\]              |
| 1          | [Port](Camera_Services#port "wikilink") |
| 2          | s16, Trim Width                         |
| 3          | s16, Trim Height                        |
| 4          | s16, Camera Width                       |
| 5          | s16, Camera Height                      |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
