+++
title = 'CAMU:SetAutoExposure'
+++

# Request

| Index Word | Description                                             |
|------------|---------------------------------------------------------|
| 0          | Header code \[0x00190080\]                              |
| 1          | [CameraSelect](Camera_Services#cameraselect "wikilink") |
| 2          | u8, 0 = Disable, 1 = Enable                             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
