# Request

| Index Word | Description                                                                                                                        |
|------------|------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x000100C2\]                                                                                                         |
| 1          | [CRS](CRO0 "wikilink")(usually from "romfs:/cro/static.crs") buffer pointer, in the process memory specified via the below handle. |
| 2          | CRS size                                                                                                                           |
| 3          | Process-memory address where the CRS will be mapped                                                                                |
| 4          | Must be zero                                                                                                                       |
| 5          | [KProcess](SVC "wikilink") handle                                                                                                  |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |