+++
title = 'FS:GetExtDataBlockSize'
+++

# Request

| Index Word | Description                                                       |
|------------|-------------------------------------------------------------------|
| 0          | Header code \[0x08540100\]                                        |
| 1-4        | [ExtSaveDataInfo](Filesystem_services#ExtSaveDataInfo "wikilink") |

# Response

| Index Word | Description           |
|------------|-----------------------|
| 0          | Header code           |
| 1          | Result code           |
| 2-3        | u64, Total Blocks     |
| 4-5        | u64, Remaining Blocks |
| 6          | Block Size            |