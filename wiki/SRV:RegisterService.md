# Request

# Response

This function registers a new service which can be accessed using
[SRV:GetServiceHandle](SRV:GetServiceHandle "wikilink"). The service
manager will create a new client-server port pair, registering the
[client endpoint](KPort "wikilink") under the given name, and returning
the [server endpoint](KServerPort "wikilink") for the service to listen
on for incoming connections.