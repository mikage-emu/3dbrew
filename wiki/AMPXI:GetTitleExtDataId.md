# Request

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code \[0x000600C0\]                            |
| 1          | [MediaType](Filesystem_services#MediaType "wikilink") |
| 2-3        | u64, Title ID                                         |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000600C0\] |
| 1          | Result code                |
| 2-3        | u64, ExtData ID            |