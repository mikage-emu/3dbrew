+++
title = 'APT:GetProgramInfo'
+++

# Request

| Index Word | Description                                                |
|------------|------------------------------------------------------------|
| 0          | Header code \[0x00480100\]                                 |
| 1-4        | [Program Info](Filesystem_services#ProgramInfo "wikilink") |

# Response

| Index Word | Description                                              |
|------------|----------------------------------------------------------|
| 0          | Header code                                              |
| 1          | Result code                                              |
| 2          | u8, [System Mode](NCCH/Extended_Header#Flag0 "wikilink") |
| 3          | FIRM Program ID Low                                      |

# Description

This obtains info mainly used for [launching](APT:Reboot "wikilink")
[FIRM](FIRM "wikilink"). For TWL titles, the output Program ID Low is
0x102 for TWL_FIRM, however for CTR titles this is
[loaded](PMApp:GetTitleExheaderFlags "wikilink") from the first 4-bytes
of the exheader_arm11systemlocalcaps.flags("Core Version"). For non-TWL
titles when a certain NS state flag is set, the output flag is the value
from config-mem [APPMEMTYPE](Configuration_Memory "wikilink").