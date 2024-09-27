+++
title = 'Pitfalls'
categories = ["GPU"]
+++

This page collects some oddities and pitfalls of the PICA GPU which is
used in the 3DS.

## Internal Registers

### Vertex attribute alignment

Vertex components which are defined through
[GPUREG_ATTRIBBUFFERi_CONFIG1](GPU/Internal_Registers#gpureg_attribbufferi_config1 "wikilink")
will be accessed aligned by the GPU.

- Vertex attributes will be aligned to their component element size.
- Padding attributes (Component type \> 11) will always aligned to 4
  byte offets into the buffer.
- The stride which is passed to the GPU should be passed unaligned.

### Vertex stride in GPUREG_ATTRIBBUFFERi_CONFIG2

The vertex stride set in
[GPUREG_ATTRIBBUFFERi_CONFIG2](GPU/Internal_Registers#gpureg_attribbufferi_config2 "wikilink")
must match the actual size of the vertex contained in the buffer or the
PICA will freeze or it won't draw anything.

If you want to use a different stride you have to pad the data
accordingly with padding attributes.

### Output mapping in GPUREG_SH_OUTMAP_MASK

The output masking in
[GPUREG_SH_OUTMAP_MASK](GPU/Internal_Registers#gpureg_sh_outmap_mask "wikilink")
influences how the registers starting at
[GPUREG_SH_OUTMAP_Oi](GPU/Internal_Registers#gpureg_sh_outmap_oi "wikilink")
map to outputs in the shader.

If an output is disabled in
[GPUREG_SH_OUTMAP_MASK](GPU/Internal_Registers#gpureg_sh_outmap_mask "wikilink")
it means that no slot in the
[GPUREG_SH_OUTMAP_Oi](GPU/Internal_Registers#gpureg_sh_outmap_oi "wikilink")
registers is consumed.
[GPUREG_SH_OUTMAP_TOTAL](GPU/Internal_Registers#gpureg_sh_outmap_total "wikilink")
configures the number of used consecutive slots in the outmap.

Example:

| Register               | Value      | Meaning                |
|------------------------|------------|------------------------|
| GPUREG_SH_OUTMAP_TOTAL | 0x00000002 | 2 outputs enabled      |
| GPUREG_SH_OUTMAP_MASK  | 0x00000011 | o0 enabled, o4 enabled |
| GPUREG_SH_OUTMAP_O0    | 0x03020100 | o0 = pos.xyzw          |
| GPUREG_SH_OUTMAP_O1    | 0x0B0A0908 | o4 = color.rgba        |
| GPUREG_SH_OUTMAP_O2    | ...        | (unused)               |

## Shaders

### Configued Output components must be written exactly once

Each configured output component has to be written exactly once or the
PICA freezes.

### MOVA instructions can't be adjacent

Having 2 consecutive MOVA instructions will freeze the PICA. This can be
relaxed by placing a NOP between 2 MOVAs or by rearranging the code.

[Category:GPU](Category:GPU "wikilink")
