# Request

| Index Word | Description                                    |
|------------|------------------------------------------------|
| 0          | Header code \[0x00060040\]                     |
| 1          | [AppID](NS_and_APT_Services#AppIDs "wikilink") |

# Response

| Index Word | Description                                             |
|------------|---------------------------------------------------------|
| 0          | Header code                                             |
| 1          | Result code                                             |
| 2-3        | u64, Title ID                                           |
| 4          | [MediaType](Filesystem_services#MediaType "wikilink")   |
| 5          | u8, Registered (0 = not registered, 1 = registered)     |
| 6          | u8, Loaded (0 = not loaded, 1 = loaded)                 |
| 7          | [AppletAttr](NS_and_APT_Services#AppletAttr "wikilink") |

# Description

This returns info for the specified app(let). It seems when the app(let)
for the specified AppID isn't running, error 0xC880CFFA is returned.