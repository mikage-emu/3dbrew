+++
title = 'FS:GetProductInfo'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x082E0040\] |
| 1          | u32 processID              |

# Response

| Index Word | Description                                                |
|------------|------------------------------------------------------------|
| 0          | Header code                                                |
| 1          | Result code                                                |
| 2-6        | [Product Info](Filesystem_services#productinfo "wikilink") |

# Description

This is an interface for
[FSPXI:GetProductInfo](Filesystem_services_PXI "wikilink").
