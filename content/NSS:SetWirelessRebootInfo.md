# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00060042\] |
| 1          | Size                       |
| 2          | (Size \<\< 14) \| 2        |
| 3          | Data Pointer               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

The input buffer data is copied to the NS [FIRM](FIRM "wikilink")
parameter buffer at offset 0x4A0, the size used by NS is clamped to
0x10-bytes. A state flag is also set to 0x3.

This data can then be loaded via
[<APT:GetWirelessRebootInfo>](APT:GetWirelessRebootInfo "wikilink")
later.

This command is used by the dlplay system-application.