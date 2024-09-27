+++
title = 'GSP Shared Memory'
+++

This page describes the structure of the GSP
[shared](GSPGPU:RegisterInterruptRelayQueue "wikilink") memory.
Interrupt, framebuffer, and GX command data is stored here.

# Interrupt Queue

The Interrupt queue is located at sharedMemBase + (clientID \* 0x40).

| Index Byte | Description                                                                                      |
|------------|--------------------------------------------------------------------------------------------------|
| 0x0        | Offset from the count where to save incoming interrupts                                          |
| 0x1        | Count (max 0x20 for PDC, 0x34 for others)                                                        |
| 0x2        | Missed other interrupts (set to 1 when 0 and count \>= 0x34)                                     |
| 0x3        | Flags (bit0 = skip PDC)                                                                          |
| 0x4-0x7    | Missed PDC0 (incremented when flags.bit0 is clear and count \>= 0x20)                            |
| 0x8-0xB    | Missed PDC1 (same as above)                                                                      |
| 0xC-0x3F   | Interrupt list (u8) (0=PSC0, 1=PSC1, 2=PDC0/VBlankTop, 3=PDC1/VBlankBottom, 4=PPF, 5=P3D, 6=DMA) |

GSP fills the interrupt list, then triggers the event set with
[RegisterInterruptRelayQueue](GSPGPU:RegisterInterruptRelayQueue "wikilink")
for the specified process(es).

PDC interrupts are sent to all processes; other interrupts are only sent
to the process with GPU rights.

# Framebuffer Info

The framebuffer info structure for the top LCD is located at
sharedMemBase + 0x200 + (clientID \* 0x80).

The framebuffer info structure for the bottom LCD is located at
sharedMemBase + 0x240 + (clientID \* 0x80).

## Framebuffer Info Header

| Index Byte | Description                                                     |
|------------|-----------------------------------------------------------------|
| 0          | Framebuffer info [entry](GSPGPU:SetBufferSwap "wikilink") index |
| 1          | Flags (bit0 = client has set new data)                          |
| 3-2        | Padding                                                         |

## Framebuffer Info Structure

| Index Word | Description                                                                            |
|------------|----------------------------------------------------------------------------------------|
| 0          | Active framebuffer (0 = first, 1 = second)                                             |
| 1          | Left framebuffer VA                                                                    |
| 2          | Right framebuffer VA (top screen only)                                                 |
| 3          | [Stride](GPU/External_Registers#lcd_source_framebuffer_setup "wikilink") (offset 0x90) |
| 4          | [Format](GPU/External_Registers#framebuffer_format "wikilink")                         |
| 5          | [Status](GPU/External_Registers#lcd_source_framebuffer_setup "wikilink") (offset 0x78) |
| 6          | ? ("Attribute")                                                                        |

When a process sets this framebuffer info, it sets index to (index+1)
& 1. Then it writes the framebuffer info entry, and sets flag to
value 1. The GSP module loads this framebuffer info entry data into GSP
state once the [GPU](categories/GPU "wikilink") finishes processing GX commands 3
or 4. Once the GSP module finishes loading this framebuffer info, it
sets flag to value 0, then it will not load the framebuffer info again
until flag is value 1. After loading this entry data into GSP state, the
GSP module then writes this framebuffer state to the
[LCD](LCD "wikilink") registers. GSP module automatically updates the
LCD framebuffer registers each time GX commands 3 or 4 finish, even when
this shared memory data was not updated by the application.(GSP module
toggles the active framebuffer register when automatically updating LCD
registers, when shared memory data is not used)

The two 0x1C-byte framebuffer info entries are located at
framebufferinfo+4.

# 3D Slider and 3D [LED](GSPGPU:SetLedForceOff "wikilink")

See [Configuration Memory](Configuration_Memory "wikilink").

# Command Queue

The command queue is located at sharedMemBase + 0x800 + (clientID \*
0x200). It consists of an header followed by at most 15 command entries.
Each command entry is of size 0x20 and has an header followed by command
specific parameters.

After adding a command,
[TriggerCmdReqQueue](GSPGPU:TriggerCmdReqQueue "wikilink") must be used
to trigger GSP processing when the total commands field is value 1.

## Command Queue Header

| Index Byte | Description                                                                                                                                                |
|------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Index of the command to process, this is incremented by GSP before handling the command                                                                    |
| 1          | Total commands to process, this is incremented by the application when adding the command to the queue, and decremented by GSP before handling the command |
| 2          | Flags (bit0 = completed?, bit7 = fatal error)                                                                                                              |
| 3          | ? (bit0 = set flags.bit0)                                                                                                                                  |
| 4          | Result code for the last GX command which failed                                                                                                           |

## Command Header

| Index Byte | Description                                                                                                                                        |
|------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Command ID                                                                                                                                         |
| 1          | ?                                                                                                                                                  |
| 2          | ? (bit0 = set queue.flags.bit0 after processing)                                                                                                   |
| 3          | When set, the command fails if GSP is busy handling any other command; otherwise, it only fails if GSP is busy handling a command of the same kind |

## Commands

Addresses specified in parameters are virtual addresses. For
applications these are normally located in GSP memory, while for other
processes they are located in VRAM.

Address and size parameters except for command 0 and command 5 must be
8-byte aligned.

### Trigger DMA Request

| Index Word | Description                               |
|------------|-------------------------------------------|
| 0          | u8 CommandID is 0x00                      |
| 1          | Source address                            |
| 2          | Destination address                       |
| 3          | Size                                      |
| 6-4        | Unused                                    |
| 7          | Flush source (0 = don't flush, 1 = flush) |

This command is normally used to DMA data from the application GSP
[heap](Memory_layout "wikilink") to VRAM. When flushing is enabled and
the source buffer is not located within VRAM, svcFlushProcessDataCache
is used to flush the source buffer.

### Trigger Command List Processing

| Index Word | Description                                                      |
|------------|------------------------------------------------------------------|
| 0          | u8 CommandID is 0x01                                             |
| 1          | Buffer address                                                   |
| 2          | Buffer size                                                      |
| 3          | Update gas additive blend results (0 = don't update, 1 = update) |
| 6-4        | Unused                                                           |
| 7          | Flush buffer (0 = don't flush, 1 = flush)                        |

This command converts the specified address to a physical address, then
writes the physical address and size to the [GPU](categories/GPU "wikilink")
registers at 0x1EF018E0. This buffer contains [GPU
commands](GPU/Internal_Registers "wikilink"). When flushing is enabled,
svcFlushProcessDataCache is used to flush the buffer.

### Trigger Memory Fill

| Index Word | Description                                  |
|------------|----------------------------------------------|
| 0          | u8 CommandID is 0x02                         |
| 1          | Buf0 start address (0 = don't fill anything) |
| 2          | Buf0 value                                   |
| 3          | Buf0 end address                             |
| 4          | Buf1 start address (0 = don't fill anything) |
| 5          | Buf1 value                                   |
| 6          | Buf1 end address                             |
| 7          | Control0 \| (Control1 \<\< 16)               |

This command converts the specified addresses to physical addresses,
then writes these addresses and the specified parameters to the
[GPU](categories/GPU "wikilink") registers at 0x1EF00010 and 0x1EF00020. Doing so
fills the specified buffers with the associated 4-byte value. This is
used to clear GPU framebuffers. The associated buffer address must not
be \<= to the main buffer address, thus the associated buffer address
must not be zero as well. When the bufX address is zero, processing for
the bufX parameters is skipped.

The values of Control0 and Control1 give information about the type of
memory fill. See [here](GPU/External_Registers#memory_fill "wikilink")
for more information about memory fill parameters.

### Trigger Display Transfer

| Index Word | Description                                                                                                     |
|------------|-----------------------------------------------------------------------------------------------------------------|
| 0          | u8 CommandID is 0x03                                                                                            |
| 1          | Input framebuffer address                                                                                       |
| 2          | Output framebuffer address                                                                                      |
| 3          | Input framebuffer [dimensions](categories/GPU "wikilink")                                                                  |
| 4          | Output framebuffer dimensions                                                                                   |
| 5          | [Flags](categories/GPU "wikilink"), for applications this is 0x1001000 for the main screen, and 0x1000 for the sub screen. |
| 7-6        | Unused                                                                                                          |

This command converts the specified addresses to physical addresses,
then writes these physical addresses and parameters to the
[GPU](categories/GPU "wikilink") registers at 0x1EF00C00. This GPU command copies
the already rendered framebuffer data from the input GPU framebuffer
address to the specified output LCD framebuffer. The input framebuffer
is normally located in VRAM.

The GPU color buffer is stored in the same Z-curve (tiled) format as
textures. By default, SetDisplayTransfer converts the given buffer from
the tiled format to a linear format adapted to the LCD framebuffers.

Display transfers are performed asynchronously, so after requesting a
display transfer you should wait for the PPF interrupt to fire before
reading the output data.

Some color formats seem to require specific input / output sizes when
performing a display transfer, doing an RGB5A1-\>RGBA4 display transfer
would never fire the PPF interrupt with a 32x32 buffer, increasing the
buffer to 128x128 made it fire correctly.

### Trigger Texture Copy

| Index Word | Description                                                                                                                                                                                                                                                  |
|------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | u8 CommandID is 0x04                                                                                                                                                                                                                                         |
| 1          | Input buffer address.                                                                                                                                                                                                                                        |
| 2          | Output buffer address.                                                                                                                                                                                                                                       |
| 3          | Total bytes to copy, not including gaps.                                                                                                                                                                                                                     |
| 4          | Bits 0-15: Size of input line, in bytes. Bits 16-31: Gap between input lines, in bytes.                                                                                                                                                                      |
| 5          | Same as 4, but for the output.                                                                                                                                                                                                                               |
| 6          | Flags, corresponding to the [Transfer Engine flags](GPU/External_Registers#transfer_engine "wikilink"). However, for TextureCopy commands, bit 3 is always set, bit 2 is set if any output dimension is smaller than the input, and other bits are always 0. |
| 7          | Unused                                                                                                                                                                                                                                                       |

This command is similar to cmd3. It also triggers the [GPU Transfer
Engine](GPU/External_Registers#transfer_engine "wikilink"), but setting
the TextureCopy parameters.

### Flush Cache Regions

| Index Word | Description          |
|------------|----------------------|
| 0          | u8 CommandID is 0x05 |
| 1          | Buf0 address         |
| 2          | Buf0 size            |
| 3          | Buf1 address         |
| 4          | Buf1 size            |
| 5          | Buf2 address         |
| 6          | Buf2 size            |
| 7          | Unused               |

The application buffer addresses specified in the parameters are used
with [svcFlushProcessDataCache](SVC "wikilink"). The input buf0 size
must not be zero. When buf1 size is zero, svcFlushProcessDataCache() for
buf1 and buf2 are skipped. When buf2 size is zero,
svcFlushProcessDataCache() for buf2 is skipped.
