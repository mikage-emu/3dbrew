This page describes the format of the file stored in
[CXI](NCCH#CXI "wikilink") ExeFS:/logo.

The Logo contains distribution licensing Binary data. (Types: Nintendo,
Licensed, Published, or Distributed) Additionally it could have no
license (type None). System applications and applets that interact with
the Home Menu are typically set to type 'none' as they don't display
that information.

This file is a LZ11 compressed [DARC](DARC "wikilink"). The last
0x20-bytes of the decompressed data is a HMAC SHA256 hash over the
actual DARC.