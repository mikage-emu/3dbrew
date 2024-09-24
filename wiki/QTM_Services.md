QTM is the [New_3DS](New_3DS "wikilink") system module in charge of
handling head tracking. A maximum of two sessions can be opened for each
QTM service.

Head tracking is not usable when any other process is using any of the
cameras, QTM returns error 0xC8A18008 for this.

# QTM services

| Command Header | Description                                                     |
|----------------|-----------------------------------------------------------------|
| 0x00010080     | [GetHeadtrackingInfoRaw](QTM:GetHeadtrackingInfoRaw "wikilink") |
| 0x00020080     | [GetHeadtrackingInfo](QTM:GetHeadtrackingInfo "wikilink")       |
| 0x00030000     |                                                                 |
| 0x00040000     |                                                                 |
| 0x00050040     | (u8 input)                                                      |
| 0x00060000     | Writes an output u8 to cmdreply\[2\].                           |

The commands under this section are available for all QTM services
except for "qtm:c".

# QTM user service "qtm:u"

The commands available for this are exactly the same as the commands
listed under the "QTM services" section.

# QTM system service "qtm:s"

| Command Header | Description                           |
|----------------|---------------------------------------|
| 0x04010040     | (float input)                         |
| 0x04020000     | Writes float output to cmdreply\[2\]. |
| 0x04030000     |                                       |
| 0x04040000     |                                       |
| 0x04050040     | (u8 input)                            |
| 0x04060000     | Writes an u8 to cmdreply\[2\].        |
| 0x04070040     | (u8 input)                            |
| 0x040801C0     |                                       |
| 0x04090000     | Writes an u8 to cmdreply\[2\].        |
| 0x040A0040     | (u8 input)                            |

See also the "QTM services" section.

# QTM service "qtm:sp"

| Command Header | Description                           |
|----------------|---------------------------------------|
| 0x08010040     | (u8 input) Internally compared with 2 |
| 0x08020000     | Writes 1 to a flag                    |
| 0x08030040     | Returns a byte loaded from a flag     |
| 0x08040000     | Writes 1 to a flag                    |

This service has all of the commands listed under the "QTM services"
section and the "qtm:s" section, in addition to the above commands.

This service is used by [NS](NS "wikilink") and
[GSP](GSP_Services "wikilink")-module, hence no other processes can use
this service.

# QTM callibration service "qtm:c"

| Command Header | Description                                                            |
|----------------|------------------------------------------------------------------------|
| 0x00010000     | InitializeHardwareCheck (sets 0x1EB63410, 0x1EB6342B, 0x1EB6340A to 1) |
| 0x00020000     | ? (sets 0x1EB6342B, 0x1EB6340A to 0)                                   |
| 0x00030040     |                                                                        |
| 0x00040000     | Writes an output u8 to cmdreply\[2\].                                  |
| 0x00050040     | SetIrLedCheck (u8 input)                                               |

The commands for this service are separate from the commands under the
"QTM services" section.

[Category:Services](Category:Services "wikilink")