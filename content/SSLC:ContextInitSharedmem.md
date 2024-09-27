+++
title = 'SSLC:ContextInitSharedmem'
+++

# Request

| Index Word | Description                                         |
|------------|-----------------------------------------------------|
| 0          | Header code \[0x001F0082\]                          |
| 1          | SSL [context](SSLC:CreateContext "wikilink") handle |
| 2          | u32 size                                            |
| 3          | Value 0x0, translate-header for handle transfer.    |
| 4          | Sharedmem handle.                                   |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This maps the specified sharedmem, and writes the mapped vaddr + size
into state. The sharedmem is not used for \*anything\* else by this
command.

While starting the TLS connection, the entire server cert is written to
sharedmem+0. Later a network TLS encrypted alert is thrown by
SSL-module, when the user-process \*only\* cleared the sharedmem to
all-zeros.