+++
title = 'PMApp:SetAppResourceLimit'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000A0140\] |
| 1          | 0                          |
| 2          | Resource limit type (9)    |
| 3          | Resource limit value.      |
| 4-5        | u64, 0                     |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Interface for [svcSetResourceLimitValues](SVC "wikilink"). Resource
limit type must be set to 9, meaning "Max CPU time" (see
[KResourceLimit](KResourceLimit "wikilink")). If the parameters are not
set exactly as listed, or when the input reslimit-value is higher than
the maximum allowed value(from PM-module state), the command will return
result code 0xD8E05BF4.
