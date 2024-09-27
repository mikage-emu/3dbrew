+++
title = 'CAMU:GetVsyncInterruptEvent'
+++

# Request

| Index Word | Description                             |
|------------|-----------------------------------------|
| 0          | Header code \[0x00050040\]              |
| 1          | [Port](Camera_Services#port "wikilink") |

# Response

| Index Word | Description                  |
|------------|------------------------------|
| 0          | Header code                  |
| 1          | Result code                  |
| 2          | Copy handle descriptor (0x0) |
| 3          | Event Handle                 |
