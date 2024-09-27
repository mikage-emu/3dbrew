+++
title = 'NSS:RebootSystem'
+++

# Request

| Index Word | Description                                                         |
|------------|---------------------------------------------------------------------|
| 0          | Header code \[0x00100180\]                                          |
| 1          | u8, Launch Title (0 = don't launch, 1 = launch)                     |
| 2-5        | Title [ProgramInfo](Filesystem_services#programinfo "wikilink")     |
| 6          | u8, Launch [APPMEMTYPE](Configuration_Memory#appmemtype "wikilink") |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

When set to launch the provided title, the input
[ProgramInfo](Filesystem_services#programinfo "wikilink") is written to
the [FIRM](FIRM "wikilink") parameter buffer. Otherwise, the
[ProgramInfo](Filesystem_services#programinfo "wikilink") stored in the
parameter buffer is cleared. The rest of the code executed here is the
same as [<APT:StartNewestHomeMenu>](APT:StartNewestHomeMenu "wikilink"),
without the
[<APT:PrepareToStartNewestHomeMenu>](APT:PrepareToStartNewestHomeMenu "wikilink")-related
code.
