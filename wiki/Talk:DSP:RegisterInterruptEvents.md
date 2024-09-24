DSP really changes header in answer? but why? applications never checks
it, as far as i know --[Mailwl](User:Mailwl "wikilink") 13:47, 21 June
2015 (CEST)

Many do that in case of an error for example some errors in the GSP come
back with 0x00000040 --[User:ichfly](User:ichfly "wikilink")

All services change the header, because it's used by the kernel to know
how to send the parameters back to the calling process.
[Yuriks](User:Yuriks "wikilink") 00:49, 23 June 2015 (CEST)

Ah, this make sense --[Mailwl](User:Mailwl "wikilink") 08:38, 23 June
2015 (CEST)