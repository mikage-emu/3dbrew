+++
title = 'FS:EnumerateSystemSaveData'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08600042\] |
| 1          | Output Buffer Size         |
| 2          | (Size \<\< 4) \| 0xC       |
| 3          | Output Buffer              |

# Response

| Index Word | Description                                  |
|------------|----------------------------------------------|
| 0          | Header code                                  |
| 1          | Result code                                  |
| 2          | Total Save IDs written to the output buffer. |

# Description

This is a wrapper for
[FSPXI:EnumerateSystemSaveData](FSPXI:EnumerateSystemSaveData "wikilink").