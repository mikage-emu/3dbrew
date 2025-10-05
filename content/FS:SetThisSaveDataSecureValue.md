+++
title = 'FS:SetThisSaveDataSecureValue'
+++

# Request

{{% ipc/request header="0x86E00c0" %}}
{{% ipc/param %}}u32, [Secure Value Slot](Filesystem_services#securevalueslot "wikilink"){{% / %}}
{{% ipc/param span=2 %}}u64, value{{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x86E0040" %}}
{{% ipc/result %}}
{{% / %}}

# Description

Sets the secure value of the title corresponding to the current session.

If the caller process is on a game card, the secure value is written to the [DISA save image](DISA_and_DIFF#disa_header "wikilink")'s header.
Otherwise, the secure value is written to the [Anti Savegame Restore](Filesystem_services#anti_savegame_restore "wikilink") save data.
