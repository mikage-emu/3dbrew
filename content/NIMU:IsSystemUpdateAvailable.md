+++
title = 'NIMU:IsSystemUpdateAvailable'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x002A0000\] |

# Response

| Index Word | Description                                          |
|------------|------------------------------------------------------|
| 0          | Header code \[0x002A0100\]                           |
| 1          | Result code                                          |
| 2          | Result code of the actual update operation           |
| 3          | Customer Support Code of the actual update operation |
| 4          | bool Available                                       |

# Description

Checks if there is a system update available by issuing the
GetSystemUpdate SOAP call and comparing the response’s system update
hash to the locally stored hash.
