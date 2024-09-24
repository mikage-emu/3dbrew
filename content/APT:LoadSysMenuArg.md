+++
title = 'APT:LoadSysMenuArg'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00360040\] |
| 1          | Output Size                |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                |
|------------|----------------------------|
| 0          | (Output Size \<\< 14) \| 2 |
| 1          | void\*, Output Buffer      |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Same as [<APT:StoreSysMenuArg>](APT:StoreSysMenuArg "wikilink") except
for reading the data from the [FIRM](FIRM "wikilink")-launch param-buf
in NS state.