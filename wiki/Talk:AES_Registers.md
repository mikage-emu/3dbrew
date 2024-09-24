Referenced 128-bytes buffer of AES_RDFIFO and AES_CNT Read FIFO count
range of 0 to 16 doesn't match with each other. So, what is the actual
FIFO length and what is the unit size of Read/Write FIFO count fields?
Having a byte-wide FIFO for a block cypher is a bit weird. --[Duke
srg](User:Duke_srg "wikilink") ([talk](User_talk:Duke_srg "wikilink"))
16:40, 27 April 2016 (CEST)

The FIFO count is measured in words, and the 128-bytes buffer refers to
RDFIFO and WRFIFO combined. [Dazzozo](User:Dazzozo "wikilink")
([talk](User_talk:Dazzozo "wikilink")) 10:45, 28 April 2016 (CEST)