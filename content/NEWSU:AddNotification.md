# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x000100C8\]         |
| 1          | Header buffer size                 |
| 2          | Message buffer size                |
| 3          | Image buffer size, can be zero     |
| 4          | Value 0x20                         |
| 5          | ProcessID set by the ARM11-kernel. |
| 6          | (HdrSize\<\<4) \| 10               |
| 7          | Header buffer ptr                  |
| 8          | (MsgSize\<\<4) \| 10               |
| 9          | Message buffer ptr                 |
| 10         | (ImageSize\<\<4) \| 10             |
| 11         | Image buffer ptr, can be 0x0       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This is similar to
[NEWSS:AddNotification](NEWSS:AddNotification "wikilink"). This uses
[FS:GetProgramLaunchInfo](FS:GetProgramLaunchInfo "wikilink") with the
input processID to set the u64 programID @ notificationhdr+8.