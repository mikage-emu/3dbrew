# Request

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[Starting with 9.3.0-X: 0x000F0000\] |

# Response

| Index Word | Description     |
|------------|-----------------|
| 0          | Header code     |
| 1          | Result code     |
| 2          | u8 output state |

# Status values

| Value          | Description                                                                                                        |
|----------------|--------------------------------------------------------------------------------------------------------------------|
| 1              | Attempting to initialize Old3DS NFC adapter communication.                                                         |
| 2              | Old3DS NFC adapter communication initialization successfully finished.                                             |
| Other value(s) | An error occurred. Use [NFC:CommunicationGetResult](NFC:CommunicationGetResult "wikilink") to get the result-code. |

# Description

This returns the current status for Old3DS NFC adapter communication.