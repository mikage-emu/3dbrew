+++
title = 'NIMS:CheckSysupdateAvailableSOAP'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000A0000\] |

# Response

| Index Word | Description                                                                               |
|------------|-------------------------------------------------------------------------------------------|
| 0          | Header code                                                                               |
| 1          | Result code                                                                               |
| 2          | u8 flag determining whether a system update is available (using data from a SOAP request) |