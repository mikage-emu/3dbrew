+++
title = 'SHBIN'
categories = ["File formats"]
+++

The SHBIN (SHader BINary) format is used to contain compiled and linked
shader programs. These can include vertex shaders and geometry shaders.
In commercial applications, SHBIN files can be found as standalone files
with the extension .shbin, or within container formats like, for
example, [CGFX](CGFX "wikilink") (with the extension .bcsdr). They are
typically compiled from .vsh files, .gsh files, and sometimes .asm
files.

A SHBIN's structure starts with a binary header (DVLB), then a single
program header (DVLP), then one or more executable headers DVLE(s). The
binary header specifies the number and location of DVLEs. The program
header specifies the generic parts of the shader (i.e. the shader
program data, the operand descriptor data, and a filename symbol table).
The executable headers specify the contextual details (i.e. entry point,
constant values, debug symbols, etc). There may be multiple executable
headers, so in this sense multiple shaders sharing the same program code
can be stored in a single SHBIN. Hence for the following, note the
distinction between "program" and "executable".

For a description of the instruction set, see the following page :
[Shader Instruction Set](GPU/Shader_Instruction_Set "wikilink")

## Header

| Offset | Size   | Description                                                                       |
|--------|--------|-----------------------------------------------------------------------------------|
| 0x0    | 0x4    | Magic "DVLB"                                                                      |
| 0x4    | 0x4    | N = number of DVLEs in SHBIN                                                      |
| 0x8    | 0x4\*N | DVLE offset table; each offset is a u32 relative to the start of the DVLB section |
|        |        |                                                                                   |

The DVLP section comes directly after the binary header.

## DVLP

| Offset | Size | Description                                                             |
|--------|------|-------------------------------------------------------------------------|
| 0x0    | 0x4  | Magic "DVLP"                                                            |
| 0x4    | 0x4  | Unknown, same value as in DVLE. (Likely a version number)               |
| 0x8    | 0x4  | Offset (relative to DVLP start) to the compiled shader binary blob      |
| 0xC    | 0x4  | Size of compiled shader binary blob, in words                           |
| 0x10   | 0x4  | Offset (relative to DVLP start) to operand descriptor table             |
| 0x14   | 0x4  | Number of operand descriptor table entries (each entry is 8-bytes long) |
| 0x18   | 0x4  | Unknown (Same value as offset to filename symbol table?)                |
| 0x1C   | 0x4  | Unknown (Always zero?)                                                  |
| 0x20   | 0x4  | Offset (relative to DVLP start) to filename symbol table                |
| 0x24   | 0x4  | Size of filename symbol table                                           |
|        |      |                                                                         |

## DVLE

| Offset | Size | Description                                                                                                             |
|--------|------|-------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x4  | Magic "DVLE"                                                                                                            |
| 0x4    | 0x2  | Unknown, same value as in DVLP. (Likely a version number)                                                               |
| 0x6    | 0x1  | Shader type (0x0 = vertex shader, 0x1 = geometry shader; might contain other flags)                                     |
| 0x7    | 0x1  | true = merge vertex and geometry shader outmaps (geometry shader)                                                       |
| 0x8    | 0x4  | Executable's main offset in binary blob (in words)                                                                      |
| 0xC    | 0x4  | Executable's program's endmain offset in binary blob (in words)                                                         |
| 0x10   | 0x2  | Bitmask of used input registers                                                                                         |
| 0x12   | 0x2  | Bitmask of used output registers                                                                                        |
| 0x14   | 0x1  | Geometry shader type (point = 0x0, variable/subdivide = 0x1, fixed/particle = 0x2)                                      |
| 0x15   | 0x1  | Starting float constant register number for storing the fixed-size primitive vertex array (geometry shader, fixed mode) |
| 0x16   | 0x1  | Number of fully-defined vertices in the variable-size primitive vertex array (geometry shader, variable mode)           |
| 0x17   | 0x1  | Number of vertices in the fixed-size primitive vertex array (geometry shader, fixed mode)                               |
| 0x18   | 0x4  | Offset (relative to DVLE start) to constant table                                                                       |
| 0x1C   | 0x4  | Number of entries in constant table (each entry is 0x14-byte long)                                                      |
| 0x20   | 0x4  | Offset (relative to DVLE start) to label table                                                                          |
| 0x24   | 0x4  | Number of entries in label table (each entry is 0x10-byte long)                                                         |
| 0x28   | 0x4  | Offset (relative to DVLE start) to output register table                                                                |
| 0x2C   | 0x4  | Number of entries in output register table (each entry is 0x8-byte long)                                                |
| 0x30   | 0x4  | Offset (relative to DVLE start) to uniform table                                                                        |
| 0x34   | 0x4  | Number of entries in uniform table (each entry is 0x8-byte long)                                                        |
| 0x38   | 0x4  | Offset (relative to DVLE start) to symbol table                                                                         |
| 0x3C   | 0x4  | Size of symbol table (in bytes)                                                                                         |
|        |      |                                                                                                                         |

### Label Table Entry

| Offset | Size | Description                                                                       |
|--------|------|-----------------------------------------------------------------------------------|
| 0x0    | 0x2  | Label ID                                                                          |
| 0x0    | 0x2  | Unknown (always 1?)                                                               |
| 0x4    | 0x4  | Offset (relative to shader program blob start) to label's location, in words      |
| 0x8    | 0x4  | Size of label's location (in words). 0xFFFFFFFF/(uint32_t)-1 if there is no size. |
| 0xC    | 0x4  | Offset (relative to DVLE symbol table start) to label's symbol                    |
|        |      |                                                                                   |

### Constant Table Entry

Each executable's constants are stored in a constant table. This
information is used by ctrulib's SHDR framework to automatically send
those values to the GPU when changing to a given program. An entry is
constituted by a header and the constant data, the latter of which uses
a format specific to the constant type.

| Offset | Size | Description                             |
|--------|------|-----------------------------------------|
| 0x0    | 0x1  | Constant type (0=bool, 1=ivec4, 2=vec4) |
| 0x2    | 0x1  | Constant register ID                    |

Corresponding constant entry formats:

| Offset | Size | Description                  |
|--------|------|------------------------------|
| 0x0    | 0x1  | 0x0                          |
| 0x2    | 0x1  | Boolean constant register ID |
| 0x4    | 0x1  | Value (boolean)              |

| Offset | Size | Description                  |
|--------|------|------------------------------|
| 0x0    | 0x1  | 0x1                          |
| 0x2    | 0x1  | Integer constant register ID |
| 0x4    | 0x1  | x (u8)                       |
| 0x5    | 0x1  | y (u8)                       |
| 0x6    | 0x1  | z (u8)                       |
| 0x7    | 0x1  | w (u8)                       |

| Offset | Size | Description                         |
|--------|------|-------------------------------------|
| 0x0    | 0x1  | 0x2                                 |
| 0x2    | 0x1  | floating-point constant register ID |
| 0x4    | 0x4  | x (float24)                         |
| 0x8    | 0x4  | y (float24)                         |
| 0xC    | 0x4  | z (float24)                         |
| 0x10   | 0x4  | w (float24)                         |

### Output Table Entry

| Offset | Size | Description                                                                         |
|--------|------|-------------------------------------------------------------------------------------|
| 0x0    | 0x2  | Output type (see table below)                                                       |
| 0x2    | 0x2  | Register ID                                                                         |
| 0x4    | 0x2  | Output attribute component mask (e.g. 5=xz)                                         |
| 0x6    | 0x2  | Unknown (Consistently the same number throughout the DVLE, may vary between DVLEs?) |
|        |      |                                                                                     |

Output types :

| Type | Description       |
|------|-------------------|
| 0x0  | result.position   |
| 0x1  | result.normalquat |
| 0x2  | result.color      |
| 0x3  | result.texcoord0  |
| 0x4  | result.texcoord0w |
| 0x5  | result.texcoord1  |
| 0x6  | result.texcoord2  |
| 0x7  | ?                 |
| 0x8  | result.view       |

### Uniform Table Entry

Keep in mind that the usage of the term "Uniform" here is used as
[defined by
Nvidia](https://developer.download.nvidia.com/CgTutorial/cg_tutorial_chapter03.html)
(variable who obtains its initial value from an external environment)
and not as defined by RenderMan/GLSL (variables whose values are
constant over a shaded surface).

The uniform table contains a list of all registers whose initial values
are derived by an external source along with their layout and associated
symbol.

| Offset | Size | Description                                                                       |
|--------|------|-----------------------------------------------------------------------------------|
| 0x0    | 0x4  | Offset (relative to DVLE symbol table start) to variable's symbol                 |
| 0x4    | 0x2  | Register index of the start of the uniform                                        |
| 0x6    | 0x2  | Register index of the end of the uniform (equal to start register for non-arrays) |
|        |      |                                                                                   |

The register indices refer to a unified register space for non-output
registers. The mapping of register index values to registers is the
following:

| Values    | Registers |
|-----------|-----------|
| 0x00-0x0F | v0-v15    |
| 0x10-0x6F | c0-c95    |
| 0x70-0x73 | i0-i3     |
| 0x78-0x87 | b0-b15    |
|           |           |

## DVOJ

There is another file format for shaders, which starts with the string
"DVOJ". This format seems to be used for unlinked shader objects. It
seems likely that one or multiple DVOJs can be linked to a DVLB file,
similarly to the C compilation model.

Structurally, a DVOJ header captures all information there is about a
single shader instance. It uses the same fields like the DVLB, DVLP, and
DVLE structures, but also stores two unknown blocks of data. It seems
that the entry point of a DVOJ is always the first shader instruction.

All offsets in the following table are given relative to the DVOJ start.

| Offset | Size | Description                                                                                                                                                          |
|--------|------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00   | 0x4  | Magic "DVOJ"                                                                                                                                                         |
| 0x04   | 0x2  | Unknown. (Likely a version number)                                                                                                                                   |
| 0x06   | 0x1  | Shader type (0x0 = vertex shader, 0x1 = geometry shader; might contain other flags)                                                                                  |
| 0x07   | 0x1  | true = merge vertex and geometry shader outmaps (geometry shader)                                                                                                    |
| 0x08   | 0x2  | Bitmask of used input registers.                                                                                                                                     |
| 0x10   | 0x2  | Bitmask of used output registers.                                                                                                                                    |
| 0x0C   | 0x4  | Padding? (usually 0xFFFFFFFF)                                                                                                                                        |
| 0x10   | 0x4  | Offset to constant table                                                                                                                                             |
| 0x14   | 0x4  | Number of entries in constant table (each entry is 0x14-byte long)                                                                                                   |
| 0x18   | 0x4  | Offset to label table                                                                                                                                                |
| 0x1C   | 0x4  | Number of entries in label table (each entry is 0x10-byte long)                                                                                                      |
| 0x20   | 0x4  | Offset to the compiled shader binary blob                                                                                                                            |
| 0x24   | 0x4  | Size of compiled shader binary blob, in words                                                                                                                        |
| 0x28   | 0x4  | Offset to operand descriptor table                                                                                                                                   |
| 0x2C   | 0x4  | Number of operand descriptor table entries (each entry is 8-bytes long)                                                                                              |
| 0x30   | 0x4  | Offset to unknown block 1                                                                                                                                            |
| 0x34   | 0x4  | Number of items in unknown block 1 (each item is 8-byte long). This seems to be equal to the total number of instructions.                                           |
| 0x38   | 0x4  | Offset to unknown block 2                                                                                                                                            |
| 0x3C   | 0x4  | Number of items in unknown block 2 (each item is 12-byte long). This seems to be equal to the number of instructions taking arguments (i.e. excluding NOP, END, ...) |
| 0x40   | 0x4  | Offset to output register table                                                                                                                                      |
| 0x44   | 0x4  | Number of entries in output register table (each entry is 0x8-byte long)                                                                                             |
| 0x48   | 0x4  | Offset to uniform table                                                                                                                                              |
| 0x4C   | 0x4  | Number of entries in uniform table (each entry is 0x8-byte long)                                                                                                     |
| 0x50   | 0x4  | Offset to symbol table                                                                                                                                               |
| 0x54   | 0x4  | Size of symbol table (in bytes)                                                                                                                                      |
|        |      |                                                                                                                                                                      |

### Unknown Block 1 Item

A wild guess is that this denotes shader source line information. Take
the information with a grain of salt, though, since it hasn't been
backed by any empirical data so far.

The index N of the item within Unknown Block 1 corresponds to the Nth
instruction in the shader binary.

| Offset | Size | Description                                                                        |
|--------|------|------------------------------------------------------------------------------------|
| 0x0    | 0x4  | Byte offset within symbol table pointing to a source shader filename.              |
| 0x4    | 0x4  | Line number of the corresponding shader instruction within the shader source code. |
|        |      |                                                                                    |

### Unknown Block 2 Item

| Offset | Size | Description                                                                                                         |
|--------|------|---------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x4  | This seems to be an index of a shader instruction. All non-nullary instructions seem to be referenced exactly once. |
| 0x4    | 0x4  |                                                                                                                     |
| 0x8    | 0x4  |                                                                                                                     |
|        |      |                                                                                                                     |

[Category:File formats](Category:File_formats "wikilink")
