+++
title = 'Miiverse'
+++

This is the Miiverse system-applet which can be launched via Home Menu /
etc(process-name is "olv").

Before doing *any* network requests at all, Miiverse starts the mint
library-applet for NNID network requests. Hence, if a sysupdate is
required Miiverse would halt here without sending any network requests
itself.

Then Miiverse uses HTTPC for requesting
https://discovery.olv.nintendo.net/v1/endpoint, which then returns what
domains to use afterwards(there's "portal_host" and "n3ds_host" tags but
the tags' value are the same). This seems to be the only time Miiverse
itself uses HTTPC.

Then it starts loading the Miiverse-browser(WebKit) for accessing the
domain(s) specified above(with applet-side TLS/etc like the main
browser).