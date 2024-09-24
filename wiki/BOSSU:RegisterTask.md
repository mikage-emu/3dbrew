# Request

| Index Word | Description                                                   |
|------------|---------------------------------------------------------------|
| 0          | Header code \[0x000B00C2\]                                    |
| 1          | TaskID buffer size                                            |
| 2          | u8, unknown(bool). Usually zero, regardless of HTTP GET/POST. |
| 3          | u8, unknown. Usually zero, regardless of HTTP GET/POST.       |
| 4          | (Size \<\< 4) \| 0xA                                          |
| 5          | TaskID data pointer                                           |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This registers a task and updates the BOSS savedata immediately,
including info previously initialized with
[BOSSU:SendProperty](BOSSU:SendProperty "wikilink").