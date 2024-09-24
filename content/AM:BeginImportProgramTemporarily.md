+++
title = 'AM:BeginImportProgramTemporarily'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x04030000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | 0x10        |
| 3          | CIA Handle  |

# Description

Similar to [AM:BeginImportProgram](AM:BeginImportProgram "wikilink"),
except sets the database type to 1 for tmp\*.db and the mediatype to
NAND.
