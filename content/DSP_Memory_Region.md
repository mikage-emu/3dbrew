+++
title = 'DSP Memory Region'
categories = ["DSP"]
+++

*Note that everything below may vary depending on the exact DSP firmware
used and different variants have slightly different behaviours.*

The DSP communicates with the application through two shared memory
areas 0x8000 bytes long each (at 0x1FF50000 and 0x1FF70000
respectively). The DSP alternates between the use of these two areas
(much like a double-buffer). Each area has 15 structures within it. The
location of these structures can be obtained by [reading channel 2 of
the DSP pipe](DSP:ReadPipe "wikilink"). A list of structures in the
order the DSP addresses are read from the pipe follows:

1\. Frame count

2\. Input configurations

3\. Input status

4\. Input ADPCM coefficients

5\. DSP configuration

6\. DSP status

7\. Output samples

8\. Intermediate mix samples

9\. Compressor table

10\. DSP debug statistics

11\. Unknown Coefficients

12\. Unknown Coefficients

13\. Unknown Coefficients

14\. Surround sound biquad filter 1

15\. Surround sound biquad filter 2

The DSP has 24 inputs, each of which are individually configurable.
These 24 inputs each produce three sets of 4 audio channels (two left,
two right).

These four audio channels feed into three intermediate mixers. Two of
these intermediate mixers are used for effects and aux.

## Frame Count

The frame count of the first region must be even and the frame count of
the second region must be odd.

The frame with the higher count is the "current region".

The DSP firmware only responds if the first frame count is 4.

## Input Config

A 192 byte long structure. There are 24 of them.

|        |                    |                                                                             |
|--------|--------------------|-----------------------------------------------------------------------------|
| Offset | Type               | Description                                                                 |
| 0      | u32                | Dirty flags                                                                 |
| 4      | f32\[3\]\[2\]\[2\] | Input Gain (Each input has 12 channels)                                     |
| 52     | f32                | Rate multiplier (1.0x == native DSP rate)                                   |
| 56     | u8                 | Interpolation mode                                                          |
| 57     | u8                 | Polyphase filter select                                                     |
| 58     | u16                | bit\[0\]: Simple Filter enabled, bit\[1\]: Biquadratic Filter enabled       |
| 60     | SimpleFilter       | Simple Filter (One pole normalized recursive linear filter)                 |
| 64     | BiquadFilter       | Biquadratic Filter (Two poles two zeros normalized recursive linear filter) |
| 74     | u16                | Bitmap of which buffers in queue are dirty                                  |
| 76     | Buffer\[4\]        | Buffer queue                                                                |
| 156    | u32                | \-                                                                          |
| 160    | u16                | Is Active                                                                   |
| 162    | u16                | Sync Count                                                                  |
| 164    | u32                | Play position                                                               |
| 168    | 4                  | ?                                                                           |
| 172    | u32                | Physical address of embedded buffer                                         |
| 176    | u32                | Number of samples in embedded buffer                                        |
| 180    | u16                | Format                                                                      |
| 182    | AdpcmData          | ADPCM data associated with embedded buffer                                  |
| 188    | u16                | bit\[0\]: ADPCM updated?; bit\[1\]: Is looping?r                            |
| 190    | u16                | Buffer Id of embedded buffer                                                |

There is a 2 sample delay in this preprocessing stage, likely due to the
interpolation step.

### Format

This is a u16.

|      |                                                                     |
|------|---------------------------------------------------------------------|
| Bits | Desciption                                                          |
| 0-1  | Number of channels: 0,1,3 = mono; 2 = stereo                        |
| 2-3  | Buffer codec: [0:PCM8; 1:PCM16; 2:ADPCM](BCWAV#encoding "wikilink") |
| 5    | Fade                                                                |

### Buffer

|        |           |                   |
|--------|-----------|-------------------|
| Offset | Type      | Description       |
| 0      | u32       | Physical Address  |
| 4      | u32       | Sample Count      |
| 8      | AdpcmData | ADPCM data        |
| 14     | u8        | ADPCM data dirty? |
| 15     | u8        | Looping?          |
| 16     | u16       | Buffer Id         |
| 18     | u16       | \-                |

### Adpcm Data

|     |     |                       |
|-----|-----|-----------------------|
| 0   | u8  | ADPCM predictor/scale |
| 1   | u8  | \-                    |
| 2   | s16 | ADPCM y\[n-1\]        |
| 4   | s16 | ADPCM y\[n-2\]        |

### Simple Filter

This is a standard single-pole filter. The fall-off is 6dB per octave as
you would expect.

|        |       |              |
|--------|-------|--------------|
| Offset | Type  | Description  |
| 0      | s1.15 | b0           |
| 2      | s1.15 | a1 (negated) |

### Biquad Filter

This is a [biquadratic
filter](https://en.wikipedia.org/wiki/Digital_biquad_filter "wikilink").

|        |       |              |
|--------|-------|--------------|
| Offset | Type  | Description  |
| 0      | s2.14 | a2 (negated) |
| 2      | s2.14 | a1 (negated) |
| 4      | s2.14 | b2           |
| 6      | s2.14 | b1           |
| 8      | s2.14 | b0           |

## Input status

Read only. This structure is set by the DSP. This structure is 12 bytes
long and there are 24 of them.

|        |      |                                                                                 |
|--------|------|---------------------------------------------------------------------------------|
| Offset | Type | Description                                                                     |
| 0      | u8   | Input Enabled?                                                                  |
| 1      | u8   | Dirty flag for buffer id, set to 1 when buffer (after the first) starts playing |
| 2      | u16  | Sync count                                                                      |
| 4      | u32  | Position (number of samples) into current buffer playback                       |
| 8      | u16  | Buffer id of the buffer that's just started playing.                            |
| 10     | u16  | \-                                                                              |

## Input ADPCM coefficients

This is a 32 byte long structure. There are 24 of them.

|        |             |                   |
|--------|-------------|-------------------|
| Offset | Type        | Description       |
| 0      | s5.11\[16\] | ADPCM coefficents |

## DSP configuration

### Delay Effect

Delay with feedback.

Length of delay is expressed in terms of number of audio frames (there
are 160 samples per audio frame).

Feedback arm only has a gain on it. Under the feedback arm is a
single-pole filter with the delay.

### Reverb Effect

Reverb consists of two comb filters and one all-pass filter in standard
configuration.

## DSP status

Read only. A 32 byte long structure.

|        |          |                          |
|--------|----------|--------------------------|
| Offset | Type     | Description              |
| 0      | u16      | ?                        |
| 2      | u16      | Number of dropped frames |
| 4      | 28 bytes | ?                        |

## Output samples

Read only. This structure is 640 bytes long. Output is stereo (the 3DS
has two speakers).

|        |            |                       |
|--------|------------|-----------------------|
| Offset | Type       | Description           |
| 0      | s16\[160\] | Left-channel Samples  |
| 320    | s16\[160\] | Right-channel Samples |

This structure has separate arrays for the left and right channels.

## Intermediate mix samples

Read/Write.

PCM32. Also serves an aux function, allowing the ARM11 to apply custom
effects to audio. Internal format of the DSP firmware is quadaphonic
audio.

This structure is 5120 bytes long.

|        |                           |             |
|--------|---------------------------|-------------|
| Offset | Type                      | Description |
| 0      | IntermediateSample\[160\] | Samples     |

In contrast to the final output samples, this structure has the
left/right channels interleaved.

### Intermediate sample

A quadraphonic sample.

|        |      |                 |
|--------|------|-----------------|
| Offset | Type | Description     |
| 0      | s32  | Left Channel A  |
| 4      | s32  | Right Channel A |
| 8      | s32  | Left Channel B  |
| 12     | s32  | Right Channel B |

## Compressor table

A precomputed response curve lookup table for the compressor.

[Category:DSP](Category:DSP "wikilink")
