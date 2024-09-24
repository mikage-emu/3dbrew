# Request

| Index Word | Description                                                                                                                               |
|------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00060042\]\]                                                                                                              |
| 1          | Base address of the mapped [CRO](CRO0 "wikilink"), in the process memory, originally passed to [RO:LoadExeCRO](RO:LoadExeCRO "wikilink"). |
| 2          | Must be zero ([translation descriptor](IPC#Message_Structure "wikilink"))                                                                 |
| 3          | [KProcess](SVC "wikilink") handle                                                                                                         |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |