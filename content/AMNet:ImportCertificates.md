+++
title = 'AMNet:ImportCertificates'
+++

# Request

| Index Word | Description                             |
|------------|-----------------------------------------|
| 0          | Header code \[0x08190108\]              |
| 1          | First Certificate Size                  |
| 2          | Second Certificate Size                 |
| 3          | Third Certificate Size                  |
| 4          | Fourth Certificate Size                 |
| 5          | (First Certificate Size \<\< 4) \| 0xA  |
| 6          | First Certificate Input Pointer         |
| 7          | (Second Certificate Size \<\< 4) \| 0xA |
| 8          | Second Certificate Input Pointer        |
| 9          | (Third Certificate Size \<\< 4) \| 0xA  |
| 10         | Third Certificate Input Pointer         |
| 11         | (Fourth Certificate Size \<\< 4) \| 0xA |
| 12         | Fourth Certificate Input Pointer        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is called before
[AMNet:BeginImportTicket](AMNet:BeginImportTicket "wikilink") to set the
[certificate chain](Ticket#Certificate_Chain "wikilink") for the tickets
to be installed. You can submit up to four certificates at a time, and
if you have more than four, you can make multiple calls. If you have
less than four certificates, you can pass in NULL for the pointers, 0
for the sizes, and value 10 for the buffer-headers(word before the
buf-ptr(s)).

This also verifies each cert with the issuer, etc. When attempting to
use this command with the exact same cert which was already added with
this command, this command will return 0 without actually adding the
cert to the chain(no additional cert in ARM9-mem anywhere).

This is a wrapper for
[AMPXI](Application_Manager_Services_PXI "wikilink") command 0x003D0108.
