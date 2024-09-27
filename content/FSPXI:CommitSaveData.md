+++
title = 'FSPXI:CommitSaveData'
+++

# Request

| Index Word | Description                                                    |
|------------|----------------------------------------------------------------|
| 0          | Header code \[0x001500C0\]                                     |
| 1          | Archive handle lower word                                      |
| 2          | Archive handle upper word                                      |
| 3          | ID sent from [FS:ControlArchive](FS:ControlArchive "wikilink") |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# ID

This command is the default called by FS:ControlArchive. Except for 1
(retrieve file last modified time) and 0x789D (unknown), this may handle
other archive actions