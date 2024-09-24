+++
title = 'PMApp:GetAppResourceLimit'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000B0140\] |
| 1          | 0                          |
| 2          | Resource limit type (9)    |
| 3          | 0                          |
| 4-5        | u64, 0                     |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code                |
| 1          | Result code                |
| 2-3        | s64, Resource limit value. |

# Description

Interface for [svcGetResourceLimitLimitValues](SVC "wikilink"). Resource
limit type must be set to 9, meaning "Max CPU time" (see
[KResourceLimit](KResourceLimit "wikilink")). If the parameters are not
set exactly as listed, the command will return the not-implemented
result code 0xD8E05BF4.
