# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001A0000\] |

# Response

| Index Word | Description                                                                                                            |
|------------|------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code                                                                                                            |
| 1          | Resultcode                                                                                                             |
| 2-5        | The format for this is the same as the [FSPXI:GetSdmcArchiveResource](FSPXI:GetSdmcArchiveResource "wikilink") output. |

# Description

This is the same as
[FSPXI:GetSdmcArchiveResource](FSPXI:GetSdmcArchiveResource "wikilink"),
except this is for the [CTRNAND-FS](Flash_Filesystem "wikilink") FAT
partition.