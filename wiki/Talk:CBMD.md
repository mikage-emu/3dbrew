@Yellows8, You got it wrong.. CBMD doesn't contains CWAN... if you see a
CWAV then it means you are looking at a BNR file which is a
concatination of CBMD and CWAV..
[1](http://code.google.com/p/3dsexplorer/source/browse/trunk/3DSExplorer/Modules/mdlBanner.cs)
So CBMD files and BNR files have the same header (That's why 3DSexplorer
can't autodetect if a file is BNR or CBMD)... Also CMBD can contain
multiple CGFX... meaning CBMD is just a container of CGFX files..(as you
mentioned). You can get all the information from 3DSExplorer's source.
it's straight from the SDK.. --[Elisherer](User:Elisherer "wikilink")
15:09, 8 April 2012 (CEST)


I don't care what the extensions are, those are rather SDK-only, mostly
no-extensions/useless extensions for retail non-RomFS stuff. Most of the
info I added here didn't come from SDK-related stuff at \*all\*. Unless
"CBMD" is used for model-only data on retail outside of banners, I
\*really\* don't see the need to mention SDK-only stuff.
--[Yellows8](User:Yellows8 "wikilink") 17:46, 8 April 2012 (CEST)

(sorry about my latest edit, I misread cbmd as cgfx, which was obviously
wrong) --[Smea](User:Smea "wikilink") 10:16, 9 January 2014 (CET)