+++
title = 'CAMU:ReadRegisterI2cExclusive'
+++

# Request

| Index Word | Description                                             |
|------------|---------------------------------------------------------|
| 0          | Header code \[0x002F0080\]                              |
| 1          | [CameraSelect](Camera_Services#cameraselect "wikilink") |
| 2          | u16, Register Address                                   |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | u16, Value  |
