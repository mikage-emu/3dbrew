+++
title = 'CAMU:SetAutoWhiteBalance'
+++

# Request

| Index Word | Description                                             |
|------------|---------------------------------------------------------|
| 0          | Header code \[0x001B0080\]                              |
| 1          | [CameraSelect](Camera_Services#CameraSelect "wikilink") |
| 2          | u8, 0 = Disable, 1 = Enable                             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
