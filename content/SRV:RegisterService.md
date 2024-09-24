+++
title = 'SRV:RegisterService'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00030100\] |
| 1-2        | 8-byte UTF-8 service name  |
| 3          | Name length                |
| 4          | Maximum sessions           |

# Response

| Index Word | Description                                                                                             |
|------------|---------------------------------------------------------------------------------------------------------|
| 0          | Header code                                                                                             |
| 1          | Result code                                                                                             |
| 3          | Handle to [KServerPort](KServerPort "wikilink") which will receive incoming connections to the service. |

This function registers a new service which can be accessed using
[SRV:GetServiceHandle](SRV:GetServiceHandle "wikilink"). The service
manager will create a new client-server port pair, registering the
[client endpoint](KPort "wikilink") under the given name, and returning
the [server endpoint](KServerPort "wikilink") for the service to listen
on for incoming connections.