+++
title = 'NWMUDS:GetNodeInformationList'
+++

# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x001F0006\]         |
| 1          | (NetworkStructSize\<\<12) \| 0x402 |
| 2          | Input network struct buffer ptr    |
| 3          | (Tag0BufSize\<\<12) \| 0x802       |
| 4          | Tag0 data buffer ptr               |
| 5          | (Tag1BufSize\<\<12) \| 0xC02       |
| 6          | Tag1 data buffer ptr               |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                                        |
|------------|----------------------------------------------------|
| 0          | (Size\<\<14) \| 2                                  |
| 1          | Ptr to output buffer, size is hard-coded to 0x280. |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

The sizes of the input/output buffers are hard-coded. The tag-data
buffers begin at the OUI field in the tags(this data is from
[NWMUDS:StartScan](NWMUDS:StartScan "wikilink")). Normally tag1buf is
unused(all-zero), tag1 is only used when the crypt-size is larger than
0xFA. The decrypted data is byte-swapped to little-endian when copying
to the output buffer.

While the input tag-data can be from arbitrary tags, the user-process
normally uses OUI type 24/0x18 for tag0 and type 25/0x19 for tag1(when
it exists).