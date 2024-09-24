# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00190000\] |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00190040\] |
| 1          | Result code                |

# Description

Stops active content import initialized by
[AMPXI:InstallContentBegin](AMPXI:InstallContentBegin "wikilink") or
resumed by
[AMPXI:InstallContentResume](AMPXI:InstallContentResume "wikilink").

The import is not cancelled and can later be resumed with
[AMPXI:InstallContentResume](AMPXI:InstallContentResume "wikilink").