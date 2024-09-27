+++
title = 'HID Registers'
+++

# Registers

| Old3DS | Name                                   | Address    | Width | Used by                                                    |
|--------|----------------------------------------|------------|-------|------------------------------------------------------------|
| Yes    | [HID_PAD](#hid_pad "wikilink")         | 0x10146000 | 2     | Boot9, Boot11, Kernel11, TwlBg, HID Services, dlp Services |
| Yes    | [HID_PAD_CNT](#hid_pad_cnt "wikilink") | 0x10146002 | 2     | TwlBg                                                      |

## HID_PAD

Each bit in this register refers to a particular key. Each bit is set if
the corresponding key is **not** pressed, and unset if it's pressed.

| Bit | Key    |
|-----|--------|
| 0   | A      |
| 1   | B      |
| 2   | Select |
| 3   | Start  |
| 4   | Right  |
| 5   | Left   |
| 6   | Up     |
| 7   | Down   |
| 8   | R      |
| 9   | L      |
| 10  | X      |
| 11  | Y      |

## HID_PAD_CNT

| Bit   | Key                              |
|-------|----------------------------------|
| 0     | A                                |
| 1     | B                                |
| 2     | Select                           |
| 3     | Start                            |
| 4     | Right                            |
| 5     | Left                             |
| 6     | Up                               |
| 7     | Down                             |
| 8     | R                                |
| 9     | L                                |
| 10    | X                                |
| 11    | Y                                |
| 12-13 | Unused.                          |
| 14    | Enable IRQ 0x5B. 1 = enable.     |
| 15    | IRQ condition (0 = OR, 1 = AND). |

This is the same as on GBA/DS(i).
