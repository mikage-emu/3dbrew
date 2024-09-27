# Request

| Index Word | Description                               |
|------------|-------------------------------------------|
| 0          | Header code \[0x00170182\]                |
| 1          | Unused u32. Normally 0x1.                 |
| 2          | u16 destination NetworkNodeID.            |
| 3          | u8 [data_channel](NWMUDS:Bind "wikilink") |
| 4          | BufSize \>\> 2                            |
| 5          | Actual data size                          |
| 6          | u8 flags                                  |
| 7          | (BufSize\<\<14) \| 0x402                  |
| 8          | Pointer to the input buffer               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Flags

| Bit | Description                                                                                                              |
|-----|--------------------------------------------------------------------------------------------------------------------------|
| 0   | Unknown, normally set.                                                                                                   |
| 1   | When set, broadcast the data frame via the destination MAC address, even when the NetworkNodeID isn't set for broadcast. |

This command *only* uses the input flags field for checking the above 2
bits, nothing more.

# Description

This sends a data frame, while connected to the UDS network. This is the
sending version of [NWMUDS:PullPacket](NWMUDS:PullPacket "wikilink").
BufSize is 4-byte aligned version of "Actual data size". The
actual_datasize must be \<= 0x5C6.