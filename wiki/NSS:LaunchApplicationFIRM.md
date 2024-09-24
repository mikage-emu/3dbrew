# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000500C0\] |
| 1-2        | u64, Title ID              |
| 3          | Flags                      |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This triggers a FIRM [launch](PMApp:LaunchFIRMSetParams "wikilink"),
where the title run by this FIRM is specified with the input titleID.
The [FIRM](FIRM "wikilink") titleID-low is determined by the input
application titleID. When the input TID is all-zero, the application is
launched from the gamecard by the launched FIRM.

Flags bit0 is set when launching a [FIRM](FIRM "wikilink") which
requires an application title-info structure to be specified via
[FIRM](FIRM "wikilink") parameters. Otherwise when not specifying FIRM
parameters, bit0 is clear. When flags bit1 is clear, NS will check
certain [Configuration Memory](Configuration_Memory "wikilink") fields
and will return an error if these checks fail. This [Configuration
Memory](Configuration_Memory "wikilink") field checks seems to always
pass on retail however.

See [here](APT:GetProgramInfo "wikilink") for how the FIRM programID-low
is determined.