+++
title = 'LocalFriendCodeSeed B'
+++

# Format

| Offset | Size  | Description                                                                                                                                                                     |
|--------|-------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x100 | RSA-2048 signature over the following 0x10-bytes.                                                                                                                               |
| 0x100  | 0x8   | Normally zero? The second byte (offset 0x101) appears to be 0x01 if system is a devkit.                                                                                         |
| 0x108  | 0x8   | LocalFriendCodeSeed. Since the data of the whole file gets copied to [movable.sed](../../Nand/private/movable.sed "wikilink"), this also becomes the first 8 bytes of the keyY there. |

This contains the same LocalFriendCodeSeed data that
[PSPXI:GetLocalFriendCodeSeed](../../PSPXI:GetLocalFriendCodeSeed "wikilink")
retrieves from memory.

# See Also

- [Config Services](../../Config_Services "wikilink")
