+++
title = 'AMPXI:ExportDSiWare'
+++

# Request

| Index Word | Description                           |
|------------|---------------------------------------|
| 0          | Header code \[0x004D0144\]            |
| 1-2        | u64, TWL Title ID                     |
| 3          | Path size                             |
| 4          | Working buffer size (usually 0x20000) |
| 5          | u8, DSiWare export type               |
| 6          | (PathSize \<\< 8) \| 0x4              |
| 7          | Path pointer                          |
| 8          | (WorkingBufferSize \<\< 8) \| 0x14    |
| 9          | Working buffer pointer                |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x004D0040\] |
| 1          | Result code                |

# Description

This is used for [exporting](DSiWare_Exports "wikilink") DSiWare. The
UTF-16 input path is normally in the format
"[sdmc](SD_Filesystem "wikilink"):/Nintendo 3DS/<ID0>/<ID1>/Nintendo
DSiWare/\<TitleID-Low.bin\>", however this can be arbitrary.
