# Request

| Index Word | Description                          |
|------------|--------------------------------------|
| 0          | Header code \[0x083E00C2\]           |
| 1          | Number of Directories                |
| 2          | Number of Files                      |
| 3          | File Size Count                      |
| 4          | ((FileSizeCount \* 8) \<\< 4) \| 0xA |
| 5          | File Size Buffer Pointer             |

# Response

| Index Word | Description           |
|------------|-----------------------|
| 0          | Header code           |
| 1          | Result code           |
| 2-3        | u64, Total Quota Size |

# Description

This calculates the total size of save data given its formatting details
and file sizes.