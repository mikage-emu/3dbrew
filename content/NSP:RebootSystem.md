+++
title = 'NSP:RebootSystem'
+++

# Request

| Index Word | Description                                     |
|------------|-------------------------------------------------|
| 0          | Header code \[0x00010040\]                      |
| 1          | u8, Launch Title (0 = don't launch, 1 = launch) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This calls the same code as
[NSS:RebootSystem](NSS:RebootSystem "wikilink"), rebooting into the
current application if the launch argument is set to 1.
