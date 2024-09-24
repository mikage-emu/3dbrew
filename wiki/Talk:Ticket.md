### Ticket Format 0

|            |          |                                                                |
|:----------:|:--------:|:--------------------------------------------------------------:|
| **Offset** | **Size** |                        **Description**                         |
|    0x0     |   0x40   |                             Issuer                             |
|    0x40    |   0x3C   |                         ECC PublicKey                          |
|    0x7C    |   0x1    |                            Version                             |
|    0x7D    |   0x1    |                          CaCrlVersion                          |
|    0x7E    |   0x1    |                        SignerCrlVersion                        |
|    0x7F    |   0x10   |                       Encrypted TitleKey                       |
|    0x8F    |   0x1    |                            Reserved                            |
|    0x90    |   0x8    |                            TicketID                            |
|    0x98    |   0x4    |                        Ticket consoleID                        |
|    0x9C    |   0x8    |                            TitleID                             |
|    0xA4    |   0x2    |                      Systitle Access Mask                      |
|    0xA6    |   0x2    |                      Ticket title version                      |
|    0xA8    |   0x4    |  AccessTitleId - Indicates which titles can access this title  |
|    0xAC    |   0x4    |            AccessTitleMask (Mask for AccessTitleId)            |
|    0xB0    |   0x1    |                          License Type                          |
|    0xB1    |   0x1    | Ticket common key index, usually 0x1 for retail system titles. |
|    0xB2    |   0x2F   |                            Reserved                            |
|    0xE1    |   0x1    |                             Audit                              |
|    0xE2    |   0x40   |                         Content Index                          |
|   0x122    |   0x2    |                            Reserved                            |
|   0x124    |   0x40   |                             Limits                             |