+++
title = 'DSP AAC Decoder'
categories = ["DSP"]
+++

*Note that everything below may vary depending on the exact DSP firmware used and different variants have slightly different behaviours.*
*Also note that some things about the AAC firmware still need to be properly tested and/or reverse engineered.*

# Summary

Some versions of the DSP firmware contain a decoder for the AAC audio codec. Such firmware may be dumped from specific games, like Pokemon X/Y or Rhythm Heaven Megamix. Interfacing with the AAC decoder (sending requests/receiving responses) happens via the DSP binary pipe (pipe 3)

# Message Format

Below is the message format used for communicating with the AAC decoder. The same format is both when making requests and for responses, though the "request/response data" field changes appropriately.

Size : 0x20 bytes

| Offset in bytes | Type | Description |
|----|----|----|
| 0x0 | u16 | Mode (Seems to be 0 = None, 1 = Decode AAC, 2 = Encode AAC) |
| 0x2 | DecoderCommand | Command to be handled by the decoder (See information on DecoderCommand structure below) |
| 0x4 | u32 | Result Code |
| 0x8 | Request/Response data | A 24-byte chunk of data containing information about the request/response. See below for more info. |

**enum DecoderCommand : u16**

| Enum                                          | Value |
|-----------------------------------------------|-------|
| Initialize (Initialize AAC decoder)           | 0     |
| DecodeEncode (Decode or encode an AAC stream) | 1     |
| Shutdown                                      | 2     |
| LoadState                                     | 3     |
| SaveState                                     | 4     |

# Request/Response Data

The 24-byte "request/response data" chunk can take on one of the formats listed below, depending on what sort of message it's found in.

**AAC Decode request**

Size : 24 bytes

| Offset in bytes | Type | Description |
|----|----|----|
| 0x0 | u32 | Physical address of input AAC stream |
| 0x4 | u32 | Byte size of input AAC stream |
| 0x8 | u32 | Physical address to output decoded PCM16 samples to (In the case of stereo audio, this corresponds to the left channel) |
| 0xC | u32 | Physical address to output decoded PCM16 samples for the right channel |
| 0x10 | u32 | Unknown? |
| 0x14 | u32 | Unknown? |

**AAC Decode command response**

Size : 24 bytes

| Offset in bytes | Type | Description |
|----|----|----|
| 0x0 | enum SampleRate | Sample rate of the decoded AAC stream (Note: This is an enum, NOT a numerical value for the sample rate) |
| 0x4 | u32 | Channel count (?) |
| 0x8 | u32 | Size |
| 0xC | u32 | Unknown? |
| 0x10 | u32 | Unknown? |
| 0x14 | u32 | Number of decoded samples (?) |

# Sample rate enum

**enum SampleRate : u32**

| Enum                | Value |
|---------------------|-------|
| 48000Hz (48KHz)     | 0     |
| 44100Hz (44.1KHz)   | 1     |
| 32000Hz (32KHz)     | 2     |
| 24000Hz (24KHz)     | 3     |
| 22050Hz (22.05KHz)  | 4     |
| 16000Hz (16KHz)     | 5     |
| 12000Hz (12KHz)     | 6     |
| 11025Hz (11.025KHz) | 7     |
| 8000Hz (8KHz)       | 8     |

[Category:DSP](Category:DSP "wikilink")
