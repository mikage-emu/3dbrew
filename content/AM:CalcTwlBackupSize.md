+++
title = 'AM:CalcTwlBackupSize'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001A00C0\] |
| 1-2        | u64, TWL Title ID          |
| 3          | u8, Export Type            |

# Response

| Index Word | Description       |
|------------|-------------------|
| 0          | Header code       |
| 1          | Result code       |
| 2          | Total Backup Size |

# Description

This is a wrapper for
[AMPXI:GetDSiWareExportSize](AMPXI:GetDSiWareExportSize "wikilink").