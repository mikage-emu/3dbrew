# Request

{{#vardefine:ipc_offset\|0}}

# Response

{{#vardefine:ipc_offset\|0}}

# Description

This writes 0x1-bytes to SPI for command 0x9F(RDID), then reads 2-bytes
of output which are then copied to cmdreply\[2\].