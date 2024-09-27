+++
title = 'AMNet:ResumeImportTitle'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x080600C0\]                             |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink") |
| 2-3        | u64, Title ID                                          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This resumes installing a title, when the TMD was already installed
prior to this.