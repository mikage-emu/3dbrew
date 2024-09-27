+++
title = 'CAMU:GetTrimmingParams'
+++

# Request

| Index Word | Description                             |
|------------|-----------------------------------------|
| 0          | Header code \[0x00110040\]              |
| 1          | [Port](Camera_Services#Port "wikilink") |

# Response

| Index Word | Description  |
|------------|--------------|
| 0          | Header code  |
| 1          | Result code  |
| 2          | s16, X Start |
| 3          | s16, Y Start |
| 4          | s16, X End   |
| 5          | s16, Y End   |