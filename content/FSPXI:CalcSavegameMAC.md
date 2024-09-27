+++
title = 'FSPXI:CalcSavegameMAC'
+++

# Request

| Index Word | Description                                                  |
|------------|--------------------------------------------------------------|
| 0          | Header code \[0x000C0104\]                                   |
| 1          | File handle lower word                                       |
| 2          | File handle upper word                                       |
| 3          | Output MAC buffer size                                       |
| 4          | Input buffer size                                            |
| 5          | (inputbuf_size\<\<8) \| 6                                    |
| 6          | Input buffer pointer                                         |
| 7          | \| (macbuf_size\<\<8) \| 0x14                                |
| 8          | [MAC](Savegames#mac_header "wikilink") output buffer pointer |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Usage

Used to calculate CMACs as stored in in [DISA/DIFF
files](DISA_and_DIFF#aes_cmac "wikilink"). The file handle that is
passed in determines the type of CMAC to calculate. The input buffer
data is used as the input data for the CMAC type chosen, and, in the
case of stacked CMAC types
([CTR-SIGN](DISA_and_DIFF#ctr-sign "wikilink") or
[CTR-NOR0](DISA_and_DIFF#ctr-nor0 "wikilink")), the stacking is applied
properly on top of the inner CMAC types.
