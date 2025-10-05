+++
title = 'FS:SetOtherSaveDataSecureValue'
+++

# Request

{{% ipc/request header="0x086B00c2" %}}
{{% ipc/param %}}u8, [Media Type](Filesystem_services#mediatype "wikilink"){{% / %}}
{{% ipc/param %}}u32, Unique ID{{% / %}}
{{% ipc/param %}}u32, Entry count{{% / %}}
{{% ipc/mapbuffer r %}}Input [SecureValueEntry](Filesystem_services#securevalueentry "wikilink") buffer pointer{{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x086B0042" %}}
{{% ipc/result %}}
{{% ipc/mapbuffer r %}}Input [SecureValueEntry](Filesystem_services#securevalueentry "wikilink") buffer pointer{{% / %}}
{{% / %}}

# Description

Updates or removes the secure value(s) of another title.

This command will, by default, write to the secure value section of the [DISA save image's header](DISA_and_DIFF#disa_header "wikilink").

However, it is possible to force this command to write to the [Anti Savegame Restore](Filesystem_services#anti_savegame_restore "wikilink") save data by specifying media type 100 (the meaning of this media type is unknown and is not used elsewhere in FS).
