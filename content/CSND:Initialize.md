# Request

| Index Word | Description                                                                                                                           |
|------------|---------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00010140\]                                                                                                            |
| 1          | Shared memory block size, for mem-block creation.                                                                                     |
| 2          | Offset0 located in the shared-memory, region size=8, used for dumping some DSP flags with type0 cmd 0x300.                            |
| 3          | Offset1 located in the shared-memory, region size=12\*num_channels, used for dumping sound channel states with type0 cmd 0x300.       |
| 4          | Offset2 located in the shared-memory, region size=8\*num_capturedevices, used for dumping capture device states with type0 cmd 0x300. |
| 5          | Offset3 located in the shared-memory.                                                                                                 |

# Response

| Index Word | Description                                                 |
|------------|-------------------------------------------------------------|
| 0          | Header code                                                 |
| 1          | Result code                                                 |
| 2          | Handle-list header, value is: 0x4000000                     |
| 3          | Mutex handle                                                |
| 4          | [Shared memory](CSND_Shared_Memory "wikilink") block handle |