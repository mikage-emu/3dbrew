+++
title = 'IRRST:Initialize'
+++

# Request

| Index Word | Description                                                                                                                                                                             |
|------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00020080\]                                                                                                                                                              |
| 1          | u32, HID data update period in ms. only values in range \[10, 21\] are allowed.                                                                                                         |
| 2          | u8, if the value is non-zero, raw C-stick axis data without calibration will be written to [IRRST Shared Memory](IRRST_Shared_Memory "wikilink"), and won't generate C-stick PAD state. |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00020040\] |
| 1          | Result code                |