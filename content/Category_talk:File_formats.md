"with padding in between the two files to make sure the .BCWAV *starts
on a new line*." Isn't .BNR the same as ExeFS:/banner, which is binary?
--[Yellows8](User:Yellows8 "wikilink") 17:58, 13 June 2012 (CEST)

- Yes the .BNR is the same type of file found at ExeFS:/banner. .BNR
  contains two files, a .CBMD and a .(B)CWAV, which is the graphics and
  audio for the Banner of an application. But depending on the length of
  CBMD, there will be a space padded with zeros to make sure the last
  line of the CBMD takes up a whole line, and the start of the (B)CWAV
  starts on a new line. If you look in the banner of the exefs you will
  see this, or by use of the 3DS SDK or CiTRUS make your own BNR and see
  how the input and output compare. --[3dsguy](User:3dsguy "wikilink")
  01:25, 14 June 2012 (CEST)
  - I don't get what you mean by "starts on a new line". "newline"
    implies the file is text but this is binary. Don't you mean aligned
    to 0x10 bytes perhaps? --[Yellows8](User:Yellows8 "wikilink") 03:53,
    14 June 2012 (CEST)
    - That's what I meant :/ sorry--[3dsguy](User:3dsguy "wikilink")
      06:52, 14 June 2012 (CEST)

Yellows8, why do you call files by their 'Magic' Characters as oppose to
their file extentions?--[3dsguy](User:3dsguy "wikilink") 02:35, 29 June
2012 (CEST)


I prefer to call these NCCH instead of CXI/Ctr*Executeable*Image,
because every single CTR title on CDN is a NCCH. Calling non-executable
titles "CXI"/executable instead of NCCH doesn't sound right imo.
--[Yellows8](User:Yellows8 "wikilink") 02:54, 29 June 2012 (CEST)


Yeah okay, that makes sense--[3dsguy](User:3dsguy "wikilink") 02:57, 29
June 2012 (CEST)