This [CFA](NCCH#CFA "wikilink") (title id:
[0004001b00010002](Title_list#0004001B_-_System_Data_Archives "wikilink"))
contains the following [encrypted](PSPXI:EncryptDecryptAes "wikilink")
files in the RomFS:

- "ctr-common-1-cert.bin", this is the default SSL client cert used by
  the SSL module in DER format.
- "ctr-common-1-key.bin", this is the default SSL client private key
  used by the SSL module in DER format.

For retail this is the "CTR Common Prod 1" cert. The final sizes passed
to a function used internally by SSL-module, are 0x4C7 for the cert DER,
and 0x4AA for the key DER.

Each file is encrypted in CBC mode using [keyslot
0xD](PSPXI:EncryptDecryptAes#Key_Types "wikilink"). The first 16 bytes
of each file are the IV for decrypting the rest of the file.

The following servers require usage of ClCertA to connect:

- <https://account.nintendo.net/> (Account/OAuth2 related)
- <https://ccif.ctr.shop.nintendo.net/> (CreditCardInfo(?), used for
  credit card/transaction related stuff)
- <https://ecs.c.shop.nintendowifi.net/> (ECommerce SOAP,
  ticket-related)
- <https://cas.c.shop.nintendowifi.net/> (Cataloging SOAP)
- <https://ninja.ctr.shop.nintendo.net/> (eShop-related)
- <https://nus.c.shop.nintendowifi.net/> (NetUpdate SOAP, used by [nim
  system module](NIM_Services "wikilink"))