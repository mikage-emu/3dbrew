+++
title = 'GSP Shared Memory'
+++

This page describes the structure of the GSP [shared](GSPGPU:RegisterInterruptRelayQueue "wikilink") memory. Interrupt, framebuffer, and GX command data is stored here.

# Interrupt Queue

The Interrupt queue is located at sharedMemBase + (clientID \* 0x40).

| Index Byte | Description |
|----|----|
| 0x0 | Offset from the count where to save incoming interrupts |
| 0x1 | Count (max 0x20 for PDC, 0x34 for others) |
| 0x2 | Missed other interrupts (set to 1 when 0 and count \>= 0x34) |
| 0x3 | Flags (bit0 = skip PDC) |
| 0x4-0x7 | Missed PDC0 (incremented when flags.bit0 is clear and count \>= 0x20) |
| 0x8-0xB | Missed PDC1 (same as above) |
| 0xC-0x3F | Interrupt list (u8) (0=PSC0, 1=PSC1, 2=PDC0/VBlankTop, 3=PDC1/VBlankBottom, 4=PPF, 5=P3D, 6=DMA) |

GSP fills the interrupt list, then triggers the event set with [RegisterInterruptRelayQueue](GSPGPU:RegisterInterruptRelayQueue "wikilink") for the specified process(es).

PDC interrupts are sent to all processes; other interrupts are only sent to the process with rendering rights.

When issuing a [Memory Fill](GSP_Shared_Memory#trigger_memory_fill "wikilink") command with both buffers set GSP will only dispatch PSC0.

# Framebuffer Info

The framebuffer info structure for the top LCD is located at sharedMemBase + 0x200 + (clientID \* 0x80).

The framebuffer info structure for the bottom LCD is located at sharedMemBase + 0x240 + (clientID \* 0x80).

## Framebuffer Info Header

| Index Byte | Description |
|----|----|
| 0 | Framebuffer info [entry](GSPGPU:SetBufferSwap "wikilink") index |
| 1 | Flags (bit0 = client has set new data) |
| 3-2 | Padding |

## Framebuffer Info Structure

| Index Word | Description |
|----|----|
| 0 | Active framebuffer (0 = first, 1 = second) |
| 1 | Left framebuffer VA |
| 2 | Right framebuffer VA (top screen only) |
| 3 | [Stride](GPU/External_Registers#lcd_source_framebuffer_setup "wikilink") (offset 0x90) |
| 4 | [Format](GPU/External_Registers#framebuffer_format "wikilink") |
| 5 | [Status](GPU/External_Registers#lcd_source_framebuffer_setup "wikilink") (offset 0x78) |
| 6 | ? ("Attribute") |

When a process sets this framebuffer info, it sets index to (index+1) & 1. Then it writes the framebuffer info entry, and sets flag to value 1. The GSP module loads this framebuffer info entry data into GSP state once the [GPU](GPU "wikilink") finishes processing GX commands 3 or 4. Once the GSP module finishes loading this framebuffer info, it sets flag to value 0, then it will not load the framebuffer info again until flag is value 1. After loading this entry data into GSP state, the GSP module then writes this framebuffer state to the [LCD](LCD "wikilink") registers. GSP module automatically updates the LCD framebuffer registers each time GX commands 3 or 4 finish, even when this shared memory data was not updated by the application.(GSP module toggles the active framebuffer register when automatically updating LCD registers, when shared memory data is not used)

The two 0x1C-byte framebuffer info entries are located at framebufferinfo+4.

# 3D Slider and 3D [LED](GSPGPU:SetLedForceOff "wikilink")

See [Configuration Memory](Configuration_Memory "wikilink").

# GX Command Queue

This command queue is located at sharedMemBase + 0x800 + (clientID \* 0x200). It consists of an header followed by at most 15 command entries.

The queue header has the following structure:

| Index Byte | Description |
|----|----|
| 0 | Index of the command to process, this is incremented by GSP before handling the command |
| 1 | Total commands to process, this is incremented by the application when adding the command to the queue, and decremented by GSP before handling the command |
| 2 | Status (0x1 = halted, 0x80 = error) |
| 3 | When bit0 is set, further processing of commands is halted until the client resets the flag and calls [TriggerCmdReqQueue](GSPGPU:TriggerCmdReqQueue "wikilink") |
| 7-4 | Result code for the last command which failed |

After adding a command, [TriggerCmdReqQueue](GSPGPU:TriggerCmdReqQueue "wikilink") must be used to start command processing (official code does so when the total commands field is 1).

## Commands

A command entry is made of 8 words. The first word is the command header, subsequent words represent command specific parameters.

The command header has the following structure:

| Index Byte | Description |
|----|----|
| 0 | Command ID |
| 1 | Unused |
| 2 | When bit0 is set, GSP stops processing further commands (can be used for packing together sets of commands) |
| 3 | When set, the command fails if GSP is busy handling any other command; otherwise, it only fails if GSP is busy handling a command of the same kind |

Addresses specified in command parameters are virtual addresses. Depending on the command, there might be constraints on the accepted parameters. In general, some commands require parameters to be aligned, and addresses are expected to be on [linear](Memory_Management#memory_mapping "wikilink"), [QTM](Memory_layout#0x1f000000_new_3ds_only "wikilink") or VRAM memory.

### RequestDMA

| Index Word | Description                               |
|------------|-------------------------------------------|
| 0          | Command header (ID = 0x00)                |
| 1          | Source address                            |
| 2          | Destination address                       |
| 3          | Size                                      |
| 6-4        | Unused                                    |
| 7          | Flush source (0 = don't flush, 1 = flush) |

This command issues a [DMA request](Corelink_DMA_Engines "wikilink") as the process with [rendering rights](GSPGPU:AcquireRight "wikilink"). When the destination address is within VRAM, GSP places itself as the destination process: this makes it possible to transfer data in VRAM without needing it listed in the destination process [exheader mappings](NCCH/Extended_Header#arm11_kernel_capabilities "wikilink"). Otherwise, both source and destination of the DMA request are the process with rendering rights.

The source buffer must be mapped as readable in the source process, while the destination address must be mapped as writable in the destination process, otherwise GSP calls [svcBreak](SVC "wikilink"). When flushing is enabled and the source address is above VRAM, svcFlushProcessDataCache is used to flush the source buffer.

Any process must have acquired rendering rights, otherwise the command does nothing.

### ProcessCommandList

| Index Word | Description |
|----|----|
| 0 | Command header (ID = 0x01) |
| 1 | Buffer address |
| 2 | Buffer size |
| 3 | Update gas additive blend results (0 = don't update, 1 = update) |
| 6-4 | Unused |
| 7 | Flush buffer (0 = don't flush, 1 = flush) |

This command sets the [Command List registers](GPU/External_Registers#command_list "wikilink"), and optionally updates gas additive blend results after command processing has ended.

No error checking is performed on the parameters. Address and size should be both aligned to 8 bytes, and the address should be in linear, QTM or VRAM memory, otherwise PA 0 is used. When flushing is enabled, [svcFlushProcessDataCache](SVC "wikilink") is used to flush the buffer on the process that has acquired rendering rights.

Any process must have acquired rendering rights, otherwise the command does nothing.

### MemoryFill

| Index Word | Description                    |
|------------|--------------------------------|
| 0          | Command header (ID = 0x02)     |
| 1          | Buffer 0 start address         |
| 2          | Buffer 0 value                 |
| 3          | Buffer 0 end address           |
| 4          | Buffer 1 start address         |
| 5          | Buffer 1 value                 |
| 6          | Buffer 1 end address           |
| 7          | Control0 \| (Control1 \<\< 16) |

This command sets the [Memory Fill registers](GPU/External_Registers#memory_fill "wikilink").

Addresses should be aligned to 8 bytes and must be in linear, QTM or VRAM memory, otherwise error 0xE0E02BF5 (GSP_INVALID_ADDRESS) is returned. The start address for a buffer must be below its end address, else the same error is returned. If the start address for a buffer is 0, that buffer is skipped; otherwise, its relative PSC unit is used for the fill operation.

### DisplayTransfer

| Index Word | Description                |
|------------|----------------------------|
| 0          | Command header (ID = 0x03) |
| 1          | Source address             |
| 2          | Destination address        |
| 3          | Source dimensions          |
| 4          | Output dimensions          |
| 5          | Flags                      |
| 7-6        | Unused                     |

This command sets the [Display Transfer registers](GPU/External_Registers#transfer_engine "wikilink").

No error checking is performed on the parameters. Addresses should be aligned to 8 bytes and should be in linear, QTM or VRAM memory, otherwise PA 0 is used.

### TextureCopy

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Command header (ID = 0x04)         |
| 1          | Source address                     |
| 2          | Destination address                |
| 3          | Size                               |
| 4          | Line width \| (gap \<\< 16)        |
| 5          | Same as above, for the destination |
| 6          | Flags                              |
| 7          | Unused                             |

This command sets the [Texture Copy registers](GPU/External_Registers#texturecopy "wikilink"). Note that GSP doesn't enforce bit3 of the flags to be set.

No error checking is performed on the parameters. Addresses and size should be aligned to 8 bytes, and the addresses should be in linear, QTM or VRAM memory, otherwise PA 0 is used.

### FlushCacheRegions

| Index Word | Description                |
|------------|----------------------------|
| 0          | Command header (ID = 0x05) |
| 1          | Buffer 0 address           |
| 2          | Buffer 0 size              |
| 3          | Buffer 1 address           |
| 4          | Buffer 1 size              |
| 5          | Buffer 2 address           |
| 6          | Buffer 2 size              |
| 7          | Unused                     |

This command calls svcFlushProcessDataCache for each buffer on the process that has acquired rendering rights.

If any call fails, its error is returned; If any buffer has size 0, the buffer is skipped. In both cases, subsequent buffers are not processed.

Any process must have acquired rendering rights, otherwise the error 0xD8202A06 (GSP_NO_RIGHT) is returned.

## Bugs

- When issuing a DMA request, GSP attempts to acquire an internal semaphore that rules CDMA access; this semaphore is never released on failure paths. While this is generally not an issue, as GSP breaks on DMA failures, it becomes a problem if the DMA request is done with cache flushing: in that case, GSP will error silently, causing a deadlock in DMA code.
- When handling GX commands apart from RequestDMA and ProcessCommandList, GSP sets the relative busy flags in internal state before executing the commands. This means that, if the relevant interrupts are never triggered (eg. on invalid parameters), the busy flags never get reset, preventing execution of future commands of the same kind.
