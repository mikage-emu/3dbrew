+++
title = 'DSP Services'
categories = ["Services","DSP"]
+++

# DSP service "dsp::DSP"

| Command Header | Description                                                                                                       |
|----------------|-------------------------------------------------------------------------------------------------------------------|
| 0x00010040     | [RecvData](DSP:RecvData "wikilink")                                                                               |
| 0x00020040     | [RecvDataIsReady](DSP:RecvDataIsReady "wikilink")                                                                 |
| 0x00030080     | [SendData](DSP:SendData "wikilink")                                                                               |
| 0x00040040     | [SendDataIsEmpty](DSP:SendDataIsEmpty "wikilink")                                                                 |
| 0x000500C2     | SendFifoEx(unsigned short, unsigned short const\*, unsigned int, unsigned int)                                    |
| 0x000600C0     | RecvFifoEx(unsigned short \*, unsigned short, unsigned int, unsigned int)                                         |
| 0x00070040     | [SetSemaphore](DSP:SetSemaphore "wikilink")                                                                       |
| 0x00080000     | [GetSemaphore](DSP:GetSemaphore "wikilink")                                                                       |
| 0x00090040     | [ClearSemaphore](DSP:ClearSemaphore "wikilink")                                                                   |
| 0x000A0040     | [MaskSemaphore](DSP:MaskSemaphore "wikilink")                                                                     |
| 0x000B0000     | [CheckSemaphoreRequest](DSP:CheckSemaphoreRequest "wikilink")                                                     |
| 0x000C0040     | [ConvertProcessAddressFromDspDram](DSP:ConvertProcessAddressFromDspDram "wikilink")                               |
| 0x000D0082     | [WriteProcessPipe](DSP:WriteProcessPipe "wikilink")                                                               |
| 0x000E00C0     | [ReadPipe](DSP:ReadPipe "wikilink")                                                                               |
| 0x000F0080     | [GetPipeReadableSize](DSP:GetPipeReadableSize "wikilink")                                                         |
| 0x001000C0     | [ReadPipeIfPossible](DSP:ReadPipeIfPossible "wikilink")                                                           |
| 0x001100C2     | [LoadComponent](DSP:LoadComponent "wikilink")                                                                     |
| 0x00120000     | [UnloadComponent](DSP:UnloadComponent "wikilink")                                                                 |
| 0x00130082     | [FlushDataCache](DSP:FlushDataCache "wikilink")                                                                   |
| 0x00140082     | [InvalidateDCache](DSP:InvalidateDCache "wikilink")                                                               |
| 0x00150082     | [RegisterInterruptEvents](DSP:RegisterInterruptEvents "wikilink")                                                 |
| 0x00160000     | [GetSemaphoreEventHandle](DSP:GetSemaphoreEventHandle "wikilink")                                                 |
| 0x00170040     | [SetSemaphoreMask](DSP:SetSemaphoreMask "wikilink")                                                               |
| 0x00180040     | [GetPhysicalAddress](DSP:GetPhysicalAddress "wikilink")                                                           |
| 0x00190040     | [GetVirtualAddress](DSP:GetVirtualAddress "wikilink")                                                             |
| 0x001A0042     | SetIirFilterI2S1. Wrapper for cdc:DSP cmd 1                                                                       |
| 0x001B0042     | SetIirFilterI2S2. Wrapper for cdc:DSP cmd 2                                                                       |
| 0x001C0082     | SetIirFilterEQ. Wrapper for cdc:DSP cmd 3                                                                         |
| 0x001D00C0     | ReadMultiEx_SPI2(unsigned char, unsigned char, unsigned char \*, unsigned char) (Wrapper for cdc:DSP cmd 4)       |
| 0x001E00C2     | WriteMultiEx_SPI2(unsigned char, unsigned char, unsigned char const\*, unsigned char) (Wrapper for cdc:DSP cmd 5) |
| 0x001F0000     | [GetHeadphoneStatus](DSP:GetHeadphoneStatus "wikilink")                                                           |
| 0x00200040     | [ForceHeadphoneOut](DSP:ForceHeadphoneOut "wikilink")                                                             |
| 0x00210000     | [GetIsDspOccupied](DSP:GetIsDspOccupied "wikilink")                                                               |

This is the main service for playing audio. The
[CSND](CSND_Services "wikilink") service can be used for playing audio
as well, however most processes use this DSP service for playing audio.
The DSP and CSND hardware can play audio simultaneously.

[Category:Services](Category:Services "wikilink")
[Category:DSP](Category:DSP "wikilink")