+++
title = 'CAMU:SetAutoWhiteBalanceWindow'
+++

# Request

| Index Word | Description                                             |
|------------|---------------------------------------------------------|
| 0          | Header code \[0x00270140\]                              |
| 1          | [CameraSelect](Camera_Services#CameraSelect "wikilink") |
| 2          | s16, X                                                  |
| 3          | s16, Y                                                  |
| 4          | s16, Width                                              |
| 5          | s16, Height                                             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |