+++
title = 'SecureInfo A'
+++

# SecureInfo format

| Offset | Size  | Description                                                                               |
|--------|-------|-------------------------------------------------------------------------------------------|
| 0x0    | 0x100 | RSA-2048 signature over the following 0x11-bytes.                                         |
| 0x100  | 0x1   | Region                                                                                    |
| 0x101  | 0x1   | Normally zero                                                                             |
| 0x102  | 0xF   | ASCII serial number, without the [check digit](Serials#Console_Serial_Numbers "wikilink") |

The RSA private key for dev systems is embedded inside the dev system
updater package so that the region can be changed.

# SecureInfo Region Values

| Value | Description                                                                                                                          |
|-------|--------------------------------------------------------------------------------------------------------------------------------------|
| 0     | JPN                                                                                                                                  |
| 1     | USA                                                                                                                                  |
| 2     | EUR                                                                                                                                  |
| 3     | AUS(for system-update SOAP at least), unused. The [NS](NS "wikilink") programIDs for the applet AppIDs for this are the same as JPN? |
| 4     | CHN                                                                                                                                  |
| 5     | KOR                                                                                                                                  |
| 6     | TWN                                                                                                                                  |

NIM module uses "AUS" for value3 for SOAP requests, however the server
doesn't return a titlelist for that. On AUS 3DS systems this region
field is set to EUR instead.

# See Also

- [Config Services](Config_Services "wikilink")