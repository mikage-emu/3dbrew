+++
title = 'FS:GetOtherSaveDataSecureValue'
+++

# Request

{{% ipc/request header="0x86C00c2" %}}
{{% ipc/param %}}u8, [Media Type](Filesystem_services#mediatype "wikilink"){{% / %}}
{{% ipc/param %}}u32, Unique ID{{% / %}}
{{% ipc/param %}}u32, Entry count{{% / %}}
{{% ipc/mapbuffer w %}}Output [SecureValueEntry](Filesystem_services#securevalueentry "wikilink") buffer pointer{{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x086C0082" %}}
{{% ipc/result %}}
{{% ipc/param %}}u32, Number of read entries{{% / %}}
{{% ipc/mapbuffer w %}}Output [SecureValueEntry](Filesystem_services#securevalueentry "wikilink") buffer pointer{{% / %}}
{{% / %}}

# Description

Queries the secure value(s) of another title.

This command will, by default, read from the secure value section of the [DISA save image's header](DISA_and_DIFF#disa_header "wikilink").

However, it is possible to force this command to read from the [Anti Savegame Restore](Filesystem_services#anti_savegame_restore "wikilink") save data by specifying media type 100 (the meaning of this media type is unknown and is not used elsewhere in FS).
