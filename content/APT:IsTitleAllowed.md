+++
title = 'APT:IsTitleAllowed'
+++

# Request

| Index Word | Description                                               |
|------------|-----------------------------------------------------------|
| 0          | Header code \[0x01050100\]                                |
| 1-4        | [ProgramInfo](Filesystem_services#ProgramInfo "wikilink") |

# Response

| Index Word | Description                                                                       |
|------------|-----------------------------------------------------------------------------------|
| 0          | Header code                                                                       |
| 1          | Result code, hard-coded to always return 0 with [10.4.0-X](10.4.0-29 "wikilink"). |
| 2          | u8, Allowed (0 = not allowed, 1 = allowed)                                        |

# Description

Gets whether a title is allowed for launch.

As of [10.4.0-29](10.4.0-29 "wikilink"), USA+EUR IronFall v1.0 and v1.1
are the only titles to be blocked. See [here](10.4.0-29 "wikilink") for
implementation details. The table used with this as of 10.4.0-29 just
contains <uniqueid for each Ironfall title>, with value 0x1 at entry+4
for each one.

[11.1.0-34](11.1.0-34 "wikilink") added a minimum version requirement to
"SmileBasic" (7 for JPN, 2 for USA); and [a special
case](FS:CheckUpdatedDat "wikilink") for "Animal Crossing New Leaf", to
prevent the game from being run without the major "Welcome Amiibo"
update installed if the save is already converted to the Welcome Amiibo
format.

[11.6.0-39](11.6.0-39 "wikilink") added all three regions of "Flipnote
Studio 3D".

If this command returns an error, Home Menu will handle that the exact
same way as if the output u8 was value 0(one way this could happen is if
v10.4 Home Menu is installed with a pre-v10.4 NS).
