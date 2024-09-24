### DIFF

@Yellows8: Is it possible that the DIFF wasn't DISA because you xored it
with a different file and the SA changed to FF because of a value that
was there? or you've seen it in multiple occasions?
--[Elisherer](User:Elisherer "wikilink") 13:07, 20 January 2012 (CET)


XOR wouldn't reveal DIFF, they never switch between DISA/DIFF after
extdata creation. The only thing that you'd notice since it differs
between the extdata, is the DIFF hash.(which is at a different offset
than the DISA one) --[Yellows8](User:Yellows8 "wikilink") 16:14, 20
January 2012 (CET)


I don't know if you understood me... I meant that not knowing how you
got a decrypted extdata, assuming you xored two files, you got the word
DIFF instead of DISA because there was a value just in the place where
the SA was supposed to be in one of the files. and maybe the different
magic number is like a version of the struct..or maybe you got it
multiple times and sure it's DIFF? (question)
--[Elisherer](User:Elisherer "wikilink") 23:53, 20 January 2012 (CET)


I understood your question fine. I didn't xor any new extdata, and I
didn't properly decrypt anything either.
--[Yellows8](User:Yellows8 "wikilink") 01:15, 21 January 2012 (CET)


OK, thanks :) --[Elisherer](User:Elisherer "wikilink") 11:28, 21 January
2012 (CET)