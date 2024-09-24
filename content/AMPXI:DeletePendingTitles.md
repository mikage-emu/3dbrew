# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x00070080\]                             |
| 1          | [MediaType](Filesystem_services#MediaType "wikilink")  |
| 2          | Flags (bit0 = non-system titles, bit1 = system titles) |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00070040\] |
| 1          | Result code                |