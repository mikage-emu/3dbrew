# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00070000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | u8 output   |

# Output Values

These values are only reliable when [no external power is
connected](PTM:GetAdapterState "wikilink").

| Value | State of charge                                                                                |
|-------|------------------------------------------------------------------------------------------------|
| 5     | 100~61% (4 blue bars)                                                                          |
| 4     | 60~31% (3 blue bars)                                                                           |
| 3     | 30~11% (2 blue bars)                                                                           |
| 2     | 10~6% (1 red bar)                                                                              |
| 1     | 5~1% (1 red bar & [notification LED](PTMSYSM:SetBatteryEmptyLEDPattern "wikilink") both blink) |
| 0     | 0% (system shutdown)                                                                           |