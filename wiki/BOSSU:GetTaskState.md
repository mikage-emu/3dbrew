# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00200082\] |
| 1          | TaskID buffer size         |
| 2          | s8 val, unknown.           |
| 3          | (Size \<\< 4) \| 0xA       |
| 4          | TaskID data pointer        |

# Response

| Index Word | Description                                                                                                       |
|------------|-------------------------------------------------------------------------------------------------------------------|
| 0          | Header code                                                                                                       |
| 1          | Result code                                                                                                       |
| 2          | u8 [TaskStatus](BOSS_Services "wikilink")                                                                         |
| 3          | Current state value for task PropertyID 0x4.                                                                      |
| 4          | Unknown output u8. Usually 0 when TaskStatus isn't 0x0. In one cases when TaskStatus was 0x0, this field was 0x5. |