# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00050000\] |

# Response

| Index Word | Description         |
|------------|---------------------|
| 0          | Header code         |
| 1          | Result code         |
| 2-5        | FriendKey structure |

FriendKey Structure:

|     |                 |
|-----|-----------------|
| u32 | principalId     |
| u32 | padding?        |
| u64 | localFriendCode |