+++
title = 'CAMU:SetTransferBytes'
+++

# Request

| Index Word | Description                             |
|------------|-----------------------------------------|
| 0          | Header code \[0x000B0100\]              |
| 1          | [Port](Camera_Services#port "wikilink") |
| 2          | Bytes                                   |
| 3          | s16, Width                              |
| 4          | s16, Height                             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
