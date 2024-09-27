+++
title = 'CAMU:GetBufferErrorInterruptEvent'
+++

# Request

| Index Word | Description                             |
|------------|-----------------------------------------|
| 0          | Header code \[0x00060040\]              |
| 1          | [Port](Camera_Services#Port "wikilink") |

# Response

| Index Word | Description                  |
|------------|------------------------------|
| 0          | Header code                  |
| 1          | Result code                  |
| 2          | Copy handle descriptor (0x0) |
| 3          | Event Handle                 |