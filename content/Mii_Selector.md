+++
title = 'Mii Selector'
+++

This is the library applet used to select a [Mii](Mii "wikilink").
Internally it is called *appletEd*.

# Launching the applet

*appletEd* can be launched by calling
[<APT:StartLibraryApplet>](APT:StartLibraryApplet "wikilink") with
[AppID](NS_and_APT_Services#AppIDs "wikilink") 0x402. It expects a
pointer to a [buffer](#Parameter_Buffer "wikilink") of 0x104 bytes to be
passed as parameter. It does not use other resources, so an invalid
[handle](SVC#typedef_Handle "wikilink") of value 0 is expected.

After returning from the applet, [part of the parameter
buffer](#Return_Buffer "wikilink") is filled with the data of any
selected Mii and some other related values.

# Parameter Buffer

The applet can be configured to work in a flexible way by setting values
in a 0x104 byte long buffer that is passed when launching it.

| Index Byte | Size       | Type     | Name                                     | Description                                                                                                                                                                                                                                                                             |
|------------|------------|----------|------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x000      | 1          | `1*u8`   | Cancel button flag                       | If set to a nonzero value, a Button labeled *(B) Cancel* is displayed at the bottom of the applet. This allows to cancel the selection of a Mii.                                                                                                                                        |
| 0x001      | 1          | `1*u8`   | Enable Guest Mii selection flag          | If set to a nonzero value, 6 predefined *Guest Miis* can be selected on their own page.                                                                                                                                                                                                 |
| 0x002      | 1          | `1*u8`   | Show on top screen flag                  | If set to a nonzero value, the applet is displayed at the top screen instead of the touchscreen.                                                                                                                                                                                        |
| 0x003      | 5          | `5*u8`   | *Unknown*                                | May be padding to align the following data to a 8-byte boundary.                                                                                                                                                                                                                        |
| 0x008      | 128 (0x80) | `64*u16` | Title                                    | This is a UTF16-LE\[<https://en.wikipedia.org/wiki/UTF-16%5D-encoded>, zero-terminated string that is displayed at the top of the applet. If the first character is set to `'\x0000'` (null-terminator), a default title is displayed.                                                  |
| 0x088      | 4          | `4*u8`   | *Unknown*                                | May be padding.                                                                                                                                                                                                                                                                         |
| 0x08C      | 1          | `1*u8`   | Show Guest Miis flag                     | If set to a nonzero value, the applet initially shows the page where the Guest Miis are located. Otherwise, it displays the user-created/-imported Miis after launch.                                                                                                                   |
| 0x08D      | 3          | `3*u8`   | *Unknown*                                | May be padding to align the following data to a 8-byte boundary.                                                                                                                                                                                                                        |
| 0x090      | 4          | `1*u32`  | Initially selected Mii index             | If set to a value `i`, the cursor is initially placed on the `i+1`st Mii in the [Mii database](Mii#Mii_Database "wikilink"). If *Show Guest Miis* is set and `i` is in \[0,...,5\], the cursor is placed on the `i+1`st Guest Mii. In any other case a user's personal Mii is selected. |
| 0x094      | 6          | `6*u8`   | Guest Mii whitelist                      | For each nonzero byte in this array, the corresponding Guest Mii is made selectable. Otherwise they are greyed out and can't be selected.                                                                                                                                               |
| 0x09A      | 100 (0x64) | `100*u8` | User Mii whitelist                       | Like the above, only for the Miis found in the system's database. A Mii's index in this array corresponds to its index in the system database.                                                                                                                                          |
| 0x0FE      | 2          | `1*u16`  | *Unknown*                                | May be padding to align the following data to a 8-byte boundary.                                                                                                                                                                                                                        |
| 0x100      | 4          | `1*u32`  | Magic value `0x13DE28CF` (little Endian) | Without this value, the applet refuses to display any Miis.                                                                                                                                                                                                                             |

# Return Buffer

After selecting a Mii or canceling the operation, *appletEd* writes 0x84
byte to the parameter buffer it was passed, starting at offset 0.

| Index Byte | Size      | Type           | Name                     | Description                                                                                                                                               |
|------------|-----------|----------------|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00       | 4         | `1*u32`        | Return code              | Set to 1 if the action was canceled, 0 if a Mii was selected.                                                                                             |
| 0x04       | 4         | `1*u32`        | Guest Mii selected flag  | Set to 1 if a Guest Mii was selected, 0 if it was a user Mii.                                                                                             |
| 0x08       | 4         | `1*u32`        | Selected Guest Mii index | If a Guest Mii was selected, this is set to the value corresponding to its index (i.e. 3 for Guest D). Set to 0xFFFFFFFF (-1) if a user Mii was selected. |
| 0x0C       | 92 (0x5c) | `1*struct mii` | Selected Mii data        | If a Mii was selected, its data is copied here. The same [format](Mii#Mii_format "wikilink") as in the system's Mii database is used.                     |
| 0x68       | 2         | `2*u8`         | *Unknown*                | \-                                                                                                                                                        |
| 0x6a       | 2         | `1*u16`        | Mii data checksum (?)    | This may be a [checksum](Mii#Checksum "wikilink") of the returned Mii data.                                                                               |
| 0x6c       | 24        | `12*u16`       | Guest Mii name           | The localized name as a UTF16-LE string of a Guest Mii if one was selected, zeroed otherwise.                                                             |