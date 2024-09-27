+++
title = 'FSPXI:GetProductInfo'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x082E0040\] |
| 1          | Archive handle lower word  |
| 2          | Archive handle upper word  |

# Response

| Index Word | Description                                                |
|------------|------------------------------------------------------------|
| 0          | Header code                                                |
| 1          | Result code                                                |
| 2-6        | [Product Info](Filesystem_services#productinfo "wikilink") |

# Description

Reads the product info from an open NCCH content archive
