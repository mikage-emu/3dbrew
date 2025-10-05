+++
title = 'AMPXI:UpdateImportContentContexts'
+++

# Request

| Index Word | Description |
|----|----|
| 0 | Header code \[0x00630042\] |
| 1 | Import Content Context Count |
| 2 | ((Import Content Context Count \* 2) \<\< 8) \| 0x6 |
| 3 | [Import Content Context](Application_Manager_Services#importcontentcontext "wikilink") Indices Input Pointer |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is similar to [AMPXI:CreateImportContentContexts](AMPXI:CreateImportContentContexts "wikilink"), with a key difference: this must be called after finishing the TMD installation but not while a content import is active. Furthermore, this will replace the existing entry for the title in import.db with a fresh entry - as if [AMPXI:InstallTitleBegin](AMPXI:InstallTitleBegin "wikilink") was called. After that, this follows the same flow as [AMPXI:CreateImportContentContexts](AMPXI:CreateImportContentContexts "wikilink"), by creating new import content contexts for the given content indices.
