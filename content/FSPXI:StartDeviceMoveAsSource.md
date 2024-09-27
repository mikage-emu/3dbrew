# Request

| Index Word | Description                                                              |
|------------|--------------------------------------------------------------------------|
| 0          | Header code, starting with [3.0.0-5](3.0.0-5 "wikilink"): \[0x004B0000\] |

# Response

| Index Word | Description                                                                                     |
|------------|-------------------------------------------------------------------------------------------------|
| 0          | Header code                                                                                     |
| 1          | Result code                                                                                     |
| 2-5        | This is from the stored 0x10-byte [movable.sed](Nand/private/movable.sed "wikilink") keyY hash. |
| 6-9        | This is 0x10-bytes of random data.                                                              |

# Description

An u8 state flag must be zero when using this command, otherwise
error-code 0xE02046EE is returned. This state flag is then set to
value 1. The stored movable.sed keyY hash is then loaded, then
0x10-bytes of data is randomly generated.