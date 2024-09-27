+++
title = 'AM:CheckContentRights'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x002500C0\] |
| 1-2        | u64, Title ID              |
| 3          | u16, Content Index         |

# Response

| Index Word | Description              |
|------------|--------------------------|
| 0          | Header code              |
| 1          | Result code              |
| 2          | bool, Has Content Rights |

# Description

Wraps [AMPXI:CheckContentRights](AMPXI:CheckContentRights "wikilink").