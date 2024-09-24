# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00280000\] |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00280040\] |
| 1          | Result code                |

# Description

Aborts active title import initialized by
[AMPXI:InstallTitleBegin](AMPXI:InstallTitleBegin "wikilink") or resumed
by [AMPXI:InstallTitleResume](AMPXI:InstallTitleResume "wikilink").

Cannot be resumed with
[AMPXI:InstallTitleResume](AMPXI:InstallTitleResume "wikilink") later.