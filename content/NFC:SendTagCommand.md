+++
title = 'NFC:SendTagCommand'
+++

# Request

{{#vardefine:ipc_offset\|0}}

{{#vardefine:ipc_offset\|0}}

# Response

{{#vardefine:ipc_offset\|0}}

# Description

This sends a raw NFC command to the tag. The inbuf/outbuf is the raw
data to send/receive to/from the tag. With Amiibo tags the first byte in
the inbuf is the command, followed by any parameters for the command if
required.

outputsize value 0x800 will be used when it's \>=0x800. An error will be
returned if actual_output_size is larger than outputsize. This can only
be used when [initialized](NFC:Initialize "wikilink") with type3, and
when the [TagState](NFC:GetTagState "wikilink") is 3.