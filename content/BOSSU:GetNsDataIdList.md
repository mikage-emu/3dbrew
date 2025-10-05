+++
title = 'BOSSU:GetNsDataIdList'
+++

# Request

{{% ipc/request header="0x00100102" %}}
{{% ipc/param %}}u32, Filter{{% / %}}
{{% ipc/param %}}u32, Number of entries that the list can hold (max entries){{% / %}}
{{% ipc/param %}}u16, Starting index in the internal NS Data ID list{{% / %}}
{{% ipc/param %}}u32, Starting NS Data ID{{% / %}}
{{% ipc/mapbuffer w %}}Output NS Data ID list{{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x001000c2" %}}
{{% ipc/result %}}
{{% ipc/param %}}u16, Actual number of output entries{{% / %}}
{{% ipc/param %}}u16, Last index copied to output in the internal NS Data ID list{{% / %}}
{{% ipc/mapbuffer w %}}Output NS Data ID list{{% / %}}
{{% / %}}

# Description

Writes an array of NS Data ID entries (u32) for the program ID of the current session to the output buffer using the provided filters.

## Internals

This eventually calls a function with the following type parameters: 0, 1, 1. This function doesn't use the second type parameter. Afterwards another function is called using the program ID.

The first type parameter is a filter based on the new flag of the NsData:

| Value | Description |
|----|----|
| 0 | Allow everything. This will also unset the [arrival flag](BOSS_Savegame#boss_a_titleinfo "wikilink") |
| 1 | Only allow entries which don't have the new flag set. This will also set the [arrival flag](BOSS_Savegame#boss_a_titleinfo "wikilink") |
| 2 | Only allow entries which have the new flag set. This will also set the [arrival flag](BOSS_Savegame#boss_a_titleinfo "wikilink") |

The second type parameter represents the session being used for the command:

| Value | Description |
|-------|-------------|
| 1     | User        |
| 2     | Privileged  |

The third type parameter is a filter based on the program ID of the session:

| Value | Description |
|----|----|
| 0 | Allow everything |
| 1 | Only allow entries which have a target program ID matching the program ID of the session |

Hence, this command only lists entries whose program ID matches the one from this session.

# Filter

Content filtering is enabled when this word isn't 0xFFFFFFFF. This is only used for the following: `if (filterword_u16high != contentdatatype_u16high || (filterword_u16low & contentdatatype_u16low) == 0) continue;` Hence, filterword_u16high must match contentdatatype_u16high, and the bitmask specified by filterword_u16low must be non-zero in contentdatatype_u16low. The contentdatatype is extracted from the extdata filename, which originates from the [BOSS-container](SpotPass "wikilink"). The NS Data ID for the content entry is only written to the output when processing isn't skipped due to filtering.

# Start NsDataId

This field is only used when the starting index is non-zero or when this field is non-zero.

The NS Data ID at the specified starting index must match this field, otherwise error 0xD840F846 is returned. It will then skip normal content entry processing for this matching entry (cur_wordindex is field is increased by 0x1 before starting the content entry processing loop).
