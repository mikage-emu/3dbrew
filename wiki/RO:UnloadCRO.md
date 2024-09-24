# Request

| Index Word | Description                                                                                                                                                                |
|------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x000500C2\]                                                                                                                                                 |
| 1          | Base address of the mapped [CRO](CRO0 "wikilink"), in the process memory, originally passed to [RO:LoadExeCRO](RO:LoadExeCRO "wikilink").                                  |
| 2          | Unknown, usually zero?                                                                                                                                                     |
| 3          | Original address where the [CRO](CRO0 "wikilink") was first located in process memory(such as the process heap), also passed to [RO:LoadExeCRO](RO:LoadExeCRO "wikilink"). |
| 4          | Must be zero                                                                                                                                                               |
| 5          | [KProcess](SVC "wikilink") handle                                                                                                                                          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This function patches the CRO binary in memory. It sets up imported
symbols (functions+data) according to Import Table(s).