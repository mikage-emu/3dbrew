+++
title = 'CAMU:ReadMcuVariableI2cExclusive'
+++

# Request

| Index Word | Description                                             |
|------------|---------------------------------------------------------|
| 0          | Header code \[0x00300080\]                              |
| 1          | [CameraSelect](Camera_Services#CameraSelect "wikilink") |
| 2          | u16, Variable Address                                   |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | u16, Value  |