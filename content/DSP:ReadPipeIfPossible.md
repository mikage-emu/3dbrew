+++
title = 'DSP:ReadPipeIfPossible'
+++

# Request

| Index Word | Description                                                           |
|------------|-----------------------------------------------------------------------|
| 0          | Header code \[0x001000c0\]                                            |
| 1          | Channel (0 - 7 0:Debug from DSP 1:P-DMA 2:audio 3:binary 4-7: free ?) |
| 2          | Peer (0 = from DSP, 1 = from ARM)                                     |
| 3          | u16, Size                                                             |

0x100 byte after the Request header

| Index Word | Description           |
|------------|-----------------------|
| 0          | (Size \<\< 14) \| 0x2 |
| 1          | Buffer                |

# Response

| Index Word | Description           |
|------------|-----------------------|
| 0          | Header code           |
| 1          | Result code           |
| 2          | u16, Actual read size |

# Channels

## Channel 2 (Audio)

Channel 2 returns the DSP DRAM addresses of structures located in the
[DSP Memory Region](DSP_Memory_Region "wikilink").
[DSP:ConvertProcessAddressFromDspDram](DSP:ConvertProcessAddressFromDspDram "wikilink")
can be used to convert these addresses into virtual memory addresses.
The list of addresses and the length of the list vary depending on DSP
firmware version.

## Channel 3 (Binary)

The purpose of channel 3 is unknown. The behaviour of this pipe varies
depending on DSP firmware version. Observed behaviours include:

- doing nothing.
- echoing what is returned to it.
- long strings of zeros.
