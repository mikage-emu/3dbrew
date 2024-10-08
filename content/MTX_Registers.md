+++
title = 'MTX Registers'
+++

These registers are responsible for controlling how framebuffer data can
be DMA'd from the DS GPU, and also for configuring the upscaling matrix.

# Registers

The physical address can be calculated by subtracting 0xEB00000 from the
virtual address.

## Control

| VAddress   | Name                             | Width |
|------------|----------------------------------|-------|
| 0x1EC1x000 | [MTX_CNT](#mtx_cnt "wikilink")   | 4     |
| 0x1EC1x004 | [MTX_SIZE](#mtx_size "wikilink") | 4     |
| 0x1EC1x008 | [MTX_ACK](#mtx_ack "wikilink")   | 4     |
| 0x1EC1x00C | [MTX_IE](#mtx_ie "wikilink")     | 4     |
| 0x1EC1x020 | ???                              | 4     |
|            |                                  |       |

## Matrix unit

There are two matrix units, one at +0x200 for vertical (Y) scaling, and
the other one at +0x300 for horizontal (X) scaling.

<table>
<thead>
<tr class="header">
<th>VAddress</th>
<th>Name</th>
<th>Width</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0x1EC1xn00</td>
<td>KRN_WIDTH</td>
<td>4</td>
<td>Kernel width - 1 is written here, 1 &lt;= width &lt;= 8</p>
<p>This decides how many pixels are written each batch.</td>
</tr>
<tr class="even">
<td>0x1EC1xn04</td>
<td>KRN_PATTERN_BITS</td>
<td>4</td>
<td>If the corresponding bit for the current batch iteration index is
set then a new pixel is read.</p>
<p>The amount of set bits determine how many pixels are read each batch.
Any bit indexes past KRN_WIDTH are ignored.</p>
<p>This value is 8 bits, but it has to be written with a 32bit
write.</td>
</tr>
<tr class="odd">
<td>0x1EC1xn40</td>
<td>KRN_MTX</td>
<td>0xC0</td>
<td>int kerneldata[6][8]; - matrix data is written here, height is
always 6</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

# Descriptions

## MTX_CNT

| Bit(s) | Description                                                                                                              |
|--------|--------------------------------------------------------------------------------------------------------------------------|
| 0      | Enable bit                                                                                                               |
| 1      | Enable vertical matrix                                                                                                   |
| 2      | Enable horizontal matrix                                                                                                 |
| 4      | ???                                                                                                                      |
| 5      | ???                                                                                                                      |
| 8-9    | Input pixel mode? 0 = 4byte color, 1 = 3byte color, 2 = 2byte color, 3 = 2byte color                                     |
| 10-11  | Output framebuffer rotation: 0 = normal, 1 = 90° CW (right), 2 = 180° CW (upside down, not mirrored), 3 = 270° CW (left) |
| 12     | Output tiling for use with the GPU. When set, the output width and height must be a multiple of 8.                       |
| 15     | Start bit (setting this will eventually raise MTX interrupt 0)                                                           |
| 16     | Data still available flag (?)                                                                                            |
|        |                                                                                                                          |

## MTX_SIZE

| Bit(s) | Description                                                         |
|--------|---------------------------------------------------------------------|
| 0-8    | Output framebuffer width - 1 is written here, 1 \<= width \<= 512   |
| 16-25  | Output framebuffer height - 1 is written here, 1 \<= height \<= 512 |
|        |                                                                     |

## MTX_ACK

Reading this register will return pending interrupts. Writing this
register will acknowledge pending interrupts where the bits are set.

| Bit(s) | Description                                 |
|--------|---------------------------------------------|
| 0      | FIFO ready (signal to start DMA)            |
| 1      | FIFO overrun(?) (occurs if DMA is too slow) |
| 2      | FIFO underrun(?) (occurs on VBlank)         |
|        |                                             |

## MTX_IE

Interrupt Enable for the above interrupts.
