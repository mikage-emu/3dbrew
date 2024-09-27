+++
title = 'CAMU:IsAutoWhiteBalance'
+++

# Request

| Index Word | Description                                             |
|------------|---------------------------------------------------------|
| 0          | Header code \[0x001C0040\]                              |
| 1          | [CameraSelect](Camera_Services#cameraselect "wikilink") |

# Response

| Index Word | Description                   |
|------------|-------------------------------|
| 0          | Header code                   |
| 1          | Result code                   |
| 2          | u8, 0 = Disabled, 1 = Enabled |
