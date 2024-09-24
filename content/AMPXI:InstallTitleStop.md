# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00110000\] |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00110040\] |
| 1          | Result code                |

# Description

Stops active title import initialized by
[AMPXI:InstallTitleBegin](AMPXI:InstallTitleBegin "wikilink") or resumed
by [AMPXI:InstallTitleResume](AMPXI:InstallTitleResume "wikilink").

The import is not cancelled and can later be resumed with
[AMPXI:InstallTitleResume](AMPXI:InstallTitleResume "wikilink").