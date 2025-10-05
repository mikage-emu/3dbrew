+++
title = 'PDN Services'
categories = ["Services"]
+++

# PDN PTM Service "pdn:s"

| Command Header | Description                                                |
|----------------|------------------------------------------------------------|
| 0x00010000     | [GetWakeStatus](PDNS:GetWakeStatus "wikilink")             |
| 0x00020080     | [ConfigureWakeEvents](PDNS:ConfigureWakeEvents "wikilink") |
| 0x00030040     | [Acknowledge](PDNS:Acknowledge "wikilink")                 |

# PDN DSP Service "pdn:d"

| Command Header | Description                        |
|----------------|------------------------------------|
| 0x000100C0     | [Control](PDND:Control "wikilink") |

# PDN I2S Service "pdn:i"

| Command Header | Description                          |
|----------------|--------------------------------------|
| 0x00010040     | [Control1](PDNI:Control1 "wikilink") |
| 0x00020040     | [Control2](PDNI:Control2 "wikilink") |

Used by [Codec Services](Codec_Services "wikilink").

# PDN GSP service "pdn:g"

| Command Header | Description                        |
|----------------|------------------------------------|
| 0x000100C0     | [Control](PDNG:Control "wikilink") |

# PDN Camera Service "pdn:c"

| Command Header | Description                            |
|----------------|----------------------------------------|
| 0x00010040     | [Control](PDNC:Control "wikilink")     |
| 0x000200000    | [IsEnabled](PDNC:IsEnabled "wikilink") |

[Category:Services](Category:Services "wikilink")
