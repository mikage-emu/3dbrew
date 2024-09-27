+++
title = 'AMPXI:InstallContentAbort'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001A0000\] |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001A0040\] |
| 1          | Result code                |

# Description

Aborts active content import initialized by
[AMPXI:InstallContentBegin](AMPXI:InstallContentBegin "wikilink") or
resumed by
[AMPXI:InstallContentResume](AMPXI:InstallContentResume "wikilink").

Cannot be resumed with
[AMPXI:InstallContentResume](AMPXI:InstallContentResume "wikilink")
later.