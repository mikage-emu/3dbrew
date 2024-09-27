+++
title = 'PXIDEV:SPIMultiWriteRead'
+++

# Request

| Index Word | Description                                                                      |
|------------|----------------------------------------------------------------------------------|
| 0          | Header code \[0x000D0688\]                                                       |
| 1-2        | Header                                                                           |
| 3          | Header Size                                                                      |
| 4          | Header [TransferOption](Gamecard_Services_PXI#TransferOption "wikilink")         |
| 5-6        | Header [WaitOperation](Gamecard_Services_PXI#WaitOperation "wikilink")           |
| 7          | Write Buffer 1 Size                                                              |
| 8          | Write Buffer 1 [TransferOption](Gamecard_Services_PXI#TransferOption "wikilink") |
| 9-10       | Write Buffer 1 [WaitOperation](Gamecard_Services_PXI#WaitOperation "wikilink")   |
| 11         | Read Buffer 1 Size                                                               |
| 12         | Read Buffer 1 [TransferOption](Gamecard_Services_PXI#TransferOption "wikilink")  |
| 13-14      | Read Buffer 1 [WaitOperation](Gamecard_Services_PXI#WaitOperation "wikilink")    |
| 15         | Write Buffer 2 Size                                                              |
| 16         | Write Buffer 2 [TransferOption](Gamecard_Services_PXI#TransferOption "wikilink") |
| 17-18      | Write Buffer 2 [WaitOperation](Gamecard_Services_PXI#WaitOperation "wikilink")   |
| 19         | Read Buffer 2 Size                                                               |
| 20         | Read Buffer 2 [TransferOption](Gamecard_Services_PXI#TransferOption "wikilink")  |
| 21-22      | Read Buffer 2 [WaitOperation](Gamecard_Services_PXI#WaitOperation "wikilink")    |
| 23-24      | Footer                                                                           |
| 25         | Footer Size                                                                      |
| 26         | Footer [TransferOption](Gamecard_Services_PXI#TransferOption "wikilink")         |
| 27         | (WriteBuffer1Size \<\< 8) \| 0x6                                                 |
| 28         | Write Buffer 1 Pointer                                                           |
| 29         | (WriteBuffer2Size \<\< 8) \| 0x16                                                |
| 30         | Write Buffer 2 Pointer                                                           |
| 31         | (ReadBuffer1Size \<\< 8) \| 0x24                                                 |
| 32         | Read Buffer 1 Pointer                                                            |
| 33         | (ReadBuffer2Size \<\< 8) \| 0x34                                                 |
| 34         | Read Buffer 2 Pointer                                                            |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Writes the header to the [CARDSPI FIFO](SPICARD_Registers "wikilink"),
writes the first write buffer, reads the response to the first read
buffer, writes the second write buffer, reads the response to the second
read buffer, and writes the footer. To use this, the [ARM9 Access
Control](NCCH/Extended_Header "wikilink") bit for SPICARD must be set in
one of the currently running ARM11 processes.

If the header, footer, or any of the buffers have a size of 0, their
respective operation will be skipped.