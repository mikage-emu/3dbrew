This tool available from the eShop allows transferring savegames from
the gamecard to the eShop version of the game installed on SD card. This
tool only supports using a gamecard for the source and the SD version
for the destination. The files stored in the original gamecard savegame
are deleted once the transfer is finished.

Each time the tool is loaded, the tool
[downloads](https://npdl.cdn.nintendowifi.net/p01/nsa/pZWhL0tyf4FMCt8r/FGONLYT/fairy_bl.lrc)
the blacklist of titles which can't have savegames transferred, to
extdata with [SpotPass](SpotPass "wikilink"). The content payload for
this may contain hashes.

## Transfer implementation

This app uses [FSUSER](Filesystem_services "wikilink") commands which
might be savedata-transfer related? This app includes code for using
[FS:OpenFileDirectly](FS:OpenFileDirectly "wikilink") with archive
0x567890B2.

## ExtData

The ExtData [File System](Extdata#Filesystem "wikilink") for Save Data
Transfer Tool is as follows:

`root`
`├── icon`
`├── boss`
`│   └── FGONLYT00.tmp`
`└── user`

| File          | Details                                                   | Size         | FW Introduced                   | Plaintext                                                                                            |
|---------------|-----------------------------------------------------------|--------------|---------------------------------|------------------------------------------------------------------------------------------------------|
| icon          | Duplicated from application ExeFS. Always image 00000002. | 0x36c0 Bytes | n/a                             | [Download](https://dl.dropboxusercontent.com/u/60710927/CTR/Sample/SaveDataTransferToolExtdata/icon) |
| FGONLYT00.tmp | Where the data from fairy_bl.lrc is stored                | 0x21c Bytes  | [5.0.0-11](5.0.0-11 "wikilink") |                                                                                                      |