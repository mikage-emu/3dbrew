+++
title = 'CAMU:SetDetailSize'
+++

# Request

| Index Word | Description                                             |
|------------|---------------------------------------------------------|
| 0          | Header code \[0x001E0200\]                              |
| 1          | [CameraSelect](Camera_Services#CameraSelect "wikilink") |
| 2          | s16, Width                                              |
| 3          | s16, Height                                             |
| 4          | s16, Crop X0                                            |
| 5          | s16, Crop Y0                                            |
| 6          | s16, Crop X1                                            |
| 7          | s16, Crop Y1                                            |
| 8          | [Context](Camera_Services#Context "wikilink")           |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
