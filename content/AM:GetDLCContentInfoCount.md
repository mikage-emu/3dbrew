TID high value must be 0x0004008C, otherwise 0xE0E0801F is returned.

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x100100C0\]                             |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink") |
| 2-3        | u64, Title ID                                          |

# Response

| Index Word | Description             |
|------------|-------------------------|
| 0          | Header code             |
| 1          | Result code             |
| 2          | Number of Content Infos |