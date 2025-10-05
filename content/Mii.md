+++
title = 'Mii'
+++

Originally [created for the Nintendo Wii](http://wiibrew.org/wiki/Mii_Data) (and backported to a selection of DS/i games), the **Mii** format was expanded with a larger selection of facial features and a new "copying" permission for the 3DS family, and later implemented as-is on Wii U.

See [Mii Maker](Mii_Maker "wikilink") for the application chiefly designed to create, edit, delete, and trade Miis or convert them from and to a QR code.

The default endianness in this page is little-endian, unless explicitly specified.

## Mii Database

Format of the Mii main database **CFL_DB.dat**, found in [shared extdata](Extdata#nand_shared_extdata "wikilink") archive f0000000b.

<table>
<thead>
<tr>
<th>Offset</th>
<th>Length</th>
<th></th>
</tr>
</thead>
<tbody>
<tr>
<td>0x0</td>
<td>0x4</td>
<td>Header "CFOG" (Mii Maker section)</td>
</tr>
<tr>
<td>0x4</td>
<td>0x4</td>
<td>Header 0x00000100</td>
</tr>
<tr>
<td>0x8</td>
<td>0x23F0 (100 * 0x5C)</td>
<td>Array of owned (saved in Mii Maker) Miis. Order in file is unrelated to canonical order in-app.</td>
</tr>
<tr>
<td>0x23F8</td>
<td>0x4</td>
<td>Header "CFHE"</td>
</tr>
<tr>
<td>0x23FC</td>
<td>0x2</td>
<td>Linked list tail index. 0xFFFF if the list is empty</td>
</tr>
<tr>
<td>0x23FE</td>
<td>0x2</td>
<td>Linked list head index. 0xFFFF if the list is empty</td>
</tr>
<tr>
<td>0x2400</td>
<td>0xA410 (3000 * 0xE)</td>
<td>Linked list of objects? See chapter</td>
</tr>
<tr>
<td>0xC810</td>
<td>0xE</td>
<td>Padding?</td>
</tr>
<tr>
<td>0xC81E</td>
<td>0x2</td>
<td>Checksum of all of the above (the first 0xC81E byte). See section <a href="#checksum" title="wikilink">below</a>.</td>
</tr>
<tr>
<td>0xC820</td>
<td>0x4</td>
<td>Header "CFRA" (Invitations section)</td>
</tr>
<tr>
<td>0xC824</td>
<td>0x4</td>
<td>Mii count in this section. Maximum 100</td>
</tr>
<tr>
<td>0xC828</td>
<td>0x64 (100 * 0x1)</td>
<td>Order index of Mii in this section?</td>
</tr>
<tr>
<td>0xC88C</td>
<td>0x1C20 (100 * 0x48)</td>
<td>Array of Miis contributed from games, used for Mii Plaza "invitations" feature.<br />
The format isn't that of a full Mii. The "author" field is missing</td>
</tr>
<tr>
<td>0xE4AC</td>
<td>0x12</td>
<td>01 00 [..] 00</td>
</tr>
<tr>
<td>0xE4BE</td>
<td>0x2</td>
<td>Checksum over the data above starting from 0xC820</td>
</tr>
<tr>
<td>0xE4C0</td>
<td>0x3D860 (3000 * 0x54)</td>
<td>Another array of Miis. Seems related to the CFHE section.<br />
The Mii format in this section is modified. The "author" field is missing, A 4-byte timestamp (seconds since 2000) together with 8-byte zeros(?) is appended at the end.</td>
</tr>
</tbody>
</table>

When encrypted in QR codes, 4 additional bytes are added. Two null bytes and a CRC-16. It's the exact same CRC-16 as for the Wii blocks on the 0x5e first bytes. It seems that the CRC is ignored, the Mii Maker expecting the result of <APT:Unwrap> to detect integrity loss.

## CFHE object

A 0xE-byte long linked list node. The format is 4-byte Mii ID (See Mii format) + 6-byte MAC + 2-byte previous node index (prev) + 2-byte next node index (next).

An invalid node has value: ID = 0, MAC = 0, prev = 0x7FFF, next = 0x7FFF.

The highest bit of these fields has some special meaning and isn't part of the index value.

## Checksum

The algorithm used to verify the integrity of the database is based on CRC-16/XMODEM. It is the same algorithm used to verify [Mii Data on the Wii](http://wiibrew.org/wiki/Mii_Data#Block_format).

To obtain the correct value for the checksum, apply the algorithm to the first 0xC81E bytes of the database. This can be done using [FixCRC](https://gbatemp.net/threads/tutorial-give-your-mii-gold-pants-and-use-it-for-streetpass.379146/page-24#post-6569186); alternativly a pseudocode implementation of the checksum algorithm is given below:

``` python
def crc16_CCITTWii(u8[]: data) -> u16:
    """Calculate a checksum of data using the CRC-16/XMODEM implementation

    CRC-16/XMODEM implementation uses 0x0000 as the starting value
    """
    
    u32 crc := 0x0

    for byte in data:
        # Iterate over every of the 8 bits in byte.
        # Begin with the most significant bit. (7, 6, ... , 1, 0)
        for bit in 7..0:
            # & - binary `and'; <</>> - bitshift left/right; ^ - binary `xor'
            crc := (
                     (crc << 1) | ((byte >> bit) & 0x1)
                     ^ (0x1021 if crc & 0x8000 else 0)
                   )

    for _ in 0..15:
        crc := (crc << 1) ^ (0x1021 if crc & 0x8000 else 0)

    # only return the lowest 16 bit of crc
    return (u16) (crc & 0xffff)

checksum := crc16_CCITTWii(miidb[0:0xc81e]) # checksum over the first 0xc81e bytes
```

## Mii format

<table>
<thead>
<tr>
<th>Offset</th>
<th>Length</th>
<th></th>
</tr>
</thead>
<tbody>
<tr>
<td>0x0</td>
<td>0x1</td>
<td>Mii Version - Always 3</td>
</tr>
<tr>
<td>0x1</td>
<td>0x1</td>
<td>bit 0: allow copying<br />
bit 1: profanity flag (whether in Mii name or creator name does not matter)<br />
bit 2-3: region lock (0=no lock, 1=JPN, 2=USA, 3=EUR)<br />
bit4-5:character set(0=JPN+USA+EUR, 1=CHN, 2=KOR, 3=TWN)</td>
</tr>
<tr>
<td>0x2</td>
<td>0x1</td>
<td>Mii position shown on the selection screen<br />
bit 0-3: page index<br />
bit 4-7: slot index</td>
</tr>
<tr>
<td>0x3</td>
<td>0x1</td>
<td>bit 0-3: ?<br />
bit 4-6: Device Mii was originally made on (1=Wii, 2=DS, 3=3DS, 4=Wii U/Switch)</td>
</tr>
<tr>
<td>0x4</td>
<td>0x8</td>
<td>System ID (identifies owner, for purpose of enforcing editing restrictions and blue pants).<br />
Is not tied to the MAC address anymore.</td>
</tr>
<tr>
<td>0xC</td>
<td>0x4</td>
<td>Mii ID (big-endian 32bit unsigned integer):<br />
Bit 0..27: (bit[0..27] * 2) = date of creation (seconds since 01/01/2010 00:00:00)<br />
Bit 28: Always set?<br />
Bit 29: set for temporary Mii<br />
Bit 30: Set for DSi mii?<br />
Bit 31: not set if Mii is special</td>
</tr>
<tr>
<td>0x10</td>
<td>0x6</td>
<td>Creator's full MAC</td>
</tr>
<tr>
<td>0x16</td>
<td>0x2</td>
<td>Padding (0000)</td>
</tr>
<tr>
<td>0x18</td>
<td>0x2</td>
<td>bit 0: sex (0 if male, 1 if female)<br />
bit 1-4: birthday month<br />
bit 5-9: birthday day<br />
bit 10-13: favorite color<br />
bit 14: favorite mii (0 if false, 1 if true)</td>
</tr>
<tr>
<td>0x1A</td>
<td>0x14</td>
<td>UTF-16 Mii Name (10 chars max, 0000 terminated)</td>
</tr>
<tr>
<td>0x2E</td>
<td>0x2</td>
<td>width &amp; height</td>
</tr>
<tr>
<td>0x30</td>
<td>0x1</td>
<td>bit 0: disable sharing<br />
bit 1-4: face shape<br />
bit 5-7: skin color</td>
</tr>
<tr>
<td>0x31</td>
<td>0x1</td>
<td>bit 0-3: wrinkles<br />
bit 4-7: makeup</td>
</tr>
<tr>
<td>0x32</td>
<td>0x1</td>
<td>hair style</td>
</tr>
<tr>
<td>0x33</td>
<td>0x1</td>
<td>bit 0-2: hair color<br />
bit 3: flip hair</td>
</tr>
<tr>
<td>0x34</td>
<td>0x4</td>
<td>bit 0-5: eye style<br />
bit 6-8: eye color<br />
bit 9-12: eye scale<br />
bit 13-15: eye yscale<br />
bit 16-20: eye rotation<br />
bit 21-24: eye x spacing<br />
bit 25-29: eye y position</td>
</tr>
<tr>
<td>0x38</td>
<td>0x4</td>
<td>bit 0-4: eyebrow style<br />
bit 5-7: eyebrow color<br />
bit 8-11: eyebrow scale<br />
bit 12-14: eyebrow yscale<br />
bit 16-19: eyebrow rotation<br />
bit 21-24: eyebrow x spacing<br />
bit 25-29: eyebrow y position</td>
</tr>
<tr>
<td>0x3C</td>
<td>0x2</td>
<td>bit 0-4: nose style<br />
bit 5-8: nose scale<br />
bit 9-13: nose y position</td>
</tr>
<tr>
<td>0x3E</td>
<td>0x2</td>
<td>bit 0-5: mouth style<br />
bit 6-8: mouth color<br />
bit 9-12: mouth scale<br />
bit 13-15: mouth yscale</td>
</tr>
<tr>
<td>0x40</td>
<td>0x2</td>
<td>bit 0-4: mouth y position<br />
bit 5-7: mustach style</td>
</tr>
<tr>
<td>0x42</td>
<td>0x2</td>
<td>bit 0-2: beard style<br />
bit 3-5: beard color<br />
bit 6-9: mustache scale<br />
bit 10-14:mustache y position</td>
</tr>
<tr>
<td>0x44</td>
<td>0x2</td>
<td>bit 0-3: glasses style<br />
bit 4-6: glasses color<br />
bit 7-10: glasses scale<br />
bit 11-15: glasses y position</td>
</tr>
<tr>
<td>0x46</td>
<td>0x2</td>
<td>bit 0: enable mole<br />
bit 1-4: mole scale<br />
bit 5-9: mole x position<br />
bit 10-14: mole y position</td>
</tr>
<tr>
<td>0x48</td>
<td>0x14</td>
<td>UTF-16 Author Name (10 chars max, 0000 terminated)</td>
</tr>
</tbody>
</table>

## CFLStoreData

This is a common Mii container object, used in games and system modules like [FRD](Friend_Services "wikilink") and [ACT](ACT_Services "wikilink").

| Offset | Size | Description                          |
|--------|------|--------------------------------------|
| 0x0    | 0x5C | Base Mii data in the above format    |
| 0x5C   | 0x2  | padding, left as zeros usually       |
| 0x5E   | 0x2  | CRC16 over the previous 0x5E of data |

## Mii categories (pants colors)

#### Special (gold) Miis

Specialness will override any other pants color.

A special Mii cannot have sharing on or else it will be deemed invalid.

Zeroed system-id and timestamp?

#### Imported (blue) Miis

Any (non-gold) Mii with a different System ID will appear as a foreign one.

There is also a range of Mii IDs that are always foreign and uneditable, regardless of the System ID:

#### Regular (black/red) Miis

Always editable, since they can only appear as such on the console that created them.

#### Personal (red) Mii

A red Mii that happens to be the first in the file!

The Mii doesn't really need to be red, it is only red because the personal Mii is always favorited.

## Mii values

Each of the following values were found with NTR Debugger:
If you want to access the value, grab the given "NTR address" and add 0x08815000.

| Data | NTR address | Variation (hex) | Notes |
|----|----|----|----|
| Face style | 0x894 | 00-0B | Not ordered as in editor, read below |
| Face color | 0x898 | 00-05 | From top to bottom |
| Wrinkles | 0x89C | 00-0B | Same order as displayed in editor |
| Makeup | 0x8A0 | 00-0B | Same order as displayed in editor |
| Hair style | 0x8A4 | 00-84 | Not ordered as in editor, read below |
| Hair color | 0x8A8 | 00-07 | From top to bottom |
| Hair flipped | 0x8AC | 1 if true | From top to bottom |
| Eye style | 0x8B0 | 00-3C | Not ordered as in editor, read below |
| Eyes color | 0x8B4 | 00-05 | From top to bottom |
| Eyes size | 0x8B8 | 07-00 | Left button increases value. |
| Eyes thickness | 0x8BC | 06-00 | Left button increases value. |
| Eyes rotation | 0x8C0 | 00-07 |  |
| Eyes spacing | 0x8C4 | 00-0C |  |
| Eyes height | 0x8C8 | 00-12 |  |
| Eyebrows style | 0x8CC | 00-18 | Not ordered as in editor, read below |
| Eyebrows color | 0x8D0 | 00-07 | From top to bottom |
| Eyebrows size | 0x8D4 | 08-00 | Left button increases value. |
| Eyebrows thickness | 0x8D8 | 06-00 | Left button increases value. |
| Eyebrows rotation | 0x8DC | 00-0B |  |
| Eyebrows spacing | 0x8E0 | 00-0C |  |
| Eyebrows height | 0x8E4 | 03-12 | Yup, minimum is 0x03 |
| Nose style | 0x8E8 | 00-11 | Not ordered as in editor, read below |
| Nose size | 0x8EC | 08-00 | Left button increases value. |
| Nose height | 0x8F0 | 00-12 |  |
| Mouth style | 0x8F4 | 00-23 | Not ordered as in editor, read below |
| Mouth color | 0x8F8 | 00-04 | From top to bottom. |
| Mouth size | 0x8FC | 08-00 | Left button increases value. |
| Mouth thickness | 0x900 | 06-00 | Left button increases value. |
| Mouth height | 0x904 | 00-12 |  |
| Mustache style | 0x908 | 00-05 | Order like in editor. |
| Beard style | 0x90C | 00-05 | Order like in editor. |
| Mustache/Beard color | 0x910 | 00-07 | From top to button. |
| Mustache size | 0x914 | 08-00 | Left button increases value. |
| Mustache height | 0x918 | 00-10 |  |
| Glasses style | 0x91C | 00-08 | Order like in editor. |
| Glasses color | 0x920 | 00-05 | From top to bottom |
| Glasses size | 0x924 | 07-00 | Left button increases value. |
| Glasses height | 0x928 | 00-14 |  |
| Mole enable | 0x92C | 1 if enabled, 0 else. |  |
| Mole size | 0x930 | 08-00 | Left button increases value. |
| Mole horiz pos | 0x934 | 00-10 |  |
| Mole vert pos | 0x938 | 00-1E |  |
| Mii height | 0x93C | 00-7F |  |
| Mii weight | 0x940 | 00-7F |  |
| Mii name | 0x944-0x959 | UTF-16 | Terminated with 0x0000. Not updated immediatly? |
| Creator's name | 0x95A-96F | UTF-16 | Terminated with 0x0000. Not updated immediatly? |
| Mii gender | 0x970 | 0: Male, 1: Female |  |
| Birthdate month | 0x974 | 01-0C |  |
| Birthdate day | 0x978 | 01-1F |  |
| Mii shirt color | 0x97C | 00-0B | Ordered like in editor. |
| Favorite | 0x980 | 0: false, 1: true |  |
| Allow copy | 0x981 | 0: false, 1: true |  |
| Unused byte? | 0x982 |  |  |
| Allow sharing | 0x983 | 0: true, 1: false |  |
| ??? | 0x984-0x98F | All zero? |  |
| ??? | 0x990-0x997 | 4? |  |

0x08815998: Same 4 bytes as encrypted Mii: first 4 bits for Mii type, 4 next for number of seconds since 01/01/2010 00:00:00 UTC+3 (should be verified by other country and region 3DS) divided by 2.
0x0881599C: 6 bytes of MAC address of the 3DS that created the Mii.
0x088159A2: 6 unknow uses bytes
0x088159A8: Same 8 bytes as decrypted Mii at 0x04 through 0x0B. Seems NAND specific, kept the same on Miis created on same NAND but different 3DS via System Transfer. Might be a coincidence but the two first bytes are in ID0 folder name in the Nintendo 3DS folder.

### Mapped Editor \<-\> Hex values

Most of the values are ordered (left button decreases, right increases, color choices are top to bottom...) but for most "main" part of the UI, where you choose the style of the part being edited, hex values has no correlation with displayed order.
Here is a JSON that can go from a Part, a Page and Position to the right hex value. This is 0 indexed (eg: datas\["face"\]\[0\]\[11\]).

`{`  
`face: [`  
`    0x00,0x01,0x08,`  
`    0x02,0x03,0x09,`  
`    0x04,0x05,0x0a,`  
`    0x06,0x07,0x0b`  
`],`  
`hairs: [`  
`    [0x21,0x2f,0x28,`  
`    0x25,0x20,0x6b,`  
`    0x30,0x33,0x37,`  
`    0x46,0x2c,0x42],`  
`    [0x34,0x32,0x26,`  
`    0x31,0x2b,0x1f,`  
`    0x38,0x44,0x3e,`  
`    0x73,0x4c,0x77],`  
`    [0x40,0x51,0x74,`  
`    0x79,0x16,0x3a,`  
`    0x3c,0x57,0x7d,`  
`    0x75,0x49,0x4b],`  
`    [0x2a,0x59,0x39,`  
`    0x36,0x50,0x22,`  
`    0x17,0x56,0x58,`  
`    0x76,0x27,0x24],`  
`    [0x2d,0x43,0x3b,`  
`    0x41,0x29,0x1e,`  
`    0x0c,0x10,0x0a,`  
`    0x52,0x80,0x81],`  
`    [0x0e,0x5f,0x69,`  
`    0x64,0x06,0x14,`  
`    0x5d,0x66,0x1b,`  
`    0x04,0x11,0x6e],`  
`    [0x7b,0x08,0x6a,`  
`    0x48,0x03,0x15,`  
`    0x00,0x62,0x3f,`  
`    0x5a,0x0b,0x78],`  
`    [0x05,0x4a,0x6c,`  
`    0x5e,0x7c,0x19,`  
`    0x63,0x45,0x23,`  
`    0x0d,0x7a,0x71],`  
`    [0x35,0x18,0x55,`  
`    0x53,0x47,0x83,`  
`    0x60,0x65,0x1d,`  
`    0x07,0x0f,0x70],`  
`    [0x4f,0x01,0x6d,`  
`    0x7f,0x5b,0x1a,`  
`    0x3d,0x67,0x02,`  
`    0x4d,0x12,0x5c],`  
`    [0x54,0x09,0x13,`  
`    0x82,0x61,0x68,`  
`    0x2e,0x4e,0x1c,`  
`    0x72,0x7e,0x6f]`  
`],`  
`eyebrows: [`  
`    [0x06,0x00,0x0c,`  
`    0x01,0x09,0x13,`  
`    0x07,0x15,0x08,`  
`    0x11,0x05,0x04],`  
`    [0x0b,0x0a,0x02,`  
`    0x03,0x0e,0x14,`  
`    0x0f,0x0d,0x16,`  
`    0x12,0x10,0x17]`  
`],`  
`eyes: [`  
`    [0x02,0x04,0x00,`  
`    0x08,0x27,0x11,`  
`    0x01,0x1a,0x10,`  
`    0x0f,0x1b,0x14],`  
`    [0x21,0x0b,0x13,`  
`    0x20,0x09,0x0c,`  
`    0x17,0x22,0x15,`  
`    0x19,0x28,0x23],`  
`    [0x05,0x29,0x0d,`  
`    0x24,0x25,0x06,`  
`    0x18,0x1e,0x1f,`  
`    0x12,0x1c,0x2e],`  
`    [0x07,0x2c,0x26,`  
`    0x2a,0x2d,0x1d,`  
`    0x03,0x2b,0x16,`  
`    0x0a,0x0e,0x2f],`  
`    [0x30,0x31,0x32,`  
`    0x35,0x3b,0x38,`  
`    0x36,0x3a,0x39,`  
`    0x37,0x33,0x34]`  
`],`  
`nose: [`  
`    [0x01,0x0a,0x02,`  
`    0x03,0x06,0x00,`  
`    0x05,0x04,0x08,`  
`    0x09,0x07,0x0B],`  
`    [0x0d,0x0e,0x0c,`  
`    0x11,0x10,0x0f]`  
`],`  
`mouth: [`  
`    [0x17,0x01,0x13,`  
`    0x15,0x16,0x05,`  
`    0x00,0x08,0x0a,`  
`    0x10,0x06,0x0d],`  
`    [0x07,0x09,0x02,`  
`    0x11,0x03,0x04,`  
`    0x0f,0x0b,0x14,`  
`    0x12,0x0e,0x0c],`  
`    [0x1b,0x1e,0x18,`  
`    0x19,0x1d,0x1c,`  
`    0x1a,0x23,0x1f,`  
`    0x22,0x21,0x20]`  
`]`  
```
}
```
