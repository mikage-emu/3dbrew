+++
title = 'Gamecard Services PXI'
+++

# "pxi:dev" service

| Command Header | Available since system version | Description                                                                                                                                                                                                              |
|----------------|--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x000101C2     | [1.0.0-0](1.0.0-0 "wikilink")  | [ReadHostIO](PXIDEV:ReadCTRCARD_Cmd40 "wikilink")                                                                                                                                                                        |
| 0x000201C2     | [1.0.0-0](1.0.0-0 "wikilink")  | [WriteHostIO](PXIDEV:WriteCTRCARD_Cmd41 "wikilink")                                                                                                                                                                      |
| 0x00030102     | [1.0.0-0](1.0.0-0 "wikilink")  | [ReadHostEx](PXIDEV:ReadCTRCARD_Cmd42 "wikilink")                                                                                                                                                                        |
| 0x00040102     | [1.0.0-0](1.0.0-0 "wikilink")  | [WriteHostEx](PXIDEV:WriteCTRCARD_Cmd44 "wikilink")                                                                                                                                                                      |
| 0x00050102     | [1.0.0-0](1.0.0-0 "wikilink")  | WriteHostExStart. Stubbed, only returns an error. Use [WriteHostEx](PXIDEV:WriteCTRCARD_Cmd44 "wikilink") instead.                                                                                                       |
| 0x00060102     | [1.0.0-0](1.0.0-0 "wikilink")  | WriteHostExChunk. Stubbed, only returns an error. Use [WriteHostEx](PXIDEV:WriteCTRCARD_Cmd44 "wikilink") instead.                                                                                                       |
| 0x00070000     | [1.0.0-0](1.0.0-0 "wikilink")  | WriteHostExEnd. Stubbed, only returns an error. Use [WriteHostEx](PXIDEV:WriteCTRCARD_Cmd44 "wikilink") instead.                                                                                                         |
| 0x00080000     | [2.0.0-2](2.0.0-2 "wikilink")  | InitializeMIDI                                                                                                                                                                                                           |
| 0x00090000     | [2.0.0-2](2.0.0-2 "wikilink")  | FinalizeMIDI                                                                                                                                                                                                             |
| 0x000A0000     | [2.0.0-2](2.0.0-2 "wikilink")  | GetMIDIInfo. This writes 3 bytes to cmdreply\[2\], the [SPICARD](SPICARD "wikilink") hw is used for this.                                                                                                                |
| 0x000B0000     | [2.0.0-2](2.0.0-2 "wikilink")  | GetMIDIBufferSize. This writes a max-size value to cmdreply\[2\].                                                                                                                                                        |
| 0x000C0042     | [2.0.0-2](2.0.0-2 "wikilink")  | ReadMIDI (size, ((size\<\<8) \| 4), outbufptr) This copies the data from some buffer(size is restricted to the maxsize value also used by command 0x000B0000) to the FCRAM outbuf, when certain flags are set correctly. |
| 0x000D0688     | [2.0.0-2](2.0.0-2 "wikilink")  | [SPIMultiWriteRead](PXIDEV:SPIMultiWriteRead "wikilink")                                                                                                                                                                 |
| 0x000E0284     | [2.0.0-2](2.0.0-2 "wikilink")  | [SPIWriteRead](PXIDEV:SPIWriteRead "wikilink")                                                                                                                                                                           |
| 0x000F0000     | [2.0.0-2](2.0.0-2 "wikilink")  | [GetCardDevice](PXIDEV:GetCardDevice "wikilink")                                                                                                                                                                         |

## Types

### SectorSize

| Value | Description  |
|-------|--------------|
| 0     | 0x0 bytes    |
| 1     | 0x4 bytes    |
| 2     | 0x10 bytes   |
| 3     | 0x40 bytes   |
| 4     | 0x200 bytes  |
| 5     | 0x400 bytes  |
| 6     | 0x800 bytes  |
| 7     | 0x1000 bytes |
| 8     | 0x2000 bytes |

### TransferOption

| Bits | Description                                                       |
|------|-------------------------------------------------------------------|
| 0-5  | [CardSpiBaudRate](Filesystem_services#cardspibaudrate "wikilink") |
| 6-7  | [CardSpiBusMode](Filesystem_services#cardspibusmode "wikilink")   |

### WaitOperation

| Bits | Description                              |
|------|------------------------------------------|
| 0-3  | [WaitType](#waittype "wikilink")         |
| 4-7  | [DeassertType](#deasserttype "wikilink") |
| 8-63 | Nanoseconds                              |

### WaitType

| Value | Description                        |
|-------|------------------------------------|
| 0     | None                               |
| 1     | Sleep                              |
| 2     | Wait for IREQ, return if timeout   |
| 3     | Wait for IREQ, continue if timeout |

### DeassertType

| Value | Description |
|-------|-------------|
| 0     | None        |
| 1     | Before wait |
| 2     | After wait  |
