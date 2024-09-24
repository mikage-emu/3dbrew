+++
title = 'PTMSYSM:SetInfoLEDPatternHeader'
+++

# Request

| Index Word | Description                                                                                           |
|------------|-------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x08020040\]                                                                            |
| 1          | Parameter data passed to [MCURTC:SetInfoLEDPatternHeader](MCURTC:SetInfoLEDPatternHeader "wikilink"). |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is a wrapper for
[MCURTC:SetInfoLEDPatternHeader](MCURTC:SetInfoLEDPatternHeader "wikilink").