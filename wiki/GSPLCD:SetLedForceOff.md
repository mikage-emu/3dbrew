# Request

| Index Word | Description                                      |
|------------|--------------------------------------------------|
| 0          | Header code \[0x00130040\]                       |
| 1          | u8 state: 0 = 3D LED enable, 1 = 3D LED disable. |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This command sets [3D_LEDSTATE](Configuration_Memory "wikilink") to the
input state value.