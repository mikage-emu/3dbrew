# Request

{{#vardefine:ipc_offset\|0}}

{{#vardefine:ipc_offset\|0}}

# Response

{{#vardefine:ipc_offset\|0}}

# Description

This is similar to [NFC:SendTagCommand](NFC:SendTagCommand "wikilink"),
except this just calls send_nfctag_cmd() directly without calling a
bunch of other code.

outputsize value 0x800 will be used when it's \>=0x800.