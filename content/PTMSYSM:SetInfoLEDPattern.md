# Request

| Index Word | Description                                                                                     |
|------------|-------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x08010640\]                                                                      |
| 1-26       | These parameters are passed to [MCURTC:SetInfoLEDPattern](MCURTC:SetInfoLEDPattern "wikilink"). |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is a wrapper for command
[MCURTC:SetInfoLEDPattern](MCURTC:SetInfoLEDPattern "wikilink"). The
news module uses this PTM command for controlling the notification LED,
the news module doesn't use any of the other PTMSYSM LED commands. The
news module uses this command during initialization, prior to handling
any service commands.