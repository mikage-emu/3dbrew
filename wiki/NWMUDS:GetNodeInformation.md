# Request

| Index Word | Description                                          |
|------------|------------------------------------------------------|
| 0          | Header code \[0x000D0040\]                           |
| 1          | NetworkNodeID, this must not be the broadcast alias. |

# Response

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code                                           |
| 1          | Result code                                           |
| 2-11       | Output [NodeInfo](NWM_Services "wikilink") structure. |

# Description

This returns the node structure for the specified NetworkNodeID.