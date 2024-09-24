+++
title = 'SPI Services'
categories = ["Services"]
+++

# SPI Services

- "SPI::NOR" (used by cfg:NOR)
- "SPI::CD2" (used by [Codec Services](Codec_Services "wikilink"))
- "SPI::CS2"
- "SPI::CS3"
- "SPI::DEF"

There can only be 5 sessions open total, with 1 per service. When
there's already a session open for the target service(with
session_count\<5), SPI-module will wait for the original thread to
terminate(triggered by the session closing), then start a new thread.

# SPI Service Commands

| Command Header | Description                                     |
|----------------|-------------------------------------------------|
| 0x0001....     | SetDeviceState(u8 deviceid, u8 state)           |
| 0x0002....     | Stubbed, only returns zero.                     |
| 0x00030100     | ReadWriteDevice(u8 deviceid, ...)               |
| 0x00040500     | ReadWriteDevice2(u8 deviceid, ...)              |
| 0x0005....     | WriteDevice(u8 deviceid, ...)                   |
| 0x00060102     | ReadWriteDeviceArray(u8 deviceid, ...)          |
| 0x00070102     | ReadWriteDevice2Array(u8 deviceid, ...)         |
| 0x000800C0     | EnableSpiBus(u8 deviceid, bool onoff, u8 state) |
| 0x00090040     | EnableTwlSpiBus?(bool onoff)                    |

`0,1,2: 0x1EC60800`
`3,4,5: 0x1EC42800`
`    6: 0x1EC43800`

[Category:Services](Category:Services "wikilink")