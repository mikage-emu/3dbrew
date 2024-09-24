+++
title = 'NIMU:CommitSystemTitles'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00040000\] |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00040040\] |
| 1          | Result code                |

# Description

Commits pending system update titles, replacing the current titles.

This copies the titleIDs of system titles which did not have
installation finalized yet(which were already downloaded), to a
title-list buffer. If there's any titles which were not completely
downloaded, where TWL titles with titleID-high bit0 is set, or CTR
titles with titleID-high bit5 set, NIM will then return without using
any AM commands. NIM will then use
[AMNet:InstallTitlesFinish](AMNet:InstallTitlesFinish "wikilink")(mediatype=NAND)
with the above title-list buffer, and then use command
[AMNet:FinishInstallToMedia](AMNet:FinishInstallToMedia "wikilink")(mediatype=NAND).