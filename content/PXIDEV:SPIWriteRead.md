+++
title = 'PXIDEV:SPIWriteRead'
+++

# Request

| Index Word | Description                                                                    |
|------------|--------------------------------------------------------------------------------|
| 0          | Header code \[0x000E0284\]                                                     |
| 1-2        | Initial [WaitOperation](Gamecard_Services_PXI#WaitOperation "wikilink")        |
| 3          | Write Buffer Size                                                              |
| 4          | Write Buffer [TransferOption](Gamecard_Services_PXI#TransferOption "wikilink") |
| 5-6        | Write Buffer [WaitOperation](Gamecard_Services_PXI#WaitOperation "wikilink")   |
| 7          | Read Buffer Size                                                               |
| 8          | Read Buffer [TransferOption](Gamecard_Services_PXI#TransferOption "wikilink")  |
| 9-10       | Read Buffer [WaitOperation](Gamecard_Services_PXI#WaitOperation "wikilink")    |
| 11         | (WriteBufferSize \<\< 8) \| 0x6                                                |
| 12         | Write Buffer Pointer                                                           |
| 13         | (ReadBufferSize \<\< 8) \| 0x24                                                |
| 14         | Read Buffer Pointer                                                            |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | Bytes Read  |

# Description

Writes data to the [CARDSPI FIFO](SPICARD_Registers "wikilink") and
reads the response. To use this, the [ARM9 Access
Control](NCCH/Extended_Header "wikilink") bit for SPICARD must be set in
one of the currently running ARM11 processes.

If any of the buffers have a size of 0, their respective operation will
be skipped.