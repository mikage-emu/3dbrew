+++
title = 'BOSSU:GetNsDataIdList'
+++

# Request

{{#vardefine:ipc_offset\|0}}

# Response

{{#vardefine:ipc_offset\|0}}

# Filter

Content filtering is enabled when this word isn't 0xffffffff. This is
only used for the following:
```
if(filterword_u16high!=contentdatatype_u16high || (filterword_u16low & contentdatatype_u16low) == 0)continue;
```
Hence, filterword_u16high must match contentdatatype_u16high, and the
bitmask specified by filterword_u16low must be non-zero in
contentdatatype_u16low. The contentdatatype is extracted from the
extdata filename, which originates from the
[BOSS-container](SpotPass "wikilink"). The NsDataId for the content
entry is only written to the output when processing isn't skipped due to
filtering.

# Start NsDataId

This field is only used when starting_wordindex is non-zero or when this
field is non-zero.

The NsDataId at the specified start-wordindex must match this field,
otherwise error 0xD840F846 is returned. It will then skip normal content
entry processing for this matching entry(cur_wordindex is field is
increased by 0x1 before starting the content entry processing loop).

# Description

This writes an array of u32 entries(NsDataId) to the output buffer, for
the current programID.

This eventually calls a function with the following type parameters: 0,
1, 1. This function doesn't use the second type parameter. Afterwards
another function is called using the programID.