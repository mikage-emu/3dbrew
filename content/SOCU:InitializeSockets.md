# Request

| Index Word | Description                            |
|------------|----------------------------------------|
| 0          | Header code \[0x00010044\]             |
| 1          | Memory block size                      |
| 2          | Value 0x20 (processID header)          |
| 3          | ProcessID set by the ARM11 kernel.     |
| 4          | Value 0x0                              |
| 5          | [Shared](SVC "wikilink") memory handle |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |