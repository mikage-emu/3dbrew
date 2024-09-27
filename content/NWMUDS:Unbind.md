+++
title = 'NWMUDS:Unbind'
+++

# Request

| Index Word | Description                          |
|------------|--------------------------------------|
| 0          | Header code \[0x00130040\]           |
| 1          | [BindNodeID](NWMUDS:Bind "wikilink") |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2-5        | ?           |

# Description

This is the inverse of [NWMUDS:Bind](NWMUDS:Bind "wikilink").
