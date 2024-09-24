# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00090040\] |
| 1          | HTTP context handle        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This command triggers sending the HTTP request over the network, this
will return before the request is finished.