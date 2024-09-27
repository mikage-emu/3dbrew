# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00290080\] |
| 1          | HTTP context handle        |
| 2          | ClientCert context handle  |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This sets the ClientCert context to use with the specified HTTP context.
This can only be used if no ClientCert-context was already set for this
context, including the one which automatically gets created when using
the context-specific ClientCert commands such as
[HTTPC:SetClientCert](HTTPC:SetClientCert "wikilink").