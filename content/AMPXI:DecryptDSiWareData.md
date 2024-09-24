# Request

| Index Word | Description                         |
|------------|-------------------------------------|
| 0          | Header code \[0x00450108\]          |
| 1          | Input buffer size                   |
| 2          | Output buffer size                  |
| 3          | IV size (0x10)                      |
| 4          | (u8) DSiWare section index          |
| 5          | (Input buffer size \<\< 8) \| 0x6   |
| 6          | Input buffer pointer                |
| 7          | (IV size \<\< 8) \| 0x16            |
| 8          | Input IV buffer pointer             |
| 9          | (Output buffer size \<\< 8) \| 0x24 |
| 10         | Output buffer pointer               |
| 11         | (IV size \<\< 8) \| 0x34            |
| 12         | Output IV buffer pointer            |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00450041\] |
| 1          | Result code                |

# Description

This is used during [AM:ImportTwlBackup](AM:ImportTwlBackup "wikilink").

The input IV is gotten from the block metadata at the end of each
section.

This command will decrypt the input buffer using the given IV, size and
DSiWare section index, and outputs the resulting IV after the decryption
to be reused with this command to decrypt all data until the entire
section has been read.