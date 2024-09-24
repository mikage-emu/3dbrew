+++
title = 'CSND Shared Memory'
+++

This page describes the structure of the
[CSND](CSND_Services "wikilink") shared memory.

# Type0 Command Structure

| Index Byte | Size | Description                                                                                                                                                                                                                                                                                                                                                  |
|------------|------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0        | 2    | Offset in shared-memory for the command to process immediately after this one, when not 0xFFFF.                                                                                                                                                                                                                                                              |
| 0x2        | 2    | CommandID                                                                                                                                                                                                                                                                                                                                                    |
| 0x4        | 1    | This is initially zero when this command data is written by the user process, once the CSND module finishes processing the command this is set to 0x1. This flag is only set to value 1 for the first command(once processing for the entire command chain is finished) at the offset specified in the service command, not all type0 commands in the chain. |
| 0x5        | 3    | Padding?                                                                                                                                                                                                                                                                                                                                                     |
| 0x8        | 4    | The low 5-bits for this field is the the channel-index. This word is used for command parameters as well.                                                                                                                                                                                                                                                    |
| 0xC        | 0x14 | Command parameters                                                                                                                                                                                                                                                                                                                                           |

# Type0 Commands

## Command 0x0

| Index Byte | Size | Description       |
|------------|------|-------------------|
| 0x2        | 2    | CmdID 0x0         |
| 0xC        | 4    | Value             |
| 0x10       | 0x10 | Unused, all-zero. |

Value=1 begins audio playback. Value=0 stops audio playback, and also
seems to reset the audio channel [CSND](CSND "wikilink") registers so
that those registers need re-initialized before audio can be played from
this channel again.

## Command 0x1

| Index Byte | Size | Description       |
|------------|------|-------------------|
| 0x2        | 2    | CmdID 0x1         |
| 0xC        | 4    | Value             |
| 0x10       | 0x10 | Unused, all-zero. |

This command starts playing the audio channel with value=1. Once the
audio channel is playing, value=0 pauses the audio channel playback, and
value=1 resumes the audio channel playback. Value=1 has no affect when
the audio channel is already playing, likewise for value=0 when the
audio channel is not playing.

## Command 0x2

| Index Byte | Size | Description                                                     |
|------------|------|-----------------------------------------------------------------|
| 0x2        | 2    | CmdID 0x2                                                       |
| 0xC        | 1    | Encoding, this is the same as the values used with command 0xE. |
| 0x10       | 0x10 | Unused, all-zero.                                               |

This sets the encoding field in the [CSND](CSND "wikilink") channel CNT
register(that field is cleared to zero first), command 0xE also sets
this field.

## Command 0x3

| Index Byte | Size | Description                                        |
|------------|------|----------------------------------------------------|
| 0x2        | 2    | CmdID 0x3                                          |
| 0xC        | 4    | Physical address of the second block of audio data |
| 0x10       | 4    | Total byte-size of the block                       |

This sets the address and size of the second block of an audio channel.
The CSND module writes these fields to the channel
[register](CSND "wikilink") for the physical address of the second block
and the register for the block size.

## Command 0x4

| Index Byte | Size | Description                                                          |
|------------|------|----------------------------------------------------------------------|
| 0x2        | 2    | CmdID 0x4                                                            |
| 0xC        | 1    | Looping value, this is the same as the values used with command 0xE. |
| 0x10       | 0x10 | Unused, all-zero.                                                    |

This is the same as cmd2 except for the looping field. CSND will only
write to this channel CNT register for updating the looping field if
bit15 in the channel CNT register is value zero.

## Command 0x5

| Index Byte | Size | Description       |
|------------|------|-------------------|
| 0x2        | 2    | CmdID 0x5         |
| 0xC        | 4    | Value             |
| 0x10       | 0x10 | Unused, all-zero. |

When value=0, CSND module will clear bit7 in the channel CNT register.
Otherwise, CSND module sets bit7 in the channel CNT register.

## Command 0x6

| Index Byte | Size | Description       |
|------------|------|-------------------|
| 0x2        | 2    | CmdID 0x6         |
| 0xC        | 4    | Value             |
| 0x10       | 0x10 | Unused, all-zero. |

This is the same as cmd5, except this updates channel CNT bit6 instead.
CSND module will only update CNT here if bit15=0 in CNT.

## Command 0x7

| Index Byte | Size | Description                    |
|------------|------|--------------------------------|
| 0x2        | 2    | CmdID 0x7                      |
| 0xC        | 1    | Duty value (3 bits), see below |
| 0x10       | 0x10 | Unused, all-zero.              |

This command updates bit0 through (at least) bit2 of the channel's CNT
register. These bits control the duty of a PSG square wave:

```
 0  12.5% "_______-_______-_______-"
 1  25.0% "______--______--______--"
 2  37.5% "_____---_____---_____---"
 3  50.0% "____----____----____----"
 4  62.5% "___-----___-----___-----"
 5  75.0% "__------__------__------"
 6  87.5% "_-------_-------_-------"
 7   0.0% "________________________"
```

## Command 0x8

| Index Byte | Size | Description                                                     |
|------------|------|-----------------------------------------------------------------|
| 0x2        | 2    | CmdID 0x8                                                       |
| 0xC        | 4    | s32 value = (s32)(6.7027964E+07f / ((float)samplerate \* 1.0f)) |

This sets the sample rate. This value is written to the channel CNT
high-u16, which command 0xE also writes to. This command is used
immediately after command 0xE.

## Command 0x9

| Index Byte | Size | Description          |
|------------|------|----------------------|
| 0x2        | 2    | CmdID 0x9            |
| 0xC        | 2    | Left channel volume  |
| 0xE        | 2    | Right channel volume |
| 0x10       | 2    | Left capture volume  |
| 0x12       | 2    | Right capture volume |

This sets the playback and capture volumes for the specified channel.
This command is usually used after command 0x8(user processes use cmd8 a
second time before using this command).

## Command 0xA

| Index Byte | Size | Description                                       |
|------------|------|---------------------------------------------------|
| 0x2        | 2    | CmdID 0xA                                         |
| 0xC        | 4    | Physical address of the first block of audio data |
| 0x10       | 0x4  | Total byte-size of the block                      |
| 0x14       | 0xC  | Unused, all-zero.                                 |

This sets the address and size of the first block of an audio channel.
The CSND module writes these fields to the channel
[register](CSND "wikilink") for the physical address of the first block
and the register for the block size.

## Command 0xB

| Index Byte | Size | Description                                                                                                          |
|------------|------|----------------------------------------------------------------------------------------------------------------------|
| 0x2        | 2    | CmdID 0xB                                                                                                            |
| 0xC        | 2    | User processes set this to: [cwav_imaadpcminfo.data](https://github.com/3dshax/ctr/blob/master/ctrtool/cwav.h)       |
| 0x10       | 1    | User processes set this to: [cwav_imaadpcminfo.tableindex](https://github.com/3dshax/ctr/blob/master/ctrtool/cwav.h) |
| 0x11       | 0xF  | Unused, all-zero.                                                                                                    |

This command is used for setting the IMA-ADPCM state used to play the
first block (when IMA-ADPCM encoding is used), prior to using command
0xE. [CSND](CSND "wikilink") channelslotregister+0x18 =
(u16)cmdword\[3\] \| ((cmdword\[4\] & 0xFF)\<\<16).
[CSND](CSND "wikilink") channelslotregister+0x1C = 0.

## Command 0xC

| Index Byte | Size | Description                                                                                                              |
|------------|------|--------------------------------------------------------------------------------------------------------------------------|
| 0x2        | 2    | CmdID 0xC                                                                                                                |
| 0xC        | 2    | User processes set this to: [cwav_imaadpcminfo.loopdata](https://github.com/3dshax/ctr/blob/master/ctrtool/cwav.h)       |
| 0x10       | 1    | User processes set this to: [cwav_imaadpcminfo.looptableindex](https://github.com/3dshax/ctr/blob/master/ctrtool/cwav.h) |
| 0x11       | 0xF  | Unused, all-zero.                                                                                                        |

This is used for setting the IMA-ADPCM state used to play the second
block (when IMA-ADPCM encoding is used). channelslotregister+0x1C =
(1\<\<31) \| (u16)cmdword\[3\] \| ((cmdword\[4\] & 0xFF)\<\<16).

## Command 0xD

| Index Byte | Size | Description                                                      |
|------------|------|------------------------------------------------------------------|
| 0x2        | 2    | CmdID 0xD                                                        |
| 0xC        | 1    | 0 = disable ADPCM state reload for the second block, 1 = enable. |

This command configures bit31 of channelslotregister+0x1C. This bit
indicates whether the hardware will load ADPCM state from said register
everytime the second block is to be played; or if it will continue using
the same state used for the previously emitted sample.

## Command 0xE

| Index Byte | Size | Description                                          |
|------------|------|------------------------------------------------------|
| 0x2        | 2    | CmdID 0xE                                            |
| 0x8        | 4    | See below. (Flags + Timer)                           |
| 0xC        | 4    | See below. (Channel volume)                          |
| 0x10       | 4    | See below. (Capture volume)                          |
| 0x14       | 4    | Physical address for the first block of audio data.  |
| 0x18       | 4    | Physical address for the second block of audio data. |
| 0x1C       | 4    | Total byte-size of one block.                        |

This initializes the [CSND](CSND "wikilink") channel registers located
at: 0x1EC03400 + (channel_index\*0x20). It is unknown if stereo samples
are supported. In manual mode, the hardware plays the audio data of the
first block endlessly ignoring the size field. In one-shot mode, the
hardware plays the first block with the specified size and then stops.
When looping is enabled, the hardware plays the first block once and
then repeats the second forever. Before playing a block, the hardware
reads the corresponding address register in order to know where it is
located. The block size is either read only once at the beginning (mode
3) or before each block (mode 1, normal looping).

### Parameter word 0x8

| Bit   | Description                                                                                                                                                                                                  |
|-------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 5-0   | Channel index                                                                                                                                                                                                |
| 6     | 0 = disable linear interpolation, 1 = enable linear interpolation.                                                                                                                                           |
| 9-7   | Ignored                                                                                                                                                                                                      |
| 11-10 | Repeat mode: 0 = manual, 1 = normal looping, 2 = one-shot, 3 = looping with constant block size.                                                                                                             |
| 13-12 | This sets the encoding, some of the names for the following encodings are from [here](https://github.com/3dshax/ctr/blob/master/ctrtool/cwav.h). 0 = PCM8, 1 = PCM16, 2 = IMA-ADPCM. 3 = PSG, similar to DS. |
| 14    | 0 = disable playback, 1 = enable playback                                                                                                                                                                    |
| 15    | Ignored                                                                                                                                                                                                      |
| 31-16 | Sample rate clamped to the following range(by the user process): 0x42-0xFFFF. This is the same value used with Cmd 0x8, except clamped.                                                                      |

Bits 0 through 5 are written as zero to the CNT register.

PSG: Channels 8 through 13 play a square tone that is 32 samples long.
Channels 14 and 15 play noise. The duty of the square tones is set using
command 0x7.

### Parameter word 0xC

| Bit   | Description                                                                                          |
|-------|------------------------------------------------------------------------------------------------------|
| 15-0  | Left channel volume, this value is clamped to the following range(by the user process): 0x0-0x8000.  |
| 31-16 | Right channel volume, this value is clamped to the following range(by the user process): 0x0-0x8000. |

### Parameter word 0x10

| Bit   | Description                                                                                          |
|-------|------------------------------------------------------------------------------------------------------|
| 15-0  | Left capture volume, this value is clamped to the following range(by the user process): 0x0-0x8000.  |
| 31-16 | Right capture volume, this value is clamped to the following range(by the user process): 0x0-0x8000. |

## Command 0xF

| Index Byte | Size | Description                                                                        |
|------------|------|------------------------------------------------------------------------------------|
| 0x2        | 2    | CmdID 0xF                                                                          |
| 0x8        | 4    | Flags, as in command 0xE. Only the timer and the start/stop (bit14) bits are used. |
| 0xC        | 4    | Channel volume, same as in command 0xE.                                            |
| 0x10       | 4    | Capture volume, same as in command 0xE.                                            |
| 0x14       | 4    | Duty (see command 0x7).                                                            |

This channel is similar to command 0xE, but it is tailored for
configuring PSG Tone channels (8, 9, 10, 11, 12, 13) as it contains a
duty parameter. Channel format is set to PSG.

## Command 0x10

| Index Byte | Size | Description                                                                                                      |
|------------|------|------------------------------------------------------------------------------------------------------------------|
| 0x2        | 2    | CmdID 0xF                                                                                                        |
| 0x8        | 4    | Flags, as in command 0xE. Only the timer and the start/stop (bit14) bits are used. Channel format is set to PSG. |
| 0xC        | 4    | Channel volume, same as in command 0xE.                                                                          |
| 0x10       | 4    | Capture volume, same as in command 0xE.                                                                          |

This channel is identical to command 0xF except for not having a duty
parameter. Presumably used to configure PSG Noise channels (14, 15).

## Command 0x100

Writes bit15 of (u16\*)(0x1EC03800+16\*X).

## Command 0x101

Writes bit0 of (u16\*)(0x1EC03800+16\*X).

## Command 0x102

Writes bit1 of (u16\*)(0x1EC03800+16\*X).

## Command 0x103

Writes bit2 of (u16\*)(0x1EC03800+16\*X).

## Command 0x104

Sets (u16\*)(0x1EC03800+16\*X+4) = -Y.

## Command 0x105

Sets (u32\*)(0x1EC03800+16\*X+8) = Y, and (u32\*)(0x1EC03800+16\*X+12) =
Z.

## Command 0x106

Does the same thing as all 0x100-0x106 combined.

## Command 0x200

Sends some interrupt to the DSP?

## Command 0x300

| Index Byte | Size | Description       |
|------------|------|-------------------|
|            |      |                   |
| 0x2        | 2    | CmdID 0x300       |
| 0x8        | 0x18 | Unused, all-zero. |

CSND module writes state info(including state from
[CSND](CSND "wikilink") registers) for each audio channel to
shared-memory for this command.

# Offset1

This section describes the structure of the data located at offset1(from
[CSND:Initialize](CSND:Initialize "wikilink")) in shared-memory. This
data is updated by command 0x300, and by commands which update the
channel physical address registers. The following describes the format
of the entries located here.

## Entry Format

| Index Byte | Size | Description                                                                                                                                                                                                                                  |
|------------|------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0        | 1    | 0 = audio channel is not playing, 1 = audio channel is playing. CSND module sets this field to zero when bit14-bit15 in the channel CNT register are all-zero, otherwise CSND module sets this to value 1.                                   |
| 0x1        | 3    | Padding                                                                                                                                                                                                                                      |
| 0x4        | 2    | This is from the low 16-bits from chanregisterslot+0x18(see type0 cmd 0xB).                                                                                                                                                                  |
| 0x6        | 1    | Value = (\*(chanregisterslot+0x18) & 0x7F0000) \>\> 16(see type0 cmd 0xB).                                                                                                                                                                   |
| 0x7        | 1    | Padding                                                                                                                                                                                                                                      |
| 0x8        | 4    | This is the physical address from the main physical address channel-slot register. When the audio channel is playing, this is the address of the sample-data that was being played at the time this address was written here by CSND module. |