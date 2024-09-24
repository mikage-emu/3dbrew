# PDN PTM Service "pdn:s"

| Command Header | Description                                                                                                                                                                                                                                                                                               |
|----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00010000     | GetWakeStatus. This loads [PDN_WAKE_ENABLE](PDN_Registers#PDN_WAKE_ENABLE "wikilink") and [PDN_WAKE_REASON](PDN_Registers#PDN_WAKE_REASON "wikilink"), then writes them to cmdreplyword\[2\] and cmdreplyword\[3\].                                                                                       |
| 0x00020080     | ConfigureWakeEvents. [PDN_WAKE_REASON](PDN_Registers#PDN_WAKE_REASON "wikilink") = cmdword\[2\] & cmdword\[1\]. This then writes cmdword\[1\] to [PDN_WAKE_ENABLE](PDN_Registers#PDN_WAKE_ENABLE "wikilink"). [PDN_WAKE_REASON](PDN_Registers#PDN_WAKE_REASON "wikilink") = cmdword\[2\] & ~cmdword\[1\]. |
| 0x00030040     | Acknowledge. Writes cmdword\[1\] to [PDN_WAKE_REASON](PDN_Registers#PDN_WAKE_REASON "wikilink").                                                                                                                                                                                                          |

# PDN DSP Service "pdn:d"

| Command Header | Description                                                                                                    |
|----------------|----------------------------------------------------------------------------------------------------------------|
| 0x000100C0     | (bool enable, bool reset, bool deassertResetAfterReset) Enables and/or resets the DSP and/or holds it in reset |

# PDN I2S Service "pdn:i"

| Command Header | Description                                                                          |
|----------------|--------------------------------------------------------------------------------------|
| 0x00010040     | This sets bit0 in [PDN_I2S1_CNT](PDN_Registers#PDN_I2S1_CNT "wikilink") to u8 cmd+4. |
| 0x00020040     | This sets bit1 in [PDN_I2S2_CNT](PDN_Registers#PDN_I2S2_CNT "wikilink") to u8 cmd+4. |

Used by [Codec Services](Codec_Services "wikilink").

# PDN GSP service "pdn:g"

| Command Header | Description                                                                                                                                       |
|----------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x000100C0     | (bool enableClock, bool resetEngines, bool resetRegisters) Enables and/or resets the GPU, see [PDN_GPU_CNT](PDN_Registers#PDN_GPU_CNT "wikilink") |

# PDN Camera Service "pdn:c"

| Command Header | Description                                                                                 |
|----------------|---------------------------------------------------------------------------------------------|
| 0x00010040     | This sets bit0 in [PDN_CAMERA_CNT](PDN_Registers#PDN_CAMERA_CNT "wikilink") to u8 cmd+4.    |
| 0x000200000    | This writes [PDN_CAMERA_CNT](PDN_Registers#PDN_CAMERA_CNT "wikilink") & 1 to u8 cmdreply+8. |

[Category:Services](Category:Services "wikilink")