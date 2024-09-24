The ExHeader Sha-256 hash and ExHeader Size for the NCSD header is
always zero, why?--[3dsguy](User:3dsguy "wikilink") 07:33, 28 July 2012
(CEST)

Old version:

| Offset | Size | Description                                                         |
|--------|------|---------------------------------------------------------------------|
| 0x200  | 4    | Always 0xFFFFFFFF                                                   |
| 0x204  | 252  | Padding?                                                            |
| 0x300  | 4    | Used ROM size in bytes                                              |
| 0x304  | 28   | Padding                                                             |
| 0x320  | 8    | [CVer](CVer "wikilink") Title ID (Only Present in retail .CCI)      |
| 0x328  | 8    | [CVer](CVer "wikilink") Title Version (Only Present in retail .CCI) |

This CVer titleID/title-version is from the CVer [CIA](CIA "wikilink")
stored in the [System Update CFA](System_Update_CFA "wikilink"). With
newer NATIVE_FIRM versions the system reads this 0x200-byte block from
offset 0x200 in the NCSD image, however the CVer fields are not used.


Old Version? Is this not present in new retail game
dumps?--[3dsguy](User:3dsguy "wikilink") 03:48, 29 July 2012 (CEST)