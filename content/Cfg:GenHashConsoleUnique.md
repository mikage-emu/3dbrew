# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00030040\] |
| 1          | 20bit application ID salt  |

# Response

| Index Word | Description          |
|------------|----------------------|
| 0          | Header code          |
| 1          | Result code          |
| 2          | Hash/"ID" lower word |
| 3          | Hash/"ID" upper word |

# Description

The output hash/"ID" is the the last two words of a SHA-256 hash. This
hashes an u64 console-unique field followed by the u32 appID salt. The
console-unique field is loaded internally from
[config](Config_Savegame "wikilink") blkID 0x90001, which is generated
from the console-unique FriendCodeSeed.