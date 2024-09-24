# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x004F00C0\] |
| 1-2        | u64, TWL Title ID          |
| 3          | u8, DSiWare export type    |

# Response

| Index Word | Description                            |
|------------|----------------------------------------|
| 0          | Header code \[0x004F0080\]             |
| 1          | Result code                            |
| 2          | Total size for the DSiWare export .bin |

# Description

This obtains the total size of the DSiWare
[export](DSiWare_Exports "wikilink") .bin for the specified title, using
data loaded from NAND. When NATIVE_FIRM uses the input export type, the
type value must be 0, 7, or 12.