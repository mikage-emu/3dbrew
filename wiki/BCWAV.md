This document is about the format of Binary CTR Wave files (BCWAV). The
structure is very similar to Microsoft's Wave file.

### Overview

Microsoft's WAV structure is RIFF Header which defines the data inside
which is WAVE, then the media player expects a "fmt " chunk and a "data"
chunk. Nintendo's format uses a CWAV header (no need for a general
structure for media, only wave), which points to an INFO struct (the
equivalent to fmt) and a DATA struct (the equivalent to data).

### Header

| OFFSET | SIZE | DESCRIPTION                                                                                                            |
|--------|------|------------------------------------------------------------------------------------------------------------------------|
| 0x000  | 4    | Magic (CWAV)                                                                                                           |
| 0x004  | 2    | Endianness (0xFEFF = little, 0xFFFE = big)                                                                             |
| 0x006  | 2    | Header Size (0x40 due to [Info Block](#Info_Block "wikilink") alignment)                                               |
| 0x008  | 4    | Version (0x02010000)                                                                                                   |
| 0x00C  | 4    | File Size                                                                                                              |
| 0x010  | 2    | Number of Blocks (2)                                                                                                   |
| 0x012  | 2    | Reserved                                                                                                               |
| 0x014  | 12   | [Info Block](#Info_Block "wikilink") [Sized Reference](#Sized_Reference "wikilink") (Offset relative to start of file) |
| 0x020  | 12   | [Data Block](#Data_Block "wikilink") [Sized Reference](#Sized_Reference "wikilink") (Offset relative to start of file) |

### Block Header

| OFFSET | SIZE | DESCRIPTION |
|--------|------|-------------|
| 0x000  | 4    | Magic       |
| 0x004  | 4    | Size        |

#### Block Types

| MAGIC | TYPE                                 |
|-------|--------------------------------------|
| INFO  | [Info Block](#Info_Block "wikilink") |
| DATA  | [Data Block](#Data_Block "wikilink") |

### Info Block

| OFFSET | SIZE | DESCRIPTION                                                                             |
|--------|------|-----------------------------------------------------------------------------------------|
| 0x000  | 8    | [Block Header](#Block_Header "wikilink")                                                |
| 0x008  | 1    | [Encoding](#Encoding "wikilink")                                                        |
| 0x009  | 1    | Loop (0 = don't loop, 1 = loop)                                                         |
| 0x00A  | 2    | Padding                                                                                 |
| 0x00C  | 4    | Sample Rate                                                                             |
| 0x010  | 4    | Loop Start Frame                                                                        |
| 0x014  | 4    | Loop End Frame                                                                          |
| 0x018  | 4    | Reserved                                                                                |
| 0x01C  | X    | [Channel Info](#Channel_Info "wikilink") [Reference Table](#Reference_Table "wikilink") |
| X      | X    | [Channel Info](#Channel_Info "wikilink") Entries                                        |

If encoding is DSP ADPCM:

| OFFSET | SIZE | DESCRIPTION                                          |
|--------|------|------------------------------------------------------|
| X      | X    | [DSP ADPCM Info](#DSP_ADPCM_Info "wikilink") Entries |

If encoding is IMA ADPCM:

| OFFSET | SIZE | DESCRIPTION                                          |
|--------|------|------------------------------------------------------|
| X      | X    | [IMA ADPCM Info](#IMA_ADPCM_Info "wikilink") Entries |

The info block is aligned to 0x20 bytes.

#### Encoding

| VALUE | DESCRIPTION |
|-------|-------------|
| 0     | PCM8        |
| 1     | PCM16       |
| 2     | DSP ADPCM   |
| 3     | IMA ADPCM   |

#### Channel Info

| OFFSET | SIZE | DESCRIPTION                                                                                                         |
|--------|------|---------------------------------------------------------------------------------------------------------------------|
| 0x000  | 8    | Samples [Reference](#Reference "wikilink") (Offset relative to [Data Block](#Data_Block "wikilink") Data field)     |
| 0x008  | 8    | ADPCM Info [Reference](#Reference "wikilink") (Offset relative to Samples [Reference](#Reference "wikilink") field) |
| 0x010  | 4    | Reserved                                                                                                            |

##### DSP ADPCM Info

| OFFSET | SIZE | DESCRIPTION                                   |
|--------|------|-----------------------------------------------|
| 0x000  | 32   | [Param](#DSP_ADPCM_Param "wikilink")          |
| 0x020  | 6    | [Context](#DSP_ADPCM_Context "wikilink")      |
| 0x026  | 6    | Loop [Context](#DSP_ADPCM_Context "wikilink") |
| 0x02C  | 2    | Padding                                       |

###### DSP ADPCM Param

| OFFSET | SIZE | DESCRIPTION         |
|--------|------|---------------------|
| 0x000  | 32   | 16-bit Coefficients |

###### DSP ADPCM Context

| OFFSET | SIZE | DESCRIPTION                   |
|--------|------|-------------------------------|
| 0x000  | 1    | 4-bit Predictor + 4-bit Scale |
| 0x001  | 1    | Reserved                      |
| 0x002  | 2    | Previous Sample               |
| 0x004  | 2    | Second Previous Sample        |

##### IMA ADPCM Info

| OFFSET | SIZE | DESCRIPTION                                   |
|--------|------|-----------------------------------------------|
| 0x000  | 4    | [Context](#IMA_ADPCM_Context "wikilink")      |
| 0x004  | 4    | Loop [Context](#IMA_ADPCM_Context "wikilink") |

###### IMA ADPCM Context

| OFFSET | SIZE | DESCRIPTION |
|--------|------|-------------|
| 0x000  | 2    | Data        |
| 0x002  | 1    | Table Index |
| 0x003  | 1    | Padding     |

### Data Block

| OFFSET | SIZE                                                    | DESCRIPTION                              |
|--------|---------------------------------------------------------|------------------------------------------|
| 0x000  | 8                                                       | [Block Header](#Block_Header "wikilink") |
| 0x008  | [Block Header](#Block_Header "wikilink") Size Value - 8 | Data                                     |

The data block is aligned to 0x20 bytes, as well as the data field's
actual sample data.

### Reference Table

| OFFSET | SIZE       | DESCRIPTION                                                           |
|--------|------------|-----------------------------------------------------------------------|
| 0x000  | 4          | Count                                                                 |
| 0x004  | Count \* 8 | [References](#Reference "wikilink") (Offsets relative to Count field) |

### Sized Reference

| OFFSET | SIZE | DESCRIPTION                        |
|--------|------|------------------------------------|
| 0x000  | 8    | [Reference](#Reference "wikilink") |
| 0x008  | 4    | Size                               |

### Reference

| OFFSET | SIZE | DESCRIPTION                  |
|--------|------|------------------------------|
| 0x000  | 2    | Type ID                      |
| 0x002  | 2    | Padding                      |
| 0x004  | 4    | Offset ("null" = 0xFFFFFFFF) |

#### Reference Types

| ID     | TYPE                                         |
|--------|----------------------------------------------|
| 0x0300 | [DSP ADPCM Info](#DSP_ADPCM_Info "wikilink") |
| 0x0301 | [IMA ADPCM Info](#IMA_ADPCM_Info "wikilink") |
| 0x1F00 | [Sample Data](#Data_Block "wikilink")        |
| 0x7000 | [Info Block](#Info_Block "wikilink")         |
| 0x7001 | [Data Block](#Data_Block "wikilink")         |
| 0x7100 | [Channel Info](#Channel_Info "wikilink")     |

[Category:File formats](Category:File_formats "wikilink")