+++
title = 'FS:SetSaveDataSecureValue'
+++

# Request

| Index Word | Description                                                         |
|------------|---------------------------------------------------------------------|
| 0          | Header code \[0x08650140\]                                          |
| 1-2        | u64, Value                                                          |
| 3          | [Secure Value Slot](Filesystem_services#securevalueslot "wikilink") |
| 4          | Title Unique ID (0 = current)                                       |
| 5          | u8, Title Variation (0 = current)                                   |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
