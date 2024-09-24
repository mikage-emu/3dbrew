# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x040A0000\] |

# Response

| Index Word | Description                                              |
|------------|----------------------------------------------------------|
| 0          | Header code                                              |
| 1          | Result code                                              |
| 2          | u8 output: 0 = Old3DS, 1 = [New3DS](New_3DS "wikilink"). |

# Description

This command was added with [8.0.0-18](8.0.0-18 "wikilink").

With the original 3DS PTM module, hard-coded value 0 is written to the
output. With the [New_3DS](New_3DS "wikilink") PTM module, hard-coded
value 1 is written to the output.