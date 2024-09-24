+++
title = 'CAMU:SetTrimming'
+++

# Request

| Index Word | Description                             |
|------------|-----------------------------------------|
| 0          | Header code \[0x000E0080\]              |
| 1          | [Port](Camera_Services#Port "wikilink") |
| 2          | u8, 0 = Not Trimming, 1 = Trimming      |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
