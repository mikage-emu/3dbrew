+++
title = 'FS:GetSdmcArchiveResource'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08140000\] |

# Response

| Index Word | Description                                                        |
|------------|--------------------------------------------------------------------|
| 0          | Header code                                                        |
| 1          | Result code                                                        |
| 2-5        | [Archive Resource](Filesystem_services#ArchiveResource "wikilink") |

# Description

This is an interface for
[FSPXI:GetSdmcArchiveResource](FSPXI:GetSdmcArchiveResource "wikilink").