# Request

| Index Word | Description                      |
|------------|----------------------------------|
| 0          | Header code \[0x00030244\]       |
| 1          | Transaction (usually 0)          |
| 2          | Source archive lower word        |
| 3          | Source archive upper word        |
| 4          | SourcePath.Type                  |
| 5          | SourcePath.Size                  |
| 6          | Destination archive lower word   |
| 7          | Destination archive upper word   |
| 8          | DestinationPath.Type             |
| 9          | DestinationPath.Size             |
| 10         | (SourcePath.Size\<\<8) \| 6      |
| 11         | SourcePath.Data pointer          |
| 12         | (DestinationPath.Size\<\<8) \| 6 |
| 13         | DestinationPath.Data pointer     |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |