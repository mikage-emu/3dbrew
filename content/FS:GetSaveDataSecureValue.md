+++
title = 'FS:GetSaveDataSecureValue'
+++

# Request

| Index Word | Description                                                         |
|------------|---------------------------------------------------------------------|
| 0          | Header code \[0x086600C0\]                                          |
| 1          | [Secure Value Slot](Filesystem_services#SecureValueSlot "wikilink") |
| 2          | Title Unique ID (0 = current)                                       |
| 3          | u8, Title Variation (0 = current)                                   |

# Response

| Index Word | Description                       |
|------------|-----------------------------------|
| 0          | Header code                       |
| 1          | Result code                       |
| 2          | u8, 0 = doesn't exist, 1 = exists |
| 3-4        | u64, Value                        |