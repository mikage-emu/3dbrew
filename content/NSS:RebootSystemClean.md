+++
title = 'NSS:RebootSystemClean'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00160000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This calls the same code as
[NSS:RebootSystem](NSS:RebootSystem "wikilink") does when not launching
a title, with the
[APPMEMTYPE](Configuration_Memory#appmemtype "wikilink") argument set to
the system default (O3DS = 0, N3DS = 6).
