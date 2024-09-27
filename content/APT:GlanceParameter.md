+++
title = 'APT:GlanceParameter'
+++

# Request

| Index Word | Description                                    |
|------------|------------------------------------------------|
| 0          | Header code \[0x000E0080\]                     |
| 1          | [AppID](NS_and_APT_Services#AppIDs "wikilink") |
| 2          | Parameter Size (max is 0x1000)                 |

The following is located 0x100-bytes after the beginning of the above
command buffer, as a static buffer descriptor receiving the static
buffer in the response:

| Index Word | Description                   |
|------------|-------------------------------|
| 0          | (Parameter Size \<\< 14) \| 2 |
| 1          | void\*, Parameter Output      |

# Response

| Index Word | Description                                                     |
|------------|-----------------------------------------------------------------|
| 0          | Header code \[0x000E0104\]                                      |
| 1          | Result code                                                     |
| 2          | Sender [AppID](NS_and_APT_Services#AppIDs "wikilink")           |
| 3          | [Command](NS_and_APT_Services#Command "wikilink")               |
| 4          | Actual Parameter Size                                           |
| 5          | 0x0                                                             |
| 6          | Handle Parameter                                                |
| 7          | (Actual Parameter Size \<\< 14) \| 2 (static buffer descriptor) |
| 8          | void\*, Parameter to send                                       |

# Description

This is exactly the same as
[<APT:ReceiveParameter>](APT:ReceiveParameter "wikilink") (except for
the word value prior to the output handle), except this will not clear
the flag (except when responseword\[3\] == 8 \|\| responseword\[3\] ==
9) in NS state. Thus, the parameter data can still be loaded via
[<APT:ReceiveParameter>](APT:ReceiveParameter "wikilink")/[<APT:GlanceParameter>](APT:GlanceParameter "wikilink")
after using this command, except when responseword\[3\] is one of the
above values.
