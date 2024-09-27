+++
title = 'CSND Services'
categories = ["Services"]
+++

The CSND service talks to the DSP using the DSP FIFO to negotiate what
CSND channels are allocated to the DSP, and this seems to be channels
0-7 (usually). The rest are dedicated to CSND services.

# CSND service "csnd:SND"

| Command Header | Description                                                  |
|----------------|--------------------------------------------------------------|
| 0x00010140     | [Initialize](CSND:Initialize "wikilink")                     |
| 0x00020000     | [Shutdown](CSND:Shutdown "wikilink")                         |
| 0x00030040     | [ExecuteCommands](CSND:ExecuteCommands "wikilink")           |
| 0x00040080     | [PlaySoundDirectly](CSND:PlaySoundDirectly "wikilink")       |
| 0x00050000     | [AcquireSoundChannels](CSND:AcquireSoundChannels "wikilink") |
| 0x00060000     | [ReleaseSoundChannels](CSND:ReleaseSoundChannels "wikilink") |
| 0x00070000     | [AcquireCapUnit](CSND:AcquireCapUnit "wikilink")             |
| 0x00080040     | [ReleaseCapUnit](CSND:ReleaseCapUnit "wikilink")             |
| 0x00090082     | [FlushDataCache](CSND:FlushDataCache "wikilink")             |
| 0x000A0082     | [StoreDataCache](CSND:StoreDataCache "wikilink")             |
| 0x000B0082     | [InvalidateDataCache](CSND:InvalidateDataCache "wikilink")   |
| 0x000C0000     | [Reset](CSND:Reset "wikilink")                               |

A maximum of 4 service sessions can be opened at the same time for this
service.

For cache operations addresses must be in 0x14000000-0x1C000000 range.
Starting with [8.0.0-18](8.0.0-18 "wikilink") addresses in the range
0x30000000-0x40000000 are also allowed.

This service is normally used for playing [CWAVs](BCWAV "wikilink"). The
audio data must be located in the 0x14000000 virtual memory region,
since CSND requires the physical address for playing the audio.

[Category:Services](Category:Services "wikilink")
