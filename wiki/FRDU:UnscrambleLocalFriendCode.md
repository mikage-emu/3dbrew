# Request

| Index Word | Description                                              |
|------------|----------------------------------------------------------|
| 0          | Header code \[0x001C0042\]                               |
| 1          | Friend code count                                        |
| 2          | ((count \* 12) \<\< 14) \| 0x402                         |
| 3          | Pointer to encoded friend codes. Each is 12 bytes large. |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                                                            |
|------------|------------------------------------------------------------------------|
| 0          | ((count \* 8) \<\< 14) \| 2                                            |
| 1          | Pointer to write decoded local friend codes to. Each is 8 bytes large. |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This decodes one or more encoded friend codes into local friend codes
for use with some friend-related commands. Encoded friend codes seem to
generally be retrieved from
[NWMUDS](NWM_Services#NWM_local-WLAN_service_.22nwm::UDS.22 "wikilink")
command [GetNodeInformation](NWMUDS:GetNodeInformation "wikilink").