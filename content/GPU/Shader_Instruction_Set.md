+++
title = 'Shader Instruction Set'
categories = ["GPU"]
+++

## Overview

A compiled shader binary is comprised of two parts : the main
instruction sequence and the operand descriptor table. These are both
sent to the GPU around the same time but using separate [GPU
Commands](GPU/Internal_Registers "wikilink"). Instructions (such as
format 1 instruction) may reference operand descriptors. When such is
the case, the operand descriptor ID is the offset, in words, of the
descriptor within the table. Both instructions and descriptors are coded
in little endian. Basic implementations of the following specification
can be found at [1](https://github.com/smealum/aemstro) and
[2](https://github.com/neobrain/nihstro). The instruction set seems to
have been heavily inspired by Microsoft's vs_3_0
[3](http://msdn.microsoft.com/en-us/library/windows/desktop/bb172938%28v=vs.85%29.aspx)
and the Direct3D shader code
[4](https://msdn.microsoft.com/en-us/library/windows/hardware/ff552891%28v=vs.85%29.aspx).
Please note that this page is being written as the instruction set is
reverse engineered; as such it may very well contain mistakes.

Debug information found in the code.bin of "Ironfall: Invasion" suggests
that there may not be more than 512 instructions and 128 operand
descriptors in a shader.

## Nomenclature

- opcode names with I appended to them are the same as their non-I
  version, except they use the inverted instruction format, giving 7
  bits to SRC2 (and access to constant registers) and 5 bits to SRC1

<!-- -->

- opcode names with U appended to them are the same as their non-U
  version, except they are executed conditionally based on the value of
  a constant boolean register.

<!-- -->

- opcode names with C appended to them are the same as their non-C
  version, except they are executed conditionally based on a logical
  expression specified in the instruction.

## Instruction formats

Format 1 : (used for register operations)

| Offset | Size (bits) | Description                             |
|--------|-------------|-----------------------------------------|
| 0x0    | 0x7         | Operand descriptor ID (DESC)            |
| 0x7    | 0x5         | Source 2 register (SRC2)                |
| 0xC    | 0x7         | Source 1 register (SRC1)                |
| 0x13   | 0x2         | Address register index for SRC1 (IDX_1) |
| 0x15   | 0x5         | Destination register (DST)              |
| 0x1A   | 0x6         | Opcode                                  |

Format 1i : (used for register operations)

| Offset | Size (bits) | Description                             |
|--------|-------------|-----------------------------------------|
| 0x0    | 0x7         | Operand descriptor ID (DESC)            |
| 0x7    | 0x7         | Source 2 register (SRC2)                |
| 0xE    | 0x5         | Source 1 register (SRC1)                |
| 0x13   | 0x2         | Address register index for SRC2 (IDX_2) |
| 0x15   | 0x5         | Destination register (DST)              |
| 0x1A   | 0x6         | Opcode                                  |

Format 1u : (used for unary register operations)

| Offset | Size (bits) | Description                             |
|--------|-------------|-----------------------------------------|
| 0x0    | 0x7         | Operand descriptor ID (DESC)            |
| 0xC    | 0x7         | Source 1 register (SRC1)                |
| 0x13   | 0x2         | Address register index for SRC1 (IDX_1) |
| 0x15   | 0x5         | Destination register (DST)              |
| 0x1A   | 0x6         | Opcode                                  |

Format 1c : (used for comparison operations)

| Offset | Size (bits) | Description                             |
|--------|-------------|-----------------------------------------|
| 0x0    | 0x7         | Operand descriptor ID (DESC)            |
| 0x7    | 0x5         | Source 2 register (SRC2)                |
| 0xC    | 0x7         | Source 1 register (SRC1)                |
| 0x13   | 0x2         | Address register index for SRC1 (IDX_1) |
| 0x15   | 0x3         | Comparison operator for Y (CMPY)        |
| 0x18   | 0x3         | Comparison operator for X (CMPX)        |
| 0x1B   | 0x5         | Opcode                                  |

Format 2 : (used for flow control instructions)

| Offset | Size (bits) | Description                         |
|--------|-------------|-------------------------------------|
| 0x0    | 0x8         | Number of instructions (NUM)        |
| 0xA    | 0xC         | Destination offset (in words) (DST) |
| 0x16   | 0x2         | Condition boolean operator (CONDOP) |
| 0x18   | 0x1         | Y reference bit (REFY)              |
| 0x19   | 0x1         | X reference bit (REFX)              |
| 0x1A   | 0x6         | Opcode                              |

Format 3 : (used for constant-based conditional flow control
instructions)

| Offset | Size (bits) | Description                         |
|--------|-------------|-------------------------------------|
| 0x0    | 0x8         | Number of instructions ? (NUM)      |
| 0xA    | 0xC         | Destination offset (in words) (DST) |
| 0x16   | 0x4         | Constant ID (BOOL/INT)              |
| 0x1A   | 0x6         | Opcode                              |

Format 4 : (used for SETEMIT)

| Offset | Size (bits) | Description                         |
|--------|-------------|-------------------------------------|
| 0x16   | 0x1         | Winding flag (FLAG_WINDING)         |
| 0x17   | 0x1         | Primitive emit flag (FLAG_PRIMEMIT) |
| 0x18   | 0x2         | Vertex ID (VTXID)                   |
| 0x1A   | 0x6         | Opcode                              |

Format 5 : (used for MAD)

| Offset | Size (bits) | Description                             |
|--------|-------------|-----------------------------------------|
| 0x0    | 0x5         | Operand descriptor ID (DESC)            |
| 0x5    | 0x5         | Source 3 register (SRC3)                |
| 0xA    | 0x7         | Source 2 register (SRC2)                |
| 0x11   | 0x5         | Source 1 register (SRC1)                |
| 0x16   | 0x2         | Address register index for SRC2 (IDX_2) |
| 0x18   | 0x5         | Destination register (DST)              |
| 0x1D   | 0x3         | Opcode                                  |

Format 5i : (used for MADI)

| Offset | Size (bits) | Description                             |
|--------|-------------|-----------------------------------------|
| 0x0    | 0x5         | Operand descriptor ID (DESC)            |
| 0x5    | 0x7         | Source 3 register (SRC3)                |
| 0xC    | 0x5         | Source 2 register (SRC2)                |
| 0x11   | 0x5         | Source 1 register (SRC1)                |
| 0x16   | 0x2         | Address register index for SRC3 (IDX_3) |
| 0x18   | 0x5         | Destination register (DST)              |
| 0x1D   | 0x3         | Opcode                                  |

## Instructions

Unless noted otherwise, SRC1 and SRC2 refer to their respectively
indexed float\[4\] registers (after swizzling). Similarly, DST refers to
its indexed register modulo destination component masking, i.e. an
expression like DST=SRC1 might actually just set DST.y to SRC1.y.

| Opcode    | Format       | Name    | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
|-----------|--------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00      | 1            | ADD     | Adds two vectors component by component; DST\[i\] = SRC1\[i\]+SRC2\[i\] for all i                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| 0x01      | 1            | DP3     | Computes dot product on 3-component vectors; DST = SRC1.SRC2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| 0x02      | 1            | DP4     | Computes dot product on 4-component vectors; DST = SRC1.SRC2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| 0x03      | 1            | DPH     | Computes dot product on a 3-component vector with 1.0 appended to it and a 4-component vector; DST = SRC1.SRC2 (with SRC1 homogenous)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| 0x04      | 1            | DST     | Equivalent to Microsoft's [dst](https://msdn.microsoft.com/en-us/library/windows/desktop/bb219790.aspx) instruction: DST = {1, SRC1\[1\]\*SRC2\[1\], SRC1\[2\], SRC2\[3\]}                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| 0x05      | 1u           | EX2     | Computes SRC1's first component exponent with base 2; DST\[i\] = EXP2(SRC1\[0\]) for all i                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| 0x06      | 1u           | LG2     | Computes SRC1's first component logarithm with base 2; DST\[i\] = LOG2(SRC1\[0\]) for all i                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| 0x07      | 1u           | LITP    | Partial lighting computation, may be used in conjunction with EX2, LG2, etc to compute the vertex lighting coefficients. See the [Microsoft](https://msdn.microsoft.com/en-us/library/windows/desktop/bb174703.aspx) and [ARB](https://registry.khronos.org/OpenGL/extensions/ARB/ARB_vertex_program.txt) docs for more information on how to implement the full lit function; DST = {max(src.x, 0), max(min(src.y, 127.9961), -127.9961), 0, max(src.w, 0)} and it sets the cmp.x and cmp.y flags based on if the respective src.x and src.w components are \>= 0.                                                            |
| 0x08      | 1            | MUL     | Multiplies two vectors component by component; DST\[i\] = SRC1\[i\].SRC2\[i\] for all i                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| 0x09      | 1            | SGE     | Sets output if SRC1 is greater than or equal to SRC2; DST\[i\] = (SRC1\[i\] \>= SRC2\[i\]) ? 1.0 : 0.0 for all i                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| 0x0A      | 1            | SLT     | Sets output if SRC1 is strictly less than SRC2; DST\[i\] = (SRC1\[i\] \< SRC2\[i\]) ? 1.0 : 0.0 for all i                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| 0x0B      | 1u           | FLR     | Computes SRC1's floor component by component; DST\[i\] = FLOOR(SRC1\[i\]) for all i                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| 0x0C      | 1            | MAX     | Takes the max of two vectors, component by component; DST\[i\] = MAX(SRC1\[i\], SRC2\[i\]) for all i                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| 0x0D      | 1            | MIN     | Takes the min of two vectors, component by component; DST\[i\] = MIN(SRC1\[i\], SRC2\[i\]) for all i                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| 0x0E      | 1u           | RCP     | Computes the reciprocal of the vector's first component; DST\[i\] = 1/SRC1\[0\] for all i                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| 0x0F      | 1u           | RSQ     | Computes the reciprocal of the square root of the vector's first component; DST\[i\] = 1/sqrt(SRC1\[0\]) for all i                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| 0x10      | ?            | ???     | ?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| 0x11      | ?            | ???     | ?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| 0x12      | 1u           | MOVA    | Move to address register; Casts the float value given by SRC1 to an integer (truncating the fractional part) and assigns the result to (a0.x, a0.y, _, _), respecting the destination component mask.                                                                                                                                                                                                                                                                                                                                                                                                                        |
| 0x13      | 1u           | MOV     | Moves value from one register to another; DST = SRC1.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| 0x14      | ?            | ???     | ?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| 0x15      | ?            | ???     | ?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| 0x16      | ?            | ???     | ?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| 0x17      | ?            | ???     | ?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| 0x18      | 1i           | DPHI    | Computes dot product on a 3-component vector with 1.0 appended to it and a 4-component vector; DST = SRC1.SRC2 (with SRC1 homogenous)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| 0x19      | 1i           | DSTI    | DST with sources swapped.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| 0x1A      | 1i           | SGEI    | Sets output if SRC1 is greater than or equal to SRC2; DST\[i\] = (SRC1\[i\] \>= SRC2\[i\]) ? 1.0 : 0.0 for all i                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| 0x1B      | 1i           | SLTI    | Sets output if SRC1 is strictly less than SRC2; DST\[i\] = (SRC1\[i\] \< SRC2\[i\]) ? 1.0 : 0.0 for all i                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| 0x1C      | ?            | ???     | ?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| 0x1D      | ?            | ???     | ?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| 0x1E      | ?            | ???     | ?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| 0x1F      | ?            | ???     | ?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| 0x20      | 0            | BREAK   | Breaks out of LOOP block; do not use while in nested IF/CALL block inside LOOP block.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| 0x21      | 0            | NOP     | Does literally nothing.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| 0x22      | 0            | END     | Signals the shader unit that processing for this vertex/primitive is done.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| 0x23      | 2            | BREAKC  | If condition (see [below](#Conditions "wikilink") for details) is true, then breaks out of LOOP block.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| 0x24      | 2            | CALL    | Jumps to DST and executes instructions until it reaches DST+NUM instructions                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| 0x25      | 2            | CALLC   | If condition (see [below](#Conditions "wikilink") for details) is true, then jumps to DST and executes instructions until it reaches DST+NUM instructions, else does nothing.                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| 0x26      | 3            | CALLU   | Jumps to DST and executes instructions until it reaches DST+NUM instructions if BOOL is true                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| 0x27      | 3            | IFU     | If condition BOOL is true, then executes instructions until DST, then jumps to DST+NUM; else, jumps to DST.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| 0x28      | 2            | IFC     | If condition (see [below](#Conditions "wikilink") for details) is true, then executes instructions until DST, then jumps to DST+NUM; else, jumps to DST                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| 0x29      | 3            | LOOP    | Loops over the code between itself and DST (inclusive), performing INT.x+1 iterations in total. First, aL is initialized to INT.y. After each iteration, aL is incremented by INT.z.                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| 0x2A      | 0 (no param) | EMIT    | (geometry shader only) Emits a vertex (and primitive if FLAG_PRIMEMIT was set in the corresponding SETEMIT). SETEMIT must be called before this.                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| 0x2B      | 4            | SETEMIT | (geometry shader only) Sets VTXID, FLAG_WINDING and FLAG_PRIMEMIT for the next EMIT instruction. VTXID is the ID of the vertex about to be emitted within the primitive, while FLAG_PRIMEMIT is zero if we are just emitting a single vertex and non-zero if are emitting a vertex and primitive simultaneously. FLAG_WINDING controls the output primitive's winding. Note that the output vertex buffer (which holds 4 vertices) is **not** cleared when the primitive is emitted, meaning that vertices from the previous primitive can be reused for the current one. (this is still a working hypothesis and unconfirmed) |
| 0x2C      | 2            | JMPC    | If condition (see [below](#Conditions "wikilink") for details) is true, then jumps to DST, else does nothing.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| 0x2D      | 3            | JMPU    | If condition BOOL is true, then jumps to DST, else does nothing. Having bit 0 of NUM = 1 will invert the test, jumping if BOOL is false instead.                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| 0x2E-0x2F | 1c           | CMP     | Sets booleans cmp.x and cmp.y based on the operand's x and y components and the CMPX and CMPY comparison operators respectively. See [below](#Comparison_operator "wikilink") for details about operators. It's unknown whether CMP respects the destination component mask or not.                                                                                                                                                                                                                                                                                                                                            |
| 0x30-0x37 | 5i           | MADI    | Multiplies two vectors and adds a third one component by component; DST\[i\] = SRC3\[i\] + SRC2\[i\].SRC1\[i\] for all i; this is not an FMA, the intermediate result is rounded                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| 0x38-0x3F | 5            | MAD     | Multiplies two vectors and adds a third one component by component; DST\[i\] = SRC3\[i\] + SRC2\[i\].SRC1\[i\] for all i; this is not an FMA, the intermediate result is rounded                                                                                                                                                                                                                                                                                                                                                                                                                                               |

## Operand descriptors

Sizes below are in bits, not bytes.

| Offset | Size | Description                                                 |
|--------|------|-------------------------------------------------------------|
| 0x0    | 0x4  | Destination component mask. Bit 3 = x, 2 = y, 1 = z, 0 = w. |
| 0x4    | 0x1  | Source 1 negation bit                                       |
| 0x5    | 0x8  | Source 1 component selector                                 |
| 0xD    | 0x1  | Source 2 negation bit                                       |
| 0xE    | 0x8  | Source 2 component selector                                 |
| 0x16   | 0x1  | Source 3 negation bit                                       |
| 0x17   | 0x8  | Source 3 component selector                                 |

Component selector :

| Offset | Size | Description       |
|--------|------|-------------------|
| 0x0    | 0x2  | Component 3 value |
| 0x2    | 0x2  | Component 2 value |
| 0x4    | 0x2  | Component 1 value |
| 0x6    | 0x2  | Component 0 value |

| Value | Component |
|-------|-----------|
| 0x0   | x         |
| 0x1   | y         |
| 0x2   | z         |
| 0x3   | w         |

The component selector enables swizzling. For example, component
selector 0x1B is equivalent to .xyzw, while 0x55 is equivalent to .yyyy.

Depending on the current shader opcode, source components are disabled
implicitly by setting the destination component mask. For example, ADD
o0.xy, r0.xyzw, r1.xyzw will not make use of r0's or r1's z/w
components, while DP4 o0.xy, r0.xyzw, r1.xyzw will use all input
components regardless of the used destination component mask.

## Relative addressing

| IDX raw value | Register name |
|---------------|---------------|
| 0x0           | None          |
| 0x1           | a0.x          |
| 0x2           | a0.y          |
| 0x3           | aL            |

There are 3 address registers: a0.x, a0.y and aL (loop counter). For
format 1 instructions, when IDX != 0, the value of the corresponding
address register is added to SRC1's value. For example, if IDX = 2, a0.y
= 3 and SRC1 = c8, then instead SRC1+a0.y = c11 will be used for the
instruction. It is only possible to use address registers on constant
registers, attempting to use them on input attribute or temporary
registers results in the address register being ignored (i.e. read as
zero).

a0.x and a0.y are set manually through the MOVA instruction by rounding
a float value to integer precision. Hence, they may take negative
values. The way out-of-bounds values behave when reading uniforms is as
follows:

- If the offset is out of byte bounds (less than -128 or greater than
  127), the offset is not applied (treated as 0).
- The offset is added to the constant register index and masked by 0x7F.
- If the resulting index is greater than 95, the result is (1, 1, 1, 1).
- Otherwise, the result is the value at the indexed constant register.

aL can only be set indirectly by the LOOP instruction. It is still
accessible and valid after exiting a LOOP block, though.

## Comparison operator

| CMPX/CMPY raw value | Operator name | Expression    |
|---------------------|---------------|---------------|
| 0x0                 | EQ            | src1 == src2  |
| 0x1                 | NE            | src1 != src2  |
| 0x2                 | LT            | src1 \< src2  |
| 0x3                 | LE            | src1 \<= src2 |
| 0x4                 | GT            | src1 \> src2  |
| 0x5                 | GE            | src1 \>= src2 |
| 0x6                 | ??            | true ?        |
| 0x7                 | ??            | true ?        |

6 and 7 seem to always return true.

## Conditions

A number of format 2 instructions are executed conditionally. These
conditions are based on two boolean registers which can be set with CMP
: cmp.x and cmp.y.

Conditional instructions include 3 parameters : CONDOP, REFX and REFY.
REFX and REFY are reference values which are tested for equality against
cmp.x and cmp.y, respectively. CONDOP describes how the final truth
value is constructed from the results of the two tests. There are four
conditional expression formats :

| CONDOP raw value | Expression                     | Description            |
|------------------|--------------------------------|------------------------|
| 0x0              | <nowiki>cmp.x == REFX          | cmp.y == REFY</nowiki> |
| 0x1              | cmp.x == REFX && cmp.y == REFY | AND                    |
| 0x2              | cmp.x == REFX                  | X                      |
| 0x3              | cmp.y == REFY                  | Y                      |

## Registers

| Name        | Format | Type    | Access     | Written by                | Description                                   |
|-------------|--------|---------|------------|---------------------------|-----------------------------------------------|
| v0-v15      | vector | float   | Read only  | Application/Vertex-stream | Input registers.                              |
| o0-o15      | vector | float   | Write only | Vertex shader             | Output registers.                             |
| r0-r15      | vector | float   | Read/Write | Vertex shader             | Temporary registers.                          |
| c0-c95      | vector | float   | Read only  | Application/Vertex-stream | Floating-point Constant registers.            |
| i0-i3       | vector | integer | Read only  | Application               | Integer Constant registers. (special purpose) |
| b0-b15      | scalar | boolean | Read only  | Application               | Boolean Constant registers. (special purpose) |
| a0.x & a0.y | scalar | integer | Use/Write  | Vertex shader             | Address registers.                            |
| aL          | scalar | integer | Use        | Vertex shader             | Loop count register.                          |

Input attribute registers store the per-vertex data given by the CPU and
hence are read-only.

Output registers hold the data to be passed to the later GPU stages and
are write-only. Each of the output register is assigned a semantic by
setting the corresponding
[GPU_Internal_Registers](GPU_Internal_Registers "wikilink"). Output
registers o7-o15 are only available in vertex shaders. Keep in mind that
writing to the same output register/component more than once appears
appears to cause problems (e.g. GPU hangs).

Temporary registers can be used for intermediate calculations and can be
both read and written.

Constant registers hold data uploaded by the application which remain
constant throughout all processed vertices. There are 96 float\[4\]
constant registers (c0-c95), eight boolean constant registers (b0-b7),
and four int\[4\] constant registers (i0-i3). Many shader instructions
which take float arguments can only provide the full 7 bits for one SRC
operand. All other source operands can only be used to refer to input
attributes or temporary registers and cannot be passed Floating-point
Constant registers.

Address registers and the Loop count register can be used to to provide
relative addressing for the designated SRC operand. For more
information, see the section on [relative
addressing](#Relative_addressing "wikilink").

DST mapping :

| DST raw value | Register name | Description          |
|---------------|---------------|----------------------|
| 0x0-0xF       | o0-o15        | Output registers.    |
| 0x10-0x1F     | r0-r15        | Temporary registers. |

SRC mapping :

| SRC raw value | Register name | Description                |
|---------------|---------------|----------------------------|
| 0x0-0xF       | v0-v15        | Input attribute registers. |
| 0x10-0x1F     | r0-r15        | Temporary registers.       |
| 0x20-0x7F     | c0-c95        | Constant registers.        |

## Floating-Point Behavior

The PICA200 is not IEEE-compliant. It has positive and negative
infinities and NaN, but does not seem to have negative 0. Input and
output subnormals are flushed to +0. The internal floating point format
seems to be the same as used in shader binaries: 1 sign bit, 7 exponent
bits, 16 (explicit) mantissa bits. Several instructions also have
behavior that differs from the IEEE functions. Here are the results from
some tests done on hardware (s = largest subnormal, n = smallest
positive normal):

| Computation     | Result | Notes                                                    |
|-----------------|--------|----------------------------------------------------------|
| inf \* 0        | 0      | Including inside MUL, MAD, DP4, etc.                     |
| NaN \* 0        | NaN    |                                                          |
| +inf - +inf     | NaN    | Indicates +inf is real inf, not FLT_MAX                  |
| rsq(rcp(-inf))  | +inf   | Indicates that there isn't -0.0.                         |
| rcp(-0)         | +inf   | no -0 so differs from IEEE where rcp(-0) = -inf          |
| rcp(0)          | +inf   |                                                          |
| rcp(+inf)       | 0      |                                                          |
| rcp(NaN)        | NaN    |                                                          |
| rsq(-0)         | +inf   | no -0 so differs from IEEE where rsq(-0) = -inf          |
| rsq(-2)         | NaN    |                                                          |
| rsq(+inf)       | 0      |                                                          |
| rsq(-inf)       | NaN    |                                                          |
| rsq(NaN)        | NaN    |                                                          |
| max(0, +inf)    | +inf   |                                                          |
| max(0, -inf)    | -inf   |                                                          |
| max(0, NaN)     | NaN    | max violates IEEE but match GLSL spec                    |
| max(NaN, 0)     | 0      |                                                          |
| max(-inf, +inf) | +inf   |                                                          |
| min(0, +inf)    | 0      |                                                          |
| min(0, -inf)    | -inf   |                                                          |
| min(0, NaN)     | NaN    | min violates IEEE but match GLSL spec                    |
| min(NaN, 0)     | 0      |                                                          |
| min(-inf, +inf) | -inf   |                                                          |
| cmp(s, 0)       | false  | cmp does not flush input subnormals                      |
| max(s, 0)       | s      | max does not flush input or output subnormals            |
| mul(s, 2)       | 0      | input subnormals are flushed in arithmetic instructions  |
| mul(n, 0.5)     | 0      | output subnormals are flushed in arithmetic instructions |

1.0 can be multiplied 63 times by 0.5 until the result compares equal
zero. This is consistent with a 7-bit exponent and output subnormal
flushing.

## Control Flow

Control flow is implemented using four independent stacks:

- 4-deep CALL stack
- 8-deep IF stack
- 4-deep LOOP stack

All stacks are initially empty. After every instruction but before JMP
takes effect, the PC is incremented and a copy is sent to each stack.
Each stack is checked against its copy of the PC. If an entry is popped
from the stack, the copied PC is updated and used for the next check of
this stack, although the IF/LOOP stacks can each only pop one entry per
instruction, whereas the CALL stack is checked again until it doesn't
match or the stack is empty. The updated PC copy with the highest
priority wins: LOOP (highest), IF, CALL, JMP, original PC (lowest).

Special cases:

- JMP overwrites the PC \*after\* the stacks checks (and only if no
  stack was popped).
- Executing a BREAK on an empty LOOP stack hangs the GPU.
- A stack overflow discards the oldest element, so you could think of it
  as a queue or a ring buffer.
- If the CALL stack is popped four times in a row, the fourth update to
  its copy of the PC is missed (the third PC update will be propagated).
  Probably a hardware bug.

[Category:GPU](Category:GPU "wikilink")