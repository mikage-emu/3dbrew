+++
title = 'AM:GetProgramInfosIgnorePlatform'
+++

# Request

| Index Word | Description |
|----|----|
| 0 | Header code \[0x002C0084\] |
| 1 | [Media Type](Filesystem_services#mediatype "wikilink") |
| 2 | Title Count |
| 3 | ((Title Count \* 8) \<\< 4) \| 0xA |
| 4 | Title IDs Input Pointer |
| 5 | ((Title Count \* 0x18) \<\< 4) \| 0xC |
| 6 | [Title Infos](Application_Manager_Services#titleinfo "wikilink") Output Pointer |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

A wrapper for [AM:GetProgramInfos](AM:GetProgramInfos "wikilink"), with special handling for New3DS title IDs:

If the given title ID is a CTR title ID, this first sets the New3DS bit (e.g. 0004013800000002 -\> 0004013820000002). If the New3DS version was not found, it falls back to the given title ID.

For TWL title IDs however there is no special handling and the command acts exactly like [AM:GetProgramInfos](AM:GetProgramInfos "wikilink").
