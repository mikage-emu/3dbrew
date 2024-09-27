+++
title = 'CAMU:WriteMcuVariableI2c'
+++

# Request

| Index Word | Description                                             |
|------------|---------------------------------------------------------|
| 0          | Header code \[0x002E00C0\]                              |
| 1          | [CameraSelect](Camera_Services#cameraselect "wikilink") |
| 2          | u16, Variable Address                                   |
| 3          | u16, Data                                               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
