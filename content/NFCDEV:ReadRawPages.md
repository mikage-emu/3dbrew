+++
title = 'NFCDEV:ReadRawPages'
+++

# Request

{{#vardefine:ipc_offset\|0}}

{{#vardefine:ipc_offset\|0}}

# Response

{{#vardefine:ipc_offset\|0}}

# Description

This reads raw NFC tag pages by calling send_nfctag_cmd() with cmd
0x3A("FAST_READ"). The output-data is stored on stack, which is copied
to the specified output-buffer afterwards using the actual_output_size.
An error is returned if actual_output_size is larger than outputsize.

outputsize 0x800 is used when it's \>=0x800.