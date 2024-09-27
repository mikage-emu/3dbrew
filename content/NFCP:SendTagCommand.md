+++
title = 'NFCP:SendTagCommand'
+++

# Request

{{#vardefine:ipc_offset\|0}}

{{#vardefine:ipc_offset\|0}}

# Response

{{#vardefine:ipc_offset\|0}}

# Description

This is about the same as
[NFCS:SendTagCommand](NFCS:SendTagCommand "wikilink"), except that this
verifies that the input/output buffer ptrs are not NULL. This also
clears the output buffer before calling the cmd-sending func. A state
field(probably TagState?) must match 3.

outputsize value 0x800 will be used when it's \>=0x800.