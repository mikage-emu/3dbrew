# Request

| Index Word | Description                                                |
|------------|------------------------------------------------------------|
| 0          | Header code \[0x04040100\]                                 |
| 1-4        | [Program Info](Filesystem_services#ProgramInfo "wikilink") |

# Response

| Index Word | Description         |
|------------|---------------------|
| 0          | Header code         |
| 1          | Result code         |
| 2-3        | u64, Program Handle |