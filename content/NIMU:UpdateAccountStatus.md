+++
title = 'NIMU:UpdateAccountStatus'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00250000\] |

# Response

| Index Word | Description                                          |
|------------|------------------------------------------------------|
| 0          | Header code \[0x002500C0\]                           |
| 1          | Result code                                          |
| 2          | Result code of the actual update operation           |
| 3          | Customer Support Code of the actual update operation |

# Description

Fetches the user’s current account status using the GetAccountStatus
endpoint with ServiceLevel = SHOP. Based on the response, NIM will
respond to any authentication challenges and update the SOAP URL set for
future calls. These requests are also typically made when checking for a
system update, except with ServiceLevel = SYSTEM.