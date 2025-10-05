+++
title = 'FS:GetThisSaveDataSecureValue'
+++

# Request

{{% ipc/request header="0x86F0040" %}}
{{% ipc/param %}}u32, [Secure Value Slot](Filesystem_services#securevalueslot "wikilink"){{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x86F0140" %}}
{{% ipc/result %}}
{{% ipc/param %}}bool, whether or not the secure value was found{{% / %}}
{{% ipc/param %}}bool, whether or not the title is from a gamecart (regardless of whether or not the secure value was found){{% / %}}
{{% ipc/param span=2 %}}u64, Secure value{{% / %}}

{{% / %}}

# Description

Gets the secure value of the title corresponding to the current session.

If the caller process is on a game card, the secure value is read from the [DISA save image](DISA_and_DIFF#disa_header "wikilink")'s header.
Otherwise, the secure value is read from the [Anti Savegame Restore](Filesystem_services#anti_savegame_restore "wikilink") save data.
