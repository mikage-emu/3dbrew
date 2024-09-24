+++
title = 'SSLC:Initialize'
+++

# Request

| Index Word | Description                       |
|------------|-----------------------------------|
| 0          | Header code \[0x00010002\]        |
| 1          | Value 0x20, PID translate-header. |
| 2          | PID written by ARM11-kernel.      |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is used for initializing the main service-session. If this
service-session was already used with
[SSLC:InitializeConnectionSession](SSLC:InitializeConnectionSession "wikilink"),
this command returns error 0xD8A0B834.
