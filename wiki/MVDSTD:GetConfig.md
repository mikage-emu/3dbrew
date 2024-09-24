# Request

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[0x001D0042\]                        |
| 1          | Size, normally 0x11C.                             |
| 2          | (Size\<\<4) \| 12                                 |
| 3          | Output [config](MVD_Services "wikilink") data ptr |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

For this command, MVD module DMAs 0x11C-bytes from a MVD state structure
to the above output buffer.