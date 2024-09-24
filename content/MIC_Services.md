+++
title = 'MIC Services'
categories = ["Services"]
+++

# Microphone service "mic:u"

| Command Header | Description                                                                                                                                               |
|----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00010042     | [MapSharedMem](MIC:MapSharedMem "wikilink")                                                                                                               |
| 0x00020000     | [UnmapSharedMem](MIC:UnmapSharedMem "wikilink")                                                                                                           |
| 0x00030140     | [StartSampling](MICU:StartSampling "wikilink")                                                                                                            |
| 0x00040040     | [AdjustSampling](MICU:AdjustSampling "wikilink")                                                                                                          |
| 0x00050000     | [StopSampling](MICU:StopSampling "wikilink")                                                                                                              |
| 0x00060000     | [IsSampling](MICU:IsSampling "wikilink")                                                                                                                  |
| 0x00070000     | [GetEventHandle](MICU:GetEventHandle "wikilink")                                                                                                          |
| 0x00080040     | [SetGain](MICU:SetGain "wikilink")                                                                                                                        |
| 0x00090000     | [GetGain](MICU:GetGain "wikilink")                                                                                                                        |
| 0x000A0040     | [SetPower](MICU:SetPower "wikilink")                                                                                                                      |
| 0x000B0000     | [GetPower](MICU:GetPower "wikilink")                                                                                                                      |
| 0x000C0042     | [SetIirFilterMic](MICU:SetIirFilterMic "wikilink")                                                                                                        |
| 0x000D0040     | [SetClamp](MICU:SetClamp "wikilink")                                                                                                                      |
| 0x000E0000     | [GetClamp](MICU:GetClamp "wikilink")                                                                                                                      |
| 0x000F0040     | [SetAllowShellClosed](MICU:SetAllowShellClosed "wikilink")                                                                                                |
| 0x00100040     | When the input value is 0, value 1 is written to an u8 MIC module state field. Otherwise, value 0 is written there. Normally the input value is non-zero. |

This is an interface for using the MIC hardware via the "cdc:MIC"
service and the MIC [IO](IO_Registers "wikilink") registers.

Only one session can be open for this service total(that is, only one
process can use this service at a time).

## Encoding

| Enum                  | Value |
|-----------------------|-------|
| ENCODING_PCM8         | 0     |
| ENCODING_PCM16        | 1     |
| ENCODING_PCM8_SIGNED  | 2     |
| ENCODING_PCM16_SIGNED | 3     |

## SampleRate

| Enum              | Value |
|-------------------|-------|
| SAMPLE_RATE_32730 | 0     |
| SAMPLE_RATE_16360 | 1     |
| SAMPLE_RATE_10910 | 2     |
| SAMPLE_RATE_8180  | 3     |

The actual accurate sampling rate can be calculated using
`(16756991 / 512) / (SampleRate + 1)` where `SampleRate` is one of the
above values.

# See Also

[MIC Shared Memory](MIC_Shared_Memory "wikilink")

[Category:Services](Category:Services "wikilink")