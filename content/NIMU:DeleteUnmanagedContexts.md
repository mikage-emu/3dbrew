+++
title = 'NIMU:DeleteUnmanagedContexts'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00100000\] |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00100040\] |
| 1          | Result code                |

# Description

Uses [DeleteImportTitleContext](AM:DeleteImportTitleContext "wikilink")
to delete any import contexts that are not managed by a NIM background
install task.
