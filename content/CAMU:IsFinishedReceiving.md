+++
title = 'CAMU:IsFinishedReceiving'
+++

# Request

| Index Word | Description                             |
|------------|-----------------------------------------|
| 0          | Header code \[0x00080040\]              |
| 1          | [Port](Camera_Services#port "wikilink") |

# Response

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code                        |
| 1          | Result code                        |
| 2          | u8, 0 = Not Finished, 1 = Finished |
