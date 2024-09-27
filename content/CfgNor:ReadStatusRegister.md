+++
title = 'CfgNor:ReadStatusRegister'
+++

# Request

{{#vardefine:ipc_offset\|0}}

# Response

{{#vardefine:ipc_offset\|0}}

# Description

This writes 0x1-byte to SPI for command 0x05(RDSR), then reads 0x1-byte
of output which are then copied to cmdreply\[2\].