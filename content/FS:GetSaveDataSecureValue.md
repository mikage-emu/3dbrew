+++
title = 'FS:GetSaveDataSecureValue'
+++

# Request

| Index Word | Description |
|----|----|
| 0 | Header code \[0x086600C0\] |
| 1 | [Secure Value Slot](Filesystem_services#securevalueslot "wikilink") |
| 2 | Title Unique ID (0 = current) |
| 3 | u8, Title Variation (0 = current) |

# Response

| Index Word | Description                       |
|------------|-----------------------------------|
| 0          | Header code                       |
| 1          | Result code                       |
| 2          | u8, 0 = doesn't exist, 1 = exists |
| 3-4        | u64, Value                        |

# Description

Gets the secure value for a specific title (or current title) in the specified slot. This command will read from the [Anti Savegame Restore](Filesystem_services#anti_savegame_restore "wikilink") save data.

If appropriate FS permissions are not set in the caller processes' exheader, this command will only run if the save data ID for the specified title is present in the exheader.
