+++
title = 'MVD Services'
+++

This is for using the MVD hardware video decoder(unknown whether MVD can
do more than decoding) + hardware color-format converter. The
[New_3DS](New_3DS "wikilink") [Internet
Browser](Internet_Browser "wikilink") uses mvd:STD for video decoding +
YUV2RGB for decoded MJPEG frames.

See [here](Internet_Browser "wikilink") for the supported hardware
decoder video codecs.

There can only be one service session open at a time for each individual
MVD service.

## MVD Service "mvd:STD"

| Command Header | Available since system version              | Description                                                                                                                                                                                                                                                                                                                                                                                      | Used by [SKATER](Internet_Browser "wikilink") |
|----------------|---------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------|
| 0x00010082     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | [Initialize](MVDSTD:Initialize "wikilink")                                                                                                                                                                                                                                                                                                                                                       | Yes                                           |
| 0x00020000     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | [Shutdown](MVDSTD:Shutdown "wikilink")                                                                                                                                                                                                                                                                                                                                                           | Yes                                           |
| 0x00030300     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | [CalculateWorkBufSize](MVDSTD:CalculateWorkBufSize "wikilink")                                                                                                                                                                                                                                                                                                                                   | Yes                                           |
| 0x000400C0     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | [CalculateImageSize](MVDSTD:CalculateImageSize "wikilink")                                                                                                                                                                                                                                                                                                                                       | No                                            |
| 0x00050100     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | (s8 unk0, s8 unk1, s8 unk2, u32 unk3) SKATER uses hard-coded value 0 for all of these params. Using different input data for this doesn't seem to affect video-processing output.                                                                                                                                                                                                                | Yes                                           |
| 0x00060000     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | Unknown.                                                                                                                                                                                                                                                                                                                                                                                         | No                                            |
| 0x00070000     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | Used during shutdown with video-processing.                                                                                                                                                                                                                                                                                                                                                      | Yes                                           |
| 0x00080142     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | [ProcessNALUnit](MVDSTD:ProcessNALUnit "wikilink")                                                                                                                                                                                                                                                                                                                                               | Yes                                           |
| 0x00090042     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | [ControlFrameRendering](MVDSTD:ControlFrameRendering "wikilink")                                                                                                                                                                                                                                                                                                                                 | Yes                                           |
| 0x000A0000     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | [GetStatus](MVDSTD:GetStatus "wikilink")                                                                                                                                                                                                                                                                                                                                                         | Yes                                           |
| 0x000B0000     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | GetStatusOther(unknown what this is used for). Same output size as [GetStatus](MVDSTD:GetStatus "wikilink").                                                                                                                                                                                                                                                                                     | No                                            |
| 0x000C0100     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | (u8 unk0, s8 unk1, u32 unk2, u32 unk3) Unknown.                                                                                                                                                                                                                                                                                                                                                  | No                                            |
| 0x000D0000     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | Unknown.                                                                                                                                                                                                                                                                                                                                                                                         | No                                            |
| 0x000E0202     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | Unknown. The code for this appears to be similar to [ProcessNALUnit](MVDSTD:ProcessNALUnit "wikilink"), this DMAs data from the input buffer as well.                                                                                                                                                                                                                                            | No                                            |
| 0x000F0042     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | (s8 unk, val0, handle) Unknown. Presumably the command 0x000E0202 version of [MVDSTD:ControlFrameRendering](MVDSTD:ControlFrameRendering "wikilink").                                                                                                                                                                                                                                            | No                                            |
| 0x00100000     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | Unknown. This writes 0x28-bytes of output starting at cmdreply\[2\].                                                                                                                                                                                                                                                                                                                             | No                                            |
| 0x00110000     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | Unknown.                                                                                                                                                                                                                                                                                                                                                                                         | No                                            |
| 0x001200C0     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | (s8 unk0, u32 unk1, u32 unk2) Unknown.                                                                                                                                                                                                                                                                                                                                                           | No                                            |
| 0x00130000     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | Unknown.                                                                                                                                                                                                                                                                                                                                                                                         | No                                            |
| 0x001400C2     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | Unknown. The code for this appears to be similar to [ProcessNALUnit](MVDSTD:ProcessNALUnit "wikilink"), this DMAs data from the input buffer as well.                                                                                                                                                                                                                                            | No                                            |
| 0x00150042     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | (s8 unk, val0, handle) Unknown. Presumably the command 0x001400C2 version of [MVDSTD:ControlFrameRendering](MVDSTD:ControlFrameRendering "wikilink").                                                                                                                                                                                                                                            | No                                            |
| 0x00160000     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | Unknown.                                                                                                                                                                                                                                                                                                                                                                                         | No                                            |
| 0x00170000     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | Unknown.                                                                                                                                                                                                                                                                                                                                                                                         | No                                            |
| 0x00180000     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | Unknown. Used during initialization regardless of the operation mode(color-conversion/video-processing).                                                                                                                                                                                                                                                                                         | Yes                                           |
| 0x00190000     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | Unknown. Used during shutdown regardless of the operation mode(color-conversion/video-processing).                                                                                                                                                                                                                                                                                               | Yes                                           |
| 0x001A0000     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | Used when doing color-format conversion. This triggers writing to the output buffer specified via config.                                                                                                                                                                                                                                                                                        | Yes                                           |
| 0x001B0040     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | (u8 inval) Used during video-processing initialization. SKATER uses hard-coded value 1 for this. MVD-sysmodule checks that the input value is not 0 or higher than 11. The input value must be one of the following: 1, 6, 9, or 10. Using any of these values instead of 1 results in no data being written to the output buffer with normal video processing, without any errors being thrown. | Yes                                           |
| 0x001C0000     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | Used during shutdown with video-processing.                                                                                                                                                                                                                                                                                                                                                      | Yes                                           |
| 0x001D0042     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | [GetConfig](MVDSTD:GetConfig "wikilink")                                                                                                                                                                                                                                                                                                                                                         | Yes                                           |
| 0x001E0044     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | [SetConfig](MVDSTD:SetConfig "wikilink")                                                                                                                                                                                                                                                                                                                                                         | Yes                                           |
| 0x001F0902     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | [SetupOutputBuffers](MVDSTD:SetupOutputBuffers "wikilink")                                                                                                                                                                                                                                                                                                                                       | No                                            |
| 0x00200002     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | (val0, handle) Unknown. This loads data from the table entry which has a field matching a certain value. This is the global table used by [SetupOutputBuffers](MVDSTD:SetupOutputBuffers "wikilink").                                                                                                                                                                                            | No                                            |
| 0x00210100     | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | [OverrideOutputBuffers](MVDSTD:OverrideOutputBuffers "wikilink")                                                                                                                                                                                                                                                                                                                                 | No                                            |

This one uses the I/O mapped @ 0x10207000.

This service is used by the [New_3DS](New_3DS "wikilink") [Internet
Browser](Internet_Browser "wikilink"). SKATER runs the entire MVD
initialization/shutdown each time the video player is entered/exited.

Linear-memory vaddrs passed to this service should be in the 0x30\*
region, MVD-sysmodule doesn't support the 0x14\* region.

By default MVD does(?) various post-processing with the output image,
this is controlled by the [configuration](MVDSTD:GetConfig "wikilink").
This post-processing isn't done at all in certain cases.

Initialization procedures:

- Color-conversion: Use command
  [MVDSTD:Initialize](MVDSTD:Initialize "wikilink") with bufsize=1, then
  command 0x00180000.
- H.264: If needed, use
  [MVDSTD:CalculateWorkBufSize](MVDSTD:CalculateWorkBufSize "wikilink").
  Then use [MVDSTD:Initialize](MVDSTD:Initialize "wikilink"). Then use
  commands 0x00050100, 0x00180000, and 0x001B0040. Then use
  [MVDSTD:ProcessNALUnit](MVDSTD:ProcessNALUnit "wikilink") for each of
  the individual NAL-unit parameter sets("Sequence Parameter Set" and
  "Picture Parameter Set"), with the main video processing starting
  afterwards.

Shutdown procedures:

- Color-conversion: just use command 0x00190000, then
  [MVDSTD:Shutdown](MVDSTD:Shutdown "wikilink").
- H.264: Use command 0x00090042 in a loop, waiting for it to return a
  retval that isn't 0x00017002. Then use commands 0x001C0000,
  0x00190000, and 0x00070000. Then use
  [MVDSTD:Shutdown](MVDSTD:Shutdown "wikilink").

### MVDSTD configuration structure

| Offset | Size | Description                                                                                                                                                                                                                                                                                                                              |
|--------|------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x4  | Input format type, see below.                                                                                                                                                                                                                                                                                                            |
| 0x4    | 0x4  | The default for this is 0x0. Must be \<=5. When non-zero, the type value at offset 0x0 must be one of the following: 0x00020001, 0x00010001, 0x00010005, 0x00010006, or 0x00010007. Doesn't seem to have any visible affect on the output for video processing.                                                                          |
| 0x8    | 0x4  | The default for this is 0x0. This must be \<=1. Referred to as "H264 range" in SKATER. When 0x1 the output image is brighter than normal.                                                                                                                                                                                                |
| 0x0C   | 0x4  | Input video width. Must be \>=width_min and \<width_max. This must be aligned: the low <dimensions_alignment>-bits must be clear.                                                                                                                                                                                                        |
|        |      |                                                                                                                                                                                                                                                                                                                                          |
| 0x10   | 0x4  | Input video height. Must be \>=height_min and \<height_max. This must be aligned: the low <dimensions_alignment>-bits must be clear.                                                                                                                                                                                                     |
| 0x14   | 0x4  | Input data physical address, only set for color-conversion. This isn't used when the value at offset 0x4 is 0x1 or 0x5.                                                                                                                                                                                                                  |
| 0x18   | 0x4  | Physical data address, only used for color-conversion when the type value has bitmask 0x20000 set. This isn't used when the value at offset 0x4 is 0x1 or 0x5.                                                                                                                                                                           |
| 0x1C   | 0x4  | Physical data address, only used for color-conversion when the type value is 0x20000. This isn't used when the value at offset 0x4 is 0x1 or 0x5.                                                                                                                                                                                        |
| 0x20   | 0x4  | Physical data address, for color-conversion. This isn't used when the value at offset 0x4 is 0x0 or 0x4.                                                                                                                                                                                                                                 |
| 0x24   | 0x4  | Physical data address, only used for color-conversion when the type value has bitmask 0x20000 set. This isn't used when the value at offset 0x4 is 0x0 or 0x4.                                                                                                                                                                           |
| 0x28   | 0x4  | Unknown. Doesn't seem to have any visible affect on the output.                                                                                                                                                                                                                                                                          |
| 0x2C   | 0x4  | When non-zero this enables some sort of color adjustment for the output?                                                                                                                                                                                                                                                                 |
| 0x30   | 0x4  | Same affect as offset 0x2C? This must not be enabled at the same time as that field.                                                                                                                                                                                                                                                     |
| 0x34   | 0x4  | Unknown, must be \<8 for video-processing? Doesn't seem to have any visible affect on the output.                                                                                                                                                                                                                                        |
| 0x38   | 0x4  | Unknown. Doesn't seem to have any visible affect on the output.                                                                                                                                                                                                                                                                          |
| 0x3C   | 0x4  | Unknown, must be \<8 for video-processing? Doesn't seem to have any visible affect on the output.                                                                                                                                                                                                                                        |
| 0x40   | 0x4  | When non-zero this enables usage of the 4 words starting at offset 0x44. SKATER sets this to 0x0 for color-conversion, and 0x1 for video processing(this flag isn't mandatory for the latter).                                                                                                                                           |
| 0x44   | 0x4  | See offset 0x40. The default for this is 0x0. u32 input_crop_x_pos. Must be \<=widthval. Where widthval = \<width value from the field at offset 0xC\>. The low 4-bits of this value must be clear.                                                                                                                                      |
| 0x48   | 0x4  | See offset 0x40. The default for this is 0x0. u32 input_crop_y_pos. Must be \<=heightval. Where heightval = \<height value from the field at offset 0x10\>. The low 4-bits of this value must be clear.                                                                                                                                  |
| 0x4C   | 0x4  | See offset 0x40. u32 input_crop_height. Must be \>=16 and \<=heightval. Where heightval = \<height value from the field at offset 0x10\>. The low 3-bits of this value must be clear.                                                                                                                                                    |
| 0x50   | 0x4  | See offset 0x40. u32 input_crop_width. Must be \>=width_min and \<=widthval. Where widthval = \<width value from the field at offset 0xC\>. The low 3-bits of this value must be clear.                                                                                                                                                  |
| 0x54   | 0x4  | The default for this is 0x0. Must be \<=5. For video processing, and when this value is non-zero, the type value at offset 0x0 must not be any of the following: 0x00010004, 0x00010001, 0x0x00100001, or 0x00200001. For video processing, the type value at offset 0x0 must not be 0x80000 when this value at offset 0x54 is non-zero. |
| 0x58   | 0x4  | Output format type, see below. SKATER writes value 0x40002 here.                                                                                                                                                                                                                                                                         |
| 0x5C   | 0x4  | Output video width. Must be \>=16, and must be \<somewidth_statefield.                                                                                                                                                                                                                                                                   |
| 0x60   | 0x4  | Output video height. Must be \>=16, and must be \<someheight_statefield.                                                                                                                                                                                                                                                                 |
| 0x64   | 0x4  | Output data physical address.                                                                                                                                                                                                                                                                                                            |
| 0x68   | 0x4  | Additional output data physical address. This is only used when the output format type is value 0x00020001.                                                                                                                                                                                                                              |
| 0x6C   | 0x4  | Unknown, doesn't seem to have a visible affect on the output. Must be \<3 for video-processing?                                                                                                                                                                                                                                          |
| 0x70   | 0x4  | Unknown, doesn't seem to have a visible affect on the output.                                                                                                                                                                                                                                                                            |
| 0x74   | 0x4  | Unknown, doesn't seem to have a visible affect on the output.                                                                                                                                                                                                                                                                            |
| 0x78   | 0x4  | Unknown, doesn't seem to have a visible affect on the output.                                                                                                                                                                                                                                                                            |
| 0x7C   | 0x4  | Unknown, doesn't seem to have a visible affect on the output.                                                                                                                                                                                                                                                                            |
| 0x80   | 0x4  | Unknown. Must be \<=1 for video processing? Doesn't seem to have a visible affect on the output.                                                                                                                                                                                                                                         |
| 0x84   | 0x4  | Unknown, doesn't seem to have a visible affect on the output.                                                                                                                                                                                                                                                                            |
| 0x88   | 0x4  | Unknown, doesn't seem to have a visible affect on the output.                                                                                                                                                                                                                                                                            |
| 0x8C   | 0x4  | Unknown, doesn't seem to have a visible affect on the output.                                                                                                                                                                                                                                                                            |
| 0x90   | 0x4  | Unknown, doesn't seem to have a visible affect on the output.                                                                                                                                                                                                                                                                            |
| 0x94   | 0x4  | Unknown, doesn't seem to have a visible affect on the output.                                                                                                                                                                                                                                                                            |
| 0x98   | 0x4  | Unknown, doesn't seem to have a visible affect on the output.                                                                                                                                                                                                                                                                            |
| 0x9C   | 0x4  | Unknown, doesn't seem to have a visible affect on the output.                                                                                                                                                                                                                                                                            |
| 0xA0   | 0x4  | Unknown, doesn't seem to have a visible affect on the output.                                                                                                                                                                                                                                                                            |
| 0xA4   | 0x4  | Unknown, doesn't seem to have a visible affect on the output.                                                                                                                                                                                                                                                                            |
| 0xA8   | 0x4  | Unknown, doesn't seem to have a visible affect on the output.                                                                                                                                                                                                                                                                            |
| 0xAC   | 0x4  | Unknown, must be zero for video-processing.                                                                                                                                                                                                                                                                                              |
| 0xB0   | 0x28 | Unknown, doesn't seem to have a visible affect on the output.                                                                                                                                                                                                                                                                            |
| 0xD8   | 0x4  | Unknown, must be zero for video-processing.                                                                                                                                                                                                                                                                                              |
| 0xDC   | 0x28 | Unknown, doesn't seem to have a visible affect on the output.                                                                                                                                                                                                                                                                            |
| 0x104  | 0x4  | This flag enables using the following 4 words when non-zero.                                                                                                                                                                                                                                                                             |
| 0x108  | 0x4  | u32 output_x_pos. Output X position in the output buffer.                                                                                                                                                                                                                                                                                |
| 0x10C  | 0x4  | u32 output_y_pos. Same as above except for the Y pos.                                                                                                                                                                                                                                                                                    |
| 0x110  | 0x4  | u32 output_width_override. The low 2-bits must be clear. When the output width is less than this, this value is used to align the output image width to the specified value via value0-pixels. When this value is less than the output width, this value is used for the output width instead.                                           |
| 0x114  | 0x4  | Same as the field at offset 0x110 except for the output height.                                                                                                                                                                                                                                                                          |
| 0x118  | 0x4  | Unknown, when non-zero it seems the output buffer isn't written any more?                                                                                                                                                                                                                                                                |

The size of this structure is fixed to 0x11C-bytes. The user process
does the LINEAR-mem vaddr-\>physaddr conversion for the above physaddrs,
when modifying the config struct before using
[MVDSTD:SetConfig](MVDSTD:SetConfig "wikilink"). For the above physaddrs
that are checked/used, the physaddr must not be 0x0, and the physaddr
must be 8-byte aligned(low 3-bits clear).

For color-conversion, the output frame is split into two images via the
two output physaddrs.

For \*_min/\*_max/dimensions_alignment mentioned above: \*_min = 16
for color-conversion, 48 for video processing. \*_max = 2048 for
color-conversion, 4672 for video processing. dimensions_alignment = 4
for color-conversion, 3 for video processing.

The configuration doesn't seem to change at all while SKATER is running
video processing(each [MVDSTD:SetConfig](MVDSTD:SetConfig "wikilink")
input config appears to the same).

#### SKATER video processing config

When processing video, SKATER [gets](MVDSTD:GetConfig "wikilink") the
config, updates all of the fields listed below, then uses
[MVDSTD:SetConfig](MVDSTD:SetConfig "wikilink").

| Offset | Size | Description                                                  | Written value                                                                                                                         |
|--------|------|--------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x4  | Input format type.                                           | 0x00020001(H.264), hard-coded.                                                                                                        |
| 0x8    | 0x4  |                                                              | Loaded from unique input state. This is the 'range' field in the following debug print: "H264 w=%d h=%d range=%d pics=%d multi=%d\n". |
| 0xC    | 0x4  | Input video width.                                           | Loaded from unique input state.                                                                                                       |
| 0x10   | 0x4  | Input video height.                                          | Loaded from unique input state.                                                                                                       |
| 0x40   | 0x4  | Flag                                                         | 0x1, hard-coded.                                                                                                                      |
| 0x44   | 0x4  |                                                              | Loaded from unique input state.                                                                                                       |
| 0x48   | 0x4  |                                                              | Loaded from unique input state.                                                                                                       |
| 0x4C   | 0x4  |                                                              | Loaded from unique input state.                                                                                                       |
| 0x50   | 0x4  |                                                              | Loaded from unique input state.                                                                                                       |
| 0x54   | 0x4  |                                                              | 0x0, hard-coded.                                                                                                                      |
| 0x58   | 0x4  | Output format type.                                          | Loaded from unique input state.                                                                                                       |
| 0x5C   | 0x4  | Output video width.                                          | Loaded from unique input state.                                                                                                       |
| 0x60   | 0x4  | Output video height.                                         | Loaded from unique input state.                                                                                                       |
| 0x64   | 0x4  | Output data physical address.                                |                                                                                                                                       |
| 0x68   | 0x4  | Output data physical address, only set for color-conversion. | 0x0, hard-coded.                                                                                                                      |
| 0xA8   | 0x4  |                                                              | 0x1, hard-coded.                                                                                                                      |
| 0xAC   | 0x4  |                                                              | 0x0, hard-coded.                                                                                                                      |
| 0xD8   | 0x4  |                                                              | 0x0, hard-coded.                                                                                                                      |
| 0x104  | 0x4  |                                                              | 0x1, hard-coded.                                                                                                                      |
| 0x108  | 0x4  |                                                              | Loaded from unique input state.                                                                                                       |
| 0x10C  | 0x4  |                                                              | Loaded from unique input state.                                                                                                       |
| 0x110  | 0x4  |                                                              | Loaded from unique input state.                                                                                                       |
| 0x114  | 0x4  |                                                              | Loaded from unique input state.                                                                                                       |
| 0x118  | 0x4  |                                                              | 0x0, hard-coded.                                                                                                                      |

"Loaded from unique input state" refers to the field being loaded from
state seperate from the other fields used for this configuration
structure.

#### Input formats

| Type value | Mode                               | Video processing                                                                 | Color conversion |
|------------|------------------------------------|----------------------------------------------------------------------------------|------------------|
| 0x00010001 | Color conversion                   | N/A                                                                              | YUYV422          |
| 0x00010002 | Video processing                   | H.264, but no output will be written to output buffer with error code 0xD961710A | N/A              |
| 0x00010004 | Video processing                   | H.264, but no output will be written to output buffer with error code 0xD961710A | N/A              |
| 0x00010005 | Color conversion, Video processing | H.264, but no output will be written to output buffer with error code 0xD961710A | YVYU422          |
| 0x00010006 | Color conversion, Video processing | H.264, but no output will be written to output buffer with error code 0xD961710A | UYVY422          |
| 0x00010007 | Color conversion, Video processing | H.264, but no output will be written to output buffer with error code 0xD961710A | VYUY422?         |
| 0x00020000 | Video processing                   | H.264, but no output will be written to output buffer with error code 0xD961710A | N/A              |
| 0x00020001 | Video processing                   | H.264                                                                            | N/A              |
| 0x00020002 | Video processing                   | H.264, output will be corrupt a little??                                         | N/A              |
| 0x00080000 | Video processing                   | H.264, output will be gray-scale.                                                | N/A              |
| 0x00080001 | Video processing                   | H.264, but no output will be written to output buffer with error code 0xD961710A | N/A              |
| 0x00180001 | Video processing                   | H.264, but no output will be written to output buffer with error code 0xD961710A | N/A              |

#### Output formats

| Type value | Description              | Note                                                                                                                                                                              |
|------------|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00010001 | YUYV422                  | N/A                                                                                                                                                                               |
| 0x00010005 | YVYU422                  | A certain MVD state field must not be set to 0x8170 in order to use this.                                                                                                         |
| 0x00010006 | UYVY422                  | see 0x00010005 for the usage requirement.                                                                                                                                         |
| 0x00010007 | VYUY422                  | see 0x00010005 for the usage requirement.                                                                                                                                         |
| 0x00010008 | YUYV422 with some align? | A certain MVD-module state field must not be set to 0x8170 in order to use this. Whether this can actually be used is determined by another MVD-module state field. 16bit format. |
| 0x00010009 | YVYU422 with some align? | see 0x00010008 for the usage requirements. 16bit format.                                                                                                                          |
| 0x0001000A | UYVY422 with some align? | see 0x00010008 for the usage requirements. 16bit format.                                                                                                                          |
| 0x0001000B | VYUY422 with some align? | see 0x00010008 for the usage requirements. 16bit format.                                                                                                                          |
| 0x00020001 | Some sort of YUV format? | 12bit format. The initial output is written to the normal output buffer, then the rest is written to the additional output buffer dedicated to this out-type.                     |
| 0x00040000 | Unknown                  | Doesn't write anything to the out-buffer when doing color-conversion.                                                                                                             |
| 0x00040001 | ARGB1555?                | N/A                                                                                                                                                                               |
| 0x00040002 | RGB565                   | N/A                                                                                                                                                                               |
| 0x00040003 | ABGR1555?                | N/A                                                                                                                                                                               |
| 0x00040004 | BGR565                   | N/A                                                                                                                                                                               |
| 0x00041000 | Unknown                  | Doesn't write anything to the out-buffer when doing color-conversion.                                                                                                             |
| 0x00041001 | ARGB32                   | N/A                                                                                                                                                                               |
| 0x00041002 | ABGR32                   | N/A                                                                                                                                                                               |

## MVD Service "l2b:u"

This one uses the I/O mapped @ 0x10130000.

| Command Header | Description             |
|----------------|-------------------------|
| 0x00010040     | SetInputFormat?         |
| 0x00020080     | GetInputFormat?         |
| 0x00030040     | SetOutputFormat         |
| 0x00040080     | GetOutputFormat         |
| 0x00050040     | SetTransferEndInterrupt |
| 0x00060080     | GetTransferEndInterrupt |
| 0x00070080     | GetL2BEndEvent          |
| 0x00080102     | ?                       |
| 0x00090080     | Waits on a DMA Handle   |
| 0x000A0102     | MaybeSetRecieving       |
| 0x000B0080     | isDoneRecieving         |
| 0x000C0040     | SetInputLineWidth       |
| 0x000D0080     | GetInputLineWidth       |
| 0x000E0040     | SetInputLines           |
| 0x000F0080     | GetInputLines           |
| 0x00100040     | MaybeSetAlpha           |
| 0x00110080     | MaybeGetAlpha           |
| 0x00120040     | StartConversion         |
| 0x00130040     | StopConversion          |
| 0x00140080     | isBusyConversion        |
| 0x00150040     | SetPackageParameter     |
| 0x00160080     | GetPackageParameter     |
| 0x00170080     | PingProcess             |

## MVD Service "l2b2:u"

This uses the same command-handler as "l2b:u".

## MVD Service "y2r2:u"

This is a exact copy of y2r camera service and hence named y2r2.

## MVD Result-codes

| Result-code | Internal MVD status-code | Description                                                                                                                                                                                                                                                                                                                                     |
|-------------|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0xD961710F  |                          | Invalid [configuration](MVDSTD:GetConfig "wikilink"), mainly when setting the config.                                                                                                                                                                                                                                                           |
| 0xD96170CA  | -2(~1)                   |                                                                                                                                                                                                                                                                                                                                                 |
| 0xE16170C9  | -1(~0)                   |                                                                                                                                                                                                                                                                                                                                                 |
| 0xF96171C8  | -0xFB(~0xFA)             |                                                                                                                                                                                                                                                                                                                                                 |
| 0x17000     | 0x0                      | OK                                                                                                                                                                                                                                                                                                                                              |
| 0x17001     | 0x1                      | Returned after processing NAL-unit parameter-sets.                                                                                                                                                                                                                                                                                              |
| 0x17002     | 0x2                      | Busy. When returned by command 0x00090042 during video processing, SKATER uses the {[MVDSTD:GetConfig](MVDSTD:GetConfig "wikilink"), [MVDSTD:SetConfig](MVDSTD:SetConfig "wikilink"), and 0x00090042} commands again(same config as before). The SKATER code for this includes this debug string: "H264 output %lld us corrected to %lld us\n". |
| 0x17003     | 0x3                      |                                                                                                                                                                                                                                                                                                                                                 |
| 0x17004     | 0x4                      | Returned when not all of the input NAL-unit buffer was processed.                                                                                                                                                                                                                                                                               |
| 0x17005     | 0x5                      |                                                                                                                                                                                                                                                                                                                                                 |
| 0x17006     | 0x6                      |                                                                                                                                                                                                                                                                                                                                                 |
| 0x17007     | 0x7                      |                                                                                                                                                                                                                                                                                                                                                 |
| 0x17038     |                          |                                                                                                                                                                                                                                                                                                                                                 |

## Supported H.264 Levels and Profiles

| Level | Baseline      | Main          | High          | High 10 (High10, High10p, Hi10p or 10-bit H.264) | High 4:2:2 (High422p or High422) | High 4:4:4 Predictive (Hi444PP) |
|-------|---------------|---------------|---------------|--------------------------------------------------|----------------------------------|---------------------------------|
| 1     | Yes           | Yes           | Yes           | Yes                                              | Untested                         | Untested                        |
| 1b    | Yes           | Yes           | Yes           | Yes                                              | Untested                         | Untested                        |
| 1.1   | Yes           | Yes           | Yes           | Yes                                              | Untested                         | Untested                        |
| 1.2   | Yes           | Yes           | Yes           | Yes                                              | Untested                         | Untested                        |
| 1.3   | Yes           | Yes           | Yes           | Yes                                              | Untested                         | Untested                        |
| 2     | Yes           | Yes           | Yes           | Yes                                              | Untested                         | Untested                        |
| 2.1   | Yes           | Yes           | Yes           | Yes                                              | Untested                         | Untested                        |
| 2.2   | Yes           | Yes           | Yes           | Yes                                              | Untested                         | Untested                        |
| 3     | Yes           | Yes           | Yes           | Yes                                              | Untested                         | Untested                        |
| 3.1   | Yes           | Yes           | Yes           | Yes                                              | Untested                         | Untested                        |
| 3.2   | Yes           | Yes           | Yes           | Yes                                              | Untested                         | Untested                        |
| 4     | No (untested) | No (untested) | No (untested) | No (untested)                                    | No (untested)                    | No (untested)                   |
| 4.1   | No (untested) | No (untested) | No (untested) | No (untested)                                    | No (untested)                    | No (untested)                   |
| 4.2   | No (untested) | No (untested) | No (untested) | No (untested)                                    | No (untested)                    | No (untested)                   |
| 5     | No (untested) | No (untested) | No (untested) | No (untested)                                    | No (untested)                    | No (untested)                   |
| 5.1   | No (untested) | No (untested) | No (untested) | No (untested)                                    | No (untested)                    | No (untested)                   |
| 5.2   | No (untested) | No (untested) | No (untested) | No (untested)                                    | No (untested)                    | No (untested)                   |

created using the New 3DS Internet Browser, New 3DS Internet Browser
Specs and the following test pages:
[Baseline Profile Test](http://mtheall.com/~mtheall/pie/baseline.html)
[Main Profile Test](http://mtheall.com/~mtheall/pie/main.html)
[High Profile Test](http://mtheall.com/~mtheall/pie/high.html)
[High10 Profile Test](http://mtheall.com/~mtheall/pie/high10.html)
