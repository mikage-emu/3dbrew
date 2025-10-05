+++
title = 'FS:SetSaveDataSecureValue'
+++

# Request

| Index Word | Description |
|----|----|
| 0 | Header code \[0x08650140\] |
| 1-2 | u64, Value |
| 3 | [Secure Value Slot](Filesystem_services#securevalueslot "wikilink") |
| 4 | Title Unique ID (0 = current) |
| 5 | u8, Title Variation (0 = current) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Sets the secure value for a specified title (or the current title) in the specified slot. This command will write to the [Anti Savegame Restore](Filesystem_services#anti_savegame_restore "wikilink") save data.

If appropriate FS permissions are not set in the caller processes' exheader, this command will only run if the save data ID for the specified title is present in the exheader.
