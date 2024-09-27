# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000100C0\] |
| 1-2        | u64, Application Title ID  |
| 3          | Unused                     |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

When this TID is zero, the gamecard TID is obtained via
[AM](AMNet:GetTitleIDList "wikilink"). If the TID is the JPN [System
Settings](System_Settings "wikilink") titleID, the TID used for applet
entry initialization is loaded from an array of [System
Settings](System_Settings "wikilink") titleIDs, where the array-index is
determined by the region. This command then initializes the
titleID+mediatype field for appletID 0x300, in the titleID applet array
using the TID. This is mostly the same as
[NSS:LaunchApplicationFIRM](NSS:LaunchApplicationFIRM "wikilink")
without the [Configuration Memory](Configuration_Memory "wikilink")
checks. This calls the same code which
[NSS:LaunchApplicationFIRM](NSS:LaunchApplicationFIRM "wikilink") uses
for flags bit0=1.

When the required FIRM for the specified title matches the already
running FIRM, NS will skip FIRM-launch and just do a normal title
launch.