+++
title = 'MVDSTD:SetupOutputBuffers'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001F0902\] |
| 1-35       | 0x8C-byte input structure. |
| 36         | Size of each buffer.       |
| 37         | Value 0x0                  |
| 38         | KProcess handle            |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Input Structure

| Offset | Size | Description                                 |
|--------|------|---------------------------------------------|
| 0x0    | 0x4  | Total entries that are actually used below. |
| 0x4    | 0x88 | 17 0x8-byte entries.                        |

## Entry Structure

| Offset | Size | Description                                                                                          |
|--------|------|------------------------------------------------------------------------------------------------------|
| 0x0    | 0x4  | Linearmem vaddr output buffer, equivalent to config+0x64. This must be non-zero.                     |
| 0x4    | 0x4  | Linearmem vaddr additional output buffer, equivalent to config+0x68. This can be zero when not used. |

# Description

This command isn't used by SKATER.

This loads the input structure into state, the vaddrs are also converted
to physaddrs. It appears using this command multiple times will replace
the entry-list in state with the input entry-list.

Once this command is used, each
[rendered](MVDSTD:ControlFrameRendering "wikilink") frame will be
written into the output buffers specified by the entry-list in state,
instead of the output buffers from configuration. A separate frame is
written into the buffers for each individual entry.