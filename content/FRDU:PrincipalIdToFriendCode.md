# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00240040\] |
| 1          | principalId                |

This function takes the principalId given and applies SHA-1 over it
(byte order: little endian). The first byte of the SHA-1 digest is then
shifted right by 1, which forms the checksum byte.

It returns an u64. The lower word is the principalId, the upper word is
the checksum byte.

# Response

| Index Word | Description                    |
|------------|--------------------------------|
| 0          | Header code                    |
| 1          | Result code                    |
| 2-3        | (u64)the shareable friend code |