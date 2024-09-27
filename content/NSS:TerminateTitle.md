+++
title = 'NSS:TerminateTitle'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00110100\] |
| 1-2        | u64, Program ID            |
| 3-4        | u64, Timeout               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Wrapper for [PMApp:TerminateTitle](PMApp:TerminateTitle "wikilink").
