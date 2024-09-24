# Request

| Index Word | Description                                    |
|------------|------------------------------------------------|
| 0          | Header code \[0x00140040\]                     |
| 1          | [contexthandle](SSLC:CreateContext "wikilink") |

# Response

| Index Word | Description                                                                                                        |
|------------|--------------------------------------------------------------------------------------------------------------------|
| 0          | Header code                                                                                                        |
| 1          | Result code                                                                                                        |
| 2          | Internal retval before the internal retval is converted to result-code. Only set when the internal retval is \>=0. |
| 3          | u32 output, unknown.                                                                                               |

# Description

This calls the same function as
[SSLC:StartConnection](SSLC:StartConnection "wikilink") internally. The
only difference is that the original retval from that function is saved,
and that this function writes an output u32 instead of skipping this.