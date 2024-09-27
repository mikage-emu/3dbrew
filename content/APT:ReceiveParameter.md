+++
title = 'APT:ReceiveParameter'
+++

# Request

| Index Word | Description                                    |
|------------|------------------------------------------------|
| 0          | Header code \[0x000D0080\]                     |
| 1          | [AppID](NS_and_APT_Services#appids "wikilink") |
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
| 0          | Header code \[0x000D0104\]                                      |
| 1          | Result code                                                     |
| 2          | Sender [AppID](NS_and_APT_Services#appids "wikilink")           |
| 3          | [Command](NS_and_APT_Services#command "wikilink")               |
| 4          | Actual Parameter Size                                           |
| 5          | 0x10 (Move handle descriptor)                                   |
| 6          | Handle Parameter                                                |
| 7          | (Actual Parameter Size \<\< 14) \| 2 (static buffer descriptor) |
| 8          | void\*, Parameter to send                                       |

# Description

This returns the current parameter data from NS state, from the source
process which set the parameters. Once finished, NS will clear a flag in
the NS state so that this command will return an error if this command
is used again if parameters were not set again. This is called when the
second [<APT:Initialize>](APT:Initialize "wikilink") event is triggered.
It returns a signal type indicating why it was triggered.
