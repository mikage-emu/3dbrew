I have grabbed the "CTR Common Prod 1" certification file (from
WireShark, So i only have its public key. If i have that private key i
would try to look into the indeed decrypted data transformed). That is
all the same **despite the regions** the devices have (sorry i only have
the ones from J and U now, but i may gain more). If you need that, email
me (luxsie@163.com) --[Syphurith](User:Syphurith "wikilink") 17:33, 28
March 2013 (CET)


You can't decrypt \*any\* SSL data with the SSL client private key at
all, the server private key is used for that.(Which is not possible to
obtain of course) "That is all the same despite the regions the devices
have" This title is used for all regions.
--[Yellows8](User:Yellows8 "wikilink") 17:44, 28 March 2013 (CET)


Well then. where do you think that a private key may been while in
runtime? okey.. I saw you are now detecting those APIs (PSPXI), is there
any chance to decrypt the package and get that private key now? BTW what
i remembered is that *you can decrypt those sent by server if you have
the private key (at least the ClientKeyExchange).*
--[Syphurith](User:Syphurith "wikilink") 18:01, 28 March 2013 (CET)


That SSL client cert/private key can only be used for directly accessing
their servers like with curl, not for any decryption. The only way to
obtain cleartext data sent/received with SSL by a 3DS is to run code on
a 3DS. --[Yellows8](User:Yellows8 "wikilink") 18:22, 28 March 2013 (CET)


Thanks for your reply. Hope you can do that some days later. (Checking
Title ID..) --[Syphurith](User:Syphurith "wikilink") 18:26, 28 March
2013 (CET)