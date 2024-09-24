+++
title = 'Online Play'
+++

**Online Play** is a functionality of the Nintendo 3DS to play games
online with other people.

## Connection

First a connection to *nasc.nintendowifi.net* is established and the
resource */ac* is requested with the POST method to get the actual
address of the game server and a ticket for authentication on the game
server.
A typical request to *nasc.nintendowifi.net/ac* has this format:

Header:

    POST https://nasc.nintendowifi.net/ac HTTP/1.1
    Host: nasc.nintendowifi.net
    X-GameId: 00003200
    User-Agent: CTR FPD/000F
    Content-Type: application/x-www-form-urlencoded
    Content-Type: application/x-www-form-urlencoded
    Content-Length: 841

Body:

    gameid=MDAwMDMyMDA%2A&sdkver=MDAwMDAw&titleid=MDAwNDAxMzAwMDAwMzIwMg%2A%2A&gamecd=LS0tLQ%2A%2A&gamever=MDAxNA%2A%2A&mediatype=MA%2A%2A&makercd=MDA%2A&unitcd=Mg%2A%2A&macadr=MTEyMjMzNDQ1NTY2&bssid=MTEyMjMzYWFiYmNj&apinfo=MDQ6MDAwMDAwMDAwMA%2A%2A&fcdcert=<base64 encoded fcdcert>&devname=<base64 encoded name of the console (utf-16)>&servertype=TDE%2A&fpdver=MDAwRg%2A%2A&devtime=MjEwMTAxMjAyNjAx&lang=MDE%2A&region=MDI%2A&csnum=<base64 encoded serial number of the 3DS system wihtout check number>&uidhmac=<base64 encoded of ?>&userid=<base64 encoded Nex [[Principal_ID|Principal ID]]>&action=TE9HSU4%2A&ingamesn=

| Key        | Value                      | Value decoded    | Notes                                                                     |
|------------|----------------------------|------------------|---------------------------------------------------------------------------|
| gameid     | MDAwMDMyMDA\*              | 00003200         |                                                                           |
| sdkver     | MDAwMDAw                   | 000000           |                                                                           |
| titleid    | MDAwNDAxMzAwMDAwMzIwMg\*\* | 0004013000003202 |                                                                           |
| gamecd     | LS0tLQ\*\*                 | ----             |                                                                           |
| gamever    | MDAxNA\*\*                 | 0014             |                                                                           |
| mediatype  | MA\*\*                     | 0                |                                                                           |
| makercd    | MDA\*                      | 00               |                                                                           |
| unitcd     | Mg\*\*                     | 2                |                                                                           |
| macadr     | MTEyMjMzNDQ1NTY2           | 112233445566     | MAC address of the console. Only the digits                               |
| bssid      | MTEyMjMzYWFiYmNj           | 112233aabbcc     |                                                                           |
| apinfo     | MDQ6MDAwMDAwMDAwMA\*\*     | 04:0000000000    |                                                                           |
| fcdcert    |                            |                  |                                                                           |
| devname    |                            |                  | Name of the console in UTF-16                                             |
| servertype | TDE\*                      | L1               |                                                                           |
| fpdver     | MDAwRg\*\*                 | 000F             |                                                                           |
| devtime    | MjEwMTAxMDkyMDMx           | 210101092031     |                                                                           |
| lang       | MDE\*                      | 01               |                                                                           |
| region     | MDE\*                      | 01               |                                                                           |
| csnum      | Q0VGMTIzNDU2Nzg\*          | CEF12345678      | [Serial number](Serials "wikilink") of the device without the check digit |
| uidhmac    | MGFmODZmYmQ\*              | 0af86fbd         |                                                                           |
| userid     | MTIzNDU2Nzg5MA\*\*         | 1234567890       | Nex [Principal ID](Principal_ID "wikilink")                               |
| action     | TE9HSU4\*                  | LOGIN            |                                                                           |
| ingamesn   | *empty*                    | *empty*          |                                                                           |

Typical response to the above request:

Header:

    HTTP/1.1 200 OK
    NODE: pd42wfiap02
    Content-Type: text/plain;charset=ISO-8859-1
    Content-Length: 252
    Date: Fri, 01 Jan 2021 09:20:55 GMT
    Server: Nintendo Wii (http)

Body:

    locator=MzQuMjExLjIzNS4xMzU6NjAwMDA*&retry=MA**&returncd=MDAx&token=<Token for authentication on the game server>&datetime=MjAyMTAxMDEwOTIwNTU*

| Key      | Value                         | Value decoded        | Notes                                                                                          |
|----------|-------------------------------|----------------------|------------------------------------------------------------------------------------------------|
| locator  | MzQuMjExLjIzNS4xMzU6NjAwMDA\* | 34.211.235.135:60000 | IP address and port of the game server                                                         |
| retry    | MA\*\*                        | 0                    |                                                                                                |
| returncd | MDAx                          | 001                  | 001 for success. 119 if there is an update required                                            |
| token    |                               |                      | Token for authentication on the game server. This token cannot be verified by the Nintendo 3DS |
| datetime | MjAyMTAxMDEwOTIwNTU\*         | 20210101092055       |                                                                                                |

If there is an error (returncd is not 001) no locator and token is send

## Game Server Informations

| Game                                  | build name                                               |
|---------------------------------------|----------------------------------------------------------|
| Kid Icarus Uprising                   | branch:akd_server build:2_25_10595_1                     |
| Mario Kart 7                          | branch:origin/project/appsp build:3_4_17_3               |
| Pokemon X/Y OR/AS                     | branch:origin/project/appsg build:3_3_15_6_0             |
| Metroid Prime Federation Force        | branch:origin/release/ngs/3.9.x.200x build:3_9_21_2005_0 |
| Luigi's Mansion 2                     | branch:origin/release/ngs/3.4.x.3 build:3_4_16_3_0       |
| The Legend of Zelda: Tri Force Heroes | branch:origin/release/ngs/3.9.x.200x build:3_9_21_2005_0 |
| Pokemon Bank                          | branch:origin/project/ctr-jtta build:3_4_13_16_0         |
| Nintendo Badge Arcade                 | branch:origin/project/ctr-jwv build:3_7_16_2006_0        |
| Pokemon Sun/Moon US/UM                | branch:origin/project/ctr-a2a build:3_10_23_3112_0       |
