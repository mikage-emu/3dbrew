This system update [CFA](NCCH#CFA "wikilink") contains the below files
in the RomFS. This CFA is stored in the [NCSD](NCSD "wikilink")
system-update partition(partition 7), the data from this CFA RomFS can
also be transferred for [Download Play](Download_Play "wikilink") when
the client needs updated.

### cup_list

This uses the same format as the [CVer](CVer "wikilink") cup_list, this
system-update CFA cup_list contains the titleIDs for all of the titles
stored in this RomFS.

### <titleID>.cia

This is the [CIA](CIA "wikilink") for each system-update title, for
retail gamecards these CIAs are generated from the titles available on
[CDN](Title_list "wikilink") at the time the NCSD image was finalized.
The latest version(at the time of CFA generation) of every system title
from CDN is stored here, excluding titles with the title-versions for
[1.0.0-0](1.0.0-0 "wikilink").

## New3DS

New3DS system-update partitions are located at partition6 in gamecards.
The RomFS contains a "SNAKE" directory, the contents of that directory
have the same structure as the Old3DS sysupdate CFA RomFS.