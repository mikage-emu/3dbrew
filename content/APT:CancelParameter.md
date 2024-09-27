+++
title = 'APT:CancelParameter'
+++

# Request

| Index Word | Description                                             |
|------------|---------------------------------------------------------|
| 0          | Header code \[0x000F0100\]                              |
| 1          | u8, Check Sender (0 = don't check, 1 = check)           |
| 2          | Sender [AppID](NS_and_APT_Services#AppIDs "wikilink")   |
| 3          | u8, Check Receiver (0 = don't check, 1 = check)         |
| 4          | Receiver [AppID](NS_and_APT_Services#AppIDs "wikilink") |

# Response

| Index Word | Description                                                                                                                                    |
|------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code                                                                                                                                    |
| 1          | Result code                                                                                                                                    |
| 2          | u8, Status (0 = failure due to no parameter data being available, or the above enabled fields don't match the fields in NS state, 1 = success) |

# Description

When parameter data is available, and when the above specified fields
match the ones in NS state (for the ones where the checks are enabled),
this clears the flag which indicates that parameter data is available
(same flag cleared by
[<APT:ReceiveParameter>](APT:ReceiveParameter "wikilink")).