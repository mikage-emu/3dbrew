CFL_DB.dat is an extdata file, located in the NAND shared extdata, that
contains Mii informations.

Informations about that file : -If it gets zero'd/if the personal Mii is
corrupted : CFL_OldDB.dat will be used. -If both of them are zero'd, the
Mii Maker will create a new CFL_DB.dat file -If CFL_OldDB.dat is zero'd,
the Mii Maker will create a new one based on CFL_DB.dat

-At offset 0xC81E, there is a CRC16-CCITT checksum of the first 0xC81E
bytes. <http://wiibrew.org/wiki/Wiimote/Mii_Data#Block_format>
<https://gist.github.com/mtheall/015b1b17c6603907a062> The fixcrc.exe
file that is circulating over the Internet seems to be based on this :
<http://marcansoft.com/transf/fixcrc.c>

about special miis:
<https://web.archive.org/web/20080723022528/http://www.davidhawley.co.uk/special-miis-gold-pants-and-creating.aspx>
(original link is broken)