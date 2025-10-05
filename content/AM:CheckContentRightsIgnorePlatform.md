+++
title = 'AM:CheckContentRightsIgnorePlatform'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x002D00C0\] |
| 1          | u64, Title ID              |
| 2          | u16, Content Index         |

# Response

| Index Word | Description              |
|------------|--------------------------|
| 0          | Header code              |
| 1          | Result code              |
| 2          | bool, Has Content Rights |

# Description

Checks the ticket for the given title and returns whether or not the user has the right to use a certain content, with special handling for New3DS title IDs:

If the given title ID is a CTR title ID, this first sets the New3DS bit (e.g. 0004013800000002 -\> 0004013820000002). If the New3DS version was not found or no rights were found, it falls back to the given title ID.

For TWL title IDs however there is no special handling and the command acts exactly like [AM:CheckContentRights](AM:CheckContentRights "wikilink").
