+++
title = 'Internal Registers'
categories = ["GPU"]
+++

## Overview

GPU internal registers are written to through GPU commands. They are used to control the GPU's behavior, that is to say tell it to draw stuff and how we want it drawn.

Each command is at least 8 bytes wide. The first word is the command parameter and the second word constitutes the command header. Optionally, more parameter words may follow (potentially including a padding word to align commands to multiples of 8 bytes).

In the simplest case, a command is exactly 8 bytes wide. You can think of such a command as writing the parameter word to an internal register (the index of which is given in the command header). The more general case where more than one parameter word is given is equivalent to multiple simple commands (one for each parameter word). If consecutive writing mode is enabled in the command header, the current command index will be incremented after each parameter write. Otherwise, the parameters will be consecutively written to the same register.

For example, the sequence "0xAAAAAAAA 0x802F011C 0xBBBBBBBB 0xCCCCCCCC" is equivalent to a call to commands 0xF011C with parameter 0xAAAAAAAA, 0xF011D with parameter 0xBBBBBBBB and 0xF011E with parameter 0xCCCCCCCC. If consecutive writing mode were disabled, the command would be equivalent to three consecutive calls to 0xF011C (once with parameter 0xAAAAAAAA, once with 0xBBBBBBBB, and finally with 0xCCCCCCCC).

Invalid GPU command parameters including NaN floats can cause the GPU to hang, which then causes the GSP module to hang as well.

The size of GPU command buffers must be 0x10-byte aligned; the lower 3 bits of the size are cleared. A common pitfall is having the finalization command (write to register 0x0010) not executed because it was the last 8 bytes of a non-0x10 byte aligned command buffer, and having the GPU hang as a result.

### Command Header

| Bit   | Description                              |
|-------|------------------------------------------|
| 0-15  | Command ID                               |
| 16-19 | Parameter mask                           |
| 20-27 | Number of extra parameters (may be zero) |
| 28-30 | Unused                                   |
| 31    | Consecutive writing mode                 |

### Parameter masking

Using a value other than 0xF, parts of a word in internal GPU memory can be updated without touching the other bits of it. For example, setting bit 16 to zero indicates that the least significant byte of the parameter will not be overwritten, setting bit 17 to zero indicates that the parameter's second LSB will not be overwritten, etc. This means that for instance commands 0x00010107 and 0x00020107 refer to the same thing but write different parts of the parameter.

### Types

There are three main types of registers :

- configuration registers, which directly map to various rendering properties (for example: [GPUREG_FACECULLING_CONFIG](#gpureg_faceculling_config "wikilink"))
- data transfer registers, which can be seen as FIFOs that let us send sequential chunks of data to the GPU, such as shader code or 1D samplers (for example: [GPUREG_GSH_CODETRANSFER_DATA](#gpureg_sh_codetransfer_data "wikilink"))
- action triggering registers, which tell the GPU to do something, like draw a primitive (for example: [GPUREG_DRAWARRAYS](#gpureg_drawarrays "wikilink"))

### Aliases

It is possible for multiple register (sequential) IDs to correspond to the same register. This is done to leverage the consecutive writing mode for GPU commands, which makes it possible for a single command to write data to multiple sequential register IDs. For example, register IDs 02C1 through 02C8 all correspond to [GPUREG_VSH_FLOATUNIFORM_DATA*i*](#gpureg_vsh_floatuniform_datai "wikilink") so that a consecutively writing command based at 02C0 will write its first parameter to [GPUREG_VSH_FLOATUNIFORM_INDEX](#gpureg_vsh_floatuniform_index "wikilink") and ever subsequent ones to [GPUREG_VSH_FLOATUNIFORM_DATA*i*](#gpureg_vsh_floatuniform_datai "wikilink")

### Data Types

| Name | Description |
|----|----|
| signed | Signed integer |
| unsigned | Unsigned integer |
| floatX.Y.Z | Floating-point number with X sign bits, Y exponent bits, and Z mantissa bits |
| fixedX.Y.Z | Fixed-point number with X sign bits, Y integer bits, and Z fractional bits |

## Register list

### Miscellaneous registers (0x000-0x03F)

| Register ID | Register name | Notes | Official Name |
|----|----|----|----|
| 0000 | [GPUREG_0000](#gpureg_0000 "wikilink") |  |  |
| 0001 | [GPUREG_0001](#gpureg_0001 "wikilink") |  |  |
| 0002 | [GPUREG_0002](#gpureg_0002 "wikilink") |  |  |
| 0003 | [GPUREG_0003](#gpureg_0003 "wikilink") |  |  |
| 0004 | [GPUREG_0004](#gpureg_0004 "wikilink") |  |  |
| 0005 | [GPUREG_0005](#gpureg_0005 "wikilink") |  |  |
| 0006 | [GPUREG_0006](#gpureg_0006 "wikilink") |  |  |
| 0007 | [GPUREG_0007](#gpureg_0007 "wikilink") |  |  |
| 0008 | [GPUREG_0008](#gpureg_0008 "wikilink") |  |  |
| 0009 | [GPUREG_0009](#gpureg_0009 "wikilink") |  |  |
| 000A | [GPUREG_000A](#gpureg_000a "wikilink") |  |  |
| 000B | [GPUREG_000B](#gpureg_000b "wikilink") |  |  |
| 000C | [GPUREG_000C](#gpureg_000c "wikilink") |  |  |
| 000D | [GPUREG_000D](#gpureg_000d "wikilink") |  |  |
| 000E | [GPUREG_000E](#gpureg_000e "wikilink") |  |  |
| 000F | [GPUREG_000F](#gpureg_000f "wikilink") |  |  |
| 0010 | [GPUREG_FINALIZE](#gpureg_finalize "wikilink") |  | PICA_REG_INTERRUPT |
| 0011 | [GPUREG_0011](#gpureg_0011 "wikilink") |  |  |
| 0012 | [GPUREG_0012](#gpureg_0012 "wikilink") |  |  |
| 0013 | [GPUREG_0013](#gpureg_0013 "wikilink") |  |  |
| 0014 | [GPUREG_0014](#gpureg_0014 "wikilink") |  |  |
| 0015 | [GPUREG_0015](#gpureg_0015 "wikilink") |  |  |
| 0016 | [GPUREG_0016](#gpureg_0016 "wikilink") |  |  |
| 0017 | [GPUREG_0017](#gpureg_0017 "wikilink") |  |  |
| 0018 | [GPUREG_0018](#gpureg_0018 "wikilink") |  |  |
| 0019 | [GPUREG_0019](#gpureg_0019 "wikilink") |  |  |
| 001A | [GPUREG_001A](#gpureg_001a "wikilink") |  |  |
| 001B | [GPUREG_001B](#gpureg_001b "wikilink") |  |  |
| 001C | [GPUREG_001C](#gpureg_001c "wikilink") |  |  |
| 001D | [GPUREG_001D](#gpureg_001d "wikilink") |  |  |
| 001E | [GPUREG_001E](#gpureg_001e "wikilink") |  |  |
| 001F | [GPUREG_001F](#gpureg_001f "wikilink") |  |  |
| 0020 | [GPUREG_0020](#gpureg_0020 "wikilink") |  |  |
| 0021 | [GPUREG_0021](#gpureg_0021 "wikilink") |  |  |
| 0022 | [GPUREG_0022](#gpureg_0022 "wikilink") |  |  |
| 0023 | [GPUREG_0023](#gpureg_0023 "wikilink") |  |  |
| 0024 | [GPUREG_0024](#gpureg_0024 "wikilink") |  |  |
| 0025 | [GPUREG_0025](#gpureg_0025 "wikilink") |  |  |
| 0026 | [GPUREG_0026](#gpureg_0026 "wikilink") |  |  |
| 0027 | [GPUREG_0027](#gpureg_0027 "wikilink") |  |  |
| 0028 | [GPUREG_0028](#gpureg_0028 "wikilink") |  |  |
| 0029 | [GPUREG_0029](#gpureg_0029 "wikilink") |  |  |
| 002A | [GPUREG_002A](#gpureg_002a "wikilink") |  |  |
| 002B | [GPUREG_002B](#gpureg_002b "wikilink") |  |  |
| 002C | [GPUREG_002C](#gpureg_002c "wikilink") |  |  |
| 002D | [GPUREG_002D](#gpureg_002d "wikilink") |  |  |
| 002E | [GPUREG_002E](#gpureg_002e "wikilink") |  |  |
| 002F | [GPUREG_002F](#gpureg_002f "wikilink") |  |  |
| 0030 | [GPUREG_0030](#gpureg_0030 "wikilink") |  |  |
| 0031 | [GPUREG_0031](#gpureg_0031 "wikilink") |  |  |
| 0032 | [GPUREG_0032](#gpureg_0032 "wikilink") |  |  |
| 0033 | [GPUREG_0033](#gpureg_0033 "wikilink") |  |  |
| 0034 | [GPUREG_0034](#gpureg_0034 "wikilink") |  |  |
| 0035 | [GPUREG_0035](#gpureg_0035 "wikilink") |  |  |
| 0036 | [GPUREG_0036](#gpureg_0036 "wikilink") |  |  |
| 0037 | [GPUREG_0037](#gpureg_0037 "wikilink") |  |  |
| 0038 | [GPUREG_0038](#gpureg_0038 "wikilink") |  |  |
| 0039 | [GPUREG_0039](#gpureg_0039 "wikilink") |  |  |
| 003A | [GPUREG_003A](#gpureg_003a "wikilink") |  |  |
| 003B | [GPUREG_003B](#gpureg_003b "wikilink") |  |  |
| 003C | [GPUREG_003C](#gpureg_003c "wikilink") |  |  |
| 003D | [GPUREG_003D](#gpureg_003d "wikilink") |  |  |
| 003E | [GPUREG_003E](#gpureg_003e "wikilink") |  |  |
| 003F | [GPUREG_003F](#gpureg_003f "wikilink") |  |  |

### Rasterizer registers (0x040-0x07F)

| Register ID | Register name | Notes | Official Name |
|----|----|----|----|
| 0040 | [GPUREG_FACECULLING_CONFIG](#gpureg_faceculling_config "wikilink") |  | PICA_REG_CULL_FACE |
| 0041 | [GPUREG_VIEWPORT_WIDTH](#gpureg_viewport_width "wikilink") |  | PICA_REG_VIEWPORT_WIDTH1 |
| 0042 | [GPUREG_VIEWPORT_INVW](#gpureg_viewport_invw "wikilink") |  | PICA_REG_VIEWPORT_WIDTH2 |
| 0043 | [GPUREG_VIEWPORT_HEIGHT](#gpureg_viewport_height "wikilink") |  | PICA_REG_VIEWPORT_HEIGHT1 |
| 0044 | [GPUREG_VIEWPORT_INVH](#gpureg_viewport_invh "wikilink") |  | PICA_REG_VIEWPORT_HEIGHT2 |
| 0045 | [GPUREG_0045](#gpureg_0045 "wikilink") |  |  |
| 0046 | [GPUREG_0046](#gpureg_0046 "wikilink") |  |  |
| 0047 | [GPUREG_FRAGOP_CLIP](#gpureg_fragop_clip "wikilink") | ? | PICA_REG_FRAGOP_CLIP |
| 0048 | [GPUREG_FRAGOP_CLIP_DATA0](#gpureg_fragop_clip_datai "wikilink") | ? | PICA_REG_FRAGOP_CLIP_DATA1 |
| 0049 | [GPUREG_FRAGOP_CLIP_DATA1](#gpureg_fragop_clip_datai "wikilink") | ? | PICA_REG_FRAGOP_CLIP_DATA2 |
| 004A | [GPUREG_FRAGOP_CLIP_DATA2](#gpureg_fragop_clip_datai "wikilink") | ? | PICA_REG_FRAGOP_CLIP_DATA3 |
| 004B | [GPUREG_FRAGOP_CLIP_DATA3](#gpureg_fragop_clip_datai "wikilink") | ? | PICA_REG_FRAGOP_CLIP_DATA4 |
| 004C | [GPUREG_004C](#gpureg_004c "wikilink") |  |  |
| 004D | [GPUREG_DEPTHMAP_SCALE](#gpureg_depthmap_scale "wikilink") | As f24 | PICA_REG_FRAGOP_WSCALE_DATA1 |
| 004E | [GPUREG_DEPTHMAP_OFFSET](#gpureg_depthmap_offset "wikilink") | As f24 | PICA_REG_FRAGOP_WSCALE_DATA2 |
| 004F | [GPUREG_SH_OUTMAP_TOTAL](#gpureg_sh_outmap_total "wikilink") |  | PICA_REG_GS_OUT_REG_NUM0 / PICA_REG_VS_OUT_REG_NUM0 |
| 0050 | [GPUREG_SH_OUTMAP_O0](#gpureg_sh_outmap_oi "wikilink") |  | PICA_REG_GS_OUT_ATTR0 / PICA_REG_VS_OUT_ATTR0 |
| 0051 | [GPUREG_SH_OUTMAP_O1](#gpureg_sh_outmap_oi "wikilink") |  | PICA_REG_GS_OUT_ATTR1 / PICA_REG_VS_OUT_ATTR1 |
| 0052 | [GPUREG_SH_OUTMAP_O2](#gpureg_sh_outmap_oi "wikilink") |  | PICA_REG_GS_OUT_ATTR2 / PICA_REG_VS_OUT_ATTR2 |
| 0053 | [GPUREG_SH_OUTMAP_O3](#gpureg_sh_outmap_oi "wikilink") |  | PICA_REG_GS_OUT_ATTR3 / PICA_REG_VS_OUT_ATTR3 |
| 0054 | [GPUREG_SH_OUTMAP_O4](#gpureg_sh_outmap_oi "wikilink") |  | PICA_REG_GS_OUT_ATTR4 / PICA_REG_VS_OUT_ATTR4 |
| 0055 | [GPUREG_SH_OUTMAP_O5](#gpureg_sh_outmap_oi "wikilink") |  | PICA_REG_GS_OUT_ATTR5 / PICA_REG_VS_OUT_ATTR5 |
| 0056 | [GPUREG_SH_OUTMAP_O6](#gpureg_sh_outmap_oi "wikilink") |  | PICA_REG_GS_OUT_ATTR6 / PICA_REG_VS_OUT_ATTR6 |
| 0057 | [GPUREG_0057](#gpureg_0057 "wikilink") |  |  |
| 0058 | [GPUREG_0058](#gpureg_0058 "wikilink") |  |  |
| 0059 | [GPUREG_0059](#gpureg_0059 "wikilink") |  |  |
| 005A | [GPUREG_005A](#gpureg_005a "wikilink") |  |  |
| 005B | [GPUREG_005B](#gpureg_005b "wikilink") |  |  |
| 005C | [GPUREG_005C](#gpureg_005c "wikilink") |  |  |
| 005D | [GPUREG_005D](#gpureg_005d "wikilink") |  |  |
| 005E | [GPUREG_005E](#gpureg_005e "wikilink") |  |  |
| 005F | [GPUREG_005F](#gpureg_005f "wikilink") |  |  |
| 0060 | [GPUREG_0060](#gpureg_0060 "wikilink") |  |  |
| 0061 | [GPUREG_EARLYDEPTH_FUNC](#gpureg_earlydepth_func "wikilink") | ? | PICA_REG_EARLY_DEPTH_FUNC |
| 0062 | [GPUREG_EARLYDEPTH_TEST1](#gpureg_earlydepth_test1 "wikilink") | ? | PICA_REG_EARLY_DEPTH_TEST1 |
| 0063 | [GPUREG_EARLYDEPTH_CLEAR](#gpureg_earlydepth_clear "wikilink") |  | PICA_REG_EARLY_DEPTH_CLEAR |
| 0064 | [GPUREG_SH_OUTATTR_MODE](#gpureg_sh_outattr_mode "wikilink") | ? | PICA_REG_GS_OUT_ATTR_MODE / PICA_REG_VS_OUT_ATTR_MODE |
| 0065 | [GPUREG_SCISSORTEST_MODE](#gpureg_scissortest_mode "wikilink") |  | PICA_REG_SCISSOR |
| 0066 | [GPUREG_SCISSORTEST_POS](#gpureg_scissortest_pos "wikilink") |  | PICA_REG_SCISSOR_XY |
| 0067 | [GPUREG_SCISSORTEST_DIM](#gpureg_scissortest_dim "wikilink") |  | PICA_REG_SCISSOR_SIZE |
| 0068 | [GPUREG_VIEWPORT_XY](#gpureg_viewport_xy "wikilink") |  | PICA_REG_VIEWPORT_XY |
| 0069 | [GPUREG_0069](#gpureg_0069 "wikilink") |  |  |
| 006A | [GPUREG_EARLYDEPTH_DATA](#gpureg_earlydepth_data "wikilink") |  | PICA_REG_EARLY_DEPTH_DATA |
| 006B | [GPUREG_006B](#gpureg_006b "wikilink") |  |  |
| 006C | [GPUREG_006C](#gpureg_006c "wikilink") |  |  |
| 006D | [GPUREG_DEPTHMAP_ENABLE](#gpureg_depthmap_enable "wikilink") | ? | PICA_REG_FRAGOP_WSCALE |
| 006E | [GPUREG_RENDERBUF_DIM](#gpureg_renderbuf_dim "wikilink") | ? | PICA_REG_RENDER_BUF_RESOLUTION1 |
| 006F | [GPUREG_SH_OUTATTR_CLOCK](#gpureg_sh_outattr_clock "wikilink") | ? | PICA_REG_GS_OUT_ATTR_CLK / PICA_REG_VS_OUT_ATTR_CLK |
| 0070 | [GPUREG_0070](#gpureg_0070 "wikilink") |  |  |
| 0071 | [GPUREG_0071](#gpureg_0071 "wikilink") |  |  |
| 0072 | [GPUREG_0072](#gpureg_0072 "wikilink") |  |  |
| 0073 | [GPUREG_0073](#gpureg_0073 "wikilink") |  |  |
| 0074 | [GPUREG_0074](#gpureg_0074 "wikilink") |  |  |
| 0075 | [GPUREG_0075](#gpureg_0075 "wikilink") |  |  |
| 0076 | [GPUREG_0076](#gpureg_0076 "wikilink") |  |  |
| 0077 | [GPUREG_0077](#gpureg_0077 "wikilink") |  |  |
| 0078 | [GPUREG_0078](#gpureg_0078 "wikilink") |  |  |
| 0079 | [GPUREG_0079](#gpureg_0079 "wikilink") |  |  |
| 007A | [GPUREG_007A](#gpureg_007a "wikilink") |  |  |
| 007B | [GPUREG_007B](#gpureg_007b "wikilink") |  |  |
| 007C | [GPUREG_007C](#gpureg_007c "wikilink") |  |  |
| 007D | [GPUREG_007D](#gpureg_007d "wikilink") |  |  |
| 007E | [GPUREG_007E](#gpureg_007e "wikilink") |  |  |
| 007F | [GPUREG_007F](#gpureg_007f "wikilink") |  |  |

### Texturing registers (0x080-0x0FF)

| Register ID | Register name | Notes | Official Name |
|----|----|----|----|
| 0080 | [GPUREG_TEXUNIT_CONFIG](#gpureg_texunit_config "wikilink") |  | PICA_REG_TEXTURE_FUNC |
| 0081 | [GPUREG_TEXUNIT0_BORDER_COLOR](#gpureg_texuniti_border_color "wikilink") |  | PICA_REG_TEXTURE0_BORDER_COLOR |
| 0082 | [GPUREG_TEXUNIT0_DIM](#gpureg_texuniti_dim "wikilink") |  | PICA_REG_TEXTURE0_SIZE |
| 0083 | [GPUREG_TEXUNIT0_PARAM](#gpureg_texuniti_param "wikilink") |  | PICA_REG_TEXTURE0_WRAP_FILTER |
| 0084 | [GPUREG_TEXUNIT0_LOD](#gpureg_texuniti_lod "wikilink") | ? | PICA_REG_TEXTURE0_LOD |
| 0085 | [GPUREG_TEXUNIT0_ADDR1](#gpureg_texuniti_addri "wikilink") |  | PICA_REG_TEXTURE0_ADDR1 |
| 0086 | [GPUREG_TEXUNIT0_ADDR2](#gpureg_texuniti_addri "wikilink") |  | PICA_REG_TEXTURE0_ADDR2 |
| 0087 | [GPUREG_TEXUNIT0_ADDR3](#gpureg_texuniti_addri "wikilink") |  | PICA_REG_TEXTURE0_ADDR3 |
| 0088 | [GPUREG_TEXUNIT0_ADDR4](#gpureg_texuniti_addri "wikilink") |  | PICA_REG_TEXTURE0_ADDR4 |
| 0089 | [GPUREG_TEXUNIT0_ADDR5](#gpureg_texuniti_addri "wikilink") |  | PICA_REG_TEXTURE0_ADDR5 |
| 008A | [GPUREG_TEXUNIT0_ADDR6](#gpureg_texuniti_addri "wikilink") |  | PICA_REG_TEXTURE0_ADDR6 |
| 008B | [GPUREG_TEXUNIT0_SHADOW](#gpureg_texuniti_shadow "wikilink") | ? | PICA_REG_TEXTURE0_SHADOW |
| 008C | [GPUREG_008C](#gpureg_008c "wikilink") |  |  |
| 008D | [GPUREG_008D](#gpureg_008d "wikilink") |  |  |
| 008E | [GPUREG_TEXUNIT0_TYPE](#gpureg_texuniti_type "wikilink") | ? | PICA_REG_TEXTURE0_FORMAT |
| 008F | [GPUREG_LIGHTING_ENABLE0](#gpureg_lighting_enable0 "wikilink") | ? | PICA_REG_FRAG_LIGHT_EN0 |
| 0090 | [GPUREG_0090](#gpureg_0090 "wikilink") |  |  |
| 0091 | [GPUREG_TEXUNIT1_BORDER_COLOR](#gpureg_texuniti_border_color "wikilink") |  | PICA_REG_TEXTURE1_BORDER_COLOR |
| 0092 | [GPUREG_TEXUNIT1_DIM](#gpureg_texuniti_dim "wikilink") |  | PICA_REG_TEXTURE1_SIZE |
| 0093 | [GPUREG_TEXUNIT1_PARAM](#gpureg_texuniti_param "wikilink") |  | PICA_REG_TEXTURE1_WRAP_FILTER |
| 0094 | [GPUREG_TEXUNIT1_LOD](#gpureg_texuniti_lod "wikilink") | ? | PICA_REG_TEXTURE1_LOD |
| 0095 | [GPUREG_TEXUNIT1_ADDR](#gpureg_texuniti_addri "wikilink") |  | PICA_REG_TEXTURE1_ADDR |
| 0096 | [GPUREG_TEXUNIT1_TYPE](#gpureg_texuniti_type "wikilink") |  | PICA_REG_TEXTURE1_FORMAT |
| 0097 | [GPUREG_0097](#gpureg_0097 "wikilink") |  |  |
| 0098 | [GPUREG_0098](#gpureg_0098 "wikilink") |  |  |
| 0099 | [GPUREG_TEXUNIT2_BORDER_COLOR](#gpureg_texuniti_border_color "wikilink") |  | PICA_REG_TEXTURE2_BORDER_COLOR |
| 009A | [GPUREG_TEXUNIT2_DIM](#gpureg_texuniti_dim "wikilink") |  | PICA_REG_TEXTURE2_SIZE |
| 009B | [GPUREG_TEXUNIT2_PARAM](#gpureg_texuniti_param "wikilink") |  | PICA_REG_TEXTURE2_WRAP_FILTER |
| 009C | [GPUREG_TEXUNIT2_LOD](#gpureg_texuniti_lod "wikilink") | ? | PICA_REG_TEXTURE2_LOD |
| 009D | [GPUREG_TEXUNIT2_ADDR](#gpureg_texuniti_addri "wikilink") |  | PICA_REG_TEXTURE2_ADDR |
| 009E | [GPUREG_TEXUNIT2_TYPE](#gpureg_texuniti_type "wikilink") |  | PICA_REG_TEXTURE2_FORMAT |
| 009F | [GPUREG_009F](#gpureg_009f "wikilink") |  |  |
| 00A0 | [GPUREG_00A0](#gpureg_00a0 "wikilink") |  |  |
| 00A1 | [GPUREG_00A1](#gpureg_00a1 "wikilink") |  |  |
| 00A2 | [GPUREG_00A2](#gpureg_00a2 "wikilink") |  |  |
| 00A3 | [GPUREG_00A3](#gpureg_00a3 "wikilink") |  |  |
| 00A4 | [GPUREG_00A4](#gpureg_00a4 "wikilink") |  |  |
| 00A5 | [GPUREG_00A5](#gpureg_00a5 "wikilink") |  |  |
| 00A6 | [GPUREG_00A6](#gpureg_00a6 "wikilink") |  |  |
| 00A7 | [GPUREG_00A7](#gpureg_00a7 "wikilink") |  |  |
| 00A8 | [GPUREG_TEXUNIT3_PROCTEX0](#gpureg_texunit3_proctex0 "wikilink") | ? | PICA_REG_TEXTURE3_PROCTEX0 |
| 00A9 | [GPUREG_TEXUNIT3_PROCTEX1](#gpureg_texunit3_proctex1 "wikilink") | ? | PICA_REG_TEXTURE3_PROCTEX1 |
| 00AA | [GPUREG_TEXUNIT3_PROCTEX2](#gpureg_texunit3_proctex2 "wikilink") | ? | PICA_REG_TEXTURE3_PROCTEX2 |
| 00AB | [GPUREG_TEXUNIT3_PROCTEX3](#gpureg_texunit3_proctex3 "wikilink") | ? | PICA_REG_TEXTURE3_PROCTEX3 |
| 00AC | [GPUREG_TEXUNIT3_PROCTEX4](#gpureg_texunit3_proctex4 "wikilink") | ? | PICA_REG_TEXTURE3_PROCTEX4 |
| 00AD | [GPUREG_TEXUNIT3_PROCTEX5](#gpureg_texunit3_proctex5 "wikilink") | ? | PICA_REG_TEXTURE3_PROCTEX5 |
| 00AE | [GPUREG_00AE](#gpureg_00ae "wikilink") |  |  |
| 00AF | [GPUREG_PROCTEX_LUT](#gpureg_proctex_lut "wikilink") | ? | PICA_REG_PROCTEX_LUT |
| 00B0 | [GPUREG_PROCTEX_LUT_DATA0](#gpureg_proctex_lut_datai "wikilink") | ? | PICA_REG_PROCTEX_LUT_DATA0 |
| 00B1 | [GPUREG_PROCTEX_LUT_DATA1](#gpureg_proctex_lut_datai "wikilink") | ? | PICA_REG_PROCTEX_LUT_DATA1 |
| 00B2 | [GPUREG_PROCTEX_LUT_DATA2](#gpureg_proctex_lut_datai "wikilink") | ? | PICA_REG_PROCTEX_LUT_DATA2 |
| 00B3 | [GPUREG_PROCTEX_LUT_DATA3](#gpureg_proctex_lut_datai "wikilink") | ? | PICA_REG_PROCTEX_LUT_DATA3 |
| 00B4 | [GPUREG_PROCTEX_LUT_DATA4](#gpureg_proctex_lut_datai "wikilink") | ? | PICA_REG_PROCTEX_LUT_DATA4 |
| 00B5 | [GPUREG_PROCTEX_LUT_DATA5](#gpureg_proctex_lut_datai "wikilink") | ? | PICA_REG_PROCTEX_LUT_DATA5 |
| 00B6 | [GPUREG_PROCTEX_LUT_DATA6](#gpureg_proctex_lut_datai "wikilink") | ? | PICA_REG_PROCTEX_LUT_DATA6 |
| 00B7 | [GPUREG_PROCTEX_LUT_DATA7](#gpureg_proctex_lut_datai "wikilink") | ? | PICA_REG_PROCTEX_LUT_DATA7 |
| 00B8 | [GPUREG_00B8](#gpureg_00b8 "wikilink") |  |  |
| 00B9 | [GPUREG_00B9](#gpureg_00b9 "wikilink") |  |  |
| 00BA | [GPUREG_00BA](#gpureg_00ba "wikilink") |  |  |
| 00BB | [GPUREG_00BB](#gpureg_00bb "wikilink") |  |  |
| 00BC | [GPUREG_00BC](#gpureg_00bc "wikilink") |  |  |
| 00BD | [GPUREG_00BD](#gpureg_00bd "wikilink") |  |  |
| 00BE | [GPUREG_00BE](#gpureg_00be "wikilink") |  |  |
| 00BF | [GPUREG_00BF](#gpureg_00bf "wikilink") |  |  |
| 00C0 | [GPUREG_TEXENV0_SOURCE](#gpureg_texenvi_source "wikilink") |  | PICA_REG_TEX_ENV_0 |
| 00C1 | [GPUREG_TEXENV0_OPERAND](#gpureg_texenvi_operand "wikilink") |  | PICA_REG_TEX_ENV_0_OPERAND |
| 00C2 | [GPUREG_TEXENV0_COMBINER](#gpureg_texenvi_combiner "wikilink") |  | PICA_REG_TEX_ENV_0_COMBINE |
| 00C3 | [GPUREG_TEXENV0_COLOR](#gpureg_texenvi_color "wikilink") |  | PICA_REG_TEX_ENV_0_COLOR |
| 00C4 | [GPUREG_TEXENV0_SCALE](#gpureg_texenvi_scale "wikilink") |  | PICA_REG_TEX_ENV_0_SCALE |
| 00C5 | [GPUREG_00C5](#gpureg_00c5 "wikilink") |  |  |
| 00C6 | [GPUREG_00C6](#gpureg_00c6 "wikilink") |  |  |
| 00C7 | [GPUREG_00C7](#gpureg_00c7 "wikilink") |  |  |
| 00C8 | [GPUREG_TEXENV1_SOURCE](#gpureg_texenvi_source "wikilink") |  | PICA_REG_TEX_ENV_1 |
| 00C9 | [GPUREG_TEXENV1_OPERAND](#gpureg_texenvi_operand "wikilink") |  | PICA_REG_TEX_ENV_1_OPERAND |
| 00CA | [GPUREG_TEXENV1_COMBINER](#gpureg_texenvi_combiner "wikilink") |  | PICA_REG_TEX_ENV_1_COMBINE |
| 00CB | [GPUREG_TEXENV1_COLOR](#gpureg_texenvi_color "wikilink") |  | PICA_REG_TEX_ENV_1_COLOR |
| 00CC | [GPUREG_TEXENV1_SCALE](#gpureg_texenvi_scale "wikilink") |  | PICA_REG_TEX_ENV_1_SCALE |
| 00CD | [GPUREG_00CD](#gpureg_00cd "wikilink") |  |  |
| 00CE | [GPUREG_00CE](#gpureg_00ce "wikilink") |  |  |
| 00CF | [GPUREG_00CF](#gpureg_00cf "wikilink") |  |  |
| 00D0 | [GPUREG_TEXENV2_SOURCE](#gpureg_texenvi_source "wikilink") |  | PICA_REG_TEX_ENV_2 |
| 00D1 | [GPUREG_TEXENV2_OPERAND](#gpureg_texenvi_operand "wikilink") |  | PICA_REG_TEX_ENV_2_OPERAND |
| 00D2 | [GPUREG_TEXENV2_COMBINER](#gpureg_texenvi_combiner "wikilink") |  | PICA_REG_TEX_ENV_2_COMBINE |
| 00D3 | [GPUREG_TEXENV2_COLOR](#gpureg_texenvi_color "wikilink") |  | PICA_REG_TEX_ENV_2_COLOR |
| 00D4 | [GPUREG_TEXENV2_SCALE](#gpureg_texenvi_scale "wikilink") |  | PICA_REG_TEX_ENV_2_SCALE |
| 00D5 | [GPUREG_00D5](#gpureg_00d5 "wikilink") |  |  |
| 00D6 | [GPUREG_00D6](#gpureg_00d6 "wikilink") |  |  |
| 00D7 | [GPUREG_00D7](#gpureg_00d7 "wikilink") |  |  |
| 00D8 | [GPUREG_TEXENV3_SOURCE](#gpureg_texenvi_source "wikilink") |  | PICA_REG_TEX_ENV_3 |
| 00D9 | [GPUREG_TEXENV3_OPERAND](#gpureg_texenvi_operand "wikilink") |  | PICA_REG_TEX_ENV_3_OPERAND |
| 00DA | [GPUREG_TEXENV3_COMBINER](#gpureg_texenvi_combiner "wikilink") |  | PICA_REG_TEX_ENV_3_COMBINE |
| 00DB | [GPUREG_TEXENV3_COLOR](#gpureg_texenvi_color "wikilink") |  | PICA_REG_TEX_ENV_3_COLOR |
| 00DC | [GPUREG_TEXENV3_SCALE](#gpureg_texenvi_scale "wikilink") |  | PICA_REG_TEX_ENV_3_SCALE |
| 00DD | [GPUREG_00DD](#gpureg_00dd "wikilink") |  |  |
| 00DE | [GPUREG_00DE](#gpureg_00de "wikilink") |  |  |
| 00DF | [GPUREG_00DF](#gpureg_00df "wikilink") |  |  |
| 00E0 | [GPUREG_TEXENV_UPDATE_BUFFER](#gpureg_texenv_update_buffer "wikilink") | ? | PICA_REG_GAS_FOG_MODE / PICA_REG_TEX_ENV_BUF_INPUT |
| 00E1 | [GPUREG_FOG_COLOR](#gpureg_fog_color "wikilink") | ? | PICA_REG_FOG_COLOR |
| 00E2 | [GPUREG_00E2](#gpureg_00e2 "wikilink") |  |  |
| 00E3 | [GPUREG_00E3](#gpureg_00e3 "wikilink") |  |  |
| 00E4 | [GPUREG_GAS_ATTENUATION](#gpureg_gas_attenuation "wikilink") | ? | PICA_REG_GAS_ATTENUATION |
| 00E5 | [GPUREG_GAS_ACCMAX](#gpureg_gas_accmax "wikilink") | ? | PICA_REG_GAS_ACCMAX |
| 00E6 | [GPUREG_FOG_LUT_INDEX](#gpureg_fog_lut_index "wikilink") | ? | PICA_REG_FOG_LUT_INDEX |
| 00E7 | [GPUREG_00E7](#gpureg_00e7 "wikilink") |  |  |
| 00E8 | [GPUREG_FOG_LUT_DATA0](#gpureg_fog_lut_datai "wikilink") | ? | PICA_REG_FOG_LUT_DATA0 |
| 00E9 | [GPUREG_FOG_LUT_DATA1](#gpureg_fog_lut_datai "wikilink") | ? | PICA_REG_FOG_LUT_DATA1 |
| 00EA | [GPUREG_FOG_LUT_DATA2](#gpureg_fog_lut_datai "wikilink") | ? | PICA_REG_FOG_LUT_DATA2 |
| 00EB | [GPUREG_FOG_LUT_DATA3](#gpureg_fog_lut_datai "wikilink") | ? | PICA_REG_FOG_LUT_DATA3 |
| 00EC | [GPUREG_FOG_LUT_DATA4](#gpureg_fog_lut_datai "wikilink") | ? | PICA_REG_FOG_LUT_DATA4 |
| 00ED | [GPUREG_FOG_LUT_DATA5](#gpureg_fog_lut_datai "wikilink") | ? | PICA_REG_FOG_LUT_DATA5 |
| 00EE | [GPUREG_FOG_LUT_DATA6](#gpureg_fog_lut_datai "wikilink") | ? | PICA_REG_FOG_LUT_DATA6 |
| 00EF | [GPUREG_FOG_LUT_DATA7](#gpureg_fog_lut_datai "wikilink") | ? | PICA_REG_FOG_LUT_DATA7 |
| 00F0 | [GPUREG_TEXENV4_SOURCE](#gpureg_texenvi_source "wikilink") |  | PICA_REG_TEX_ENV_4 |
| 00F1 | [GPUREG_TEXENV4_OPERAND](#gpureg_texenvi_operand "wikilink") |  | PICA_REG_TEX_ENV_4_OPERAND |
| 00F2 | [GPUREG_TEXENV4_COMBINER](#gpureg_texenvi_combiner "wikilink") |  | PICA_REG_TEX_ENV_4_COMBINE |
| 00F3 | [GPUREG_TEXENV4_COLOR](#gpureg_texenvi_color "wikilink") |  | PICA_REG_TEX_ENV_4_COLOR |
| 00F4 | [GPUREG_TEXENV4_SCALE](#gpureg_texenvi_scale "wikilink") |  | PICA_REG_TEX_ENV_4_SCALE |
| 00F5 | [GPUREG_00F5](#gpureg_00f5 "wikilink") |  |  |
| 00F6 | [GPUREG_00F6](#gpureg_00f6 "wikilink") |  |  |
| 00F7 | [GPUREG_00F7](#gpureg_00f7 "wikilink") |  |  |
| 00F8 | [GPUREG_TEXENV5_SOURCE](#gpureg_texenvi_source "wikilink") |  | PICA_REG_TEX_ENV_5 |
| 00F9 | [GPUREG_TEXENV5_OPERAND](#gpureg_texenvi_operand "wikilink") |  | PICA_REG_TEX_ENV_5_OPERAND |
| 00FA | [GPUREG_TEXENV5_COMBINER](#gpureg_texenvi_combiner "wikilink") |  | PICA_REG_TEX_ENV_5_COMBINE |
| 00FB | [GPUREG_TEXENV5_COLOR](#gpureg_texenvi_color "wikilink") |  | PICA_REG_TEX_ENV_5_COLOR |
| 00FC | [GPUREG_TEXENV5_SCALE](#gpureg_texenvi_scale "wikilink") |  | PICA_REG_TEX_ENV_5_SCALE |
| 00FD | [GPUREG_TEXENV_BUFFER_COLOR](#gpureg_texenv_buffer_color "wikilink") | ? | PICA_REG_TEX_ENV_BUF_COLOR |
| 00FE | [GPUREG_00FE](#gpureg_00fe "wikilink") |  |  |
| 00FF | [GPUREG_00FF](#gpureg_00ff "wikilink") |  |  |

### Framebuffer registers (0x100-0x13F)

| Register ID | Register name | Notes | Official Name |
|----|----|----|----|
| 0100 | [GPUREG_COLOR_OPERATION](#gpureg_color_operation "wikilink") |  | PICA_REG_COLOR_OPERATION |
| 0101 | [GPUREG_BLEND_FUNC](#gpureg_blend_func "wikilink") |  | PICA_REG_BLEND_FUNC |
| 0102 | [GPUREG_LOGIC_OP](#gpureg_logic_op "wikilink") |  | PICA_REG_LOGIC_OP |
| 0103 | [GPUREG_BLEND_COLOR](#gpureg_blend_color "wikilink") |  | PICA_REG_BLEND_COLOR |
| 0104 | [GPUREG_FRAGOP_ALPHA_TEST](#gpureg_fragop_alpha_test "wikilink") |  | PICA_REG_FRAGOP_ALPHA_TEST |
| 0105 | [GPUREG_STENCIL_TEST](#gpureg_stencil_test "wikilink") |  | PICA_REG_STENCIL_TEST |
| 0106 | [GPUREG_STENCIL_OP](#gpureg_stencil_op "wikilink") |  | PICA_REG_STENCIL_OP |
| 0107 | [GPUREG_DEPTH_COLOR_MASK](#gpureg_depth_color_mask "wikilink") |  | PICA_REG_DEPTH_COLOR_MASK |
| 0108 | [GPUREG_0108](#gpureg_0108 "wikilink") |  |  |
| 0109 | [GPUREG_0109](#gpureg_0109 "wikilink") |  |  |
| 010A | [GPUREG_010A](#gpureg_010a "wikilink") |  |  |
| 010B | [GPUREG_010B](#gpureg_010b "wikilink") |  |  |
| 010C | [GPUREG_010C](#gpureg_010c "wikilink") |  |  |
| 010D | [GPUREG_010D](#gpureg_010d "wikilink") |  |  |
| 010E | [GPUREG_010E](#gpureg_010e "wikilink") |  |  |
| 010F | [GPUREG_010F](#gpureg_010f "wikilink") |  |  |
| 0110 | [GPUREG_FRAMEBUFFER_INVALIDATE](#gpureg_framebuffer_invalidate "wikilink") |  | PICA_REG_COLOR_BUFFER_CLEAR0 |
| 0111 | [GPUREG_FRAMEBUFFER_FLUSH](#gpureg_framebuffer_flush "wikilink") |  | PICA_REG_COLOR_BUFFER_CLEAR1 |
| 0112 | [GPUREG_COLORBUFFER_READ](#gpureg_colorbuffer_read "wikilink") |  | PICA_REG_COLOR_BUFFER_READ |
| 0113 | [GPUREG_COLORBUFFER_WRITE](#gpureg_colorbuffer_write "wikilink") |  | PICA_REG_COLOR_BUFFER_WRITE |
| 0114 | [GPUREG_DEPTHBUFFER_READ](#gpureg_depthbuffer_read "wikilink") |  | PICA_REG_DEPTH_STENCIL_READ |
| 0115 | [GPUREG_DEPTHBUFFER_WRITE](#gpureg_depthbuffer_write "wikilink") |  | PICA_REG_DEPTH_STENCIL_WRITE |
| 0116 | [GPUREG_DEPTHBUFFER_FORMAT](#gpureg_depthbuffer_format "wikilink") |  | PICA_REG_RENDER_BUF_DEPTH_MODE |
| 0117 | [GPUREG_COLORBUFFER_FORMAT](#gpureg_colorbuffer_format "wikilink") |  | PICA_REG_RENDER_BUF_COLOR_MODE |
| 0118 | [GPUREG_EARLYDEPTH_TEST2](#gpureg_earlydepth_test2 "wikilink") | ? | PICA_REG_EARLY_DEPTH_TEST2 |
| 0119 | [GPUREG_0119](#gpureg_0119 "wikilink") |  |  |
| 011A | [GPUREG_011A](#gpureg_011a "wikilink") |  |  |
| 011B | [GPUREG_FRAMEBUFFER_BLOCK32](#gpureg_framebuffer_block32 "wikilink") |  | PICA_REG_RENDER_BLOCK_FORMAT |
| 011C | [GPUREG_DEPTHBUFFER_LOC](#gpureg_depthbuffer_loc "wikilink") |  | PICA_REG_RENDER_BUF_DEPTH_ADDR |
| 011D | [GPUREG_COLORBUFFER_LOC](#gpureg_colorbuffer_loc "wikilink") |  | PICA_REG_RENDER_BUF_COLOR_ADDR |
| 011E | [GPUREG_FRAMEBUFFER_DIM](#gpureg_framebuffer_dim "wikilink") |  | PICA_REG_RENDER_BUF_RESOLUTION0 |
| 011F | [GPUREG_011F](#gpureg_011f "wikilink") |  |  |
| 0120 | [GPUREG_GAS_LIGHT_XY](#gpureg_gas_light_xy "wikilink") | ? | PICA_REG_GAS_LIGHT_XY |
| 0121 | [GPUREG_GAS_LIGHT_Z](#gpureg_gas_light_z "wikilink") | ? | PICA_REG_GAS_LIGHT_Z |
| 0122 | [GPUREG_GAS_LIGHT_Z_COLOR](#gpureg_gas_light_z_color "wikilink") | ? | PICA_REG_GAS_LIGHT_Z_COLOR |
| 0123 | [GPUREG_GAS_LUT_INDEX](#gpureg_gas_lut_index "wikilink") | ? | PICA_REG_GAS_LUT_INDEX |
| 0124 | [GPUREG_GAS_LUT_DATA](#gpureg_gas_lut_data "wikilink") | ? | PICA_REG_GAS_LUT_DATA |
| 0125 | [GPUREG_0125](#gpureg_0125 "wikilink") |  |  |
| 0126 | [GPUREG_GAS_DELTAZ_DEPTH](#gpureg_gas_deltaz_depth "wikilink") | ? | PICA_REG_GAS_DELTAZ_DEPTH |
| 0127 | [GPUREG_0127](#gpureg_0127 "wikilink") |  |  |
| 0128 | [GPUREG_0128](#gpureg_0128 "wikilink") |  |  |
| 0129 | [GPUREG_0129](#gpureg_0129 "wikilink") |  |  |
| 012A | [GPUREG_012A](#gpureg_012a "wikilink") |  |  |
| 012B | [GPUREG_012B](#gpureg_012b "wikilink") |  |  |
| 012C | [GPUREG_012C](#gpureg_012c "wikilink") |  |  |
| 012D | [GPUREG_012D](#gpureg_012d "wikilink") |  |  |
| 012E | [GPUREG_012E](#gpureg_012e "wikilink") |  |  |
| 012F | [GPUREG_012F](#gpureg_012f "wikilink") |  |  |
| 0130 | [GPUREG_FRAGOP_SHADOW](#gpureg_fragop_shadow "wikilink") | ? | PICA_REG_FRAGOP_SHADOW |
| 0131 | [GPUREG_0131](#gpureg_0131 "wikilink") |  |  |
| 0132 | [GPUREG_0132](#gpureg_0132 "wikilink") |  |  |
| 0133 | [GPUREG_0133](#gpureg_0133 "wikilink") |  |  |
| 0134 | [GPUREG_0134](#gpureg_0134 "wikilink") |  |  |
| 0135 | [GPUREG_0135](#gpureg_0135 "wikilink") |  |  |
| 0136 | [GPUREG_0136](#gpureg_0136 "wikilink") |  |  |
| 0137 | [GPUREG_0137](#gpureg_0137 "wikilink") |  |  |
| 0138 | [GPUREG_0138](#gpureg_0138 "wikilink") |  |  |
| 0139 | [GPUREG_0139](#gpureg_0139 "wikilink") |  |  |
| 013A | [GPUREG_013A](#gpureg_013a "wikilink") |  |  |
| 013B | [GPUREG_013B](#gpureg_013b "wikilink") |  |  |
| 013C | [GPUREG_013C](#gpureg_013c "wikilink") |  |  |
| 013D | [GPUREG_013D](#gpureg_013d "wikilink") |  |  |
| 013E | [GPUREG_013E](#gpureg_013e "wikilink") |  |  |
| 013F | [GPUREG_013F](#gpureg_013f "wikilink") |  |  |

### Fragment lighting registers (0x140-0x1FF)

| Register ID | Register name | Notes | Official Name |
|----|----|----|----|
| 0140 | [GPUREG_LIGHT0_SPECULAR0](#gpureg_lighti_specular0 "wikilink") | ? | PICA_REG_FRAG_LIGHT0_SPECULAR0 / PICA_REG_FRAG_LIGHT_START |
| 0141 | [GPUREG_LIGHT0_SPECULAR1](#gpureg_lighti_specular1 "wikilink") | ? | PICA_REG_FRAG_LIGHT0_SPECULAR1 |
| 0142 | [GPUREG_LIGHT0_DIFFUSE](#gpureg_lighti_diffuse "wikilink") | ? | PICA_REG_FRAG_LIGHT0_DIFFUSE |
| 0143 | [GPUREG_LIGHT0_AMBIENT](#gpureg_lighti_ambient "wikilink") | ? | PICA_REG_FRAG_LIGHT0_AMBIENT |
| 0144 | [GPUREG_LIGHT0_XY](#gpureg_lighti_xy "wikilink") | ? | PICA_REG_FRAG_LIGHT0_POSITION_XY |
| 0145 | [GPUREG_LIGHT0_Z](#gpureg_lighti_z "wikilink") | ? | PICA_REG_FRAG_LIGHT0_POSITION_Z |
| 0146 | [GPUREG_LIGHT0_SPOTDIR_XY](#gpureg_lighti_spotdir_xy "wikilink") | ? | PICA_REG_FRAG_LIGHT0_SPOT_XY |
| 0147 | [GPUREG_LIGHT0_SPOTDIR_Z](#gpureg_lighti_spotdir_z "wikilink") | ? | PICA_REG_FRAG_LIGHT0_SPOT_Z |
| 0148 | [GPUREG_0148](#gpureg_0148 "wikilink") |  |  |
| 0149 | [GPUREG_LIGHT0_CONFIG](#gpureg_lighti_config "wikilink") |  | PICA_REG_FRAG_LIGHT0_TYPE |
| 014A | [GPUREG_LIGHT0_ATTENUATION_BIAS](#gpureg_lighti_attenuation_bias "wikilink") | ? | PICA_REG_FRAG_LIGHT0_DIST_ATTN_BIAS |
| 014B | [GPUREG_LIGHT0_ATTENUATION_SCALE](#gpureg_lighti_attenuation_scale "wikilink") | ? | PICA_REG_FRAG_LIGHT0_DIST_ATTN_SCALE |
| 014C | [GPUREG_014C](#gpureg_014c "wikilink") |  |  |
| 014D | [GPUREG_014D](#gpureg_014d "wikilink") |  |  |
| 014E | [GPUREG_014E](#gpureg_014e "wikilink") |  |  |
| 014F | [GPUREG_014F](#gpureg_014f "wikilink") |  |  |
| 0150 | [GPUREG_LIGHT1_SPECULAR0](#gpureg_lighti_specular0 "wikilink") | ? | PICA_REG_FRAG_LIGHT1_SPECULAR0 |
| 0151 | [GPUREG_LIGHT1_SPECULAR1](#gpureg_lighti_specular1 "wikilink") | ? | PICA_REG_FRAG_LIGHT1_SPECULAR1 |
| 0152 | [GPUREG_LIGHT1_DIFFUSE](#gpureg_lighti_diffuse "wikilink") | ? | PICA_REG_FRAG_LIGHT1_DIFFUSE |
| 0153 | [GPUREG_LIGHT1_AMBIENT](#gpureg_lighti_ambient "wikilink") | ? | PICA_REG_FRAG_LIGHT1_AMBIENT |
| 0154 | [GPUREG_LIGHT1_XY](#gpureg_lighti_xy "wikilink") | ? | PICA_REG_FRAG_LIGHT1_POSITION_XY |
| 0155 | [GPUREG_LIGHT1_Z](#gpureg_lighti_z "wikilink") | ? | PICA_REG_FRAG_LIGHT1_POSITION_Z |
| 0156 | [GPUREG_LIGHT1_SPOTDIR_XY](#gpureg_lighti_spotdir_xy "wikilink") | ? | PICA_REG_FRAG_LIGHT1_SPOT_XY |
| 0157 | [GPUREG_LIGHT1_SPOTDIR_Z](#gpureg_lighti_spotdir_z "wikilink") | ? | PICA_REG_FRAG_LIGHT1_SPOT_Z |
| 0158 | [GPUREG_0158](#gpureg_0158 "wikilink") |  |  |
| 0159 | [GPUREG_LIGHT1_CONFIG](#gpureg_lighti_config "wikilink") | ? | PICA_REG_FRAG_LIGHT1_TYPE |
| 015A | [GPUREG_LIGHT1_ATTENUATION_BIAS](#gpureg_lighti_attenuation_bias "wikilink") | ? | PICA_REG_FRAG_LIGHT1_DIST_ATTN_BIAS |
| 015B | [GPUREG_LIGHT1_ATTENUATION_SCALE](#gpureg_lighti_attenuation_scale "wikilink") | ? | PICA_REG_FRAG_LIGHT1_DIST_ATTN_SCALE |
| 015C | [GPUREG_015C](#gpureg_015c "wikilink") |  |  |
| 015D | [GPUREG_015D](#gpureg_015d "wikilink") |  |  |
| 015E | [GPUREG_015E](#gpureg_015e "wikilink") |  |  |
| 015F | [GPUREG_015F](#gpureg_015f "wikilink") |  |  |
| 0160 | [GPUREG_LIGHT2_SPECULAR0](#gpureg_lighti_specular0 "wikilink") | ? | PICA_REG_FRAG_LIGHT2_SPECULAR0 |
| 0161 | [GPUREG_LIGHT2_SPECULAR1](#gpureg_lighti_specular1 "wikilink") | ? | PICA_REG_FRAG_LIGHT2_SPECULAR1 |
| 0162 | [GPUREG_LIGHT2_DIFFUSE](#gpureg_lighti_diffuse "wikilink") | ? | PICA_REG_FRAG_LIGHT2_DIFFUSE |
| 0163 | [GPUREG_LIGHT2_AMBIENT](#gpureg_lighti_ambient "wikilink") | ? | PICA_REG_FRAG_LIGHT2_AMBIENT |
| 0164 | [GPUREG_LIGHT2_XY](#gpureg_lighti_xy "wikilink") | ? | PICA_REG_FRAG_LIGHT2_POSITION_XY |
| 0165 | [GPUREG_LIGHT2_Z](#gpureg_lighti_z "wikilink") | ? | PICA_REG_FRAG_LIGHT2_POSITION_Z |
| 0166 | [GPUREG_LIGHT2_SPOTDIR_XY](#gpureg_lighti_spotdir_xy "wikilink") | ? | PICA_REG_FRAG_LIGHT2_SPOT_XY |
| 0167 | [GPUREG_LIGHT2_SPOTDIR_Z](#gpureg_lighti_spotdir_z "wikilink") | ? | PICA_REG_FRAG_LIGHT2_SPOT_Z |
| 0168 | [GPUREG_0168](#gpureg_0168 "wikilink") |  |  |
| 0169 | [GPUREG_LIGHT2_CONFIG](#gpureg_lighti_config "wikilink") | ? | PICA_REG_FRAG_LIGHT2_TYPE |
| 016A | [GPUREG_LIGHT2_ATTENUATION_BIAS](#gpureg_lighti_attenuation_bias "wikilink") | ? | PICA_REG_FRAG_LIGHT2_DIST_ATTN_BIAS |
| 016B | [GPUREG_LIGHT2_ATTENUATION_SCALE](#gpureg_lighti_attenuation_scale "wikilink") | ? | PICA_REG_FRAG_LIGHT2_DIST_ATTN_SCALE |
| 016C | [GPUREG_016C](#gpureg_016c "wikilink") |  |  |
| 016D | [GPUREG_016D](#gpureg_016d "wikilink") |  |  |
| 016E | [GPUREG_016E](#gpureg_016e "wikilink") |  |  |
| 016F | [GPUREG_016F](#gpureg_016f "wikilink") |  |  |
| 0170 | [GPUREG_LIGHT3_SPECULAR0](#gpureg_lighti_specular0 "wikilink") | ? | PICA_REG_FRAG_LIGHT3_SPECULAR0 |
| 0171 | [GPUREG_LIGHT3_SPECULAR1](#gpureg_lighti_specular1 "wikilink") | ? | PICA_REG_FRAG_LIGHT3_SPECULAR1 |
| 0172 | [GPUREG_LIGHT3_DIFFUSE](#gpureg_lighti_diffuse "wikilink") | ? | PICA_REG_FRAG_LIGHT3_DIFFUSE |
| 0173 | [GPUREG_LIGHT3_AMBIENT](#gpureg_lighti_ambient "wikilink") | ? | PICA_REG_FRAG_LIGHT3_AMBIENT |
| 0174 | [GPUREG_LIGHT3_XY](#gpureg_lighti_xy "wikilink") | ? | PICA_REG_FRAG_LIGHT3_POSITION_XY |
| 0175 | [GPUREG_LIGHT3_Z](#gpureg_lighti_z "wikilink") | ? | PICA_REG_FRAG_LIGHT3_POSITION_Z |
| 0176 | [GPUREG_LIGHT3_SPOTDIR_XY](#gpureg_lighti_spotdir_xy "wikilink") | ? | PICA_REG_FRAG_LIGHT3_SPOT_XY |
| 0177 | [GPUREG_LIGHT3_SPOTDIR_Z](#gpureg_lighti_spotdir_z "wikilink") | ? | PICA_REG_FRAG_LIGHT3_SPOT_Z |
| 0178 | [GPUREG_0178](#gpureg_0178 "wikilink") |  |  |
| 0179 | [GPUREG_LIGHT3_CONFIG](#gpureg_lighti_config "wikilink") | ? | PICA_REG_FRAG_LIGHT3_TYPE |
| 017A | [GPUREG_LIGHT3_ATTENUATION_BIAS](#gpureg_lighti_attenuation_bias "wikilink") | ? | PICA_REG_FRAG_LIGHT3_DIST_ATTN_BIAS |
| 017B | [GPUREG_LIGHT3_ATTENUATION_SCALE](#gpureg_lighti_attenuation_scale "wikilink") | ? | PICA_REG_FRAG_LIGHT3_DIST_ATTN_SCALE |
| 017C | [GPUREG_017C](#gpureg_017c "wikilink") |  |  |
| 017D | [GPUREG_017D](#gpureg_017d "wikilink") |  |  |
| 017E | [GPUREG_017E](#gpureg_017e "wikilink") |  |  |
| 017F | [GPUREG_017F](#gpureg_017f "wikilink") |  |  |
| 0180 | [GPUREG_LIGHT4_SPECULAR0](#gpureg_lighti_specular0 "wikilink") | ? | PICA_REG_FRAG_LIGHT4_SPECULAR0 |
| 0181 | [GPUREG_LIGHT4_SPECULAR1](#gpureg_lighti_specular1 "wikilink") | ? | PICA_REG_FRAG_LIGHT4_SPECULAR1 |
| 0182 | [GPUREG_LIGHT4_DIFFUSE](#gpureg_lighti_diffuse "wikilink") | ? | PICA_REG_FRAG_LIGHT4_DIFFUSE |
| 0183 | [GPUREG_LIGHT4_AMBIENT](#gpureg_lighti_ambient "wikilink") | ? | PICA_REG_FRAG_LIGHT4_AMBIENT |
| 0184 | [GPUREG_LIGHT4_XY](#gpureg_lighti_xy "wikilink") | ? | PICA_REG_FRAG_LIGHT4_POSITION_XY |
| 0185 | [GPUREG_LIGHT4_Z](#gpureg_lighti_z "wikilink") | ? | PICA_REG_FRAG_LIGHT4_POSITION_Z |
| 0186 | [GPUREG_LIGHT4_SPOTDIR_XY](#gpureg_lighti_spotdir_xy "wikilink") | ? | PICA_REG_FRAG_LIGHT4_SPOT_XY |
| 0187 | [GPUREG_LIGHT4_SPOTDIR_Z](#gpureg_lighti_spotdir_z "wikilink") | ? | PICA_REG_FRAG_LIGHT4_SPOT_Z |
| 0188 | [GPUREG_0188](#gpureg_0188 "wikilink") |  |  |
| 0189 | [GPUREG_LIGHT4_CONFIG](#gpureg_lighti_config "wikilink") | ? | PICA_REG_FRAG_LIGHT4_TYPE |
| 018A | [GPUREG_LIGHT4_ATTENUATION_BIAS](#gpureg_lighti_attenuation_bias "wikilink") | ? | PICA_REG_FRAG_LIGHT4_DIST_ATTN_BIAS |
| 018B | [GPUREG_LIGHT4_ATTENUATION_SCALE](#gpureg_lighti_attenuation_scale "wikilink") | ? | PICA_REG_FRAG_LIGHT4_DIST_ATTN_SCALE |
| 018C | [GPUREG_018C](#gpureg_018c "wikilink") |  |  |
| 018D | [GPUREG_018D](#gpureg_018d "wikilink") |  |  |
| 018E | [GPUREG_018E](#gpureg_018e "wikilink") |  |  |
| 018F | [GPUREG_018F](#gpureg_018f "wikilink") |  |  |
| 0190 | [GPUREG_LIGHT5_SPECULAR0](#gpureg_lighti_specular0 "wikilink") | ? | PICA_REG_FRAG_LIGHT5_SPECULAR0 |
| 0191 | [GPUREG_LIGHT5_SPECULAR1](#gpureg_lighti_specular1 "wikilink") | ? | PICA_REG_FRAG_LIGHT5_SPECULAR1 |
| 0192 | [GPUREG_LIGHT5_DIFFUSE](#gpureg_lighti_diffuse "wikilink") | ? | PICA_REG_FRAG_LIGHT5_DIFFUSE |
| 0193 | [GPUREG_LIGHT5_AMBIENT](#gpureg_lighti_ambient "wikilink") | ? | PICA_REG_FRAG_LIGHT5_AMBIENT |
| 0194 | [GPUREG_LIGHT5_XY](#gpureg_lighti_xy "wikilink") | ? | PICA_REG_FRAG_LIGHT5_POSITION_XY |
| 0195 | [GPUREG_LIGHT5_Z](#gpureg_lighti_z "wikilink") | ? | PICA_REG_FRAG_LIGHT5_POSITION_Z |
| 0196 | [GPUREG_LIGHT5_SPOTDIR_XY](#gpureg_lighti_spotdir_xy "wikilink") | ? | PICA_REG_FRAG_LIGHT5_SPOT_XY |
| 0197 | [GPUREG_LIGHT5_SPOTDIR_Z](#gpureg_lighti_spotdir_z "wikilink") | ? | PICA_REG_FRAG_LIGHT5_SPOT_Z |
| 0198 | [GPUREG_0198](#gpureg_0198 "wikilink") |  |  |
| 0199 | [GPUREG_LIGHT5_CONFIG](#gpureg_lighti_config "wikilink") | ? | PICA_REG_FRAG_LIGHT5_TYPE |
| 019A | [GPUREG_LIGHT5_ATTENUATION_BIAS](#gpureg_lighti_attenuation_bias "wikilink") |  | PICA_REG_FRAG_LIGHT5_DIST_ATTN_BIAS |
| 019B | [GPUREG_LIGHT5_ATTENUATION_SCALE](#gpureg_lighti_attenuation_scale "wikilink") |  | PICA_REG_FRAG_LIGHT5_DIST_ATTN_SCALE |
| 019C | [GPUREG_019C](#gpureg_019c "wikilink") |  |  |
| 019D | [GPUREG_019D](#gpureg_019d "wikilink") |  |  |
| 019E | [GPUREG_019E](#gpureg_019e "wikilink") |  |  |
| 019F | [GPUREG_019F](#gpureg_019f "wikilink") |  |  |
| 01A0 | [GPUREG_LIGHT6_SPECULAR0](#gpureg_lighti_specular0 "wikilink") | ? | PICA_REG_FRAG_LIGHT6_SPECULAR0 |
| 01A1 | [GPUREG_LIGHT6_SPECULAR1](#gpureg_lighti_specular1 "wikilink") | ? | PICA_REG_FRAG_LIGHT6_SPECULAR1 |
| 01A2 | [GPUREG_LIGHT6_DIFFUSE](#gpureg_lighti_diffuse "wikilink") |  | PICA_REG_FRAG_LIGHT6_DIFFUSE |
| 01A3 | [GPUREG_LIGHT6_AMBIENT](#gpureg_lighti_ambient "wikilink") |  | PICA_REG_FRAG_LIGHT6_AMBIENT |
| 01A4 | [GPUREG_LIGHT6_XY](#gpureg_lighti_xy "wikilink") |  | PICA_REG_FRAG_LIGHT6_POSITION_XY |
| 01A5 | [GPUREG_LIGHT6_Z](#gpureg_lighti_z "wikilink") |  | PICA_REG_FRAG_LIGHT6_POSITION_Z |
| 01A6 | [GPUREG_LIGHT6_SPOTDIR_XY](#gpureg_lighti_spotdir_xy "wikilink") | ? | PICA_REG_FRAG_LIGHT6_SPOT_XY |
| 01A7 | [GPUREG_LIGHT6_SPOTDIR_Z](#gpureg_lighti_spotdir_z "wikilink") | ? | PICA_REG_FRAG_LIGHT6_SPOT_Z |
| 01A8 | [GPUREG_01A8](#gpureg_01a8 "wikilink") |  |  |
| 01A9 | [GPUREG_LIGHT6_CONFIG](#gpureg_lighti_config "wikilink") | ? | PICA_REG_FRAG_LIGHT6_TYPE |
| 01AA | [GPUREG_LIGHT6_ATTENUATION_BIAS](#gpureg_lighti_attenuation_bias "wikilink") |  | PICA_REG_FRAG_LIGHT6_DIST_ATTN_BIAS |
| 01AB | [GPUREG_LIGHT6_ATTENUATION_SCALE](#gpureg_lighti_attenuation_scale "wikilink") |  | PICA_REG_FRAG_LIGHT6_DIST_ATTN_SCALE |
| 01AC | [GPUREG_01AC](#gpureg_01ac "wikilink") |  |  |
| 01AD | [GPUREG_01AD](#gpureg_01ad "wikilink") |  |  |
| 01AE | [GPUREG_01AE](#gpureg_01ae "wikilink") |  |  |
| 01AF | [GPUREG_01AF](#gpureg_01af "wikilink") |  |  |
| 01B0 | [GPUREG_LIGHT7_SPECULAR0](#gpureg_lighti_specular0 "wikilink") | ? | PICA_REG_FRAG_LIGHT7_SPECULAR0 |
| 01B1 | [GPUREG_LIGHT7_SPECULAR1](#gpureg_lighti_specular1 "wikilink") | ? | PICA_REG_FRAG_LIGHT7_SPECULAR1 |
| 01B2 | [GPUREG_LIGHT7_DIFFUSE](#gpureg_lighti_diffuse "wikilink") | ? | PICA_REG_FRAG_LIGHT7_DIFFUSE |
| 01B3 | [GPUREG_LIGHT7_AMBIENT](#gpureg_lighti_ambient "wikilink") | ? | PICA_REG_FRAG_LIGHT7_AMBIENT |
| 01B4 | [GPUREG_LIGHT7_XY](#gpureg_lighti_xy "wikilink") | ? | PICA_REG_FRAG_LIGHT7_POSITION_XY |
| 01B5 | [GPUREG_LIGHT7_Z](#gpureg_lighti_z "wikilink") | ? | PICA_REG_FRAG_LIGHT7_POSITION_Z |
| 01B6 | [GPUREG_LIGHT7_SPOTDIR_XY](#gpureg_lighti_spotdir_xy "wikilink") | ? | PICA_REG_FRAG_LIGHT7_SPOT_XY |
| 01B7 | [GPUREG_LIGHT7_SPOTDIR_Z](#gpureg_lighti_spotdir_z "wikilink") | ? | PICA_REG_FRAG_LIGHT7_SPOT_Z |
| 01B8 | [GPUREG_01B8](#gpureg_01b8 "wikilink") |  |  |
| 01B9 | [GPUREG_LIGHT7_CONFIG](#gpureg_lighti_config "wikilink") | ? | PICA_REG_FRAG_LIGHT7_TYPE |
| 01BA | [GPUREG_LIGHT7_ATTENUATION_BIAS](#gpureg_lighti_attenuation_bias "wikilink") |  | PICA_REG_FRAG_LIGHT7_DIST_ATTN_BIAS |
| 01BB | [GPUREG_LIGHT7_ATTENUATION_SCALE](#gpureg_lighti_attenuation_scale "wikilink") |  | PICA_REG_FRAG_LIGHT7_DIST_ATTN_SCALE |
| 01BC | [GPUREG_01BC](#gpureg_01bc "wikilink") |  |  |
| 01BD | [GPUREG_01BD](#gpureg_01bd "wikilink") |  |  |
| 01BE | [GPUREG_01BE](#gpureg_01be "wikilink") |  |  |
| 01BF | [GPUREG_01BF](#gpureg_01bf "wikilink") |  |  |
| 01C0 | [GPUREG_LIGHTING_AMBIENT](#gpureg_lighting_ambient "wikilink") | ? | PICA_REG_FRAG_LIGHT_AMBIENT |
| 01C1 | [GPUREG_01C1](#gpureg_01c1 "wikilink") |  |  |
| 01C2 | [GPUREG_LIGHTING_NUM_LIGHTS](#gpureg_lighting_num_lights "wikilink") | ? | PICA_REG_FRAG_LIGHT_SRC_NUM |
| 01C3 | [GPUREG_LIGHTING_CONFIG0](#gpureg_lighting_config0 "wikilink") | ? | PICA_REG_FRAG_LIGHT_FUNC_MODE0 |
| 01C4 | [GPUREG_LIGHTING_CONFIG1](#gpureg_lighting_config1 "wikilink") | ? | PICA_REG_FRAG_LIGHT_FUNC_MODE1 |
| 01C5 | [GPUREG_LIGHTING_LUT_INDEX](#gpureg_lighting_lut_index "wikilink") | ? | PICA_REG_FRAG_LIGHT_LUT |
| 01C6 | [GPUREG_LIGHTING_ENABLE1](#gpureg_lighting_enable1 "wikilink") | ? | PICA_REG_FRAG_LIGHT_EN1 |
| 01C7 | [GPUREG_01C7](#gpureg_01c7 "wikilink") |  |  |
| 01C8 | [GPUREG_LIGHTING_LUT_DATA0](#gpureg_lighting_lut_datai "wikilink") | ? | PICA_REG_FRAG_LIGHT_LUT_DATA0 |
| 01C9 | [GPUREG_LIGHTING_LUT_DATA1](#gpureg_lighting_lut_datai "wikilink") | ? | PICA_REG_FRAG_LIGHT_LUT_DATA1 |
| 01CA | [GPUREG_LIGHTING_LUT_DATA2](#gpureg_lighting_lut_datai "wikilink") | ? | PICA_REG_FRAG_LIGHT_LUT_DATA2 |
| 01CB | [GPUREG_LIGHTING_LUT_DATA3](#gpureg_lighting_lut_datai "wikilink") | ? | PICA_REG_FRAG_LIGHT_LUT_DATA3 |
| 01CC | [GPUREG_LIGHTING_LUT_DATA4](#gpureg_lighting_lut_datai "wikilink") | ? | PICA_REG_FRAG_LIGHT_LUT_DATA4 |
| 01CD | [GPUREG_LIGHTING_LUT_DATA5](#gpureg_lighting_lut_datai "wikilink") | ? | PICA_REG_FRAG_LIGHT_LUT_DATA5 |
| 01CE | [GPUREG_LIGHTING_LUT_DATA6](#gpureg_lighting_lut_datai "wikilink") | ? | PICA_REG_FRAG_LIGHT_LUT_DATA6 |
| 01CF | [GPUREG_LIGHTING_LUT_DATA7](#gpureg_lighting_lut_datai "wikilink") | ? | PICA_REG_FRAG_LIGHT_LUT_DATA7 |
| 01D0 | [GPUREG_LIGHTING_LUTINPUT_ABS](#gpureg_lighting_lutinput_abs "wikilink") | ? | PICA_REG_FRAG_LIGHT_ABSLUTINPUT |
| 01D1 | [GPUREG_LIGHTING_LUTINPUT_SELECT](#gpureg_lighting_lutinput_select "wikilink") | ? | PICA_REG_FRAG_LIGHT_LUTINPUT |
| 01D2 | [GPUREG_LIGHTING_LUTINPUT_SCALE](#gpureg_lighting_lutinput_scale "wikilink") | ? | PICA_REG_FRAG_LIGHT_LUTSCALE |
| 01D3 | [GPUREG_01D3](#gpureg_01d3 "wikilink") |  |  |
| 01D4 | [GPUREG_01D4](#gpureg_01d4 "wikilink") |  |  |
| 01D5 | [GPUREG_01D5](#gpureg_01d5 "wikilink") |  |  |
| 01D6 | [GPUREG_01D6](#gpureg_01d6 "wikilink") |  |  |
| 01D7 | [GPUREG_01D7](#gpureg_01d7 "wikilink") |  |  |
| 01D8 | [GPUREG_01D8](#gpureg_01d8 "wikilink") |  |  |
| 01D9 | [GPUREG_LIGHTING_LIGHT_PERMUTATION](#gpureg_lighting_light_permutation "wikilink") | ? | PICA_REG_FRAG_LIGHT_SRC_EN_ID |
| 01DA | [GPUREG_01DA](#gpureg_01da "wikilink") |  |  |
| 01DB | [GPUREG_01DB](#gpureg_01db "wikilink") |  |  |
| 01DC | [GPUREG_01DC](#gpureg_01dc "wikilink") |  |  |
| 01DD | [GPUREG_01DD](#gpureg_01dd "wikilink") |  |  |
| 01DE | [GPUREG_01DE](#gpureg_01de "wikilink") |  |  |
| 01DF | [GPUREG_01DF](#gpureg_01df "wikilink") |  |  |
| 01E0 | [GPUREG_01E0](#gpureg_01e0 "wikilink") |  |  |
| 01E1 | [GPUREG_01E1](#gpureg_01e1 "wikilink") |  |  |
| 01E2 | [GPUREG_01E2](#gpureg_01e2 "wikilink") |  |  |
| 01E3 | [GPUREG_01E3](#gpureg_01e3 "wikilink") |  |  |
| 01E4 | [GPUREG_01E4](#gpureg_01e4 "wikilink") |  |  |
| 01E5 | [GPUREG_01E5](#gpureg_01e5 "wikilink") |  |  |
| 01E6 | [GPUREG_01E6](#gpureg_01e6 "wikilink") |  |  |
| 01E7 | [GPUREG_01E7](#gpureg_01e7 "wikilink") |  |  |
| 01E8 | [GPUREG_01E8](#gpureg_01e8 "wikilink") |  |  |
| 01E9 | [GPUREG_01E9](#gpureg_01e9 "wikilink") |  |  |
| 01EA | [GPUREG_01EA](#gpureg_01ea "wikilink") |  |  |
| 01EB | [GPUREG_01EB](#gpureg_01eb "wikilink") |  |  |
| 01EC | [GPUREG_01EC](#gpureg_01ec "wikilink") |  |  |
| 01ED | [GPUREG_01ED](#gpureg_01ed "wikilink") |  |  |
| 01EE | [GPUREG_01EE](#gpureg_01ee "wikilink") |  |  |
| 01EF | [GPUREG_01EF](#gpureg_01ef "wikilink") |  |  |
| 01F0 | [GPUREG_01F0](#gpureg_01f0 "wikilink") |  |  |
| 01F1 | [GPUREG_01F1](#gpureg_01f1 "wikilink") |  |  |
| 01F2 | [GPUREG_01F2](#gpureg_01f2 "wikilink") |  |  |
| 01F3 | [GPUREG_01F3](#gpureg_01f3 "wikilink") |  |  |
| 01F4 | [GPUREG_01F4](#gpureg_01f4 "wikilink") |  |  |
| 01F5 | [GPUREG_01F5](#gpureg_01f5 "wikilink") |  |  |
| 01F6 | [GPUREG_01F6](#gpureg_01f6 "wikilink") |  |  |
| 01F7 | [GPUREG_01F7](#gpureg_01f7 "wikilink") |  |  |
| 01F8 | [GPUREG_01F8](#gpureg_01f8 "wikilink") |  |  |
| 01F9 | [GPUREG_01F9](#gpureg_01f9 "wikilink") |  |  |
| 01FA | [GPUREG_01FA](#gpureg_01fa "wikilink") |  |  |
| 01FB | [GPUREG_01FB](#gpureg_01fb "wikilink") |  |  |
| 01FC | [GPUREG_01FC](#gpureg_01fc "wikilink") |  |  |
| 01FD | [GPUREG_01FD](#gpureg_01fd "wikilink") |  |  |
| 01FE | [GPUREG_01FE](#gpureg_01fe "wikilink") |  |  |
| 01FF | [GPUREG_01FF](#gpureg_01ff "wikilink") |  |  |

### Geometry pipeline registers (0x200-0x27F)

| Register ID | Register name | Notes | Official Name |
|----|----|----|----|
| 0200 | [GPUREG_ATTRIBBUFFERS_LOC](#gpureg_attribbuffers_loc "wikilink") |  | PICA_REG_VTX_ATTR_ARRAYS_BASE_ADDR |
| 0201 | [GPUREG_ATTRIBBUFFERS_FORMAT_LOW](#gpureg_attribbuffers_format_low "wikilink") |  | PICA_REG_VTX_ATTR_ARRAYS0 |
| 0202 | [GPUREG_ATTRIBBUFFERS_FORMAT_HIGH](#gpureg_attribbuffers_format_high "wikilink") |  | PICA_REG_VTX_ATTR_ARRAYS1 |
| 0203 | [GPUREG_ATTRIBBUFFER0_OFFSET](#gpureg_attribbufferi_offset "wikilink") |  | PICA_REG_LOAD_ARRAY0_ATTR_OFFSET |
| 0204 | [GPUREG_ATTRIBBUFFER0_CONFIG1](#gpureg_attribbufferi_config1 "wikilink") |  | PICA_REG_LOAD_ARRAY0_ELEMENT0 |
| 0205 | [GPUREG_ATTRIBBUFFER0_CONFIG2](#gpureg_attribbufferi_config2 "wikilink") |  | PICA_REG_LOAD_ARRAY0_ELEMENT1 |
| 0206 | [GPUREG_ATTRIBBUFFER1_OFFSET](#gpureg_attribbufferi_offset "wikilink") |  |  |
| 0207 | [GPUREG_ATTRIBBUFFER1_CONFIG1](#gpureg_attribbufferi_config1 "wikilink") |  |  |
| 0208 | [GPUREG_ATTRIBBUFFER1_CONFIG2](#gpureg_attribbufferi_config2 "wikilink") |  |  |
| 0209 | [GPUREG_ATTRIBBUFFER2_OFFSET](#gpureg_attribbufferi_offset "wikilink") |  |  |
| 020A | [GPUREG_ATTRIBBUFFER2_CONFIG1](#gpureg_attribbufferi_config1 "wikilink") |  |  |
| 020B | [GPUREG_ATTRIBBUFFER2_CONFIG2](#gpureg_attribbufferi_config2 "wikilink") |  |  |
| 020C | [GPUREG_ATTRIBBUFFER3_OFFSET](#gpureg_attribbufferi_offset "wikilink") |  |  |
| 020D | [GPUREG_ATTRIBBUFFER3_CONFIG1](#gpureg_attribbufferi_config1 "wikilink") |  |  |
| 020E | [GPUREG_ATTRIBBUFFER3_CONFIG2](#gpureg_attribbufferi_config2 "wikilink") |  |  |
| 020F | [GPUREG_ATTRIBBUFFER4_OFFSET](#gpureg_attribbufferi_offset "wikilink") |  |  |
| 0210 | [GPUREG_ATTRIBBUFFER4_CONFIG1](#gpureg_attribbufferi_config1 "wikilink") |  |  |
| 0211 | [GPUREG_ATTRIBBUFFER4_CONFIG2](#gpureg_attribbufferi_config2 "wikilink") |  |  |
| 0212 | [GPUREG_ATTRIBBUFFER5_OFFSET](#gpureg_attribbufferi_offset "wikilink") |  |  |
| 0213 | [GPUREG_ATTRIBBUFFER5_CONFIG1](#gpureg_attribbufferi_config1 "wikilink") |  |  |
| 0214 | [GPUREG_ATTRIBBUFFER5_CONFIG2](#gpureg_attribbufferi_config2 "wikilink") |  |  |
| 0215 | [GPUREG_ATTRIBBUFFER6_OFFSET](#gpureg_attribbufferi_offset "wikilink") |  |  |
| 0216 | [GPUREG_ATTRIBBUFFER6_CONFIG1](#gpureg_attribbufferi_config1 "wikilink") |  |  |
| 0217 | [GPUREG_ATTRIBBUFFER6_CONFIG2](#gpureg_attribbufferi_config2 "wikilink") |  |  |
| 0218 | [GPUREG_ATTRIBBUFFER7_OFFSET](#gpureg_attribbufferi_offset "wikilink") |  |  |
| 0219 | [GPUREG_ATTRIBBUFFER7_CONFIG1](#gpureg_attribbufferi_config1 "wikilink") |  |  |
| 021A | [GPUREG_ATTRIBBUFFER7_CONFIG2](#gpureg_attribbufferi_config2 "wikilink") |  |  |
| 021B | [GPUREG_ATTRIBBUFFER8_OFFSET](#gpureg_attribbufferi_offset "wikilink") |  |  |
| 021C | [GPUREG_ATTRIBBUFFER8_CONFIG1](#gpureg_attribbufferi_config1 "wikilink") |  |  |
| 021D | [GPUREG_ATTRIBBUFFER8_CONFIG2](#gpureg_attribbufferi_config2 "wikilink") |  |  |
| 021E | [GPUREG_ATTRIBBUFFER9_OFFSET](#gpureg_attribbufferi_offset "wikilink") |  |  |
| 021F | [GPUREG_ATTRIBBUFFER9_CONFIG1](#gpureg_attribbufferi_config1 "wikilink") |  |  |
| 0220 | [GPUREG_ATTRIBBUFFER9_CONFIG2](#gpureg_attribbufferi_config2 "wikilink") |  |  |
| 0221 | [GPUREG_ATTRIBBUFFER10_OFFSET](#gpureg_attribbufferi_offset "wikilink") |  |  |
| 0222 | [GPUREG_ATTRIBBUFFER10_CONFIG1](#gpureg_attribbufferi_config1 "wikilink") |  |  |
| 0223 | [GPUREG_ATTRIBBUFFER10_CONFIG2](#gpureg_attribbufferi_config2 "wikilink") |  |  |
| 0224 | [GPUREG_ATTRIBBUFFER11_OFFSET](#gpureg_attribbufferi_offset "wikilink") |  |  |
| 0225 | [GPUREG_ATTRIBBUFFER11_CONFIG1](#gpureg_attribbufferi_config1 "wikilink") |  |  |
| 0226 | [GPUREG_ATTRIBBUFFER11_CONFIG2](#gpureg_attribbufferi_config2 "wikilink") |  |  |
| 0227 | [GPUREG_INDEXBUFFER_CONFIG](#gpureg_indexbuffer_config "wikilink") |  | PICA_REG_INDEX_ARRAY_ADDR_OFFSET |
| 0228 | [GPUREG_NUMVERTICES](#gpureg_numvertices "wikilink") |  | PICA_REG_DRAW_VERTEX_NUM |
| 0229 | [GPUREG_GEOSTAGE_CONFIG](#gpureg_geostage_config "wikilink") | ? | PICA_REG_DRAW_MODE0 |
| 022A | [GPUREG_VERTEX_OFFSET](#gpureg_vertex_offset "wikilink") |  | PICA_REG_DRAW_VERTEX_OFFSET |
| 022B | [GPUREG_022B](#gpureg_022b "wikilink") |  |  |
| 022C | [GPUREG_022C](#gpureg_022c "wikilink") |  |  |
| 022D | [GPUREG_POST_VERTEX_CACHE_NUM](#gpureg_post_vertex_cache_num "wikilink") |  | PICA_REG_POST_VERTEX_CACHE_NUM |
| 022E | [GPUREG_DRAWARRAYS](#gpureg_drawarrays "wikilink") |  | PICA_REG_START_DRAW_ARRAY |
| 022F | [GPUREG_DRAWELEMENTS](#gpureg_drawelements "wikilink") |  | PICA_REG_START_DRAW_ELEMENT |
| 0230 | [GPUREG_0230](#gpureg_0230 "wikilink") |  |  |
| 0231 | [GPUREG_VTX_FUNC](#gpureg_vtx_func "wikilink") | ? | PICA_REG_VTX_FUNC |
| 0232 | [GPUREG_FIXEDATTRIB_INDEX](#gpureg_fixedattrib_index "wikilink") | ? | PICA_REG_VS_FIXED_ATTR |
| 0233 | [GPUREG_FIXEDATTRIB_DATA0](#gpureg_fixedattrib_datai "wikilink") | ? | PICA_REG_VS_FIXED_ATTR_DATA0 |
| 0234 | [GPUREG_FIXEDATTRIB_DATA1](#gpureg_fixedattrib_datai "wikilink") | ? | PICA_REG_VS_FIXED_ATTR_DATA1 |
| 0235 | [GPUREG_FIXEDATTRIB_DATA2](#gpureg_fixedattrib_datai "wikilink") | ? | PICA_REG_VS_FIXED_ATTR_DATA2 |
| 0236 | [GPUREG_0236](#gpureg_0236 "wikilink") |  |  |
| 0237 | [GPUREG_0237](#gpureg_0237 "wikilink") |  |  |
| 0238 | [GPUREG_CMDBUF_SIZE0](#gpureg_cmdbuf_size0 "wikilink") |  | PICA_REG_COMMAND_BUF_SIZE_CH0 |
| 0239 | [GPUREG_CMDBUF_SIZE1](#gpureg_cmdbuf_size1 "wikilink") |  | PICA_REG_COMMAND_BUF_SIZE_CH1 |
| 023A | [GPUREG_CMDBUF_ADDR0](#gpureg_cmdbuf_addr0 "wikilink") |  | PICA_REG_COMMAND_BUF_ADDR_CH0 |
| 023B | [GPUREG_CMDBUF_ADDR1](#gpureg_cmdbuf_addr1 "wikilink") |  | PICA_REG_COMMAND_BUF_ADDR_CH1 |
| 023C | [GPUREG_CMDBUF_JUMP0](#gpureg_cmdbuf_jump0 "wikilink") |  | PICA_REG_COMMAND_BUF_KICK_CH0 |
| 023D | [GPUREG_CMDBUF_JUMP1](#gpureg_cmdbuf_jump1 "wikilink") |  | PICA_REG_COMMAND_BUF_KICK_CH1 |
| 023E | [GPUREG_023E](#gpureg_023e "wikilink") |  |  |
| 023F | [GPUREG_023F](#gpureg_023f "wikilink") |  |  |
| 0240 | [GPUREG_0240](#gpureg_0240 "wikilink") |  |  |
| 0241 | [GPUREG_0241](#gpureg_0241 "wikilink") |  |  |
| 0242 | [GPUREG_VSH_NUM_ATTR](#gpureg_vsh_num_attr "wikilink") | ? | PICA_REG_VS_ATTR_NUM1 |
| 0243 | [GPUREG_0243](#gpureg_0243 "wikilink") |  |  |
| 0244 | [GPUREG_VSH_COM_MODE](#gpureg_vsh_com_mode "wikilink") | ? | PICA_REG_VS_COM_MODE |
| 0245 | [GPUREG_START_DRAW_FUNC0](#gpureg_start_draw_func0 "wikilink") | ? | PICA_REG_START_DRAW_FUNC0 |
| 0246 | [GPUREG_0246](#gpureg_0246 "wikilink") |  |  |
| 0247 | [GPUREG_0247](#gpureg_0247 "wikilink") |  |  |
| 0248 | [GPUREG_0248](#gpureg_0248 "wikilink") |  |  |
| 0249 | [GPUREG_0249](#gpureg_0249 "wikilink") |  |  |
| 024A | [GPUREG_VSH_OUTMAP_TOTAL1](#gpureg_vsh_outmap_total1 "wikilink") | ? | PICA_REG_VS_OUT_REG_NUM1 |
| 024B | [GPUREG_024B](#gpureg_024b "wikilink") |  |  |
| 024C | [GPUREG_024C](#gpureg_024c "wikilink") |  |  |
| 024D | [GPUREG_024D](#gpureg_024d "wikilink") |  |  |
| 024E | [GPUREG_024E](#gpureg_024e "wikilink") |  |  |
| 024F | [GPUREG_024F](#gpureg_024f "wikilink") |  |  |
| 0250 | [GPUREG_0250](#gpureg_0250 "wikilink") |  |  |
| 0251 | [GPUREG_VSH_OUTMAP_TOTAL2](#gpureg_vsh_outmap_total2 "wikilink") | ? | PICA_REG_VS_OUT_REG_NUM2 |
| 0252 | [GPUREG_GSH_MISC0](#gpureg_gsh_misc0 "wikilink") | ? | PICA_REG_GS_MISC_REG0 |
| 0253 | [GPUREG_GEOSTAGE_CONFIG2](#gpureg_geostage_config2 "wikilink") | ? | PICA_REG_DRAW_MODE1 |
| 0254 | [GPUREG_GSH_MISC1](#gpureg_gsh_misc1 "wikilink") | ? | PICA_REG_GS_MISC_REG1 |
| 0255 | [GPUREG_0255](#gpureg_0255 "wikilink") |  |  |
| 0256 | [GPUREG_0256](#gpureg_0256 "wikilink") |  |  |
| 0257 | [GPUREG_0257](#gpureg_0257 "wikilink") |  |  |
| 0258 | [GPUREG_0258](#gpureg_0258 "wikilink") |  |  |
| 0259 | [GPUREG_0259](#gpureg_0259 "wikilink") |  |  |
| 025A | [GPUREG_025A](#gpureg_025a "wikilink") |  |  |
| 025B | [GPUREG_025B](#gpureg_025b "wikilink") |  |  |
| 025C | [GPUREG_025C](#gpureg_025c "wikilink") |  |  |
| 025D | [GPUREG_025D](#gpureg_025d "wikilink") |  |  |
| 025E | [GPUREG_PRIMITIVE_CONFIG](#gpureg_primitive_config "wikilink") | ? | PICA_REG_GS_OUT_REG_NUM3 / PICA_REG_DRAW_MODE2 / PICA_REG_VS_OUT_REG_NUM3 |
| 025F | [GPUREG_RESTART_PRIMITIVE](#gpureg_restart_primitive "wikilink") | ? | PICA_REG_START_DRAW_FUNC1 |
| 0260 | [GPUREG_0260](#gpureg_0260 "wikilink") |  |  |
| 0261 | [GPUREG_0261](#gpureg_0261 "wikilink") |  |  |
| 0262 | [GPUREG_0262](#gpureg_0262 "wikilink") |  |  |
| 0263 | [GPUREG_0263](#gpureg_0263 "wikilink") |  |  |
| 0264 | [GPUREG_0264](#gpureg_0264 "wikilink") |  |  |
| 0265 | [GPUREG_0265](#gpureg_0265 "wikilink") |  |  |
| 0266 | [GPUREG_0266](#gpureg_0266 "wikilink") |  |  |
| 0267 | [GPUREG_0267](#gpureg_0267 "wikilink") |  |  |
| 0268 | [GPUREG_0268](#gpureg_0268 "wikilink") |  |  |
| 0269 | [GPUREG_0269](#gpureg_0269 "wikilink") |  |  |
| 026A | [GPUREG_026A](#gpureg_026a "wikilink") |  |  |
| 026B | [GPUREG_026B](#gpureg_026b "wikilink") |  |  |
| 026C | [GPUREG_026C](#gpureg_026c "wikilink") |  |  |
| 026D | [GPUREG_026D](#gpureg_026d "wikilink") |  |  |
| 026E | [GPUREG_026E](#gpureg_026e "wikilink") |  |  |
| 026F | [GPUREG_026F](#gpureg_026f "wikilink") |  |  |
| 0270 | [GPUREG_0270](#gpureg_0270 "wikilink") |  |  |
| 0271 | [GPUREG_0271](#gpureg_0271 "wikilink") |  |  |
| 0272 | [GPUREG_0272](#gpureg_0272 "wikilink") |  |  |
| 0273 | [GPUREG_0273](#gpureg_0273 "wikilink") |  |  |
| 0274 | [GPUREG_0274](#gpureg_0274 "wikilink") |  |  |
| 0275 | [GPUREG_0275](#gpureg_0275 "wikilink") |  |  |
| 0276 | [GPUREG_0276](#gpureg_0276 "wikilink") |  |  |
| 0277 | [GPUREG_0277](#gpureg_0277 "wikilink") |  |  |
| 0278 | [GPUREG_0278](#gpureg_0278 "wikilink") |  |  |
| 0279 | [GPUREG_0279](#gpureg_0279 "wikilink") |  |  |
| 027A | [GPUREG_027A](#gpureg_027a "wikilink") |  |  |
| 027B | [GPUREG_027B](#gpureg_027b "wikilink") |  |  |
| 027C | [GPUREG_027C](#gpureg_027c "wikilink") |  |  |
| 027D | [GPUREG_027D](#gpureg_027d "wikilink") |  |  |
| 027E | [GPUREG_027E](#gpureg_027e "wikilink") |  |  |
| 027F | [GPUREG_027F](#gpureg_027f "wikilink") |  |  |

### Shader registers (0x280-0x2DF)

| Register ID | Register name | Notes | Official Name |
|----|----|----|----|
| Geometry shader |  |  |  |
| 0280 | [GPUREG_GSH_BOOLUNIFORM](#gpureg_sh_booluniform "wikilink") |  | PICA_REG_GS_BOOL |
| 0281 | [GPUREG_GSH_INTUNIFORM_I0](#gpureg_sh_intuniform_ii "wikilink") |  | PICA_REG_GS_INT0 |
| 0282 | [GPUREG_GSH_INTUNIFORM_I1](#gpureg_sh_intuniform_ii "wikilink") |  | PICA_REG_GS_INT1 |
| 0283 | [GPUREG_GSH_INTUNIFORM_I2](#gpureg_sh_intuniform_ii "wikilink") |  | PICA_REG_GS_INT2 |
| 0284 | [GPUREG_GSH_INTUNIFORM_I3](#gpureg_sh_intuniform_ii "wikilink") |  | PICA_REG_GS_INT3 |
| 0285 | [GPUREG_0285](#gpureg_0285 "wikilink") |  |  |
| 0286 | [GPUREG_0286](#gpureg_0286 "wikilink") |  |  |
| 0287 | [GPUREG_0287](#gpureg_0287 "wikilink") |  |  |
| 0288 | [GPUREG_0288](#gpureg_0288 "wikilink") |  |  |
| 0289 | [GPUREG_GSH_INPUTBUFFER_CONFIG](#gpureg_sh_inputbuffer_config "wikilink") |  | PICA_REG_GS_ATTR_NUM |
| 028A | [GPUREG_GSH_ENTRYPOINT](#gpureg_sh_entrypoint "wikilink") |  | PICA_REG_GS_START_ADDR |
| 028B | [GPUREG_GSH_ATTRIBUTES_PERMUTATION_LOW](#gpureg_sh_attributes_permutation_low "wikilink") |  | PICA_REG_GS_ATTR_IN_REG_MAP0 |
| 028C | [GPUREG_GSH_ATTRIBUTES_PERMUTATION_HIGH](#gpureg_sh_attributes_permutation_high "wikilink") |  | PICA_REG_GS_ATTR_IN_REG_MAP1 |
| 028D | [GPUREG_GSH_OUTMAP_MASK](#gpureg_sh_outmap_mask "wikilink") |  | PICA_REG_GS_OUT_REG_MASK |
| 028E | [GPUREG_028E](#gpureg_028e "wikilink") |  |  |
| 028F | [GPUREG_GSH_CODETRANSFER_END](#gpureg_sh_codetransfer_end "wikilink") |  | PICA_REG_GS_PROG_RENEWAL_END |
| 0290 | [GPUREG_GSH_FLOATUNIFORM_INDEX](#gpureg_sh_floatuniform_index "wikilink") |  | PICA_REG_GS_FLOAT_ADDR |
| 0291 | [GPUREG_GSH_FLOATUNIFORM_DATA0](#gpureg_sh_floatuniform_datai "wikilink") |  | PICA_REG_GS_FLOAT_DATA0 |
| 0292 | [GPUREG_GSH_FLOATUNIFORM_DATA1](#gpureg_sh_floatuniform_datai "wikilink") |  | PICA_REG_GS_FLOAT_DATA1 |
| 0293 | [GPUREG_GSH_FLOATUNIFORM_DATA2](#gpureg_sh_floatuniform_datai "wikilink") |  | PICA_REG_GS_FLOAT_DATA2 |
| 0294 | [GPUREG_GSH_FLOATUNIFORM_DATA3](#gpureg_sh_floatuniform_datai "wikilink") |  | PICA_REG_GS_FLOAT_DATA3 |
| 0295 | [GPUREG_GSH_FLOATUNIFORM_DATA4](#gpureg_sh_floatuniform_datai "wikilink") |  | PICA_REG_GS_FLOAT_DATA4 |
| 0296 | [GPUREG_GSH_FLOATUNIFORM_DATA5](#gpureg_sh_floatuniform_datai "wikilink") |  | PICA_REG_GS_FLOAT_DATA5 |
| 0297 | [GPUREG_GSH_FLOATUNIFORM_DATA6](#gpureg_sh_floatuniform_datai "wikilink") |  | PICA_REG_GS_FLOAT_DATA6 |
| 0298 | [GPUREG_GSH_FLOATUNIFORM_DATA7](#gpureg_sh_floatuniform_datai "wikilink") |  | PICA_REG_GS_FLOAT_DATA7 |
| 0299 | [GPUREG_0299](#gpureg_0299 "wikilink") |  |  |
| 029A | [GPUREG_029A](#gpureg_029a "wikilink") |  |  |
| 029B | [GPUREG_GSH_CODETRANSFER_INDEX](#gpureg_sh_codetransfer_index "wikilink") | ? | PICA_REG_GS_PROG_ADDR |
| 029C | [GPUREG_GSH_CODETRANSFER_DATA0](#gpureg_sh_codetransfer_datai "wikilink") |  | PICA_REG_GS_PROG_DATA0 |
| 029D | [GPUREG_GSH_CODETRANSFER_DATA1](#gpureg_sh_codetransfer_datai "wikilink") |  | PICA_REG_GS_PROG_DATA1 |
| 029E | [GPUREG_GSH_CODETRANSFER_DATA2](#gpureg_sh_codetransfer_datai "wikilink") |  | PICA_REG_GS_PROG_DATA2 |
| 029F | [GPUREG_GSH_CODETRANSFER_DATA3](#gpureg_sh_codetransfer_datai "wikilink") |  | PICA_REG_GS_PROG_DATA3 |
| 02A0 | [GPUREG_GSH_CODETRANSFER_DATA4](#gpureg_sh_codetransfer_datai "wikilink") |  | PICA_REG_GS_PROG_DATA4 |
| 02A1 | [GPUREG_GSH_CODETRANSFER_DATA5](#gpureg_sh_codetransfer_datai "wikilink") |  | PICA_REG_GS_PROG_DATA5 |
| 02A2 | [GPUREG_GSH_CODETRANSFER_DATA6](#gpureg_sh_codetransfer_datai "wikilink") |  | PICA_REG_GS_PROG_DATA6 |
| 02A3 | [GPUREG_GSH_CODETRANSFER_DATA7](#gpureg_sh_codetransfer_datai "wikilink") |  | PICA_REG_GS_PROG_DATA7 |
| 02A4 | [GPUREG_02A4](#gpureg_02a4 "wikilink") |  |  |
| 02A5 | [GPUREG_GSH_OPDESCS_INDEX](#gpureg_sh_opdescs_index "wikilink") |  | PICA_REG_GS_PROG_SWIZZLE_ADDR |
| 02A6 | [GPUREG_GSH_OPDESCS_DATA0](#gpureg_sh_opdescs_datai "wikilink") |  | PICA_REG_GS_PROG_SWIZZLE_DATA0 |
| 02A7 | [GPUREG_GSH_OPDESCS_DATA1](#gpureg_sh_opdescs_datai "wikilink") |  | PICA_REG_GS_PROG_SWIZZLE_DATA1 |
| 02A8 | [GPUREG_GSH_OPDESCS_DATA2](#gpureg_sh_opdescs_datai "wikilink") |  | PICA_REG_GS_PROG_SWIZZLE_DATA2 |
| 02A9 | [GPUREG_GSH_OPDESCS_DATA3](#gpureg_sh_opdescs_datai "wikilink") |  | PICA_REG_GS_PROG_SWIZZLE_DATA3 |
| 02AA | [GPUREG_GSH_OPDESCS_DATA4](#gpureg_sh_opdescs_datai "wikilink") |  | PICA_REG_GS_PROG_SWIZZLE_DATA4 |
| 02AB | [GPUREG_GSH_OPDESCS_DATA5](#gpureg_sh_opdescs_datai "wikilink") |  | PICA_REG_GS_PROG_SWIZZLE_DATA5 |
| 02AC | [GPUREG_GSH_OPDESCS_DATA6](#gpureg_sh_opdescs_datai "wikilink") |  | PICA_REG_GS_PROG_SWIZZLE_DATA6 |
| 02AD | [GPUREG_GSH_OPDESCS_DATA7](#gpureg_sh_opdescs_datai "wikilink") |  | PICA_REG_GS_PROG_SWIZZLE_DATA7 |
| 02AE | [GPUREG_02AE](#gpureg_02ae "wikilink") |  |  |
| 02AF | [GPUREG_02AF](#gpureg_02af "wikilink") |  |  |
| Vertex shader |  |  |  |
| 02B0 | [GPUREG_VSH_BOOLUNIFORM](#gpureg_sh_booluniform "wikilink") |  | PICA_REG_VS_BOOL |
| 02B1 | [GPUREG_VSH_INTUNIFORM_I0](#gpureg_sh_intuniform_ii "wikilink") |  | PICA_REG_VS_INT0 |
| 02B2 | [GPUREG_VSH_INTUNIFORM_I1](#gpureg_sh_intuniform_ii "wikilink") |  | PICA_REG_VS_INT1 |
| 02B3 | [GPUREG_VSH_INTUNIFORM_I2](#gpureg_sh_intuniform_ii "wikilink") |  | PICA_REG_VS_INT2 |
| 02B4 | [GPUREG_VSH_INTUNIFORM_I3](#gpureg_sh_intuniform_ii "wikilink") |  | PICA_REG_VS_INT3 |
| 02B5 | [GPUREG_02B5](#gpureg_02b5 "wikilink") |  |  |
| 02B6 | [GPUREG_02B6](#gpureg_02b6 "wikilink") |  |  |
| 02B7 | [GPUREG_02B7](#gpureg_02b7 "wikilink") |  |  |
| 02B8 | [GPUREG_02B8](#gpureg_02b8 "wikilink") |  |  |
| 02B9 | [GPUREG_VSH_INPUTBUFFER_CONFIG](#gpureg_sh_inputbuffer_config "wikilink") |  | PICA_REG_VS_ATTR_NUM0 |
| 02BA | [GPUREG_VSH_ENTRYPOINT](#gpureg_sh_entrypoint "wikilink") |  | PICA_REG_VS_START_ADDR |
| 02BB | [GPUREG_VSH_ATTRIBUTES_PERMUTATION_LOW](#gpureg_sh_attributes_permutation_low "wikilink") |  | PICA_REG_VS_ATTR_IN_REG_MAP0 |
| 02BC | [GPUREG_VSH_ATTRIBUTES_PERMUTATION_HIGH](#gpureg_sh_attributes_permutation_high "wikilink") |  | PICA_REG_VS_ATTR_IN_REG_MAP1 |
| 02BD | [GPUREG_VSH_OUTMAP_MASK](#gpureg_sh_outmap_mask "wikilink") |  | PICA_REG_VS_OUT_REG_MASK |
| 02BE | [GPUREG_02BE](#gpureg_02be "wikilink") |  |  |
| 02BF | [GPUREG_VSH_CODETRANSFER_END](#gpureg_sh_codetransfer_end "wikilink") |  | PICA_REG_VS_PROG_RENEWAL_END |
| 02C0 | [GPUREG_VSH_FLOATUNIFORM_INDEX](#gpureg_sh_floatuniform_index "wikilink") |  | PICA_REG_VS_FLOAT_ADDR |
| 02C1 | [GPUREG_VSH_FLOATUNIFORM_DATA0](#gpureg_sh_floatuniform_datai "wikilink") |  | PICA_REG_VS_FLOAT_DATA0 |
| 02C2 | [GPUREG_VSH_FLOATUNIFORM_DATA1](#gpureg_sh_floatuniform_datai "wikilink") |  | PICA_REG_VS_FLOAT_DATA1 |
| 02C3 | [GPUREG_VSH_FLOATUNIFORM_DATA2](#gpureg_sh_floatuniform_datai "wikilink") |  | PICA_REG_VS_FLOAT_DATA2 |
| 02C4 | [GPUREG_VSH_FLOATUNIFORM_DATA3](#gpureg_sh_floatuniform_datai "wikilink") |  | PICA_REG_VS_FLOAT_DATA3 |
| 02C5 | [GPUREG_VSH_FLOATUNIFORM_DATA4](#gpureg_sh_floatuniform_datai "wikilink") |  | PICA_REG_VS_FLOAT_DATA4 |
| 02C6 | [GPUREG_VSH_FLOATUNIFORM_DATA5](#gpureg_sh_floatuniform_datai "wikilink") |  | PICA_REG_VS_FLOAT_DATA5 |
| 02C7 | [GPUREG_VSH_FLOATUNIFORM_DATA6](#gpureg_sh_floatuniform_datai "wikilink") |  | PICA_REG_VS_FLOAT_DATA6 |
| 02C8 | [GPUREG_VSH_FLOATUNIFORM_DATA7](#gpureg_sh_floatuniform_datai "wikilink") |  | PICA_REG_VS_FLOAT_DATA7 |
| 02C9 | [GPUREG_02C9](#gpureg_02c9 "wikilink") |  |  |
| 02CA | [GPUREG_02CA](#gpureg_02ca "wikilink") |  |  |
| 02CB | [GPUREG_VSH_CODETRANSFER_INDEX](#gpureg_sh_codetransfer_index "wikilink") | ? | PICA_REG_VS_PROG_ADDR |
| 02CC | [GPUREG_VSH_CODETRANSFER_DATA0](#gpureg_sh_codetransfer_datai "wikilink") |  | PICA_REG_VS_PROG_DATA0 |
| 02CD | [GPUREG_VSH_CODETRANSFER_DATA1](#gpureg_sh_codetransfer_datai "wikilink") |  | PICA_REG_VS_PROG_DATA1 |
| 02CE | [GPUREG_VSH_CODETRANSFER_DATA2](#gpureg_sh_codetransfer_datai "wikilink") |  | PICA_REG_VS_PROG_DATA2 |
| 02CF | [GPUREG_VSH_CODETRANSFER_DATA3](#gpureg_sh_codetransfer_datai "wikilink") |  | PICA_REG_VS_PROG_DATA3 |
| 02D0 | [GPUREG_VSH_CODETRANSFER_DATA4](#gpureg_sh_codetransfer_datai "wikilink") |  | PICA_REG_VS_PROG_DATA4 |
| 02D1 | [GPUREG_VSH_CODETRANSFER_DATA5](#gpureg_sh_codetransfer_datai "wikilink") |  | PICA_REG_VS_PROG_DATA5 |
| 02D2 | [GPUREG_VSH_CODETRANSFER_DATA6](#gpureg_sh_codetransfer_datai "wikilink") |  | PICA_REG_VS_PROG_DATA6 |
| 02D3 | [GPUREG_VSH_CODETRANSFER_DATA7](#gpureg_sh_codetransfer_datai "wikilink") |  | PICA_REG_VS_PROG_DATA7 |
| 02D4 | [GPUREG_02D4](#gpureg_02d4 "wikilink") |  |  |
| 02D5 | [GPUREG_VSH_OPDESCS_INDEX](#gpureg_sh_opdescs_index "wikilink") | ? | PICA_REG_VS_PROG_SWIZZLE_ADDR |
| 02D6 | [GPUREG_VSH_OPDESCS_DATA0](#gpureg_sh_opdescs_datai "wikilink") |  | PICA_REG_VS_PROG_SWIZZLE_DATA0 |
| 02D7 | [GPUREG_VSH_OPDESCS_DATA1](#gpureg_sh_opdescs_datai "wikilink") |  | PICA_REG_VS_PROG_SWIZZLE_DATA1 |
| 02D8 | [GPUREG_VSH_OPDESCS_DATA2](#gpureg_sh_opdescs_datai "wikilink") |  | PICA_REG_VS_PROG_SWIZZLE_DATA2 |
| 02D9 | [GPUREG_VSH_OPDESCS_DATA3](#gpureg_sh_opdescs_datai "wikilink") |  | PICA_REG_VS_PROG_SWIZZLE_DATA3 |
| 02DA | [GPUREG_VSH_OPDESCS_DATA4](#gpureg_sh_opdescs_datai "wikilink") |  | PICA_REG_VS_PROG_SWIZZLE_DATA4 |
| 02DB | [GPUREG_VSH_OPDESCS_DATA5](#gpureg_sh_opdescs_datai "wikilink") |  | PICA_REG_VS_PROG_SWIZZLE_DATA5 |
| 02DC | [GPUREG_VSH_OPDESCS_DATA6](#gpureg_sh_opdescs_datai "wikilink") |  | PICA_REG_VS_PROG_SWIZZLE_DATA6 |
| 02DD | [GPUREG_VSH_OPDESCS_DATA7](#gpureg_sh_opdescs_datai "wikilink") |  | PICA_REG_VS_PROG_SWIZZLE_DATA7 |
| 02DE | [GPUREG_02DE](#gpureg_02de "wikilink") |  |  |
| 02DF | [GPUREG_02DF](#gpureg_02df "wikilink") |  |  |

### Unknown registers (0x2E0-0x2FF)

| Register ID | Register name                          | Notes | Official Name |
|-------------|----------------------------------------|-------|---------------|
| 02E0        | [GPUREG_02E0](#gpureg_02e0 "wikilink") |       |               |
| 02E1        | [GPUREG_02E1](#gpureg_02e1 "wikilink") |       |               |
| 02E2        | [GPUREG_02E2](#gpureg_02e2 "wikilink") |       |               |
| 02E3        | [GPUREG_02E3](#gpureg_02e3 "wikilink") |       |               |
| 02E4        | [GPUREG_02E4](#gpureg_02e4 "wikilink") |       |               |
| 02E5        | [GPUREG_02E5](#gpureg_02e5 "wikilink") |       |               |
| 02E6        | [GPUREG_02E6](#gpureg_02e6 "wikilink") |       |               |
| 02E7        | [GPUREG_02E7](#gpureg_02e7 "wikilink") |       |               |
| 02E8        | [GPUREG_02E8](#gpureg_02e8 "wikilink") |       |               |
| 02E9        | [GPUREG_02E9](#gpureg_02e9 "wikilink") |       |               |
| 02EA        | [GPUREG_02EA](#gpureg_02ea "wikilink") |       |               |
| 02EB        | [GPUREG_02EB](#gpureg_02eb "wikilink") |       |               |
| 02EC        | [GPUREG_02EC](#gpureg_02ec "wikilink") |       |               |
| 02ED        | [GPUREG_02ED](#gpureg_02ed "wikilink") |       |               |
| 02EE        | [GPUREG_02EE](#gpureg_02ee "wikilink") |       |               |
| 02EF        | [GPUREG_02EF](#gpureg_02ef "wikilink") |       |               |
| 02F0        | [GPUREG_02F0](#gpureg_02f0 "wikilink") |       |               |
| 02F1        | [GPUREG_02F1](#gpureg_02f1 "wikilink") |       |               |
| 02F2        | [GPUREG_02F2](#gpureg_02f2 "wikilink") |       |               |
| 02F3        | [GPUREG_02F3](#gpureg_02f3 "wikilink") |       |               |
| 02F4        | [GPUREG_02F4](#gpureg_02f4 "wikilink") |       |               |
| 02F5        | [GPUREG_02F5](#gpureg_02f5 "wikilink") |       |               |
| 02F6        | [GPUREG_02F6](#gpureg_02f6 "wikilink") |       |               |
| 02F7        | [GPUREG_02F7](#gpureg_02f7 "wikilink") |       |               |
| 02F8        | [GPUREG_02F8](#gpureg_02f8 "wikilink") |       |               |
| 02F9        | [GPUREG_02F9](#gpureg_02f9 "wikilink") |       |               |
| 02FA        | [GPUREG_02FA](#gpureg_02fa "wikilink") |       |               |
| 02FB        | [GPUREG_02FB](#gpureg_02fb "wikilink") |       |               |
| 02FC        | [GPUREG_02FC](#gpureg_02fc "wikilink") |       |               |
| 02FD        | [GPUREG_02FD](#gpureg_02fd "wikilink") |       |               |
| 02FE        | [GPUREG_02FE](#gpureg_02fe "wikilink") |       |               |
| 02FF        | [GPUREG_02FF](#gpureg_02ff "wikilink") |       |               |

## Miscellaneous registers

### GPUREG_FINALIZE

| Bits | Description                                                    |
|------|----------------------------------------------------------------|
| 0-31 | unsigned, Trigger P3D Interrupt (0 = idle, non-zero = trigger) |

Writing to this register seems to signal the GPU to stop processing GPU commands from the current buffer; any command following a write to this register will be ignored. The value written to this register does not appear to matter, although 0x12345678 is the value typically written by commercial software.
Failure to write to this register in any command buffer will result in the GPU hanging.

## Rasterizer registers

### GPUREG_FACECULLING_CONFIG

| Bits | Description            |
|------|------------------------|
| 0-1  | unsigned, Culling mode |

This register is used to configure the face culling mode.

Culling mode values:

| Value | Description                    |
|-------|--------------------------------|
| 0     | None                           |
| 1     | Front Face (Counter Clockwise) |
| 2     | Back Face (Counter Clockwise)  |

### GPUREG_VIEWPORT_WIDTH

| Bits | Description            |
|------|------------------------|
| 0-23 | float1.7.16, width / 2 |

This register is used to configure the viewport width, along with GPUREG_VIEWPORT_INVW.

### GPUREG_VIEWPORT_INVW

| Bits | Description            |
|------|------------------------|
| 1-31 | float1.7.23, 2 / width |

This register is used to configure the viewport width, along with GPUREG_VIEWPORT_WIDTH.

### GPUREG_VIEWPORT_HEIGHT

| Bits | Description             |
|------|-------------------------|
| 0-23 | float1.7.16, height / 2 |

This register is used to configure the viewport height, along with GPUREG_VIEWPORT_INVH.

### GPUREG_VIEWPORT_INVH

| Bits | Description             |
|------|-------------------------|
| 1-31 | float1.7.23, 2 / height |

This register is used to configure the viewport height, along with GPUREG_VIEWPORT_HEIGHT.

### GPUREG_FRAGOP_CLIP

| Bits | Description                                   |
|------|-----------------------------------------------|
| 0    | unsigned, Enabled (0 = disabled, 1 = enabled) |

This register is used to enable clipping planes.

### GPUREG_FRAGOP_CLIP_DATA*i*

| Bits | Description                                 |
|------|---------------------------------------------|
| 0-23 | float1.7.16, Clipping plane coefficient *i* |

This register is used to configure clipping plane coefficients.

### GPUREG_DEPTHMAP_SCALE

| Bits | Description             |
|------|-------------------------|
| 0-23 | float1.7.16, Near - Far |

This register is used to configure the depth range scale.

### GPUREG_DEPTHMAP_OFFSET

| Bits | Description                        |
|------|------------------------------------|
| 0-23 | float1.7.16, Near + Polygon Offset |

This register is used to configure the depth range bias.

### GPUREG_SH_OUTMAP_TOTAL

| Bits | Description                              |
|------|------------------------------------------|
| 0-2  | unsigned, Number of following attributes |

This register is used to configure the total shader output map attributes.

### GPUREG_SH_OUTMAP_O*i*

| Bits  | Description                                             |
|-------|---------------------------------------------------------|
| 0-4   | unsigned, Semantic for the x component of the register. |
| 8-12  | unsigned, Semantic for the y component of the register. |
| 16-20 | unsigned, Semantic for the z component of the register. |
| 24-28 | unsigned, Semantic for the w component of the register. |

These registers map components of the corresponding vertex shader output register to specific fixed-function semantics.

Semantics that have not been mapped to a component of an output register have a value of 1

Semantic values:

| Value | Semantic | Description |
|----|----|----|
| 0x00 | position.x | Vertex Position |
| 0x01 | position.y |  |
| 0x02 | position.z |  |
| 0x03 | position.w |  |
| 0x04 | normquat.x | Quaternion specifying the normal/tangent frame (for fragment lighting) |
| 0x05 | normquat.y |  |
| 0x06 | normquat.z |  |
| 0x07 | normquat.w |  |
| 0x08 | color.r | Vertex color |
| 0x09 | color.g |  |
| 0x0A | color.b |  |
| 0x0B | color.a |  |
| 0x0C | texcoord0.u | Texture coordinates for texture 0 |
| 0x0D | texcoord0.v |  |
| 0x0E | texcoord1.u | Texture coordinates for texture 1 |
| 0x0F | texcoord1.v |  |
| 0x10 | texcoord0.w |  |
| 0x12 | view.x | View vector (for fragment lighting) |
| 0x13 | view.y |  |
| 0x14 | view.z |  |
| 0x16 | texcoord2.u | Texture coordinates for texture 2 |
| 0x17 | texcoord2.v |  |
| 0x1F | Unused component | Should be set for unused components of the output register |

### GPUREG_EARLYDEPTH_FUNC

| Bits | Description                    |
|------|--------------------------------|
| 0-1  | unsigned, Early depth function |

This register configures the early depth test function.

Early depth function values:

| Value | Description |
|-------|-------------|
| 0     | \>=         |
| 1     | \>          |
| 2     | \<=         |
| 3     | \<          |

### GPUREG_EARLYDEPTH_TEST1

| Bits | Description                                   |
|------|-----------------------------------------------|
| 0    | unsigned, Enabled (0 = disabled, 1 = enabled) |

This register sets whether the early depth test is enabled.

### GPUREG_EARLYDEPTH_CLEAR

| Bits | Description                             |
|------|-----------------------------------------|
| 0    | unsigned, Trigger (0 = idle, 1 = clear) |

This register triggers clearing the early depth data.

### GPUREG_SH_OUTATTR_MODE

| Bits | Description                                                |
|------|------------------------------------------------------------|
| 0    | unsigned, Use texture coordinates (0 = don't use, 1 = use) |

This register is used to configure the shader output attribute mode.

### GPUREG_SCISSORTEST_MODE

| Bits | Description                                   |
|------|-----------------------------------------------|
| 0-1  | unsigned, Enabled (0 = disabled, 3 = enabled) |

This register is used to enable scissor testing.

### GPUREG_SCISSORTEST_POS

| Bits  | Description  |
|-------|--------------|
| 0-9   | unsigned, X1 |
| 16-25 | unsigned, Y1 |

This register is used to configure the scissor test start position.

### GPUREG_SCISSORTEST_DIM

| Bits  | Description  |
|-------|--------------|
| 0-9   | unsigned, X2 |
| 16-25 | unsigned, Y2 |

This register is used to configure the scissor test end position.

### GPUREG_VIEWPORT_XY

| Bits  | Description |
|-------|-------------|
| 0-9   | signed, X   |
| 16-25 | signed, Y   |

This register is used to configure the viewport position.

### GPUREG_EARLYDEPTH_DATA

| Bits | Description           |
|------|-----------------------|
| 0-23 | unsigned, Clear value |

This register is used to configure the early depth clear value.

### GPUREG_DEPTHMAP_ENABLE

| Bits | Description                                   |
|------|-----------------------------------------------|
| 0    | unsigned, Enabled (0 = disabled, 1 = enabled) |

This register is used to enable depth range.

### GPUREG_RENDERBUF_DIM

| Bits  | Description          |
|-------|----------------------|
| 0-10  | unsigned, Width      |
| 12-21 | unsigned, Height - 1 |
| 24    | 0x1                  |

This register is used to configure the output framebuffer dimensions.

### GPUREG_SH_OUTATTR_CLOCK

| Bits | Description |
|----|----|
| 0 | unsigned, 'position.z' present (0 = absent, 1 = present) |
| 1 | unsigned, 'color' component present (0 = absent, 1 = present) |
| 8 | unsigned, 'texcoord0' component present (0 = absent, 1 = present) |
| 9 | unsigned, 'texcoord1' component present (0 = absent, 1 = present) |
| 10 | unsigned, 'texcoord2' component present (0 = absent, 1 = present) |
| 16 | unsigned, 'texcoord0.w' present (0 = absent, 1 = present) |
| 24 | unsigned, 'normquat' or 'view' component present (0 = absent, 1 = present) |

This register controls the clock supply to parts relating to certain attributes.

## Texturing registers

### GPUREG_TEXUNIT_CONFIG

| Bits  | Description                                                |
|-------|------------------------------------------------------------|
| 0     | unsigned, Texture 0 enabled (0 = disabled, 1 = enabled)    |
| 1     | unsigned, Texture 1 enabled (0 = disabled, 1 = enabled)    |
| 2     | unsigned, Texture 2 enabled (0 = disabled, 1 = enabled)    |
| 3     | 0x0                                                        |
| 8-9   | unsigned, Texture 3 coordinates                            |
| 10    | unsigned, Texture 3 enabled (0 = disabled, 1 = enabled)    |
| 12    | 0x1                                                        |
| 13    | unsigned, Texture 2 coordinates                            |
| 16    | unsigned, Clear texture cache (0 = don't clear, 1 = clear) |
| 17-31 | 0x0                                                        |

This register is used to enable texture units.

Texture 3 coordinates values:

| Value | Description |
|-------|-------------|
| 0     | Texture 0   |
| 1     | Texture 1   |
| 2     | Texture 2   |

Texture 2 coordinates values:

| Value | Description |
|-------|-------------|
| 0     | Texture 2   |
| 1     | Texture 1   |

### GPUREG_TEXUNIT*i*\_BORDER_COLOR

| Bits  | Description     |
|-------|-----------------|
| 0-7   | unsigned, Red   |
| 8-15  | unsigned, Green |
| 16-23 | unsigned, Blue  |
| 24-31 | unsigned, Alpha |

This register is used to set a texture unit's border color.

### GPUREG_TEXUNIT*i*\_DIM

| Bits  | Description      |
|-------|------------------|
| 0-10  | unsigned, Height |
| 16-26 | unsigned, Width  |

This register is used to set a texture unit's dimensions.

### GPUREG_TEXUNIT*i*\_PARAM

| Bits  | Description                                                      |
|-------|------------------------------------------------------------------|
| 1     | unsigned, Magnification filter                                   |
| 2     | unsigned, Minification filter                                    |
| 4-5   | unsigned, ETC1 (0 = not ETC1, 2 = ETC1) note: still 0 for ETC1A4 |
| 8-10  | unsigned, Wrap T                                                 |
| 12-14 | unsigned, Wrap S                                                 |
| 16-17 | 0x0                                                              |
| 20    | unsigned, Shadow (Texture 0 only, 0 = not shadow, 1 = shadow)    |
| 24    | unsigned, Mipmap filter                                          |
| 28-30 | unsigned, Type (Texture 0 only)                                  |

This register is used to set a texture unit's extra parameters.

Filter values:

| Value | Description |
|-------|-------------|
| 0     | Nearest     |
| 1     | Linear      |

Wrap values:

| Value | Description     |
|-------|-----------------|
| 0     | Clamp to edge   |
| 1     | Clamp to border |
| 2     | Repeat          |
| 3     | Mirrored repeat |

Type values:

| Value | Description |
|-------|-------------|
| 0     | 2D          |
| 1     | Cube map    |
| 2     | Shadow 2D   |
| 3     | Projection  |
| 4     | Shadow cube |
| 5     | Disabled    |

### GPUREG_TEXUNIT*i*\_LOD

| Bits  | Description         |
|-------|---------------------|
| 0-12  | fixed1.4.8, Bias    |
| 16-19 | unsigned, Max Level |
| 24-27 | unsigned, Min Level |

This register is used to configure a texture unit's level of detail.

### GPUREG_TEXUNIT*i*\_ADDR*i*

First ADDR register:

| Bits | Description                               |
|------|-------------------------------------------|
| 0-27 | unsigned, Texture physical address \>\> 3 |

Subsequent ADDR registers:

| Bits | Description |
|----|----|
| 0-21 | unsigned, Texture physical address \>\> 3 (upper 6 bits reused from first ADDR register) |

This register is used to set a texture unit's physical address(es) in memory. Individual texels in a texture are laid out in memory as a [Z-order curve](http://en.wikipedia.org/wiki/Z-order_curve). Mipmap data is stored directly following the main texture data.

If the texture is a cube:

| Register | Description |
|----------|-------------|
| ADDR1    | Positive X  |
| ADDR2    | Negative X  |
| ADDR3    | Positive Y  |
| ADDR4    | Negative Y  |
| ADDR5    | Positive Z  |
| ADDR6    | Negative Z  |

Otherwise, ADDR(1) points to a 2D texture, and the rest are empty. Addresses shall be ordered from lowest to highest, otherwise some faces might not render correctly.

### GPUREG_TEXUNIT*i*\_SHADOW

| Bits | Description                                                  |
|------|--------------------------------------------------------------|
| 0    | unsigned, Perspective (0 = perspective, 1 = not perspective) |
| 1-23 | fixed0.0.24, Z bias (upper 23 bits)                          |

This register is used to set a texture unit's shadow texture properties.

### GPUREG_TEXUNIT*i*\_TYPE

| Bits | Description      |
|------|------------------|
| 0-3  | unsigned, Format |

This register is used to set a texture unit's data format.

Format values:

| Value | Description | GL Format          | GL Data Type              |
|-------|-------------|--------------------|---------------------------|
| 0x0   | RGBA8888    | GL_RGBA            | GL_UNSIGNED_BYTE          |
| 0x1   | RGB888      | GL_RGB             | GL_UNSIGNED_BYTE          |
| 0x2   | RGBA5551    | GL_RGBA            | GL_UNSIGNED_SHORT_5_5_5_1 |
| 0x3   | RGB565      | GL_RGB             | GL_UNSIGNED_SHORT_5_6_5   |
| 0x4   | RGBA4444    | GL_RGBA            | GL_UNSIGNED_SHORT_4_4_4_4 |
| 0x5   | IA8         | GL_LUMINANCE_ALPHA | GL_UNSIGNED_BYTE          |
| 0x6   | HILO8       |                    |                           |
| 0x7   | I8          | GL_LUMINANCE       | GL_UNSIGNED_BYTE          |
| 0x8   | A8          | GL_ALPHA           | GL_UNSIGNED_BYTE          |
| 0x9   | IA44        | GL_LUMINANCE_ALPHA | GL_UNSIGNED_BYTE_4_4_EXT  |
| 0xA   | I4          |                    |                           |
| 0xB   | A4          | GL_ALPHA           | GL_UNSIGNED_NIBBLE_EXT    |
| 0xC   | ETC1        | GL_ETC1_RGB8_OES   |                           |
| 0xD   | ETC1A4      |                    |                           |

### GPUREG_LIGHTING_ENABLE0

| Bits | Description                                   |
|------|-----------------------------------------------|
| 0    | unsigned, Enabled (0 = disabled, 1 = enabled) |

This register is used to enable lighting.

### GPUREG_TEXUNIT3_PROCTEX0

| Bits | Description |
|----|----|
| 0-2 | unsigned, U-direction clamp |
| 3-5 | unsigned, V-direction clamp |
| 6-9 | unsigned, RGB mapping function |
| 10-13 | unsigned, Alpha mapping function |
| 14 | unsigned, Handle alpha separately (0 = don't separate, 1 = separate) |
| 15 | unsigned, Noise enabled (0 = disabled, 1 = enabled) |
| 16-17 | unsigned, U-direction shift |
| 18-19 | unsigned, V-direction shift |
| 20-27 | float1.5.10, Texture bias (lower 8 bits) |

This register is used to configure the procedural texture unit.

Clamp values:

| Value | Description        |
|-------|--------------------|
| 0     | Clamp to zero      |
| 1     | Clamp to edge      |
| 2     | Symmetrical repeat |
| 3     | Mirrored repeat    |
| 4     | Pulse              |

Mapping function values:

| Value | Description   |
|-------|---------------|
| 0     | U             |
| 1     | U²            |
| 2     | V             |
| 3     | V²            |
| 4     | (U + V) / 2   |
| 5     | (U² + V²) / 2 |
| 6     | sqrt(U² + V²) |
| 7     | Minimum       |
| 8     | Maximum       |
| 9     | Rmax          |

Shift values:

| Value | Description |
|-------|-------------|
| 0     | None        |
| 1     | Odd         |
| 2     | Even        |

### GPUREG_TEXUNIT3_PROCTEX1

| Bits  | Description                              |
|-------|------------------------------------------|
| 0-15  | fixed1.3.12, U-direction noise amplitude |
| 16-31 | float1.5.10, U-direction noise phase     |

This register is used to configure the procedural texture unit's U-direction noise amplitude/phase.

### GPUREG_TEXUNIT3_PROCTEX2

| Bits  | Description                              |
|-------|------------------------------------------|
| 0-15  | fixed1.3.12, V-direction noise amplitude |
| 16-31 | float1.5.10, V-direction noise phase     |

This register is used to configure the procedural texture unit's V-direction noise amplitude/phase.

### GPUREG_TEXUNIT3_PROCTEX3

| Bits  | Description                              |
|-------|------------------------------------------|
| 0-15  | float1.5.10, U-direction noise frequency |
| 16-31 | float1.5.10, V-direction noise frequency |

This register is used to configure the procedural texture unit's U-direction and V-direction noise frequency.

### GPUREG_TEXUNIT3_PROCTEX4

| Bits  | Description                              |
|-------|------------------------------------------|
| 0-2   | unsigned, Minification filter            |
| 3-6   | Min LOD (usually 0)                      |
| 7-10  | Max LOD (usually 6)                      |
| 11-18 | unsigned, Texture width                  |
| 19-26 | float1.5.10, Texture bias (upper 8 bits) |

This register is used to configure the procedural texture unit.

Minification filter values:

| Value | Description             |
|-------|-------------------------|
| 0     | Nearest                 |
| 1     | Linear                  |
| 2     | Nearest, Mipmap Nearest |
| 3     | Linear, Mipmap Nearest  |
| 4     | Nearest, Mipmap Linear  |
| 5     | Linear, Mipmap Linear   |

### GPUREG_TEXUNIT3_PROCTEX5

| Bits  | Description                                            |
|-------|--------------------------------------------------------|
| 0-7   | unsigned, Texture offset (Mipmap level 0 / base level) |
| 8-15  | unsigned, mipmap level 1 offset (usually 0x80)         |
| 16-23 | unsigned, mipmap level 2 offset (usually 0xC0)         |
| 24-31 | unsigned, mipmap level 3 offset (usually 0xE0)         |

This register is used to set the procedural texture unit's offset. Mipmap level 4-7 seems to be hardcoded at offset 0xF0, 0xF8, 0xFC and 0xFE .

### GPUREG_PROCTEX_LUT

| Bits | Description               |
|------|---------------------------|
| 0-7  | unsigned, Index           |
| 8-11 | unsigned, Reference table |

This register is used to set which look-up table to write to, with GPUREG_PROCTEX_LUT_DATA*i*, at what index.

Reference table values:

| Value | Description                  |
|-------|------------------------------|
| 0     | Noise table                  |
| 2     | RGB mapping function table   |
| 3     | Alpha mapping function table |
| 4     | Color table                  |
| 5     | Color difference table       |

### GPUREG_PROCTEX_LUT_DATA*i*

| Bits | Description |
|------|-------------|
| 0-31 | LUT data    |

These registers behave as a FIFO queue. Each write to these registers writes the provided value to the table selected with GPUREG_PROCTEX_LUT, starting at the selected index.

#### Noise Table

128 elements:

| Bits | Description |
|----|----|
| 0-11 | fixed0.0.12, Value |
| 12-23 | fixed0.0.12 with two's complement ( \[0.5,1.0) mapped to \[-1.0,0) ), Difference from next element |

#### RGB Mapping Function Table

128 elements:

| Bits  | Description                                                     |
|-------|-----------------------------------------------------------------|
| 0-11  | fixed0.0.12, Value                                              |
| 12-23 | fixed0.0.12 with two's complement, Difference from next element |

#### Alpha Mapping Function Table

128 elements:

| Bits  | Description                                                     |
|-------|-----------------------------------------------------------------|
| 0-11  | fixed0.0.12, Value                                              |
| 12-23 | fixed0.0.12 with two's complement, Difference from next element |

#### Color Table

256 elements:

| Bits  | Description     |
|-------|-----------------|
| 0-7   | unsigned, Red   |
| 8-15  | unsigned, Green |
| 16-23 | unsigned, Blue  |
| 24-31 | unsigned, Alpha |

#### Color Difference Table

256 elements:

| Bits | Description |
|----|----|
| 0-7 | signed, Half of red difference between current and next color table elements |
| 8-15 | signed, Half of green difference between current and next color table elements |
| 16-23 | signed, Half of blue difference between current and next color table elements |
| 24-31 | signed, Half of alpha difference between current and next color table elements |

### GPUREG_TEXENV*i*\_SOURCE

| Bits  | Description              |
|-------|--------------------------|
| 0-3   | unsigned, RGB source 0   |
| 4-7   | unsigned, RGB source 1   |
| 8-11  | unsigned, RGB source 2   |
| 16-19 | unsigned, Alpha source 0 |
| 20-23 | unsigned, Alpha source 1 |
| 24-27 | unsigned, Alpha source 2 |

This register configures a texture combiner's sources.

Source values:

| Value | Description                             |
|-------|-----------------------------------------|
| 0     | Primary color                           |
| 1     | Fragment primary color                  |
| 2     | Fragment secondary color                |
| 3     | Texture 0                               |
| 4     | Texture 1                               |
| 5     | Texture 2                               |
| 6     | Texture 3                               |
| 13    | Previous buffer                         |
| 14    | Constant (from GPUREG_TEXENV*i*\_COLOR) |
| 15    | Previous                                |

Using Previous (15) as a source in the first TEV stage returns the value of source 3. If source 3 has Previous it returns zero. Previous buffer (13) always returns zero.

### GPUREG_TEXENV*i*\_OPERAND

| Bits  | Description               |
|-------|---------------------------|
| 0-3   | unsigned, RGB operand 0   |
| 4-7   | unsigned, RGB operand 1   |
| 8-11  | unsigned, RGB operand 2   |
| 12-14 | unsigned, Alpha operand 0 |
| 16-18 | unsigned, Alpha operand 1 |
| 20-22 | unsigned, Alpha operand 2 |

This register configures a texture combiner's operands.

RGB operand values:

| Value | Description            |
|-------|------------------------|
| 0     | Source color           |
| 1     | One minus source color |
| 2     | Source alpha           |
| 3     | One minus source alpha |
| 4     | Source red             |
| 5     | One minus source red   |
| 8     | Source green           |
| 9     | One minus source green |
| 12    | Source blue            |
| 13    | One minus source blue  |

Alpha operand values:

| Value | Description            |
|-------|------------------------|
| 0     | Source alpha           |
| 1     | One minus source alpha |
| 2     | Source red             |
| 3     | One minus source red   |
| 4     | Source green           |
| 5     | One minus source green |
| 6     | Source blue            |
| 7     | One minus source blue  |

### GPUREG_TEXENV*i*\_COMBINER

| Bits  | Description             |
|-------|-------------------------|
| 0-3   | unsigned, RGB combine   |
| 16-19 | unsigned, Alpha combine |

This register configures a texture combiner's combine mode.

Combine values:

| Value | Description       |
|-------|-------------------|
| 0     | Replace           |
| 1     | Modulate          |
| 2     | Add               |
| 3     | Add signed        |
| 4     | Interpolate       |
| 5     | Subtract          |
| 6     | Dot3 RGB          |
| 7     | Dot3 RGBA         |
| 8     | Multiply then add |
| 9     | Add then multiply |

### GPUREG_TEXENV*i*\_COLOR

| Bits  | Description     |
|-------|-----------------|
| 0-7   | unsigned, Red   |
| 8-15  | unsigned, Green |
| 16-23 | unsigned, Blue  |
| 24-31 | unsigned, Alpha |

This register configures a texture combiner's constant color.

### GPUREG_TEXENV*i*\_SCALE

| Bits  | Description           |
|-------|-----------------------|
| 0-1   | unsigned, RGB scale   |
| 16-17 | unsigned, Alpha scale |

This register configures a texture combiner's scale value.

Scale values:

| Value | Description |
|-------|-------------|
| 0     | 1x          |
| 1     | 2x          |
| 2     | 4x          |

### GPUREG_TEXENV_UPDATE_BUFFER

| Bits  | Description                                 |
|-------|---------------------------------------------|
| 0-2   | unsigned, Fog mode                          |
| 3     | unsigned, Shading density source            |
| 8     | unsigned, TexEnv 1 RGB buffer input         |
| 9     | unsigned, TexEnv 2 RGB buffer input         |
| 10    | unsigned, TexEnv 3 RGB buffer input         |
| 11    | unsigned, TexEnv 4 RGB buffer input         |
| 12    | unsigned, TexEnv 1 alpha buffer input       |
| 13    | unsigned, TexEnv 2 alpha buffer input       |
| 14    | unsigned, TexEnv 3 alpha buffer input       |
| 15    | unsigned, TexEnv 4 alpha buffer input       |
| 16    | unsigned, Z flip (0 = don't flip, 1 = flip) |
| 24-25 | 0x0                                         |

This register is shared between the gas/fog mode configuration and texture combiner buffer inputs. Texture combiner buffer inputs are typically written with a mask of 0x2, and the gas/fog mode configuration is typically written with a mask of 0x5.

Fog mode values:

| Value | Description |
|-------|-------------|
| 0     | Disabled    |
| 5     | Fog         |
| 7     | Gas         |

Shading density source values:

| Value | Description   |
|-------|---------------|
| 0     | Plain density |
| 1     | Depth density |

Buffer input values:

| Value | Description     |
|-------|-----------------|
| 0     | Previous buffer |
| 1     | Previous        |

### GPUREG_FOG_COLOR

| Bits  | Description     |
|-------|-----------------|
| 0-7   | unsigned, Red   |
| 8-15  | unsigned, Green |
| 16-23 | unsigned, Blue  |

This register is used to configure the color of fog.

### GPUREG_GAS_ATTENUATION

| Bits | Description                          |
|------|--------------------------------------|
| 0-15 | float1.5.10, Gas density attenuation |

This register is used to configure the gas density attenuation.

### GPUREG_GAS_ACCMAX

| Bits | Description                                   |
|------|-----------------------------------------------|
| 0-15 | float1.5.10, Gas maximum density accumulation |

This register is used to configure the gas maximum density accumulation.

### GPUREG_FOG_LUT_INDEX

| Bits | Description     |
|------|-----------------|
| 0-15 | unsigned, Index |

This register is used to set what index to write to with GPUREG_FOG_LUT_DATA*i*.

### GPUREG_FOG_LUT_DATA*i*

| Bits | Description |
|------|-------------|
| 0-23 | LUT data    |

These registers behave as a FIFO queue. Each write to these registers writes the provided value to the fog look-up table, starting at the index selected with GPUREG_FOG_LUT_INDEX.

#### Fog Look-Up Table

128 elements:

| Bits  | Description                               |
|-------|-------------------------------------------|
| 0-12  | fixed1.1.11, Difference from next element |
| 13-23 | fixed0.0.11, Value                        |

### GPUREG_TEXENV_BUFFER_COLOR

| Bits  | Description     |
|-------|-----------------|
| 0-7   | unsigned, Red   |
| 8-15  | unsigned, Green |
| 16-23 | unsigned, Blue  |
| 24-31 | unsigned, Alpha |

This register is used to configure the texture combiner buffer color.

## Framebuffer registers

### GPUREG_COLOR_OPERATION

| Bits  | Description                       |
|-------|-----------------------------------|
| 0-1   | unsigned, Fragment operation mode |
| 8     | unsigned, Blend mode              |
| 16-25 | 0x0E4                             |

This register is used to configure the fragment operation mode and whether to use logic ops or blending.

Fragment operation mode values:

| Value | Description |
|-------|-------------|
| 0     | Default     |
| 1     | Gas         |
| 3     | Shadow      |

Blend mode values:

| Value | Description |
|-------|-------------|
| 0     | Logic op    |
| 1     | Blend       |

### GPUREG_BLEND_FUNC

| Bits  | Description                          |
|-------|--------------------------------------|
| 0-2   | unsigned, RGB equation               |
| 8-10  | unsigned, Alpha equation             |
| 16-19 | unsigned, RGB source function        |
| 20-23 | unsigned, RGB destination function   |
| 24-27 | unsigned, Alpha source function      |
| 28-31 | unsigned, Alpha destination function |

This register is used to configure the blending function.

**Equation values:**

| Value | Description      |
|-------|------------------|
| 0     | Add              |
| 1     | Subtract         |
| 2     | Reverse subtract |
| 3     | Minimum          |
| 4     | Maximum          |

Blend equations 5, 6, 7 appear to behave the same as blend equation 0 (Add)

**Function values:**

| Value | Description                 |
|-------|-----------------------------|
| 0     | Zero                        |
| 1     | One                         |
| 2     | Source color                |
| 3     | One minus source color      |
| 4     | Destination color           |
| 5     | One minus destination color |
| 6     | Source alpha                |
| 7     | One minus source alpha      |
| 8     | Destination alpha           |
| 9     | One minus destination alpha |
| 10    | Constant color              |
| 11    | One minus constant color    |
| 12    | Constant alpha              |
| 13    | One minus constant alpha    |
| 14    | Source alpha saturate       |

### GPUREG_LOGIC_OP

| Bits | Description        |
|------|--------------------|
| 0-3  | unsigned, Logic op |

This register is used to configure the logic op.

Logic op values:

| Value | Description   |
|-------|---------------|
| 0     | Clear         |
| 1     | AND           |
| 2     | Reverse AND   |
| 3     | Copy          |
| 4     | Set           |
| 5     | Inverted copy |
| 6     | Noop          |
| 7     | Invert        |
| 8     | NAND          |
| 9     | OR            |
| 10    | NOR           |
| 11    | XOR           |
| 12    | Equivalent    |
| 13    | Inverted AND  |
| 14    | Reverse OR    |
| 15    | Inverted OR   |

### GPUREG_BLEND_COLOR

| Bits  | Description     |
|-------|-----------------|
| 0-7   | unsigned, Red   |
| 8-15  | unsigned, Green |
| 16-23 | unsigned, Blue  |
| 24-31 | unsigned, Alpha |

This register is used to configure the blending color.

### GPUREG_FRAGOP_ALPHA_TEST

| Bits | Description                                   |
|------|-----------------------------------------------|
| 0    | unsigned, Enabled (0 = disabled, 1 = enabled) |
| 4-6  | unsigned, Function                            |
| 8-15 | unsigned, Reference value                     |

This register is used to configure alpha testing.

Function values:

| Value | Description           |
|-------|-----------------------|
| 0     | Never                 |
| 1     | Always                |
| 2     | Equal                 |
| 3     | Not equal             |
| 4     | Less than             |
| 5     | Less than or equal    |
| 6     | Greater than          |
| 7     | Greater than or equal |

### GPUREG_STENCIL_TEST

| Bits  | Description                                   |
|-------|-----------------------------------------------|
| 0     | unsigned, Enabled (0 = disabled, 1 = enabled) |
| 4-6   | unsigned, Function                            |
| 8-15  | unsigned, Buffer mask                         |
| 16-23 | signed, Reference value                       |
| 24-31 | unsigned, Mask                                |

This register is used to configure stencil testing.

Function values:

| Value | Description           |
|-------|-----------------------|
| 0     | Never                 |
| 1     | Always                |
| 2     | Equal                 |
| 3     | Not equal             |
| 4     | Less than             |
| 5     | Less than or equal    |
| 6     | Greater than          |
| 7     | Greater than or equal |

### GPUREG_STENCIL_OP

| Bits | Description                |
|------|----------------------------|
| 0-2  | unsigned, Fail operation   |
| 4-6  | unsigned, Z-fail operation |
| 8-10 | unsigned, Z-pass operation |

This register is used to configure stencil result operations.

Operation values:

| Value | Description        |
|-------|--------------------|
| 0     | Keep               |
| 1     | Zero               |
| 2     | Replace            |
| 3     | Increment          |
| 4     | Decrement          |
| 5     | Invert             |
| 6     | Increment and wrap |
| 7     | Decrement and wrap |

### GPUREG_DEPTH_COLOR_MASK

| Bits | Description                                               |
|------|-----------------------------------------------------------|
| 0    | unsigned, Depth test enabled (0 = disabled, 1 = enabled)  |
| 4-6  | unsigned, Depth function                                  |
| 8    | unsigned, Red write enabled (0 = disabled, 1 = enabled)   |
| 9    | unsigned, Green write enabled (0 = disabled, 1 = enabled) |
| 10   | unsigned, Blue write enabled (0 = disabled, 1 = enabled)  |
| 11   | unsigned, Alpha write enabled (0 = disabled, 1 = enabled) |
| 12   | unsigned, Depth write enabled (0 = disabled, 1 = enabled) |

This register is used to depth testing and framebuffer write masking.

Note that setting the "Depth test enabled" bit to 0 will *not* also disable depth writes. It will instead behave as if the depth function were set to "Always". To completely disable depth-related operations both the depth test and depth write bits must be disabled.

Depth function values:

| Value | Description           |
|-------|-----------------------|
| 0     | Never                 |
| 1     | Always                |
| 2     | Equal                 |
| 3     | Not equal             |
| 4     | Less than             |
| 5     | Less than or equal    |
| 6     | Greater than          |
| 7     | Greater than or equal |

### GPUREG_FRAMEBUFFER_INVALIDATE

| Bits | Description                                  |
|------|----------------------------------------------|
| 0    | unsigned, Trigger (0 = idle, 1 = invalidate) |
| 1-31 | 0x0                                          |

Writing 1 to this register invalidates the framebuffer cache. This should be done when changing the framebuffer or when it is cleared before rendering. Note that it does **not** flush the cache, so it should always be preceded by a write to GPUREG_FRAMEBUFFER_FLUSH.

### GPUREG_FRAMEBUFFER_FLUSH

| Bits | Description                             |
|------|-----------------------------------------|
| 0    | unsigned, Trigger (0 = idle, 1 = flush) |
| 1-31 | 0x0                                     |

Writing 1 to this register flushes the framebuffer cache to memory. This should be done after rendering before changing the framebuffer or using rendering results.

### GPUREG_COLORBUFFER_READ

| Bits | Description                                      |
|------|--------------------------------------------------|
| 0-3  | unsigned, Allow read (0 = disable, 0xF = enable) |

This register configures read access from the color buffer.

### GPUREG_COLORBUFFER_WRITE

| Bits | Description                                       |
|------|---------------------------------------------------|
| 0-3  | unsigned, Allow write (0 = disable, 0xF = enable) |

This register configures write access to the color buffer.

### GPUREG_DEPTHBUFFER_READ

| Bits | Description                                            |
|------|--------------------------------------------------------|
| 0    | unsigned, Allow stencil read (0 = disable, 1 = enable) |
| 1    | unsigned, Allow depth read (0 = disable, 1 = enable)   |

This register configures read access from the depth and stencil buffers.

### GPUREG_DEPTHBUFFER_WRITE

| Bits | Description                                             |
|------|---------------------------------------------------------|
| 0    | unsigned, Allow stencil write (0 = disable, 1 = enable) |
| 1    | unsigned, Allow depth write (0 = disable, 1 = enable)   |

This register configures write access to the depth and stencil buffers.

### GPUREG_DEPTHBUFFER_FORMAT

| Bits | Description      |
|------|------------------|
| 0-1  | unsigned, Format |

This register configures the depth buffer data format.

Format values:

| Value | Description                  |
|-------|------------------------------|
| 0     | 16-bit depth                 |
| 2     | 24-bit depth                 |
| 3     | 24-bit depth + 8-bit stencil |

### GPUREG_COLORBUFFER_FORMAT

| Bits  | Description          |
|-------|----------------------|
| 0-1   | unsigned, Pixel size |
| 16-18 | unsigned, Format     |

This register configures the color buffer data format. Color components are laid out in reverse byte order in memory, with the most significant bits used first.

Pixel size values:

| Value | Description  |
|-------|--------------|
| 0     | 16-bit color |
| 2     | 32-bit color |

Format values:

| Value | Description |
|-------|-------------|
| 0     | RGBA8/Gas   |
| 2     | RGB5A1      |
| 3     | RGB565      |
| 4     | RGBA4       |

### GPUREG_EARLYDEPTH_TEST2

| Bits | Description                                   |
|------|-----------------------------------------------|
| 0    | unsigned, Enabled (0 = disabled, 1 = enabled) |

This register enables the early depth test.

### GPUREG_FRAMEBUFFER_BLOCK32

| Bits | Description                 |
|------|-----------------------------|
| 0    | unsigned, Render block mode |

This register configures the framebuffer block mode. To untile the color buffer when using the 32x32 block format, use bit 16 of the [display transfer flags](GPU/External_Registers#transfer_engine "wikilink"). It is unknown if there are any advantages to using the 32x32 format.

Render block mode values:

| Value | Description  |
|-------|--------------|
| 0     | 8x8 blocks   |
| 1     | 32x32 blocks |

### GPUREG_DEPTHBUFFER_LOC

| Bits | Description                                    |
|------|------------------------------------------------|
| 0-27 | unsigned, Depth buffer physical address \>\> 3 |

This register configures the depth buffer physical address.

### GPUREG_COLORBUFFER_LOC

| Bits | Description                                    |
|------|------------------------------------------------|
| 0-27 | unsigned, Color buffer physical address \>\> 3 |

This register configures the color buffer physical address.

### GPUREG_FRAMEBUFFER_DIM

| Bits  | Description                                        |
|-------|----------------------------------------------------|
| 0-10  | unsigned, Width                                    |
| 12-21 | unsigned, Height - 1                               |
| 24    | unsigned, Vertical flip? (0 = enable, 1 = disable) |

This register configures the framebuffer dimensions.

### GPUREG_GAS_LIGHT_XY

| Bits  | Description                                  |
|-------|----------------------------------------------|
| 0-7   | unsigned, Planar shading minimum intensity   |
| 8-15  | unsigned, Planar shading maximum intensity   |
| 16-23 | unsigned, Planar shading density attenuation |

This register configures gas light planar shading.

### GPUREG_GAS_LIGHT_Z

| Bits  | Description                                |
|-------|--------------------------------------------|
| 0-7   | unsigned, View shading minimum intensity   |
| 8-15  | unsigned, View shading maximum intensity   |
| 16-23 | unsigned, View shading density attenuation |

This register configures gas light view shading.

### GPUREG_GAS_LIGHT_Z_COLOR

| Bits | Description                                              |
|------|----------------------------------------------------------|
| 0-7  | unsigned, View shading effect in line-of-sight direction |
| 8    | Gas color LUT input                                      |

This register configures gas light shading in the line-of-sight direction, and the input to the gas color LUT.

Color LUT input values:

| Value | Description  |
|-------|--------------|
| 0     | Gas density  |
| 1     | Light factor |

### GPUREG_GAS_LUT_INDEX

| Bits | Description     |
|------|-----------------|
| 0-15 | unsigned, Index |

This register is used to set what index to write to with GPUREG_GAS_LUT_DATA*i*.

### GPUREG_GAS_LUT_DATA

| Bits | Description |
|------|-------------|
| 0-31 | LUT data    |

These registers behave as a FIFO queue. Each write to these registers writes the provided value to the gas look-up table, starting at the index selected with GPUREG_GAS_LUT_INDEX.

#### Gas Look-Up Table

16 elements:

First 8 elements:

| Bits  | Description   |
|-------|---------------|
| 0-7   | signed, Red   |
| 8-15  | signed, Green |
| 16-23 | signed, Blue  |

Last 8 elements:

| Bits  | Description     |
|-------|-----------------|
| 0-7   | unsigned, Red   |
| 8-15  | unsigned, Green |
| 16-23 | unsigned, Blue  |

### GPUREG_GAS_DELTAZ_DEPTH

| Bits  | Description                                         |
|-------|-----------------------------------------------------|
| 0-23  | fixed0.16.8, Depth direction attenuation proportion |
| 24-25 | unsigned, Depth function                            |

This register is used to configure the gas depth direction attenuation proportion, as well as the gas depth function.

Gas depth function values:

| Value | Description                                  |
|-------|----------------------------------------------|
| 0     | Never                                        |
| 1     | Always                                       |
| 2     | Greater than/Greater than or equal           |
| 3     | Less than/Less than or equal/Equal/Not equal |

### GPUREG_FRAGOP_SHADOW

| Bits  | Description                                          |
|-------|------------------------------------------------------|
| 0-15  | float1.5.10, Sum of penumbra scale and penumbra bias |
| 16-31 | float1.5.10, Penumbra scale with reversed sign       |

This register is used to configure shadow properties.

## Fragment lighting registers

### GPUREG_LIGHT*i*\_SPECULAR0

| Bits  | Description     |
|-------|-----------------|
| 0-7   | unsigned, Blue  |
| 10-17 | unsigned, Green |
| 20-27 | unsigned, Red   |

These registers contain the specular0 color of the corresponding light. Usually set to material_specular0\*lightX_specular0.

### GPUREG_LIGHT*i*\_SPECULAR1

| Bits  | Description     |
|-------|-----------------|
| 0-7   | unsigned, Blue  |
| 10-17 | unsigned, Green |
| 20-27 | unsigned, Red   |

These registers contain the specular1 color of the corresponding light. Usually set to material_specular1\*lightX_specular1.

### GPUREG_LIGHT*i*\_DIFFUSE

| Bits  | Description     |
|-------|-----------------|
| 0-7   | unsigned, Blue  |
| 10-17 | unsigned, Green |
| 20-27 | unsigned, Red   |

These registers contain the diffuse color of the corresponding light. Usually set to material_diffuse\*lightX_diffuse.

### GPUREG_LIGHT*i*\_AMBIENT

| Bits  | Description     |
|-------|-----------------|
| 0-7   | unsigned, Blue  |
| 10-17 | unsigned, Green |
| 20-27 | unsigned, Red   |

These registers contain the ambient color of the corresponding light. Usually set to material_ambient\*lightX_ambient.

### GPUREG_LIGHT*i*\_XY

| Bits  | Description               |
|-------|---------------------------|
| 0-15  | float1.5.10, X coordinate |
| 16-31 | float1.5.10, Y coordinate |

These registers (along with GPUREG_LIGHT*i*\_Z) represent the light position (for a positional light) or the light direction vector (for a directional light) of the corresponding light.

### GPUREG_LIGHT*i*\_Z

| Bits | Description               |
|------|---------------------------|
| 0-15 | float1.5.10, Z coordinate |

These registers (along with GPUREG_LIGHT*i*\_XY) represent the light position (for a positional light) or the light direction vector (for a directional light) of the corresponding light.

### GPUREG_LIGHT*i*\_SPOTDIR_XY

| Bits  | Description                         |
|-------|-------------------------------------|
| 0-12  | fixed1.1.11, X coordinate (negated) |
| 16-28 | fixed1.1.11, Y coordinate (negated) |

These registers (along with GPUREG_LIGHT*i*\_SPOTDIR_Z) represent the spot direction (unitary) vector of the corresponding light.

### GPUREG_LIGHT*i*\_SPOTDIR_Z

| Bits | Description                         |
|------|-------------------------------------|
| 0-12 | fixed1.1.11, Z coordinate (negated) |

These registers (along with GPUREG_LIGHT*i*\_SPOTDIR_XY) represent the spot direction (unitary) vector of the corresponding light.

### GPUREG_LIGHT*i*\_CONFIG

| Bits | Description                                                        |
|------|--------------------------------------------------------------------|
| 0    | unsigned, Light type (0 = positional light, 1 = directional light) |
| 1    | unsigned, Two side diffuse (0 = one side, 1 = both sides)          |
| 2    | unsigned, Use geometric factor 0 (0 = don't use, 1 = use)          |
| 3    | unsigned, Use geometric factor 1 (0 = don't use, 1 = use)          |

This register configures a light's properties.

### GPUREG_LIGHT*i*\_ATTENUATION_BIAS

| Bits | Description                            |
|------|----------------------------------------|
| 0-19 | float1.7.12, Distance attenuation bias |

These registers contain the distance attenuation bias value of the corresponding light. The attenuation factor is DA(clip(bias + scale\*distance, 0.0, 1.0)).

### GPUREG_LIGHT*i*\_ATTENUATION_SCALE

| Bits | Description                             |
|------|-----------------------------------------|
| 0-19 | float1.7.12, Distance attenuation scale |

These registers contain the distance attenuation scale value of the corresponding light. The attenuation factor is DA(clip(bias + scale\*distance, 0.0, 1.0)).

### GPUREG_LIGHTING_AMBIENT

| Bits  | Description     |
|-------|-----------------|
| 0-7   | unsigned, Blue  |
| 10-17 | unsigned, Green |
| 20-27 | unsigned, Red   |

This register contains the initial value of the fragment primary color before the partial colors that correspond to each enabled light are added. Usually set to material_emission + material_ambient\*scene_ambient.

### GPUREG_LIGHTING_NUM_LIGHTS

| Bits | Description                           |
|------|---------------------------------------|
| 0-2  | unsigned, Number of active lights - 1 |

This register configures the number of active lights.

### GPUREG_LIGHTING_CONFIG0

| Bits | Description |
|----|----|
| 0 | unsigned, Shadow factor enabled (0 = disabled, 1 = enabled) (usually accompanied by bit 16, 17, or 18) |
| 2-3 | unsigned, Fresnel selector |
| 4-7 | unsigned, Light environment configuration |
| 8-11 | 0x4 |
| 16 | unsigned, Apply shadow attenuation to primary color (0 = don't apply, 1 = apply) |
| 17 | unsigned, Apply shadow attenuation to secondary color (0 = don't apply, 1 = apply) |
| 18 | unsigned, Invert shadow attenuation (0 = don't invert, 1 = invert) |
| 19 | unsigned, Apply shadow attenuation to alpha component (0 = don't apply, 1 = apply) |
| 22-23 | unsigned, Bump map texture unit |
| 24-25 | unsigned, Shadow map texture unit |
| 27 | unsigned, Clamp highlights (0 = disabled, 1 = enabled) |
| 28-29 | unsigned, Bump mode |
| 30 | unsigned, Recalculate bump vectors (0 = enabled, 1 = disabled) (usually set to 1 when bump mode is not 0) |
| 31 | 0x1 |

This register configures the light environment.

Fresnel selector values:

| Value | Description                 |
|-------|-----------------------------|
| 0     | None                        |
| 1     | Primary alpha               |
| 2     | Secondary alpha             |
| 3     | Primary and secondary alpha |

The light environment configuration controls which LUTs are available for use. If a LUT is not available in the selected configuration, its value will always read a constant 1.0 regardless of the enable state in GPUREG_LIGHTING_CONFIG1. If RR is enabled but not RG or RB, the output of RR is used for the three components; Red, Green and Blue.

Light environment configuration values:

| Value | Description     | Available LUTs           |
|-------|-----------------|--------------------------|
| 0     | Configuration 0 | D0, RR, SP, DA           |
| 1     | Configuration 1 | FR, RR, SP, DA           |
| 2     | Configuration 2 | D0, D1, RR, DA           |
| 3     | Configuration 3 | D0, D1, FR, DA           |
| 4     | Configuration 4 | All except for FR        |
| 5     | Configuration 5 | All except for D1        |
| 6     | Configuration 6 | All except for RB and RG |
| 8     | Configuration 7 | All                      |

Bump mode values:

| Value | Description        |
|-------|--------------------|
| 0     | Not used           |
| 1     | Use as bump map    |
| 2     | Use as tangent map |

### GPUREG_LIGHTING_CONFIG1

| Bits | Description |
|----|----|
| 0 | unsigned, Fragment light source 0 shadows disabled (0 = enabled, 1 = disabled) |
| 1 | unsigned, Fragment light source 1 shadows disabled (0 = enabled, 1 = disabled) |
| 2 | unsigned, Fragment light source 2 shadows disabled (0 = enabled, 1 = disabled) |
| 3 | unsigned, Fragment light source 3 shadows disabled (0 = enabled, 1 = disabled) |
| 4 | unsigned, Fragment light source 4 shadows disabled (0 = enabled, 1 = disabled) |
| 5 | unsigned, Fragment light source 5 shadows disabled (0 = enabled, 1 = disabled) |
| 6 | unsigned, Fragment light source 6 shadows disabled (0 = enabled, 1 = disabled) |
| 7 | unsigned, Fragment light source 7 shadows disabled (0 = enabled, 1 = disabled) |
| 8 | unsigned, Fragment light source 0 spot light disabled (0 = enabled, 1 = disabled) |
| 9 | unsigned, Fragment light source 1 spot light disabled (0 = enabled, 1 = disabled) |
| 10 | unsigned, Fragment light source 2 spot light disabled (0 = enabled, 1 = disabled) |
| 11 | unsigned, Fragment light source 3 spot light disabled (0 = enabled, 1 = disabled) |
| 12 | unsigned, Fragment light source 4 spot light disabled (0 = enabled, 1 = disabled) |
| 13 | unsigned, Fragment light source 5 spot light disabled (0 = enabled, 1 = disabled) |
| 14 | unsigned, Fragment light source 6 spot light disabled (0 = enabled, 1 = disabled) |
| 15 | unsigned, Fragment light source 7 spot light disabled (0 = enabled, 1 = disabled) |
| 16 | unsigned, Term 0 distribution component D0 LUT disabled (0 = enabled, 1 = disabled) |
| 17 | unsigned, Term 1 distribution component D1 LUT disabled (0 = enabled, 1 = disabled) |
| 18 | 0x1 |
| 19 | unsigned, Fresnel FR LUT disabled (0 = enabled, 1 = disabled) |
| 20 | unsigned, Term 1 reflection component RB LUT disabled (0 = enabled, 1 = disabled) |
| 21 | unsigned, Term 1 reflection component RG LUT disabled (0 = enabled, 1 = disabled) |
| 22 | unsigned, Term 1 reflection component RR LUT disabled (0 = enabled, 1 = disabled) |
| 24 | unsigned, Fragment light source 0 distance attenuation disabled (0 = enabled, 1 = disabled) |
| 25 | unsigned, Fragment light source 1 distance attenuation disabled (0 = enabled, 1 = disabled) |
| 26 | unsigned, Fragment light source 2 distance attenuation disabled (0 = enabled, 1 = disabled) |
| 27 | unsigned, Fragment light source 3 distance attenuation disabled (0 = enabled, 1 = disabled) |
| 28 | unsigned, Fragment light source 4 distance attenuation disabled (0 = enabled, 1 = disabled) |
| 29 | unsigned, Fragment light source 5 distance attenuation disabled (0 = enabled, 1 = disabled) |
| 30 | unsigned, Fragment light source 6 distance attenuation disabled (0 = enabled, 1 = disabled) |
| 31 | unsigned, Fragment light source 7 distance attenuation disabled (0 = enabled, 1 = disabled) |

This register is used to disable various aspects of the light environment.

### GPUREG_LIGHTING_LUT_INDEX

| Bits | Description              |
|------|--------------------------|
| 0-7  | unsigned, Starting index |
| 8-12 | unsigned, Look-up table  |

This register controls which LUT and what offset into it the GPUREG_LIGHTING_LUT_DATA*i* register writes to.

Lookup table values:

| Value | Description |
|-------|-------------|
| 0     | D0          |
| 1     | D1          |
| 3     | FR          |
| 4     | RB          |
| 5     | RG          |
| 6     | RR          |
| 8-15  | SP0-7       |
| 16-23 | DA0-7       |

### GPUREG_LIGHTING_ENABLE1

| Bits | Description                                    |
|------|------------------------------------------------|
| 0    | unsigned, Disabled (0 = enabled, 1 = disabled) |

This register is set to 1 when fragment lighting is disabled, and to 0 when it is enabled.

### GPUREG_LIGHTING_LUT_DATA*i*

| Bits | Description |
|------|-------------|
| 0-23 | LUT data    |

Lighting LUT data is written here.

A LUT contains data for the input domain \[-1.0, 1.0\], which is indexed using a signed 8-bit number \[-128, 127\]. Therefore a LUT contains 256 entries. The index of a value is (int)(x/127.0f) & 0xFF.

DA: The input domain is \[0.0, 1.0\], and the index is an unsigned 8-bit number \[0, 255\] instead.

Format of an entry:

| Bits | Description |
|----|----|
| 0-11 | fixed0.0.12, Entry value |
| 12-23 | fixed1.0.11, Absolute value of the difference between the next entry and this entry, used to implement linear interpolation |

### GPUREG_LIGHTING_LUTINPUT_ABS

| Bits | Description                                                          |
|------|----------------------------------------------------------------------|
| 1    | unsigned, abs() flag for the input of D0 (0 = enabled, 1 = disabled) |
| 5    | unsigned, abs() flag for the input of D1 (0 = enabled, 1 = disabled) |
| 9    | unsigned, abs() flag for the input of SP (0 = enabled, 1 = disabled) |
| 13   | unsigned, abs() flag for the input of FR (0 = enabled, 1 = disabled) |
| 17   | unsigned, abs() flag for the input of RB (0 = enabled, 1 = disabled) |
| 21   | unsigned, abs() flag for the input of RG (0 = enabled, 1 = disabled) |
| 25   | unsigned, abs() flag for the input of RR (0 = enabled, 1 = disabled) |

This register controls whether the absolute value of the input is taken before using a LUT.

### GPUREG_LIGHTING_LUTINPUT_SELECT

| Bits  | Description                     |
|-------|---------------------------------|
| 0-2   | unsigned, Input selector for D0 |
| 4-6   | unsigned, Input selector for D1 |
| 8-10  | unsigned, Input selector for SP |
| 12-14 | unsigned, Input selector for FR |
| 16-18 | unsigned, Input selector for RB |
| 20-22 | unsigned, Input selector for RG |
| 24-26 | unsigned, Input selector for RR |

This register selects the input from LUTs.

Input selector values:

| Value | Description                 |
|-------|-----------------------------|
| 0     | N·H                         |
| 1     | V·H                         |
| 2     | N·V                         |
| 3     | L·N                         |
| 4     | -L·P (aka Spotlight aka SP) |
| 5     | cos φ (aka CP)              |

### GPUREG_LIGHTING_LUTINPUT_SCALE

| Bits  | Description                      |
|-------|----------------------------------|
| 0-2   | unsigned, Scaler selector for D0 |
| 4-6   | unsigned, Scaler selector for D1 |
| 8-10  | unsigned, Scaler selector for SP |
| 12-14 | unsigned, Scaler selector for FR |
| 16-18 | unsigned, Scaler selector for RB |
| 20-22 | unsigned, Scaler selector for RG |
| 24-26 | unsigned, Scaler selector for RR |

This register controls the scaling that is applied to the output of a LUT.

Scaler selector values:

| Value | Description |
|-------|-------------|
| 0     | 1x          |
| 1     | 2x          |
| 2     | 4x          |
| 3     | 8x          |
| 6     | 0.25x       |
| 7     | 0.5x        |

### GPUREG_LIGHTING_LIGHT_PERMUTATION

| Bits  | Description                           |
|-------|---------------------------------------|
| 0-2   | unsigned, ID of the 1st enabled light |
| 4-6   | unsigned, ID of the 2nd enabled light |
| 8-10  | unsigned, ID of the 3rd enabled light |
| 12-14 | unsigned, ID of the 4th enabled light |
| 16-18 | unsigned, ID of the 5th enabled light |
| 20-22 | unsigned, ID of the 6th enabled light |
| 24-26 | unsigned, ID of the 7th enabled light |
| 28-30 | unsigned, ID of the 8th enabled light |

This register sets the IDs of enabled light sources.

## Geometry pipeline registers

### GPUREG_ATTRIBBUFFERS_LOC

| Bits | Description                          |
|------|--------------------------------------|
| 1-28 | unsigned, Vertex arrays base address |

This register sets the base address of all vertex arrays.

### GPUREG_ATTRIBBUFFERS_FORMAT_LOW

| Bits  | Description                       |
|-------|-----------------------------------|
| 0-1   | unsigned, Vertex attribute 0 type |
| 2-3   | unsigned, Vertex attribute 0 size |
| 4-5   | unsigned, Vertex attribute 1 type |
| 6-7   | unsigned, Vertex attribute 1 size |
| 8-9   | unsigned, Vertex attribute 2 type |
| 10-11 | unsigned, Vertex attribute 2 size |
| 12-13 | unsigned, Vertex attribute 3 type |
| 14-15 | unsigned, Vertex attribute 3 size |
| 16-17 | unsigned, Vertex attribute 4 type |
| 18-19 | unsigned, Vertex attribute 4 size |
| 20-21 | unsigned, Vertex attribute 5 type |
| 22-23 | unsigned, Vertex attribute 5 size |
| 24-25 | unsigned, Vertex attribute 6 type |
| 26-27 | unsigned, Vertex attribute 6 size |
| 28-29 | unsigned, Vertex attribute 7 type |
| 30-31 | unsigned, Vertex attribute 7 size |

This register configures the types and sizes of the first 8 vertex attributes.

Vertex attribute type values:

| Value | Description   |
|-------|---------------|
| 0     | Byte          |
| 1     | Unsigned byte |
| 2     | Short         |
| 3     | Float         |

Vertex attribute size values:

| Value | Description |
|-------|-------------|
| 0     | 8 bits      |
| 1     | 16 bits     |
| 2     | 24 bits     |
| 3     | 32 bits     |

### GPUREG_ATTRIBBUFFERS_FORMAT_HIGH

| Bits  | Description                                |
|-------|--------------------------------------------|
| 0-1   | unsigned, Vertex attribute 8 type          |
| 2-3   | unsigned, Vertex attribute 8 size          |
| 4-5   | unsigned, Vertex attribute 9 type          |
| 6-7   | unsigned, Vertex attribute 9 size          |
| 8-9   | unsigned, Vertex attribute 10 type         |
| 10-11 | unsigned, Vertex attribute 10 size         |
| 12-13 | unsigned, Vertex attribute 11 type         |
| 14-15 | unsigned, Vertex attribute 11 size         |
| 16-27 | unsigned, Fixed vertex attribute mask      |
| 28-31 | unsigned, Total vertex attribute count - 1 |

This register configures the types and sizes of the last 4 vertex attributes, along with the attribute mask and the total attribute count.

See GPUREG_ATTRIBBUFFERS_FORMAT_LOW for vertex attribute type and size values.

### GPUREG_ATTRIBBUFFER*i*\_OFFSET

| Bits | Description                                      |
|------|--------------------------------------------------|
| 0-27 | unsigned, Offset from base vertex arrays address |

This register configures the offset of a vertex array from the base vertex arrays address.

### GPUREG_ATTRIBBUFFER*i*\_CONFIG1

| Bits  | Description           |
|-------|-----------------------|
| 0-3   | unsigned, Component 1 |
| 4-7   | unsigned, Component 2 |
| 8-11  | unsigned, Component 3 |
| 12-15 | unsigned, Component 4 |
| 16-19 | unsigned, Component 5 |
| 20-23 | unsigned, Component 6 |
| 24-27 | unsigned, Component 7 |
| 28-31 | unsigned, Component 8 |

This register configures the first 8 component types of a vertex array.

Component values:

| Value | Description         |
|-------|---------------------|
| 0     | Vertex attribute 0  |
| 1     | Vertex attribute 1  |
| 2     | Vertex attribute 2  |
| 3     | Vertex attribute 3  |
| 4     | Vertex attribute 4  |
| 5     | Vertex attribute 5  |
| 6     | Vertex attribute 6  |
| 7     | Vertex attribute 7  |
| 8     | Vertex attribute 8  |
| 9     | Vertex attribute 9  |
| 10    | Vertex attribute 10 |
| 11    | Vertex attribute 11 |
| 12    | 4-byte padding      |
| 13    | 8-byte padding      |
| 14    | 12-byte padding     |
| 15    | 16-byte padding     |

### GPUREG_ATTRIBBUFFER*i*\_CONFIG2

| Bits  | Description                          |
|-------|--------------------------------------|
| 0-3   | unsigned, Component 9                |
| 4-7   | unsigned, Component 10               |
| 8-11  | unsigned, Component 11               |
| 12-15 | unsigned, Component 12               |
| 16-23 | unsigned, Bytes per vertex           |
| 28-31 | unsigned, Total number of components |

This register configures the last 4 component types of a vertex array, along with the bytes per vertex and the total number of components.

See GPUREG_ATTRIBBUFFER*i*\_CONFIG1 for component values.

### GPUREG_INDEXBUFFER_CONFIG

| Bits | Description                                                          |
|------|----------------------------------------------------------------------|
| 0-27 | unsigned, Offset from base vertex arrays address                     |
| 31   | Index type (0 = unsigned byte, 1 = unsigned short or drawing arrays) |

This register configures the index array used when drawing elements.

### GPUREG_NUMVERTICES

| Bits | Description                            |
|------|----------------------------------------|
| 0-31 | unsigned, Number of vertices to render |

This register sets the number of vertices to render.

### GPUREG_GEOSTAGE_CONFIG

| Bits | Description |
|----|----|
| 0-1 | unsigned, Geometry shader in use (0 = not in use, 2 = in use) |
| 8 | unsigned, Drawing triangle elements (0 = not, 1 = drawing triangle elements) |
| 9 | 0x0 |
| 31 | unsigned, Use reserved geometry shader subdivision (0 = don't use, 1 = use) |

This register configures the geometry stage of the GPU pipeline.

When using vertex buffers and drawing elements in triangles mode, bit 8 is set to 1, else it is set to 0.

### GPUREG_VERTEX_OFFSET

| Bits | Description                      |
|------|----------------------------------|
| 0-31 | unsigned, Starting vertex offset |

This register sets the offset of the first vertex in an array to render.

### GPUREG_POST_VERTEX_CACHE_NUM

| Bits | Description |
|----|----|
| 0-7 | unsigned, Number of entries in the post-vertex cache (usually 0x4 or 0x84) |

This register configures the post-vertex cache.

### GPUREG_DRAWARRAYS

| Bits | Description                                          |
|------|------------------------------------------------------|
| 0-31 | unsigned, Trigger (0 = idle, non-zero = draw arrays) |

This register triggers drawing vertex arrays.

### GPUREG_DRAWELEMENTS

| Bits | Description                                            |
|------|--------------------------------------------------------|
| 0-31 | unsigned, Trigger (0 = idle, non-zero = draw elements) |

This register triggers drawing vertex array elements.

### GPUREG_VTX_FUNC

| Bits | Description                                                      |
|------|------------------------------------------------------------------|
| 0-31 | unsigned, Trigger (0 = idle, non-zero = clear post-vertex cache) |

This register triggers clearing the post-vertex cache.

### GPUREG_FIXEDATTRIB_INDEX

| Bits | Description |
|----|----|
| 0-3 | unsigned, Fixed attribute index (0-11, 0xF = immediate-mode submission) |

This register selects the index of the fixed attribute to be input with GPUREG_FIXEDATTRIB_DATA*i*. See [GPU/Fixed Vertex Attributes](GPU/Fixed_Vertex_Attributes "wikilink") and [GPU/Immediate-Mode Vertex Submission](GPU/Immediate-Mode_Vertex_Submission "wikilink") for usage info.

### GPUREG_FIXEDATTRIB_DATA*i*

| Bits       | Description                                              |
|------------|----------------------------------------------------------|
| **DATA0:** |                                                          |
| 0-7        | float1.7.16, Vertex attribute element 3 (Z) (bits 16-23) |
| 8-31       | float1.7.16, Vertex attribute element 4 (W)              |
| **DATA1:** |                                                          |
| 0-15       | float1.7.16, Vertex attribute element 2 (Y) (bits 8-23)  |
| 16-31      | float1.7.16, Vertex attribute element 3 (Z) (bits 0-15)  |
| **DATA2:** |                                                          |
| 0-23       | float1.7.16, Vertex attribute element 1 (X)              |
| 24-31      | float1.7.16, Vertex attribute element 2 (Y) (bits 0-7)   |

Accepts four 24-bit floating-point values that make up a vertex attribute. Stored in the fixed attribute currently specified with GPUREG_FIXEDATTRIB_INDEX. If immediate-mode vertex submission is enabled (by writing 0xF to the index register) then vertex data is input here directly.

### GPUREG_CMDBUF_SIZE0

| Bits | Description                               |
|------|-------------------------------------------|
| 0-20 | unsigned, Size of command buffer 0 \>\> 3 |

This register sets the size of the first command buffer.

### GPUREG_CMDBUF_SIZE1

| Bits | Description                               |
|------|-------------------------------------------|
| 0-20 | unsigned, Size of command buffer 1 \>\> 3 |

This register sets the size of the second command buffer.

### GPUREG_CMDBUF_ADDR0

| Bits | Description                                           |
|------|-------------------------------------------------------|
| 0-28 | unsigned, Physical address of command buffer 0 \>\> 3 |

This register sets the physical address of the first command buffer.

### GPUREG_CMDBUF_ADDR1

| Bits | Description                                           |
|------|-------------------------------------------------------|
| 0-28 | unsigned, Physical address of command buffer 1 \>\> 3 |

This register sets the physical address of the second command buffer.

### GPUREG_CMDBUF_JUMP0

| Bits | Description                                                       |
|------|-------------------------------------------------------------------|
| 0-31 | unsigned, Trigger (0 = idle, non-zero = execute command buffer 0) |

This register triggers a jump to the first command buffer.

### GPUREG_CMDBUF_JUMP1

| Bits | Description                                                       |
|------|-------------------------------------------------------------------|
| 0-31 | unsigned, Trigger (0 = idle, non-zero = execute command buffer 1) |

This register triggers a jump to the second command buffer.

### GPUREG_VSH_NUM_ATTR

| Bits | Description                                            |
|------|--------------------------------------------------------|
| 0-3  | unsigned, Number of vertex shader input attributes - 1 |

This register sets the number of vertex shader input attributes.

### GPUREG_VSH_COM_MODE

| Bits | Description |
|----|----|
| 0 | unsigned, Geometry shader configuration enabled (0 = disabled, 1 = enabled) |

This register sets whether to use the geometry shader configuration or reuse the vertex shader configuration for the geometry shader shading unit.
When disabled and the geometry unit is not in use, as configured by GPUREG_GEOSTAGE_CONFIG, uniforms, outmap mask, program code and swizzle data are propagated to the geometry shader unit.

### GPUREG_START_DRAW_FUNC0

| Bits | Description                                     |
|------|-------------------------------------------------|
| 0    | unsigned, Mode (0 = drawing, 1 = configuration) |
| 1-7  | 0x0                                             |

This register is related to drawing. When the mode value is set to 1, rendering is not performed properly. When set to 0, changes to the vertex shader configuration registers are not applied correctly. Because of this, it is usually initialized to 1, set to 0 immediately before triggering a draw, and set back to 1 immediately after triggering a draw.

### GPUREG_VSH_OUTMAP_TOTAL1

| Bits | Description                                                |
|------|------------------------------------------------------------|
| 0-3  | unsigned, Number of vertex shader output map registers - 1 |

This register sets the number of vertex shader output map registers.

### GPUREG_VSH_OUTMAP_TOTAL2

| Bits | Description                                                |
|------|------------------------------------------------------------|
| 0-3  | unsigned, Number of vertex shader output map registers - 1 |

This register sets the number of vertex shader output map registers.

### GPUREG_GSH_MISC0

| Bits | Description |
|----|----|
| 0-31 | unsigned, Misc data (0x00000001 = Reserved geometry shader subdivision in use, 0x01004302 = Particle system in use, 0 otherwise) |

This register configures miscellaneous geometry shader properties.

### GPUREG_GEOSTAGE_CONFIG2

| Bits | Description |
|----|----|
| 0 | unsigned, Function indicator (with vertex buffers: 0 = draw elements, 1 = draw arrays, without: 0 = not inputting, 1 = inputting vertex attribute data) |
| 8 | unsigned, Drawing triangle elements (0 = not, 1 = drawing triangle elements) |

This register configures the geometry stage of the GPU pipeline.

When using vertex buffers, bit 0 is set to 1 before drawing arrays, and cleared to 0 immediately after. When using immediate mode to directly input vertex attribute data, bit 0 is set to 1 before inputting vertex attribute data, and cleared to 0 immediately after. While bit 0 is set to 1, some register writes outside of the 0x200-0x254 and 0x280-0x2DF ranges may be processed incorrectly.

When using vertex buffers and drawing elements in triangles mode, bit 8 is set to 1, else it is set to 0.

### GPUREG_GSH_MISC1

| Bits | Description |
|----|----|
| 0-4 | unsigned, Reserved geometry shader subdivision type (2 = Loop, 3 = Catmull-Clark) |

This register configures the type of reserved geometry shader subdivision in use. The value is ignored when a subdivision is not in use.

### GPUREG_PRIMITIVE_CONFIG

| Bits | Description                                                |
|------|------------------------------------------------------------|
| 0-3  | unsigned, Number of vertex shader output map registers - 1 |
| 8-9  | unsigned, Primitive mode                                   |

This register configures primitive drawing.

Primitive mode value:

| Value | Description        |
|-------|--------------------|
| 0     | Triangles          |
| 1     | Triangle strip     |
| 2     | Triangle fan       |
| 3     | Geometry primitive |

### GPUREG_RESTART_PRIMITIVE

| Bits | Description                                       |
|------|---------------------------------------------------|
| 0    | unsigned, Trigger (0 = idle, 1 = reset primitive) |
| 1-31 | 0x0                                               |

This register triggers resetting primitive drawing.

## Shader registers

### GPUREG\_*SH*\_BOOLUNIFORM

| Bits  | Description                                                |
|-------|------------------------------------------------------------|
| 0     | unsigned, Boolean register b0 value (0 = false, 1 = true)  |
| 1     | unsigned, Boolean register b1 value (0 = false, 1 = true)  |
| 2     | unsigned, Boolean register b2 value (0 = false, 1 = true)  |
| 3     | unsigned, Boolean register b3 value (0 = false, 1 = true)  |
| 4     | unsigned, Boolean register b4 value (0 = false, 1 = true)  |
| 5     | unsigned, Boolean register b5 value (0 = false, 1 = true)  |
| 6     | unsigned, Boolean register b6 value (0 = false, 1 = true)  |
| 7     | unsigned, Boolean register b7 value (0 = false, 1 = true)  |
| 8     | unsigned, Boolean register b8 value (0 = false, 1 = true)  |
| 9     | unsigned, Boolean register b9 value (0 = false, 1 = true)  |
| 10    | unsigned, Boolean register b10 value (0 = false, 1 = true) |
| 11    | unsigned, Boolean register b11 value (0 = false, 1 = true) |
| 12    | unsigned, Boolean register b12 value (0 = false, 1 = true) |
| 13    | unsigned, Boolean register b13 value (0 = false, 1 = true) |
| 14    | unsigned, Boolean register b14 value (0 = false, 1 = true) |
| 15    | unsigned, Boolean register b15 value (0 = false, 1 = true) |
| 16-31 | 0x7FFF                                                     |

This register is used to set a shader unit's boolean registers.

### GPUREG\_*SH*\_INTUNIFORM_I*i*

| Bits  | Description                             |
|-------|-----------------------------------------|
| 0-7   | unsigned, Integer register i*i* X value |
| 8-15  | unsigned, Integer register i*i* Y value |
| 16-23 | unsigned, Integer register i*i* Z value |
| 24-31 | unsigned, Integer register i*i* W value |

These registers are used to set a shader unit's integer registers.

### GPUREG\_*SH*\_INPUTBUFFER_CONFIG

| Bits | Description |
|----|----|
| 0-3 | unsigned, Input vertex attributes - 1 |
| 8-15 | unsigned, Use reserved geometry shader subdivision (0 = don't use, 1 = use) (always 0 for vertex shaders) |
| 16-23 | 0x0 |
| 24-31 | unsigned, Use geometry shader (0x8 = use, 0xA0 = don't use) (always 0xA0 for vertex shaders) |

This register is used to configure a shader unit's input buffer.

### GPUREG\_*SH*\_ENTRYPOINT

| Bits  | Description                                        |
|-------|----------------------------------------------------|
| 0-15  | unsigned, Code entry point offset, in 32-bit words |
| 16-31 | 0x7FFF                                             |

This register sets a shader unit's code entry point.

For geometry shaders, this sets the entry point for the single shader unit which can be dedicated to running geometry shaders, regardless of the current geometry stage mode. This is means that while this register is normally used to set the geometry shader entry point, it can also be used to set this single shader unit to run from a different entry point than the other three, even when running a vertex shader.

For vertex shaders, this sets the entry point for the shader units set to vertex shader mode. Depending on the current geometry stage mode this can include either all 4 shader units or just 3 of them.

### GPUREG\_*SH*\_ATTRIBUTES_PERMUTATION_LOW

| Bits  | Description                                       |
|-------|---------------------------------------------------|
| 0-3   | unsigned, Vertex attribute 0 input register index |
| 4-7   | unsigned, Vertex attribute 1 input register index |
| 8-11  | unsigned, Vertex attribute 2 input register index |
| 12-15 | unsigned, Vertex attribute 3 input register index |
| 16-19 | unsigned, Vertex attribute 4 input register index |
| 20-23 | unsigned, Vertex attribute 5 input register index |
| 24-27 | unsigned, Vertex attribute 6 input register index |
| 28-31 | unsigned, Vertex attribute 7 input register index |

This register sets the shader unit input register index which will correspond to each attribute contained by the input buffer (which in the case of geometry shaders is the vertex shader output buffer) for the first 8 attributes. For example, having bits 0-3 set to 5 means that, in the shader program, v5 will contain the input buffer's 1st attribute.

### GPUREG\_*SH*\_ATTRIBUTES_PERMUTATION_HIGH

| Bits  | Description                                        |
|-------|----------------------------------------------------|
| 0-3   | unsigned, Vertex attribute 8 input register index  |
| 4-7   | unsigned, Vertex attribute 9 input register index  |
| 8-11  | unsigned, Vertex attribute 10 input register index |
| 12-15 | unsigned, Vertex attribute 11 input register index |
| 16-19 | unsigned, Vertex attribute 12 input register index |
| 20-23 | unsigned, Vertex attribute 13 input register index |
| 24-27 | unsigned, Vertex attribute 14 input register index |
| 28-31 | unsigned, Vertex attribute 15 input register index |

This register sets the shader unit input register index which will correspond to each attribute contained by the input buffer (which in the case of geometry shaders is the vertex shader output buffer) for attributes 8 through 15. For example, having bits 0-3 set to 5 means that, in the shader program, v5 will contain the input buffer's 9th attribute.

### GPUREG\_*SH*\_OUTMAP_MASK

| Bits | Description |
|----|----|
| 0 | unsigned, Output register o0 enabled (0 = disabled, 1 = enabled) |
| 1 | unsigned, Output register o1 enabled (0 = disabled, 1 = enabled) |
| 2 | unsigned, Output register o2 enabled (0 = disabled, 1 = enabled) |
| 3 | unsigned, Output register o3 enabled (0 = disabled, 1 = enabled) |
| 4 | unsigned, Output register o4 enabled (0 = disabled, 1 = enabled) |
| 5 | unsigned, Output register o5 enabled (0 = disabled, 1 = enabled) |
| 6 | unsigned, Output register o6 enabled (0 = disabled, 1 = enabled) |
| 7 | unsigned, Output register o7 enabled (0 = disabled, 1 = enabled) (vertex shader only) |
| 8 | unsigned, Output register o8 enabled (0 = disabled, 1 = enabled) (vertex shader only) |
| 9 | unsigned, Output register o9 enabled (0 = disabled, 1 = enabled) (vertex shader only) |
| 10 | unsigned, Output register o10 enabled (0 = disabled, 1 = enabled) (vertex shader only) |
| 11 | unsigned, Output register o11 enabled (0 = disabled, 1 = enabled) (vertex shader only) |
| 12 | unsigned, Output register o12 enabled (0 = disabled, 1 = enabled) (vertex shader only) |
| 13 | unsigned, Output register o13 enabled (0 = disabled, 1 = enabled) (vertex shader only) |
| 14 | unsigned, Output register o14 enabled (0 = disabled, 1 = enabled) (vertex shader only) |
| 15 | unsigned, Output register o15 enabled (0 = disabled, 1 = enabled) (vertex shader only) |
| 16-31 | 0x0 |

This register toggles a shader unit's output registers.

### GPUREG\_*SH*\_CODETRANSFER_END

| Bits | Description                                                 |
|------|-------------------------------------------------------------|
| 0-31 | unsigned, Signal transfer end (0 = idle, non-zero = signal) |

This register's value should be set to 1 in order to finalize the transfer of shader code.

### GPUREG\_*SH*\_FLOATUNIFORM_INDEX

| Bits | Description |
|----|----|
| 0-7 | unsigned, Target floating-point register index (range 0-95, where 0 = c0 and 95 = c95) |
| 31 | unsigned, Transfer mode (0 = float1.7.16, 1 = float1.8.23) |

This register sets the shader unit's target floating-point register and transfer mode for the data transfer system. As such it is typically used right before [GPUREG\_*SH*\_FLOATUNIFORM_DATA*i*](#gpureg_sh_floatuniform_datai "wikilink"), though writing to one register does not make writing to the other mandatory.

### GPUREG\_*SH*\_FLOATUNIFORM_DATA*i*

| Bits | Description                            |
|------|----------------------------------------|
| 0-31 | Floating-point register component data |

This register is used to set the components of a shader unit's floating-point registers, each having 4 components. The data format which should be written to it depends on the transfer mode set with [GPUREG\_*SH*\_FLOATUNIFORM_INDEX](#gpureg_sh_floatuniform_index "wikilink"). This register functions as a FIFO queue: after each time a 4-component uniform register is successfully set, the target register index is incremented, meaning that groups of uniforms with contiguous register IDs can be set with only one initial write to [GPUREG\_*SH*\_FLOATUNIFORM_INDEX](#gpureg_sh_floatuniform_index "wikilink").

- In the case of float24 transfer mode, data should be sent by writing three words which are the concatenation of the float24 value of the uniform register's 4 components, in the reverse order. Assuming each letter corresponds to 4 bits, the format becomes:
  - first word : ZZWWWWWW
  - second word : YYYYZZZZ
  - third word : XXXXXXYY
- In the case of float32 transfer mode, data should be sent by writing four words which are each the float32 value of the uniform register's 4 components, in the reverse order.

### GPUREG\_*SH*\_CODETRANSFER_INDEX

| Bits | Description                         |
|------|-------------------------------------|
| 0-11 | unsigned, Target shader code offset |

This register is used to set the offset at which upcoming shader code data transferred through [GPUREG\_*SH*\_CODETRANSFER_DATA*i*](#gpureg_sh_codetransfer_datai "wikilink") should be written.

### GPUREG\_*SH*\_CODETRANSFER_DATA*i*

| Bits | Description                       |
|------|-----------------------------------|
| 0-31 | unsigned, Shader instruction data |

This register is used to transfer shader code data. This register behaves as a FIFO queue: each write to this register writes the provided value to the GPU shader code memory bank at the offset initially set by [GPUREG\_*SH*\_CODETRANSFER_INDEX](#gpureg_sh_codetransfer_index "wikilink"). The offset in question is incremented after each write to this register.

### GPUREG\_*SH*\_OPDESCS_INDEX

| Bits | Description                                       |
|------|---------------------------------------------------|
| 0-11 | unsigned, Target shader operand descriptor offset |

This register is used to set the offset at which upcoming shader operand descriptor data transferred through [GPUREG\_*SH*\_OPDESCS_DATA*i*](#gpureg_sh_opdescs_datai "wikilink") should be written.

### GPUREG\_*SH*\_OPDESCS_DATA*i*

| Bits | Description                              |
|------|------------------------------------------|
| 0-31 | unsigned, Shader operand descriptor data |

This register is used to transfer shader operand descriptor data. This register behaves as a FIFO queue: each write to this register writes the provided value to the GPU shader operand descriptor memory bank at the offset initially set by [GPUREG\_*SH*\_OPDESCS_INDEX](#gpureg_sh_opdescs_index "wikilink"). The offset in question is incremented after each write to this register.

[Category:GPU](Category:GPU "wikilink")
