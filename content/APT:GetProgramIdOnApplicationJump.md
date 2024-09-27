+++
title = 'APT:GetProgramIdOnApplicationJump'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00330000\] |

# Response

| Index Word | Description                                                   |
|------------|---------------------------------------------------------------|
| 0          | Header code                                                   |
| 1          | Result code                                                   |
| 2-3        | u64, Current Program ID                                       |
| 4          | Current [MediaType](Filesystem_services#mediatype "wikilink") |
| 5-6        | u64, Target Program ID                                        |
| 7          | Target [MediaType](Filesystem_services#mediatype "wikilink")  |
