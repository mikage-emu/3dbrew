+++
title = 'FS:SetSaveArchiveSecureValue'
+++

# Request

{{% ipc/request header="0x8750140" %}}
{{% ipc/param span=2 %}}u64, Save data [Archive](Filesystem_services#archives "wikilink") handle{{% / %}}
{{% ipc/param %}}u32, [Secure Value Slot](Filesystem_services#securevalueslot "wikilink"){{% / %}}
{{% ipc/param span=2 %}}u64, Secure value{{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x8750040" %}}
{{% ipc/result %}}
{{% / %}}

# Description

This command is identical to [FS:SetOtherSaveDataSecureValue](FS:SetOtherSaveDataSecureValue "wikilink"), but instead of specifying the title ID and mediatype manually, these parameters are retrieved through the given save data archive handle using internal state data.
