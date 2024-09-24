# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x002C0000\] |

# Response

| Index Word | Description                                          |
|------------|------------------------------------------------------|
| 0          | Header code \[0x002C00C0\]                           |
| 1          | Result code                                          |
| 2          | Result code of the actual update operation           |
| 3          | Customer Support Code of the actual update operation |

# Description

Queries for the current account’s tickets using the
AccountListETicketIds SOAP call, and downloads and installs any missing
or outdated tickets.