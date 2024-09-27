+++
title = 'CAMU:IsTrimming'
+++

# Request

| Index Word | Description                             |
|------------|-----------------------------------------|
| 0          | Header code \[0x000F0040\]              |
| 1          | [Port](Camera_Services#Port "wikilink") |

# Response

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code                        |
| 1          | Result code                        |
| 2          | u8, 0 = Not Trimming, 1 = Trimming |
