+++
title = 'FS:ControlSecureSave'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x086700C4\] |
| 1          | Action                     |
| 2          | Input Size                 |
| 3          | Output Size                |
| 4          | (inputSize \<\< 4) \| 0xA  |
| 5          | void\* Input               |
| 6          | (outputSize \<\< 4) \| 0xC |
| 7          | void\* Output              |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This allows performing extra actions on secure saves.

# Action

| Value | Description                    | Input                                                                                                                          | Output            |
|-------|--------------------------------|--------------------------------------------------------------------------------------------------------------------------------|-------------------|
| 0     | Deletes a save's secure value. | u64, (([SecureValueSlot](Filesystem_services#SecureValueSlot "wikilink") \<\< 32) \| (TitleUniqueId \<\< 8) \| TitleVariation) | u8, Value Existed |
| 1     | Formats a save.                | None                                                                                                                           | None              |
