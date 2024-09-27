# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x003000C2\] |
| 1          | u8 commandID               |
| 2          | u32 address                |
| 3          | u32 Size                   |
| 4          | (Size\<\<8) \| 4           |
| 5          | Output buffer ptr          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This is exactly the same as
[FSPXI:CardNorDirectReadWithAddress](FSPXI:CardNorDirectReadWithAddress "wikilink"),
except this calls the function for that with one of the u8 parameters
set to value 1, instead of loading the data for that parameter from
Process9 state.