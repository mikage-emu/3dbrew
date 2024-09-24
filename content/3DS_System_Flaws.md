+++
title = '3DS System Flaws'
BookToC = false
+++

Exploits are used to execute unofficial code (homebrew) on the Nintendo
3DS. This page is a list of publicly known system flaws, for userland
applications/applets flaws see [here](3DS_Userland_Flaws "wikilink").

# Stale / Rejected Efforts

- In the early days of 3DS hacking, Neimod was working on a RAM dumping
  setup for a while. He has de-soldered the 3DS's RAM chip and hooked it
  and the RAM pinouts on the 3DS's PCB up to a custom RAM dumping setup.
  He *has* published photos showing his setup to be working quite well,
  with the 3DS successfully booting up, but however, his flickr stream
  is now private along with most of his work and this method has been
  unreleased. RAM dumping can be done through homebrew now, making this
  method obsolete regardless.

## Tips and info

The 3DS uses the XN feature of the ARM11 processor. There's no official
way from applications to enable executable permission for memory
containing arbitrary unsigned code(there's a [SVC](SVC "wikilink") for
this, but only [RO-module](RO_Services "wikilink") has access to it). A
usable userland exploit would still be useful: you could only do
return-oriented-programming with it initially. From ROP one could then
exploit system flaw(s), see below.

SD card [extdata](extdata "wikilink") and SD savegames can be attacked,
for consoles where the console-unique
[movable.sed](Nand/private/movable.sed "wikilink") was dumped(accessing
SD data is far easier by running code on the target 3DS however).

# System flaws

## Hardware

<table>
<thead>
<tr class="header">
<th><p>Summary</p></th>
<th><p>Description</p></th>
<th><p>Fixed with hardware model/revision</p></th>
<th><p>Newest hardware model/revision this flaw was checked for</p></th>
<th><p>Timeframe this was discovered</p></th>
<th><p>Discovered by</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>ARM9/ARM11 bootrom vectors point at uninitialized RAM</p></td>
<td><p>ARM9's and ARM11's exception vectors are hardcoded to point at
the CPU's internal memory (0x08000000 region for ARM9, AXIWRAM for
ARM11). While the bootrom does set them up to point to an endless loop
at some point during boot, it does not do so immediately. As such, a
carefully-timed fault injection (via hardware) to trigger an exception
(such as an invalid instruction) will cause execution to fall into ARM9
RAM. Since RAM isn't cleared on boot (see below), one can immediately
start execution of their own code here to dump bootrom, OTP, etc. The
ARM9 bootrom does the following at reset: reset vector branches to
another instruction, then branches to bootrom+0x8000. Hence, there's no
way to know for certain when exactly the ARM9 exception-vector data
stored in memory gets initialized.</p>
<p>The vulnerable timing range is about 100 CPU cycles after they start
(which happens after the PLLs have stabilized after power-up). A glitch
needs to be injected during one of these 100 cycles for the attack to
succeed.</p>
<p>It has been exploited by derrek to dump the ARM9 bootrom as of Summer
2015.</p></td>
<td><p>None: all available 3DS models at the time of writing have the
exact same ARM9/ARM11 bootrom for the unprotected areas.</p></td>
<td><p>New3DS</p></td>
<td><p>End of February 2014</p></td>
<td><p><a href="../User:Derrek" title="wikilink">derrek</a>, WulfyStylez
(May 2015) independently</p></td>
</tr>
<tr class="even">
<td><p>Missing AES key clearing</p></td>
<td><p>The hardware AES engine does not clear keys when doing a hard
reset/reboot.</p></td>
<td><p>None</p></td>
<td><p>New3DS</p></td>
<td><p>August 2014</p></td>
<td><p>Mathieulh/Others</p></td>
</tr>
<tr class="odd">
<td><p>No RAM clearing on reboots</p></td>
<td><p>On an MCU-triggered reboot all RAM including FCRAM/ARM9
memory/AXIWRAM/VRAM keeps its contents.</p></td>
<td><p>None</p></td>
<td><p>New3DS</p></td>
<td><p>March 2014</p></td>
<td><p><a href="../User:Derrek" title="wikilink">derrek</a></p></td>
</tr>
<tr class="even">
<td><p>32bits of actual console-unique TWLNAND keydata</p></td>
<td><p>On retail the 8-bytes at ARM9 address <a href="../Memory_layout"
title="wikilink">0x01FFB808</a> are XORed with hard-coded data, to
generate the TWL console-unique keys, including TWLNAND. On Old3DS the
high u32 is always 0x0, while on New3DS that u32 is always 0x2. On top
of this, the lower u32's highest bit is always ORed. only 31 bits of the
TWL console-unique keydata / TWL consoleID are actually console-unique.
This allows one to easily bruteforce the TWL console-unique keydata with
*just* data from TWLNAND. On DSi the actual console-unique data for key
generation is 8-bytes(all bytes actually set).</p></td>
<td><p>None</p></td>
<td><p>New3DS</p></td>
<td><p>2012?</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p>DSi / 3DS-TWL key-generator</p></td>
<td><p>After using the key generator to generate the normal-key, you
could overwrite parts of the normal-key with your own data and then
recover the key-generator output by comparing the new crypto output with
the original crypto output. From the normal-key outputs, you could
deduce the TWL key-generator function. This applies to the keyX/keyY
too.</p>
<p>This attack does not work for the 3DS key-generator because keyslots
0-3 are only for TWL keys.</p></td>
<td><p>None</p></td>
<td><p>New3DS</p></td>
<td><p>2011</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p>3DS key-generator</p></td>
<td><p>The algorithm for generating the normal-keys for keyslots is
cryptographically weak. As a result, it is easily susceptible to
differential cryptanalysis if the normal-key corresponding to any
scrambler-generated keyslot is discovered.</p>
<p>Several such pairs of matching normal-keys and KeyY values were
found, leading to deducing the key-generator function.</p></td>
<td><p>None</p></td>
<td><p>New3DS</p></td>
<td><p>February 2015</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a>, <a
href="../User:Plutooo" title="wikilink">plutoo</a></p></td>
</tr>
<tr class="odd">
<td><p>RSA keyslots don't clear exponent when setting modulus</p></td>
<td><p>The <a href="../RSA_Registers" title="wikilink">RSA keyslots</a> are
set by boot ROM to have four private RSA keys. The exponent value in the
RSA registers is write-only and not readable.</p>
<p>However, when setting a keyslot's modulus, the RSA hardware leaves
the exponent alone. This allows retrieving the exponent by doing a
discrete logarithm of the output.</p>
<p>By setting the modulus to a prime number whose modular multiplicative
order is "smooth" (that is, p-1 is divisible by only small prime
numbers), discrete logarithms can be calculated quickly using the <a
href="../wikipedia:Pohlig-Hellman_algorithm"
title="wikilink">Pohlig-Hellman algorithm</a>. If the prime chosen is
greater than the modulus, but the same bit size, the discrete logarithm
is the private exponent.</p>
<p>This exploit's usefulness is limited: RSA keyslot 0 is only used in
current firmware for deriving the 6.x save and 7.x NCCH keys, which were
already known, and the other three keyslots are entirely unused.
Additionally, with a boot ROM dump, this exploit is moot; these private
keys are located in the protected ARM9 boot ROM.</p></td>
<td><p>None</p></td>
<td><p>New3DS</p></td>
<td><p>March 2016</p></td>
<td><p><a href="../User:Myria" title="wikilink">Myria</a></p></td>
</tr>
<tr class="even">
<td><p><a href="../CONFIG11_Registers#CFG11_GPUPROT"
title="wikilink">CFG11_GPUPROT</a> allowing acccess to
AXIWRAM/FCRAM-BASE-memregion</p></td>
<td><p><a href="../CONFIG11_Registers#CFG11_GPUPROT"
title="wikilink">CFG11_GPUPROT</a> can be configured by anything with
access to it to allow the GPU to access the entire AXIWRAM+FCRAM. For
example, this is an issue for any sysmodule that gets exploited and has
access to this register memory-page(include one that's listed
below).</p>
<p>See also "kernelhax via gspwn" below.</p></td>
<td><p>None</p></td>
<td><p>New3DS</p></td>
<td><p>February 7, 2017</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
</tbody>
</table>

## Boot ROM

<table>
<thead>
<tr class="header">
<th><p>Summary</p></th>
<th><p>Description</p></th>
<th><p>Fixed with hardware model/revision</p></th>
<th><p>Newest hardware model/revision this flaw was checked for</p></th>
<th><p>Timeframe this was discovered</p></th>
<th><p>Discovered by</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>FIRM partitions known-plaintext</p></td>
<td><p>The <a href="../Flash_Filesystem" title="wikilink">FIRM
partitions</a> are encrypted with AES-CTR without a MAC. Since this
works by XOR'ing data with a static (per-console in this case)
keystream, one can deduce the keystream of a portion of each FIRM
partition if they have the actual FIRM binary stored in it.</p>
<p>This can be paired with many exploits. For example, it allows minor
FIRM downgrades (i.e. 10.4 to 9.6 or 9.5 to 9.4, but not 9.6 to 9.5).
However it is most commonly used to install arbitrary FIRMs (usually
boot9strap), thanks to sighax.</p>
<p>This can be somewhat addressed by having a FIRM header skip over
previously used section offsets, but this would just air-gap newer FIRMs
without fixing the core bug. This can also only be done a limited number
of times due to the size of FIRM versus the size of the
partitions.</p></td>
<td><p>None</p></td>
<td><p>New3DS</p></td>
<td></td>
<td><p>Everyone</p></td>
</tr>
<tr class="even">
<td><p>Boot9 AES keyinit function issues</p></td>
<td><p><a href="../Bootloader" title="wikilink">Boot9</a> seems to have two
bugs in the AES key-init function, see <a
href="../AES_Registers#AES_key-init" title="wikilink">here</a>.</p></td>
<td><p>None</p></td>
<td><p>BootROM issue.</p></td>
<td><p>2015</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p>New3DS has same boot ROM as Old3DS</p></td>
<td><p>The New3DS has the exact same boot ROM as the Old3DS. This means,
among other things, that all the same boot ROM flaws are present. Also,
this meant that it is possible to boot Old3DS firmware on New3DS (see
"CFG9_SYSPROT9 bit1 not set by Kernel9").</p></td>
<td><p>None</p></td>
<td><p>New3DS</p></td>
<td><p>October 2014</p></td>
<td><p>Everyone</p></td>
</tr>
<tr class="even">
<td><p>sighax: Boot9 improper validation of FIRM partition RSA
signatures</p></td>
<td><p>The <a href="../Flash_Filesystem" title="wikilink">FIRM
partitions</a> are signed with RSA-2048 using SHA-256 and PKCS #1 v1.5
padding. Boot9, however, improperly validates the padding in three
ways:</p>
<ol>
<li>Boot9 permits block type 02, meant for encrypted messages, to be
used for signatures. Only 01, for signatures, should have been
permitted. As a result, when using block type 02, a signature block is
not required to have a long string of FF bytes as padding, but rather
any nonzero random values suffice.</li>
<li>Boot9 does not require that the length of the padding fill out the
signature block completely. As a result, there is considerable freedom
in the layout of a signature.</li>
<li>Boot9 fails to do bounds checking in its parsing of the DER-encoded
hash algorithm type and hash value; the length values given in DER are
permitted to point outside the signature block.</li>
</ol>
<p>Flaw 3 allows the DER encoding to be such that boot9 believes that
the signature's hash value is outside the range of the block itself,
somewhere on the stack. This can be pointed at the correct hash value it
computes. Boot9 then memcmp's the calculated hash against itself, and
thinks that the hash is valid.</p>
<p>As a result of the above, we estimate that one in 2<sup>43</sup>
(~8.8 trillion) random fake signatures will be considered by Boot9 to be
valid. This is well within the range of brute force, particularly with
an optimized GPU implementation. An Nvidia GTX 1080 Ti would take about
one week to find a match.</p></td>
<td><p>None</p></td>
<td><p>New3DS</p></td>
<td><p>July 2015</p></td>
<td><p><a href="../User:Derrek" title="wikilink">derrek</a></p></td>
</tr>
<tr class="odd">
<td><p>Boot9 FIRM loading doesn't blacklist memory-mapped I/O</p></td>
<td><p><a href="../Bootloader" title="wikilink">Boot9</a>'s FIRM loading
blacklists Boot9 data regions, but forgets to do other important
regions, including Memory-mapped I/O. Combined with sighax, a malicious
FIRM can be used to overwrite: a) boot9 data-abort handler, coupled with
a 4th section that tries to NDMA copy to NULL, causing a data abort</p>
<p>b) boot9 IRQ handler (this has the disadvantage that you must restore
the original handler, then call it manually when your payload
runs)</p></td>
<td><p>None</p></td>
<td><p>New3DS</p></td>
<td><p>2015(?)</p></td>
<td><p><a href="../User:Derrek" title="wikilink">derrek</a> (2015?), <a
href="../User:Normmatt" title="wikilink">Normmatt</a> and <a
href="../User:SciresM" title="wikilink">SciresM</a> independently (January
2017).</p></td>
</tr>
<tr class="even">
<td><p>"superhax": Boot9 FIRM loading blacklist check is flawed</p></td>
<td><p>Boot9 only makes sure the <strong>start</strong> and
<strong>end</strong> address of each section is not covered by a
blacklisted region. Thus, it is possible to overwrite blacklisted
regions (e.g. ARM9 Exception Vectors) by choosing a FIRM section range
that encloses an entire blacklisted region. The vulnerable code looks
like this: if(blRegions[i].start &lt;= sectionStart &amp;&amp;
blRegions[i].end &gt; sectionStart <nowiki></p></td>
<td><p></nowiki> blRegions[i].start &lt;= sectionEnd &amp;&amp;
blRegions[i].end &gt; sectionEnd) return false; // failure The boot9
vector table (0x08000000) contains 6 entries, each 8-bytes wide (0x30
bytes); Only 0x08000000 through 0x08000040 are blacklisted, and boot9
doesn't use the region after the vector table (this is convenient
because we can put any payload we want after it and not worry about
overwriting chunks of boot9 code)</p>
<p>To exploit this, craft a FIRM section payload that's loaded a few
bytes before 0x08000000, add padding to get to 0x08000000 and overwrite
the vector table; You could overwrite the data-abort vector and craft a
4th FIRM section that causes a data-abort OR you can just overwrite the
IRQ function pointer at 0x08000004 (make sure your payload replaces the
original boot9 function pointer); you can point the rest of the vectors
to infinite loops since they shouldn't be triggered.</p></td>
<td><p>None</p></td>
<td><p>New3DS</p></td>
<td><p>August 2015</p></td>
</tr>
</tbody>
</table>

## ARM9 software

### arm9loader

<table>
<thead>
<tr class="header">
<th><p>Summary</p></th>
<th><p>Description</p></th>
<th><p>Successful exploitation result</p></th>
<th><p>Fixed in <a href="../FIRM" title="wikilink">FIRM</a> system
version</p></th>
<th><p>Last <a href="../FIRM" title="wikilink">FIRM</a> system version this
flaw was checked for</p></th>
<th><p>Timeframe this was discovered</p></th>
<th><p>Public disclosure timeframe</p></th>
<th><p>Discovered by</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Generating the keysector console-unique keys with
ITCM+Boot9</p></td>
<td><p><a href="../Bootloader" title="wikilink">Boot9</a> decrypts the
0x100-byte <a href="../OTP_Registers" title="wikilink">OTP</a> using
AES-CBC with keydata stored in Boot9. If hash verification is
successful, the plaintext of the first 0x90-bytes are copied into <a
href="../Memory_layout" title="wikilink">ITCM</a>. This is the
<em>exact</em> <em>same</em> region hashed by arm9loader when generating
the console-unique keys for decrypting the keysector, except arm9loader
uses the raw encrypted OTP.</p>
<p>Therefore, with the OTP keydata+IV from Boot9 you can: encrypt the
0x90-bytes from ITCM, then hash the output to get the console-unique
keys for the system's keysector. This can even be done for Old3DS which
doesn't have the arm9loader keysector officially.</p>
<p>It's unknown why arm9loader only used the first 0x90-bytes of OTP.
Using more data from OTP would've prevented this. Fixing this would
require doing exactly that, but that would also mean updating the NAND
keysector(which is dangerous).</p></td>
<td><p>See description.</p></td>
<td><p>None</p></td>
<td></td>
<td><p>2015</p></td>
<td><p>January 6, 2017</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p>Rearrangable keys in the NAND keystore</p></td>
<td><p>Due to the keystore being encrypted with AES-ECB, one can
rearrange blocks and still have the NAND keystore decrypt in a
deterministic way.</p>
<p>Using 10.0 FIRM it is possible to rearrange keys such that ARM9
memory is executed. As such using existing ARM9 execution 10.0 FIRM can
be written to NAND and a payload written to memory, with the payload to
be executed post-K9L using an MCU reboot.</p></td>
<td><p>arm9loaderhax given existing ARM9 code execution</p></td>
<td><p>None</p></td>
<td><p><a href="../11.3.0-36" title="wikilink">11.3.0-X</a></p></td>
<td><p>Early 2016</p></td>
<td><p>27 September 2016</p></td>
<td><p>Myria, <a href="../User:Dark_samus" title="wikilink">dark_samus</a>;
mathieulh (independently); <a href="../User:Plutooo"
title="wikilink">plutoo</a> (independently) + others</p></td>
</tr>
<tr class="odd">
<td><p>Uncleared OTP hash keydata in console-unique 0x11
key-generation</p></td>
<td><p>Kernel9Loader does not clear the <a href="../SHA_Registers#SHA_HASH"
title="wikilink">SHA_HASH register</a> after use. As a result, the data
stored here as K9L hands over to Kernel9 is the hash of <a
href="../OTP_Registers" title="wikilink">OTP data</a> used to seed the <a
href="../FIRM#New_3DS_FIRM" title="wikilink">console-unique NAND keystore
decryption key</a> set on keyslot 0x11.</p>
<p>Retrieving this keydata and the <a href="../Flash_Filesystem#0x12C00"
title="wikilink">NAND keystore</a> of the same device allows calculating
the decrypted New3DS NAND keystore (non-unique, common to all New3DS
units), which contains AES normal keys, also set on keyslot 0x11, which
are then used to derive all current <a href="../AES_Registers#Keyslots"
title="wikilink">New3DS-only AES keyXs</a> including the newer batch
introduced in <a href="../9.6.0-24#arm9loader"
title="wikilink">9.6.0-X</a>. From there, it is trivial to perform the
same key derivation in order to initialize those keys on any system
version, and even on Old3DS.</p>
<p>This can be performed by exploiting the "arm9loaderhax" vulnerability
to obtain post-K9L code execution after an MCU reboot (the bootrom
section-loading fail is not relevant here, this attack was performed
without OTP data by brute-forcing keys), and using this to dump the
SHA_HASH register. This attack works on any FIRM version shipping a
vulnerable version of K9L, whereas OTP dumping required a boot of &lt;<a
href="../3.0.0-6" title="wikilink">3.0.0-X</a>.</p>
<p>This attack results in obtaining the entire (0x200-bytes) NAND
keystore - it was confirmed at a later date that this keystore is
encrypted with the same key (by comparing the decrypted data from
multiple units), and therefore using another key in this store will not
remedy the issue as all keys are known (i.e. later, unused keys decrypt
to the same 0x200-bytes constant with the same OTP hash). Later keys
could have been encrypted differently but this is not the case. As a
result of this, it is not possible for Nintendo to use K9L again in its
current format for its intended purpose, though this was not news from
the moment people dumped a New3DS OTP.</p></td>
<td><p>Derivation of all New3DS keys generated via the NAND keystore
(0x1B "Secure4" etc.)</p></td>
<td><p>None</p></td>
<td><p><a href="../11.3.0-36" title="wikilink">11.3.0-X</a></p></td>
<td><p>~April 2015, implemented in May 2015</p></td>
<td><p>13 January 2016</p></td>
<td><p><a href="../User:WulfyStylez" title="wikilink">WulfyStylez</a>, <a
href="../User:Dazzozo" title="wikilink">Dazzozo</a>, <a
href="../User:Shinyquagsire23" title="wikilink">shinyquagsire23</a>
(complimentary + implemented), <a href="../User:Plutooo"
title="wikilink">plutoo</a>, Normmatt (discovered
independently)</p></td>
</tr>
<tr class="even">
<td><p>enhanced-arm9loaderhax</p></td>
<td><p>See the 32c3 3ds talk. Since this is a combination of a trick
with the arm9-bootrom + arm9loaderhax, and since you have to manually
write FIRM to the firm0/firm1 NAND partitions, this can't be completely
fixed. Any system with existing ARM9 code execution and an OTP/OTP hash
dump can exploit this. Additionally, by using the FIRM partition
known-plaintext bug and bruteforcing the second entry in the keystore,
this can currently be exploited on all New3DS systems without any other
prerequisite hacks.</p></td>
<td><p>arm9loaderhax which automatically occurs at hard-boot.</p></td>
<td><p>See arm9loaderhax / description.</p></td>
<td><p>See arm9loaderhax / description.</p></td>
<td><p>Theorized around mid July, 2015. Later implemented+tested by <a
href="../User:Plutooo" title="wikilink">plutoo</a> and <a
href="../User:Derrek" title="wikilink">derrek</a>.</p></td>
<td><p>32c3 3ds talk (December 27, 2015)</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p>arm9loaderhax: Missing verification block for the 9.6
keys</p></td>
<td><p>Starting with <a href="../9.6.0-24" title="wikilink">9.6.0-X</a> a
new set of NAND-based keys were introduced. However, no verification
block was added to verify that the new key read from NAND is correct.
This was technically an issue from <a href="../9.5.0-22"
title="wikilink">9.5.0-X</a> with the original sector+0 keydata, however
the below is only possible with <a href="../9.6.0-24"
title="wikilink">9.6.0-X</a> since keyslots 0x15 and 0x16 are generated
from different 0x11 keyXs.</p>
<p>Writing an incorrect key to NAND will cause arm9loader to decrypt the
ARM9 kernel as garbage and then jump to it.</p>
<p>This allows an hardware-based attack where you can boot into an older
exploited firmware, fill all memory with NOP sleds/jump-instructions,
and then reboot into executing garbage. By automating this process with
various input keydata, eventually you'll find some garbage that jumps to
your code.</p>
<p>This gives very early ARM9 code execution (pre-ARM9 kernel). As such,
it is possible to dump RSA keyslots with this and calculate the 6.x <a
href="../Savegames#6.0.0-11_Savegame_keyY" title="wikilink">save</a>, and
7.x <a href="../NCCH" title="wikilink">NCCH</a> keys. This cannot be used
to recover keys initialized by arm9loader itself. This is due to it
wiping the area used for its stack during NAND sector decryption and
keyslot init.</p>
<p>Due to FIRMs on both Old and New 3DS using the same RSA data, this
can be exploited on Old3DS as well, but only if one already has the
actual plaintext normalkey from New3DS NAND sector 0x96 offset-0 and has
dumped the OTP area of the Old3DS.</p></td>
<td><p>Recovery of 6.x <a href="../Savegames#6.0.0-11_Savegame_keyY"
title="wikilink">save key</a>/7.x <a href="../NCCH"
title="wikilink">NCCH</a> key, access to uncleared OTP hash
keydata</p></td>
<td><p>None</p></td>
<td><p><a href="../11.3.0-36" title="wikilink">11.3.0-X</a></p></td>
<td><p>March 2015</p></td>
<td></td>
<td><p><a href="../User:Plutooo" title="wikilink">plutoo</a></p></td>
</tr>
<tr class="even">
<td><p>arm9loader runs on Old3DS</p></td>
<td><p>Despite being written only for New3DS, all of arm9loader runs
fine on Old3DS. It's not until booting Kernel9 that a New3DS FIRM
partition would crash on an Old3DS. As a result, if a bug exists in
arm9loader to get control, it can be exploited on Old3DS by writing
New3DS FIRM to the FIRM partitions. Thus, arm9loaderhax works on both
Old3DS and New3DS.</p></td>
<td><p>arm9loader bugs also compromise Old3DS</p></td>
<td><p>None</p></td>
<td><p><a href="../11.3.0-36" title="wikilink">11.3.0-X</a></p></td>
<td><p>Sometime in 2015</p></td>
<td></td>
<td><p><a href="../User:Plutooo" title="wikilink">plutoo</a>
presumably</p></td>
</tr>
<tr class="odd">
<td><p>Uncleared New3DS keyslot 0x11</p></td>
<td><p>Originally the New3DS <a href="../FIRM" title="wikilink">FIRM</a>
arm9bin loader only cleared keyslot 0x11 when it gets executed at
firmlaunch. This was fixed with <a href="../9.5.0-22"
title="wikilink">9.5.0-X</a> by completely clearing keyslot 0x11
immediately after the loader finishes using keyslot 0x11. This means
that any ARM9 code that can execute before the loader clears the keyslot
at firmlaunch(including firmlaunch-hax) can get access to the uncleared
keyslot 0x11, which then allows one to generate all &lt;=v9.5 New3DS
keyXs which are generated by keyslot 0x11.</p>
<p>Therefore, to completely fix this the loader would have to generate
more keys using different keyslot 0x11 keydata. This was done with <a
href="../9.6.0-24" title="wikilink">9.6.0-X</a>.</p></td>
<td><p>New3DS keyXs generation</p></td>
<td><p>Mostly fixed with <a href="../9.5.0-22"
title="wikilink">9.5.0-X</a>, completely fixed with new keys with <a
href="../9.6.0-24" title="wikilink">9.6.0-X</a>.</p></td>
<td></td>
<td><p>February 3, 2015 (one day after <a href="../9.5.0-22"
title="wikilink">9.5.0-X</a> release)</p></td>
<td></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
</tbody>
</table>

### Process9

<table>
<thead>
<tr class="header">
<th><p>Summary</p></th>
<th><p>Description</p></th>
<th><p>Successful exploitation result</p></th>
<th><p>Fixed in <a href="../FIRM" title="wikilink">FIRM</a> system
version</p></th>
<th><p>Last <a href="../FIRM" title="wikilink">FIRM</a> system version this
flaw was checked for</p></th>
<th><p>Timeframe this was discovered</p></th>
<th><p>Public disclosure timeframe</p></th>
<th><p>Discovered by</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Leak of normal-key matching a key-scrambler key</p></td>
<td><p>New 3DS firmware versions <a href="../8.1.0-0_New3DS"
title="wikilink">8.1.0</a> through <a href="../9.2.0-20"
title="wikilink">9.2.0</a> set the encryption key for <a href="../Amiibo"
title="wikilink">Amiibo</a> data using a hardcoded normal-key in
Process9. In firmware <a href="../9.3.0-21" title="wikilink">9.3.0</a>,
Nintendo "fixed" this by using the key scrambler instead, by calculating
the keyY value for keyslot 0x39 that results in the same normal-key,
then hardcoding that keyY into Process9.</p>
<p>Nintendo's fix is actually the problem: Nintendo revealed the
normal-key matching an unknown keyX and a known keyY. Combined with the
key scrambler using an insecure scrambling algorithm (see "Hardware"
above), the key scrambler function could be deduced.</p></td>
<td><p>Deducing the keyX for keyslot 0x39 and the key scrambler
algorithm</p></td>
<td><p>New 3DS <a href="../9.3.0-21" title="wikilink">9.3.0-X</a>, sort
of</p></td>
<td><p><a href="../10.0.0-27" title="wikilink">10.0.0-X</a></p></td>
<td><p>Sometime in 2015 after the hardware key-generator was
broken.</p></td>
<td><p>32c3 3ds talk (December 27, 2015)</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p>Leak of normal-key matching a key-generator key</p></td>
<td><p>During the 3DS' development (June/July 2010) Nintendo added
support installing encrypted content (<a href="../CIA"
title="wikilink">CIA</a>). Common-key index1 was intended to be a <a
href="../AES" title="wikilink">hardware generated key</a>. However while
they added code to generate the key in hardware, they forgot to remove
the normal-key for index1 (used elsewhere, likely old debug code).
Nintendo later removed the normal key sometime before the first
non-prototype firmware release.</p>
<p>Knowing the keyY and the normal-key for common-key index1, the devkit
key-generator algorithm can be deduced (see "Hardware" above).
Additionally the remaining devkit common-keys can be generated once the
common-key keyX is recovered.</p>
<p>Note that the devkit key-generator was discovered to be the same as
the retail key-generator.</p></td>
<td><p>Deducing the keyX for keyslot 0x3D and hardware key-generator
algorithm. Generate remaining devkit common-keys.</p></td>
<td><p>pre-<a href="../1.0.0-0" title="wikilink">1.0.0-X</a></p></td>
<td></td>
<td><p>Shortly after the key-generator was revealed to be flawed at the
32c3 3ds talk</p></td>
<td><p>January 20, 2016</p></td>
<td><p><a href="../User:Jakcron" title="wikilink">jakcron</a></p></td>
</tr>
<tr class="odd">
<td><p>Factory firmware is vulnerable to sighax</p></td>
<td><p>During the 3DS's development, presumably boot9 was written
(including the sighax vulnerability). This vulnerability is also present
in factory firmware (and earlier, including 0.11). This was fixed in
version 1.0.0-0.</p></td>
<td><p>Deducing the mechanics of the sighax vulnerability in boot9
without having a dump of protected boot9. ARM9 code execution on
factory/earlier firmware.</p></td>
<td><p><a href="../1.0.0-0" title="wikilink">1.0.0-X</a></p></td>
<td><p><a href="../1.0.0-0" title="wikilink">1.0.0-X</a></p></td>
<td><p>May 9, 2017</p></td>
<td><p>May 19, 2017</p></td>
<td><p><a href="../User:SciresM" title="wikilink">SciresM</a>, <a
href="../User:Myria" title="wikilink">Myria</a></p></td>
</tr>
<tr class="even">
<td><p>safecerthax</p></td>
<td><p>O3DS &amp; O2DS SAFE_FIRM is still vulnerable to the
PXIAM:ImportCertificates flaw fixed in <a href="../5.0.0-11"
title="wikilink">5.0.0-11</a> and to SSLoth fixed in <a
href="../11.14.0-46" title="wikilink">11.14.0-46</a>. It makes it possible
to spoof the official NUS update server and remotely trigger the
vulnerability in SAFE_FIRM.</p></td>
<td><p>Remote Arm9 code execution in O3DS/O2DS SAFE_FIRM</p></td>
<td><p>None</p></td>
<td><p><a href="../11.14.0-46" title="wikilink">11.14.0-X</a></p></td>
<td><p>2020</p></td>
<td><p>December 18, 2020</p></td>
<td><p><a href="../User:Nba_Yoh" title="wikilink">MrNbaYoh</a></p></td>
</tr>
<tr class="odd">
<td><p>twlhax: Corrupted SRL header leads to memory overwrite</p></td>
<td><p>During TWL_FIRM boot, the ARM11 process TwlBg puts launcher.srl,
the DSi bootloader, into FCRAM. TWL_FIRM Process9 then parses the <a
href="http://dsibrew.org/wiki/NDS_Format">SRL header</a> to place
launcher.srl's code where DSi mode can execute it.</p>
<p>DSi-mode memory is in FCRAM, but interleaved. Each byte of DSi-mode
memory also exists at some address in 3DS FCRAM space.</p>
<p>Process9 does not validate the RSA signature on launcher.srl, unlike
SRLs loaded from cartridge or NAND (DSiWare). A compromised ARM11 can,
in a manner similar to firmlaunchhax, send a launcher.srl with a
modified SRL header. By setting the SRL header's ARM7/ARM9 load
addresses and sizes carefully, accounting for the different memory map
and for DSi mode's interleaved memory, it is possible to overwrite part
of Process9's stack and take control with a ROP chain.</p>
<p>Fixed in 11.8.0-X by... (fill me in)</p></td>
<td><p>ARM9 code execution (whilst still in 3DS mode)</p></td>
<td><p><a href="../11.8.0-41" title="wikilink">11.8.0-X</a></p></td>
<td><p><a href="../11.8.0-41" title="wikilink">11.8.0-X</a></p></td>
<td></td>
<td><p>August 11, 2018</p></td>
<td><p>smea</p></td>
</tr>
<tr class="even">
<td><p>agbhax</p></td>
<td><p>This is the same issue as twlhax above. Legacy FIRMs share the
same OS code (Arm9-side OS, Arm11 kernel), and therefore, the outdated
AGB_FIRM can be tricked into executing the still vulnerable
PrepareArm9ForTwl function.</p></td>
<td><p>ARM9 code execution (whilst still in 3DS mode)</p></td>
<td><p>None</p></td>
<td><p><a href="../11.14.0-46" title="wikilink">11.14.0-X</a></p></td>
<td></td>
<td><p>December 17, 2020</p></td>
<td><p>Everyone</p></td>
</tr>
<tr class="odd">
<td><p>safefirmhax</p></td>
<td><p>SAFE_MODE_FIRM is almost never updated(even when NATIVE_FIRM is
updated for vuln fixes), this can be noticed by <em>just</em> checking
3dbrew/ninupdates title-listings.</p>
<p>The fix for firmlaunch-hax was only applied to NATIVE_FIRM in <a
href="../9.5.0-22" title="wikilink">9.5.0-X</a>, leaving SAFE_FIRM
exploitable. With ARM11-kernel execution, one can trigger FIRM-launch in
to SAFE_FIRM, do Kernel9 &lt;=&gt; Kernel11 sync, PXI sync and then
repeat the original attack on SAFE_FIRM instead.</p></td>
<td><p>ARM9 code execution</p></td>
<td><p><a href="../11.3.0-36" title="wikilink">11.3.0-X</a></p></td>
<td></td>
<td><p>2012-2013?</p></td>
<td><p>Wiki: January 2, 2017</p></td>
<td><p>Everyone</p></td>
</tr>
<tr class="even">
<td><p>safefirmhax 1.1</p></td>
<td><p>Nintendo's original safefirmhax fix was flawed -- they added a
global boolean that got set to true whenever a non-sysmodule title got
launched (except for a hardcoded repair title id), and panic()'d if that
boolean was true to prevent launching safefirm after hax was active.
However, because the boolean was initially false after firmlaunch --
With ARM11-kernel execution, one could FIRM-launch into NATIVE_FIRM, and
then immediately FIRM-launch again into SAFE_FIRM early in NATIVE_FIRM
boot before the boolean got set to true to repeat the safehax
attack.</p>
<p>This was fixed by adding additional CFG9_BOOTENV checks to firmlaunch
code in 11.4.</p></td>
<td><p>ARM9 code execution</p></td>
<td><p><a href="../11.4.0-37" title="wikilink">11.4.0-X</a></p></td>
<td></td>
<td><p>safefirmhax fix</p></td>
<td><p>Wiki: April 10, 2017</p></td>
<td><p>Everyone</p></td>
</tr>
<tr class="odd">
<td><p>ntrcardhax</p></td>
<td><p>When reading the banner of a NTR title, Process9 relies on a
hardware register to know when the banner was fully read. However that
register is shared between the ARM9 and the ARM11. An attacker with k11
control can so make Process9 believe the banner continues forever and so
trigger a buffer overflow. With a custom banner for a NTR flashcart,
this leads to code execution in Process9.</p>
<p>This was fixed by adding bound checks on the read data.</p></td>
<td><p>ARM9 code execution</p></td>
<td><p><a href="../10.4.0-29" title="wikilink">10.4.0-X</a></p></td>
<td></td>
<td><p>March 2015</p></td>
<td><p>32c3 3ds talk (December 27, 2015)</p></td>
<td><p><a href="../User:Plutooo" title="wikilink">plutoo</a></p></td>
</tr>
<tr class="even">
<td><p>Title downgrading via <a href="../Application_Manager_Services"
title="wikilink">AM</a>(<a href="../Application_Manager_Services_PXI"
title="wikilink">PXI</a>)</p></td>
<td><p>When a title is *already* installed, Process9 will compare the
installed title-version with the title-version being installed. When the
one being installed is older, Process9 would return an error.</p>
<p>However, this can be bypassed by just deleting the title first via
the service command(s) for that: with the title removed from the <a
href="../Title_Database" title="wikilink">Title_Database</a>, Process9
can't compare the input title-version with anything. Hence, titles can
be downgraded this way.</p>
<p><a href="../11.0.0-33" title="wikilink">11.0.0-X</a> fixed this for key
system titles (MSET, Home Menu, spider, ErrDisp, SKATER, NATIVE_FIRM,
and every retail system module), by checking the version of the title to
install against a hard-coded list of (titleID, minimumVersionRequired)
pairs.</p></td>
<td><p>Bypassing title version check at installation, which then allows
downgrading any title.</p></td>
<td><p><a href="../11.0.0-33" title="wikilink">11.0.0-X</a>, for key system
titles.</p></td>
<td><p>NATIVE_FIRM / AM-sysmodule <a href="../11.0.0-33"
title="wikilink">11.0.0-X</a></p></td>
<td><p>?</p></td>
<td></td>
<td><p>?</p></td>
</tr>
<tr class="odd">
<td><p>Anti-downgrade list did not include all system titles
initially</p></td>
<td><p>The anti-downgrade list did not include legacy FIRMs until <a
href="../11.8.0-41" title="wikilink">11.8.0-X</a>. Therefore, legacy FIRMs
could still be downgraded.</p></td>
<td><p>Downgrading legacy FIRMs; allowing to exploit bugs in older
legacy FIRMs (of which at least one exists, see below).</p></td>
<td><p><a href="../11.8.0-33" title="wikilink">11.8.0</a></p></td>
<td><p><a href="../11.8.0-33" title="wikilink">11.8.0</a></p></td>
<td><p>?</p></td>
<td><p>Wiki: August 5, 2018</p></td>
<td><p>Everyone</p></td>
</tr>
<tr class="even">
<td><p>TWL_FIRM cmd-9 unchecked offset</p></td>
<td><p>In <a href="../1.0.0-0" title="wikilink">1.0.0-X</a>'s TWL_FIRM,
cmds 8 and 9 were not stubbed (whereas in the corresponding NATIVE_FIRM,
they were). Command 8 does the Process9 initialisation for NTR carts if
an NTR cart is inserted (NTR, not TWL, judged by chipid).</p>
<p>Command 9 takes (u32 offset_read, u32 offset_write, u32
offset_read_end), and basically just copies (offset_read_end -
offset_read) bytes starting at (offset_read) of [NTR cart header in
arm9mem, NTR secure area in fcram, TWL secure area in fcram], to
0x18001000 + offset_write + offset_read.</p>
<p>offset_write is not checked at all, thus this leads to ARM9 code
execution as long as any NTR cart, including flashcarts that would
normally be blocked by TWL_FIRM, is inserted.</p>
<p>In <a href="../2.0.0-2" title="wikilink">2.0.0-X</a> TWL_FIRM, those
commands were stubbed out.</p></td>
<td><p>ARM9 code execution</p></td>
<td><p><a href="../2.0.0-2" title="wikilink">2.0.0-X</a></p></td>
<td><p><a href="../2.0.0-2" title="wikilink">2.0.0-X</a></p></td>
<td><p>January 2018</p></td>
<td><p>Wiki: August 5, 2018</p></td>
<td><p><a href="../User:Riley" title="wikilink">Riley</a></p></td>
</tr>
<tr class="odd">
<td><p>FIRM launch doesn't check target FIRM version</p></td>
<td><p>When executing a FIRM launch, Process9 doesn't validate that the
target FIRM isn't an old version. This allows booting an exploitable
FIRM from a newer FIRM, if you can get the exploitable FIRM installed.
(<a href="../11.0.0-33" title="wikilink">11.0.0-X</a> now prevents
installing old versions of system titles, but this doesn't affect titles
already installed.)</p>
<p>This had a use after <a href="../9.6.0-24" title="wikilink">9.6.0-X</a>:
on a compromised 3DS running 9.2.0, you could install the 9.6.0
NATIVE_FIRM to FIRM0/FIRM1, but avoid putting it into the NATIVE_FIRM
title. This would boot the 9.2.0 system software but with the 9.6.0
Process9 and Kernel11. With a user-mode exploit in a
sufficiently-privileged application (e.g. mset), you could trigger a
FIRM launch back to NATIVE_FIRM, which would load the 9.2.0 Process9 and
Kernel11.</p>
<p>9.6.0's keyslots 0x15 and 0x16 are unknown to 9.2.0, so 9.2.0 would
not clear them. You then could do firmlaunchhax against 9.2.0 to get
ARM9 access with keyslots 0x15 and 0x16 set to their proper 9.6.0
values, allowing decrypting 9.6.0's encrypted titles. Once the New3DS
keystore was dumped, this became moot.</p></td>
<td><p>Decrypting 9.6.0 NCCH files without dumping New3DS
keystore</p></td>
<td><p>None (but now moot)</p></td>
<td><p><a href="../9.6.0-24" title="wikilink">9.6.0-X</a></p></td>
<td><p>March 2015</p></td>
<td><p>August 12, 2018</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a>, <a
href="../User:Myria" title="wikilink">Myria</a></p></td>
</tr>
<tr class="even">
<td><p>FAT FS code null-deref</p></td>
<td><p>When FSFile:Read is used with a file which is corrupted on a FAT
filesystem(in particular SD), Process9 can crash. This particular crash
is caused by a function returning NULL instead of an actual ptr due to
an error. The caller of that function doesn't check for NULL which then
triggers a read based at NULL.</p>
<p>Sample "fsck.vfat -n -v -V <fat image backup>" output for the above
crash:</p>
<pre><code>...
Starting check/repair pass.
&lt;FilePath0&gt; and
&lt;FilePath1&gt;
 share clusters.
 Truncating second to 3375104 bytes.
&lt;FilePath1&gt;
 File size is 2787392 bytes, cluster chain length is 16384 bytes.
 Truncating file to 16384 bytes.
Checking for unused clusters.
Reclaimed 1 unused cluster (16384 bytes).
Checking free cluster summary.
Free cluster summary wrong (1404490 vs. really 1404491)
 Auto-correcting.
Starting verification pass.
Checking for unused clusters.
Leaving filesystem unchanged.</code></pre></td>
<td><p>Useless null-based-read</p></td>
<td><p>None</p></td>
<td><p><a href="../9.6.0-24" title="wikilink">9.6.0-X</a></p></td>
<td><p>July 8-9, 2015</p></td>
<td></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="../FS:EnumerateExtSaveData"
title="wikilink">FS:EnumerateExtSaveData</a> crashes process9 when
trying to parse a file as an extdata directory in Data Management
(MSET9)</p></td>
<td><p>In the implementation for FSPXI:EnumerateExtSaveData (called by
<a href="../System_Settings" title="wikilink">MSET</a> to parse 3DS extdata
IDs for Data Management), the return value of the P9 internal function
call to open a directory (when enumerating contents of the extdata
directory) was not checked. Therefore, if the call fails, an
uninitialised pointer on stack will be used for a vtable call.</p>
<p>As such, a file that starts with 8 hex digits can crash process9 if
placed directly inside the extdata directory. It can crash in various
ways based on subtle differences in the way the user triggers the crash
event.</p>
<p>While mostly leading to null derefs, in one specific context,
process9 jumps directly to an ID1 string being held in ARM9 memory.
Surprisingly, the 3DS doesn't discern what characters are used for the
ID1 directory name on the SD, only requiring exactly 32 chars. This
allows the attacker to insert arm instructions into the unicode ID1
dirname and take control of the ARM9, and thus, full control of the
3DS.</p></td>
<td><p>ARM9 code execution (primary)</p></td>
<td><p>None</p></td>
<td><p><a href="../11.17.0-50" title="wikilink">11.17.0-X</a></p></td>
<td><p>April 2022</p></td>
<td><p>August 7, 2023</p></td>
<td><p>zoogie</p></td>
</tr>
<tr class="even">
<td><p>RSA signature padding checks</p></td>
<td><p>The TWL_FIRM RSA sig padding check code used for all TWL RSA
sig-checks has issues, see <a href="../FIRM" title="wikilink">here</a>. The
main 3DS RSA padding check code(non-certificate, including NATIVE_FIRM)
uses the function used with the above to extract more padding + the
actual hash from the additional padding. This isn't really a problem
here because there's proper padding check code which is executed prior
to this.</p></td>
<td></td>
<td><p>None</p></td>
<td><p><a href="../9.5.0-22" title="wikilink">9.5.0-X</a></p></td>
<td><p>March 2015</p></td>
<td></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="../AMPXI:ValidateDSiWareSectionMAC"
title="wikilink">AMPXI:ValidateDSiWareSectionMAC</a> <a
href="../AES_Registers" title="wikilink">AES</a> keyslot reuse</p></td>
<td><p>When the input DSiWare section index is higher than
<max number of DSiWare sections supported by this FIRM>, Process9 uses
keyid 0x40 for calculating the AESMAC, which translates to keyslot 0x40.
The result is that the keyslot is left at whatever was already selected
before, since the AES selectkeyslot code will immediately return when
keyslot is &gt;=0x40. However, actually exploiting this is difficult:
the calculated AESMAC is never returned, this command just compares the
calculated AESMAC with the input AESMAC(result-code depends on whether
the AESMACs match). It's unknown whether a timing attack would work with
this. This is basically a different form of the pxips9 keyslot vuln,
except with AESMAC etc.</p></td>
<td><p>See description.</p></td>
<td><p>None</p></td>
<td><p><a href="../11.3.0-36" title="wikilink">11.3.0-X</a></p></td>
<td><p>March 15, 2015</p></td>
<td><p>December 29, 2015</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p>pxips9 <a href="../AES_Registers" title="wikilink">AES</a> keyslot
reuse</p></td>
<td><p>This requires access to the <a href="../Process_Services"
title="wikilink">ps:ps</a>/pxi:ps9 services. One way to get access to
this would be snshax on system-version &lt;=10.1.0-X(see 32c3 3ds talk).
When an invalid key-type value is passed to any of the PS commands,
Process9 will try to select keyslot 0x40. That aesengine_setkeyslot()
code will then immediately return due to the invalid keyslot value.
Since that function doesn't return any errors, Process9 will just
continue to do crypto with whatever AES keyslot was selected before the
PS command was sent.</p></td>
<td><p>Reusing the previously used keyslot, for crypto with PS.</p></td>
<td><p>None</p></td>
<td><p><a href="../11.3.0-36" title="wikilink">11.3.0-X</a></p></td>
<td><p>Roughly the same time(same day?) as firmlaunch-hax.</p></td>
<td><p>December 29, 2015</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p>firmlaunch-hax: FIRM header ToCToU</p></td>
<td><p>This can't be exploited from ARM11 userland. During <a
href="../FIRM" title="wikilink">FIRM</a> launch, the only FIRM header the
ARM9 uses at all is stored in FCRAM, this is 0x200-bytes(the actual used
FIRM RSA signature is read to the Process9 stack however). The ARM9
doesn't expect "anything" besides the ARM9 to access this data. With <a
href="../9.5.0-22" title="wikilink">9.5.0-22</a> the address of this FIRM
header was changed from a FCRAM address, to ARM9-only address
0x01fffc00.</p></td>
<td><p>ARM9 code execution</p></td>
<td><p><a href="../9.5.0-22" title="wikilink">9.5.0-22</a></p></td>
<td></td>
<td><p>2012, 3 days after <a href="../User:Yellows8"
title="wikilink">Yellows8</a> started Process9 code RE.</p></td>
<td></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p>Uninitialized data output for (PXI) command replies</p></td>
<td><p>PXI commands for various services(including some <a
href="../Filesystem_services_PXI" title="wikilink">here</a> and many
others) can write uninitialized data (like from ARM registers) to the
command reply. This happens with stubbed commands, but this can also
occur with certain commands when returning an error. Certain ARM11
service commands have this same issue as well.</p></td>
<td></td>
<td><p>None</p></td>
<td><p><a href="../9.3.0-21" title="wikilink">9.3.0-X</a></p></td>
<td><p>?</p></td>
<td></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="../Filesystem_services_PXI" title="wikilink">FSPXI</a>
OpenArchive SD permissions</p></td>
<td><p>Process9 does not use the exheader ARM9 access-mount permission
flag for SD at all. This would mean ARM11-kernelmode code / fs-module
itself could directly use FSPXI to access SD card without ARM9 checking
for SD access, but this is rather useless since a process is usually
running with SD access(Home Menu for example) anyway.</p></td>
<td></td>
<td><p>None</p></td>
<td><p><a href="../9.3.0-21" title="wikilink">9.3.0-X</a></p></td>
<td><p>2012</p></td>
<td></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p><a href="../AMPXI:ExportDSiWare"
title="wikilink">AMPXI:ExportDSiWare</a> export path</p></td>
<td><p>Process9 allocates memory on Process9 heap for the export path
then verifies that the actual allocated size matches the input size.
Then Process9 copies the input path from FCRAM to this buffer, and uses
it with the Process9 FS openfile code, which use paths in the form of
"<mountpoint>:/<path>". Process9 does not check the contents of this
path at all before passing it to the FS code, besides writing a
NUL-terminator to the end of the buffer.</p></td>
<td><p>Exporting of DSiWare to arbitrary Process9 file-paths, such as
"nand:/<path>" etc. This isn't really useful since the data which gets
written can't be controlled.</p></td>
<td><p>None</p></td>
<td><p><a href="../9.5.0-22" title="wikilink">9.5.0-22</a></p></td>
<td><p>April 2013</p></td>
<td></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="../DSiWare_Exports" title="wikilink">DSiWare_Exports</a> <a
href="../CTCert" title="wikilink">CTCert</a> verification</p></td>
<td><p>Just like DSi originally did, 3DS verifies the APCert for DSiWare
on SD with the CTCert also in the DSiWare .bin. On DSi this was fixed
with with system-version 1.4.2 by verifying with the actual
console-unique cert instead(stored in NAND), while on 3DS it's still not
fixed. On 3DS this is used in conjunction with seedminer to be able to
decrypt &amp; modify DSiWare TAD containers and inject them with
exploitable DSiWare titles such as sudoku (sudokuhax) and Flipnote JPN
(ugopwn)</p></td>
<td><p>When the movable.sed keyY for the target 3DS is known and the
target 3DS CTCert private-key is unknown, importing of modified DSiWare
SD .bin files.</p></td>
<td><p>None.</p></td>
<td><p>11.10.0-X</p></td>
<td><p>April 2013</p></td>
<td></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p>seedminer: movable.sed keyY vulnerable to brute-force</p></td>
<td><p>Half of the movable.sed keyY's 128 bits are leaked through the <a
href="../Nandrw/sys/LocalFriendCodeSeed_B" title="wikilink">LFCS</a>, which
is available in userland and below. The LFCS itself also leaks almost
half of the remaining bits by following the ratio: u32
keyY[3]=1/5(LFCS). The remaining keyY[3] uncertainty of about ±2000 can
be greatly reduced by plotting expected error margins with several
keyYs. This results in a final uncertainty of about 2^40, easily within
practical brute force range of an average modern PC.</p></td>
<td><p>Knowing the keyY of a given 3ds allows for modification of
DSiWare export contents, and chained with several other public vulns,
ultimately arm9 execution.</p></td>
<td><p>None.</p></td>
<td><p>11.8.0-X</p></td>
<td><p>December 2017</p></td>
<td><p>January 2018</p></td>
<td><p>zoogie</p></td>
</tr>
<tr class="odd">
<td><p>Improper validation of DSiWare title SRLs</p></td>
<td><p>The 3DS does not verify if the actual SRL embedded in the title's
directory matches the titleID in the TMD before launching it or
importing it from an sd DSiWare export.</p></td>
<td><p>This allows embedding older, exploitable DSiWare titles in
completely different, unexploitable DSiWare titles. Since DSiWare has
raw NAND RW, this can result in arm9 control through FIRM
known-plaintext and sighax attacks.</p></td>
<td><p>None.</p></td>
<td><p>11.10.0-X</p></td>
<td><p>2015?</p></td>
<td><p>December 2016</p></td>
<td><p>Everyone</p></td>
</tr>
<tr class="even">
<td><p>DSiWare import/export functions allow TWL system titles as
arguments</p></td>
<td><p>AM ImportTwlBackup/ExportTwlBackup unnecessarily allow TWL system
titles such as DS Download Play to import/export from userland and
System Settings -&gt; Data Management (only am:sys is needed for
userland). This is difficult to abuse for dsihax injection because no
TWL system title has a save file, and any import with a save included
will result in FS err C8804464. However, there is at least one dsihax
primary that can load a payload from a non-NAND source, and not error if
it can't access its public.sav (JPN Flipnote Studio v0).</p></td>
<td><p>When combined with other public vulns, arm9 code
execution.</p></td>
<td><p>None.</p></td>
<td><p>11.10.0-X</p></td>
<td><p>May 2018</p></td>
<td><p>Sept 2018</p></td>
<td><p>zoogie</p></td>
</tr>
<tr class="odd">
<td><p><a href="../Gamecard_Services_PXI"
title="wikilink">Gamecard_Services_PXI</a> unchecked REG_CTRCARDCNT
transfer-size</p></td>
<td><p>The u8 REG_CTRCARDCNT transfer-size parameter for the <a
href="../Gamecard_Services_PXI" title="wikilink">Gamecard_Services_PXI</a>
read/write CTRCARD commands is used as an index for an array of u16
values. Before <a href="../5.0.0-11" title="wikilink">5.0.0-X</a> this u8
value wasn't checked, thus out-of-bounds reads could be triggered(which
is rather useless in this case).</p></td>
<td><p>Out-of-bounds read for a value which gets written to a
register.</p></td>
<td><p><a href="../5.0.0-11" title="wikilink">5.0.0-X</a></p></td>
<td></td>
<td><p>2013?</p></td>
<td></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p><a href="../PXI_Registers" title="wikilink">PXI</a> cmdbuf buffer
overrun</p></td>
<td><p>The Process9 code responsible <a href="../PXI_Registers"
title="wikilink">PXI</a> communications didn't verify the size of the
incoming command before writing it to a C++ member variable.</p></td>
<td><p>Probably ARM9 code execution</p></td>
<td><p><a href="../5.0.0-11" title="wikilink">5.0.0-11</a></p></td>
<td></td>
<td><p>March 2015, original timeframe if any unknown</p></td>
<td></td>
<td><p><a href="../User:Plutooo" title="wikilink">plutoo</a>/<a
href="../User:Yellows8" title="wikilink">Yellows8</a>/maybe
others(?)</p></td>
</tr>
<tr class="odd">
<td><p><a href="../Application_Manager_Services_PXI"
title="wikilink">PXIAM</a>:ImportCertificates (See also <a
href="../Application_Manager_Services" title="wikilink">this</a>)</p></td>
<td><p>When handling this command, Process9 allocates a 0x2800-byte heap
buffer, then copies the 4 FCRAM input buffers to this heap buffer
without checking the sizes at all(only the buffers with non-zero sizes
are copied). Starting with <a href="../5.0.0-11"
title="wikilink">5.0.0-X</a>, the total combined size of the input data
must be &lt;=0x2800.</p></td>
<td><p>ARM9 code execution</p></td>
<td><p><a href="../5.0.0-11" title="wikilink">5.0.0-X</a></p></td>
<td></td>
<td><p>May 2013</p></td>
<td></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p><a href="../Process_Services_PXI" title="wikilink">PS RSA</a>
commands buffer overflows</p></td>
<td><p>pxips9 cmd1(not accessible via ps:ps) and VerifyRsaSha256:
unchecked copy to a buffer in Process9's .bss, from the input FCRAM
buffer. The buffer is located before the pxi cmdhandler threads' stacks.
SignRsaSha256 also has a buf overflow, but this isn't exploitable. The
buffer for this is the buffer for the signature data. With v5.0, the
signature buffer was moved to stack, with a check for the signature data
size. When the signature data size is too large, Process9 uses <a
href="../SVC" title="wikilink">svcBreak</a>.</p></td>
<td><p>ARM9 code execution</p></td>
<td><p><a href="../5.0.0-11" title="wikilink">5.0.0-X</a></p></td>
<td></td>
<td><p>2012</p></td>
<td></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="../PXI_Registers" title="wikilink">PXI</a> pxi_id bad
check</p></td>
<td><p>The Process9 code responsible for <a href="../PXI_Registers"
title="wikilink">PXI</a> communications read pxi_id as a signed char.
There were two flaws:</p>
<ul>
<li>They used it as index to a lookup-table without checking the value
at all.</li>
<li>Another function verified that pxi_id &lt; 7, allowing negative
values to pass the check. This would also cause an out-of-range
table-lookup.</li>
</ul></td>
<td><p>Maybe ARM9 code execution</p></td>
<td><p><a href="../3.0.0-5" title="wikilink">3.0.0-5</a></p></td>
<td></td>
<td><p>March 2015, originally 2012 for the first issue at least</p></td>
<td></td>
<td><p><a href="../User:Plutooo" title="wikilink">plutoo</a>, <a
href="../User:Yellows8" title="wikilink">Yellows8</a>, maybe
others(?)</p></td>
</tr>
</tbody>
</table>

### Kernel9

<table>
<thead>
<tr class="header">
<th><p>Summary</p></th>
<th><p>Description</p></th>
<th><p>Successful exploitation result</p></th>
<th><p>Fixed in <a href="../FIRM" title="wikilink">FIRM</a> system
version</p></th>
<th><p>Last <a href="../FIRM" title="wikilink">FIRM</a> system version this
flaw was checked for</p></th>
<th><p>Timeframe this was discovered</p></th>
<th><p>Discovered by</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><a href="../CONFIG_Registers#CFG9_SYSPROT9"
title="wikilink">CFG9_SYSPROT9</a> bit1 not set by Kernel9</p></td>
<td><p>Old versions of Kernel9 never set bit1 of <a
href="../CONFIG_Registers#CFG9_SYSPROT9"
title="wikilink">CFG9_SYSPROT9</a>. This leaves the <a
href="../OTP_Registers" title="wikilink">0x10012000</a>-region unprotected
(this region should be locked early during boot!). Since it's never
locked, you can dump it once you get ARM9 code execution.</p>
<p>From <a href="../3.0.0-5" title="wikilink">3.0.0-X</a> this was fixed by
setting the bit in Kernel9 after poking some registers in that region.
On New3DS arm9loader sets this bit instead of Kernel9, which is
exploitable through a hardware + software vulnerability (see
arm9loaderhax / description).</p>
<p>This flaw resurged when it gained a new practical use: retrieving the
OTP data for a New3DS console in order to decrypt the key data used in
arm9loader (see enhanced-arm9loaderhax / description). This was
performed by downgrading to a vulnerable system version. By accounting
for differences in CTR-NAND crypto (0x05 -&gt; 0x04, see partition
encryption types <a href="../Flash_Filesystem#NAND_structure"
title="wikilink">here</a>) and using an Old3DS <a
href="../NCSD#NCSD_header" title="wikilink">NCSD Header</a>, it is possible
to boot a New3DS using Old3DS firmware 1.0-2.x to retrieve the required
OTP data using this flaw.</p></td>
<td><p>Dumping the <a href="../OTP_Registers" title="wikilink">OTP</a>
area. Decrypting New3DS sector 0x96 keyblock.</p></td>
<td><p><a href="../3.0.0-5" title="wikilink">3.0.0-X</a></p></td>
<td></td>
<td><p>February 2015</p></td>
<td><p><a href="../User:Plutooo" title="wikilink">plutoo</a>, Normmatt
independently</p></td>
</tr>
</tbody>
</table>

## ARM11 software

### Kernel11

<table>
<thead>
<tr class="header">
<th><p>Summary</p></th>
<th><p>Description</p></th>
<th><p>Successful exploitation result</p></th>
<th><p>Fixed in <a href="../FIRM" title="wikilink">FIRM</a> system
version</p></th>
<th><p>Last <a href="../FIRM" title="wikilink">FIRM</a> system version this
flaw was checked for</p></th>
<th><p>Timeframe this was discovered</p></th>
<th><p>Discovered by</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><a href="../SVC" title="wikilink">svcUnbindInterrupt</a> double free
when irqId = 15</p></td>
<td><p>svcBindInterrupt and svcUnbindInterrupt give special treatment to
irqId 15 (FIQ helper): the access control list is bypassed and the
provided KInterruptEvent (event or semaphore, via handle) is stored
inside a singleton static object after having its refcount increased by
1.</p>
<p>svcUnbindInterrupt assumes that the user-provided handle is what is
stored in the singleton and will decref the user-provided
KInterruptEvent twice, causing a use-after-free if the attacker didn't
actually provide an handle to the same event or semaphore.</p>
<p>This was "fixed" on <a href="../11.14.0-46"
title="wikilink">11.14.0-X</a> by preventing irqId 15 to be bound on
retail units altogether (in both functions).</p></td>
<td><p>Arm11 kernel code execution</p></td>
<td><p><a href="../11.14.0-46" title="wikilink">11.14.0-X</a> (only on
retail units)</p></td>
<td><p><a href="../11.14.0-46" title="wikilink">11.14.0-X</a></p></td>
<td><p>2019</p></td>
<td><p><a href="../User:TuxSH" title="wikilink">TuxSH</a>, maybe
others</p></td>
</tr>
<tr class="even">
<td><p><a href="../SVC" title="wikilink">svcKernelSetState</a> op=3 could
map the NULL page</p></td>
<td><p>svcKernelSetState op=3 param1=1 maps the firmlaunch parameters
page to the user-specified VA.</p>
<p>It had previously no check, allowing the attacker to map data at VA
0.</p>
<p>Starting from <a href="../11.14.0-46" title="wikilink">11.14.0-X</a>,
the VA must be in the standard 0x10000000-0x14000000 address
range.</p></td>
<td><p>Mapping the NULL page (as RW) to leverage other kernel
vulnerabilities</p></td>
<td><p><a href="../11.14.0-46" title="wikilink">11.14.0-X</a></p></td>
<td><p><a href="../11.14.0-46" title="wikilink">11.14.0-X</a></p></td>
<td><p>2019</p></td>
<td><p><a href="../User:TuxSH" title="wikilink">TuxSH</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="../SVC" title="wikilink">svcMapProcessMemory</a> can map
the NULL page</p></td>
<td><p>svcMapProcessMemory's destination VA is unchecked.</p>
<p>By passing a big enough "size" parameter, an attacker can map chunks
of data at VA 0 in the destination (caller) process.</p></td>
<td><p>Mapping the NULL page (as RW) to leverage other kernel
vulnerabilities</p></td>
<td><p>None</p></td>
<td><p><a href="../11.14.0-46" title="wikilink">11.14.0-X</a></p></td>
<td><p>2020</p></td>
<td><p><a href="../User:TuxSH" title="wikilink">TuxSH</a></p></td>
</tr>
<tr class="even">
<td><p>Resource limit use-after-free</p></td>
<td><p>When assigning a KResourceLimit to a KProcess, the reslimit's
refcounter doesn't get incremented. This essentially means all
KResourceLimit get freed if pm gets somehow terminated.</p>
<p>It turns out it is possible to ask pm (via ns:s or pm:app) to
terminate itself along all other KIPs simply by passing TID
0004000100001000.</p>
<p>Calling <a href="../SVC" title="wikilink">svcGetResourceLimit</a>
afterwards triggers a use-after-free. This is rather difficult to
exploit, however: there is one slot left in the reslimit slabheap. An
attacker either has to map the NULL page as R(W)X
(svcControlProcessMemory vuln fixed on <a href="../11.8.0-41"
title="wikilink">11.8.0-X</a>), or use one of the map-null exploits
above while having access to svcCreateResourceLimit (with the only one
that is easy enough to use in that context having been fixed on <a
href="../11.14.0-46" title="wikilink">11.14.0-X</a>, anyway).</p></td>
<td><p>Arm11 kernel code execution</p></td>
<td><p>None (although near impossible to exploit on <a href="../11.14.0-46"
title="wikilink">11.14.0-X</a>)</p></td>
<td><p><a href="../11.14.0-46" title="wikilink">11.14.0-X</a></p></td>
<td><p>2020</p></td>
<td><p><a href="../User:TuxSH" title="wikilink">TuxSH</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="../SVC" title="wikilink">svcSetProcessIdealProcessor</a>
reference count overflow and therefore use-after-free.</p></td>
<td><p>The SVC receive two arguments: handle and idealprocessor. The
handle is used to get the KProcess object and the KProcess-&gt;refCnt
gets incremented,later the function check if the KProcess-&gt;mem_type
!= BASE and if yes, it checks for idealprocessor == 2 or idealprocessor
!= 3. The problem here is that if you pass the idealprocessor = 3 it
won't meet any condition and return the error 0xD9001BEA without
decrement the reference count. It can be abused to overflow the KProcess
reference count that will lead to an Use-after-free.</p></td>
<td><p>Before <a href="../11.2.0-35" title="wikilink">11.2.0-X</a>:
reference count overflow and therefore use-after-free.</p></td>
<td></td>
<td><p><a href="../11.6.0-39" title="wikilink">11.6.0-X</a></p></td>
<td><p>November 2, 2017</p></td>
<td><p><a href="../User:st4rk" title="wikilink">st4rk</a></p></td>
</tr>
<tr class="even">
<td><p><a href="../SVC" title="wikilink">svcGetThreadList</a> process
reference leak</p></td>
<td><p>When given a valid process handle (including
<code>0xFFFF8001</code>), svcGetThreadList forgets to decrement the
reference count of the underlying <a href="../KProcess"
title="wikilink">KProcess</a> instance, after having finished using
it.</p></td>
<td><p>Before <a href="../11.2.0-35" title="wikilink">11.2.0-X</a>:
reference count overflow and therefore use-after-free, but this UAF was
most likely not exploitable</p></td>
<td></td>
<td><p><a href="../11.3.0-36" title="wikilink">11.3.0-X</a></p></td>
<td><p>April 3, 2017</p></td>
<td><p><a href="../User:TuxSH" title="wikilink">TuxSH</a></p></td>
</tr>
<tr class="odd">
<td><p>kernelhax via gspwn</p></td>
<td><p>Originally the kernel didn't initialize <a
href="../CONFIG11_Registers#CFG11_GPUPROT"
title="wikilink">CFG11_GPUPROT</a>. Since it's 0 at hard-boot, this
allowed the GPU to access the entire FCRAM + AXIWRAM.</p></td>
<td><p>Entire FCRAM+AXIWRAM R/W.</p></td>
<td><p><a href="../3.0.0-5" title="wikilink">3.0.0-X</a></p></td>
<td></td>
<td><p>February 7, 2017</p></td>
<td><p><a href="../User:Plutooo" title="wikilink">plutoo</a>, <a
href="../User:Yellows8" title="wikilink">Yellows8</a> partly</p></td>
</tr>
<tr class="even">
<td><p>fasthax</p></td>
<td><p>When a KTimer is created in pulse mode, the kernel calls a
virtual function to reset the timer each time it pulses. The scheduler
is locked for that core to avoid race conditions, but another core can
call CloseHandle on the timer and free it, leading to a UAF vtable
call.</p></td>
<td><p>See description.</p></td>
<td><p><a href="../11.3.0-36" title="wikilink">11.3.0-X</a></p></td>
<td><p><a href="../11.3.0-36" title="wikilink">11.3.0-X</a></p></td>
<td><p>May 2016</p></td>
<td><p>nedwill</p></td>
</tr>
<tr class="odd">
<td><p>ipctakeover</p></td>
<td><p>When sending cmdreplies, it does not validate that the src_addr
and src_size match the equivalent dst_addr and dst_size. With a modified
addr/size specified in a cmdreply for an output buffer, the data-copy
for the first/last pages could be used to overwrite data outside of the
buffer specified by the original process.</p>
<p>Used by ctr-httpwn as of v1.2, for "ipctakeover/bosshaxx".</p>
<p>This can be used to takeover processes where the process is using
your service session. Like HTTPC -&gt; BOSS, for bosshaxx above. NIM
takeover can be done too(actual stack buffer overflow can trigger),
etc.</p></td>
<td><p>See description.</p></td>
<td><p>None</p></td>
<td><p><a href="../11.3.0-36" title="wikilink">11.3.0-X</a></p></td>
<td><p>November 26, 2016</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p>Using IPC input buffers as output buffers</p></td>
<td><p>When sending cmdreplies, it does not validate that the cmdreply
descriptor type matches the equivalent cmdreq descriptor type. This
could be used by an exploited sysmodule to use what was intended as an
input-buffer as an output-buffer, and also combine other IPC vuln(s)
with this.</p>
<p>Used by ctr-httpwn as of v1.2, for "ipctakeover/bosshaxx".</p></td>
<td><p>See description.</p></td>
<td><p>None</p></td>
<td><p><a href="../11.3.0-36" title="wikilink">11.3.0-X</a></p></td>
<td><p>November 2016</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="../SVC" title="wikilink">SVC</a> table too small</p></td>
<td><p>The table of function pointers for SVC's only contains entries up
to 0x7D, but the biggest allowed SVC for the table is 0x7F. Thus,
executing SVC7E or SVC7F would make the SVC-handler read after the
buffer, and interpret some ARM instructions as function pointers.</p>
<p>However, this would require patching the kernel .text or modifying
SVC-access-control. Even if you could get these to execute, they would
still jump to memory that isn't mapped as executable.</p></td>
<td></td>
<td><p>None</p></td>
<td><p><a href="../11.3.0-36" title="wikilink">11.3.0-X</a></p></td>
<td><p>2012</p></td>
<td><p>Everyone</p></td>
</tr>
<tr class="even">
<td><p><a href="../SVC" title="wikilink">svcBackdoor (0x7B)</a></p></td>
<td><p>This backdoor allows executing SVC-mode code at the
user-specified code-address. This is used by Process9, using this on the
ARM11 (with NATIVE_FIRM) required patching the kernel .text or modifying
SVC-access-control.</p></td>
<td><p>See description</p></td>
<td><p><a href="../11.0.0-33" title="wikilink">11.0.0-X</a>
(deleted)</p></td>
<td></td>
<td></td>
<td><p>Everyone</p></td>
</tr>
<tr class="odd">
<td><p>veryslowpidhax</p></td>
<td><p><strong>This is completely different from the
kernelmode-code-execution vuln described in the below separate
entry.</strong></p>
<p>When updating the kernel global PID counter under <a href="../SVC"
title="wikilink">svcCreateProcess</a> the kernel does not check for
wraparound to 0x0(the PID for the very first process). This only matters
because <a href="../Services" title="wikilink">SM-module</a> allows
processes with PID value less than <total ARM11 FIRM modules> to access
<em>all</em> services, without checking exheader service-access-control;
and because Kernel11 checks for the PID to be 1 (loader) to use the
input mem-region value on ControlMemory. This alone does not affect
access the <a href="../SVC" title="wikilink">SVCs</a> access table at
all.</p>
<p>Inlined ldrex+strex code is used for updating the above counter. <a
href="../11.2.0-35" title="wikilink">11.2.0-X</a> had changes for similar
code, but it was only for dedicated ldrex+strex functions(mainly for
kernel objects) and hence this PID code was not affected.</p>
<p>With launching+terminating a sysmodule repeatedly with this via ns:s,
it would take weeks to finish(if not at least about a month?).</p></td>
<td><p>Access to all <a href="../Services_API"
title="wikilink">services</a>, ControlMemory on any given
mem-region.</p></td>
<td><p>None</p></td>
<td><p><a href="../11.3.0-36" title="wikilink">11.3.0-X</a></p></td>
<td><p>2012 maybe?</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>slowhax/waithax</p></td>
<td><p>svcWaitSynchronizationN does not decrement the references to
valid handles in an array before returning an error when it encounters
an invalid handle. This allows one to (slowly) overflow the reference
count for a handle object to zero.</p></td>
<td><p>ARM11 kernel-mode code execution</p></td>
<td><p><a href="../11.2.0-35" title="wikilink">11.2.0-X</a></p></td>
<td><p><a href="../11.2.0-35" title="wikilink">11.2.0-X</a></p></td>
<td><p>2016</p></td>
<td><p>nedwill, <a href="../User:Derrek"
title="wikilink">derrek</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="../Memory_layout#ARM11_Detailed_virtual_memory_map"
title="wikilink">0xEFF00000</a> / 0xDFF00000 ARM11 kernel
virtual-memory</p></td>
<td><p>The ARM11 kernel-mode 0xEFF00000/0xDFF00000 virtual-memory(size
0x100000) is mapped to phys-mem 0x1FF00000(entire DSP-mem + entire
AXIWRAM), with permissions RW-. This is used during ARM11 kernel startup
for loading the FIRM-modules from the FIRM section located in DSP-mem,
this never seems to be used after that, however. This is never unmapped
either.</p></td>
<td></td>
<td><p>None</p></td>
<td><p><a href="../11.3.0-36" title="wikilink">11.3.0-X</a></p></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td><p>memchunkhax2.1</p></td>
<td><p>Nintendo's fix for memchunkhax2 in <a href="../10.4.0-29"
title="wikilink">10.4.0-X</a> did not fix the GPU case: one may cause
the requisite ToCToU race using gspwn, bypassing the new validation.
derrek's original 32c3 presentation for memchunkhax2 commented that a
GPU-based attack was possible, but would be difficult. However,
memchunkhax2.1 showed that it was possible to do fairly
reliably.</p></td>
<td><p>ARM11 kernel code execution</p></td>
<td><p><a href="../11.0.0-33" title="wikilink">11.0.0-X</a>, via the new <a
href="../Memory_Management#MemoryBlockHeader"
title="wikilink">memchunkhdr</a> MAC which prevents modifying
memchunkhdr data with DMA.</p></td>
<td><p><a href="../11.0.0-33" title="wikilink">11.0.0-X</a></p></td>
<td></td>
<td><p><a href="../User:Derrek" title="wikilink">derrek</a>,
aliaspider</p></td>
</tr>
<tr class="odd">
<td><p>memchunkhax2</p></td>
<td><p>When allocating a block of memory, the "next" pointer of the <a
href="../Memory_Management#MemoryBlockHeader"
title="wikilink">memchunkhdr</a> is accessed without being checked after
being mapped to userland. This allows a race condition, where the
process can change the next pointer just before it's accessed. By
pointing the next pointer to a crafted memchunckhdr in the kernel
SlabHeap, some of the SlabHeap is allocated to the calling process,
allowing to change vtables of kernel objects.</p></td>
<td><p>ARM11 kernel code execution</p></td>
<td><p><a href="../10.4.0-29" title="wikilink">10.4.0-X</a> (partially, see
memchunkhax2.1)</p></td>
<td><p><a href="../10.4.0-29" title="wikilink">10.4.0-X</a></p></td>
<td></td>
<td><p><a href="../User:Derrek" title="wikilink">derrek</a></p></td>
</tr>
<tr class="even">
<td><p>heaphax</p></td>
<td><p>Can change the size of free memchunk structures stored in FCRAM
using DMA, which leads to the ability to allocate memory chunks over
already-allocated memory. This can be used in the SYSTEM region to
allocate RW memory over any part of the NS system module, which is
enough to take it over.</p></td>
<td><p>Code execution with access to all of NS's privileges. (including
downgrading) Code execution within any applet.</p></td>
<td><p><a href="../11.0.0-33" title="wikilink">11.0.0-X</a>, via the new <a
href="../Memory_Management#MemoryBlockHeader"
title="wikilink">memchunkhdr</a> MAC which prevents modifying
memchunkhdr data with DMA.</p></td>
<td><p><a href="../11.0.0-33" title="wikilink">11.0.0-X</a></p></td>
<td><p>April 2015 ?</p></td>
<td><p>smea</p></td>
</tr>
<tr class="odd">
<td><p>snshax</p></td>
<td><p>Can force creation of Safe NS process into gspwn-able memory,
allowing for takeover.</p></td>
<td><p>Code execution with access to all of NS's privileges. (including
downgrading)</p></td>
<td><p><a href="../10.1.0-27" title="wikilink">10.1.0-X</a></p></td>
<td><p><a href="../10.1.0-27" title="wikilink">10.1.0-X</a></p></td>
<td><p>April 2015 ?</p></td>
<td><p>smea</p></td>
</tr>
<tr class="even">
<td><p>AffinityMask/processorid validation</p></td>
<td><p>With <a href="../10.0.0-27" title="wikilink">10.0.0-X</a> the
following functions were updated: svcGetThreadAffinityMask,
svcGetProcessAffinityMask, svcSetProcessAffinityMask, and
svcCreateThread. The code changes for all but svcCreateThread are
identical. The original code with the first 3 did the following:</p>
<ul>
<li>if(u32_processorcount &gt; ~0x80000001)return 0xe0e01bfd;</li>
<li>if(s32_processorcount &gt; <total_cores>)return 0xd8e007fd;</li>
</ul>
<p>The following code replaced the above:</p>
<ul>
<li>if(u32_processorcount &gt;= &lt;total_cores+1&gt;)return
0xd8e007fd;</li>
</ul>
<p>In theory the latter should catch everything that the former did, so
it's unknown if this was really a security issue.</p>
<p>The svcCreateThread changes with <a href="../10.0.0-27"
title="wikilink">10.0.0-X</a> definitely did fix a security issue.</p>
<ul>
<li>Original code: "if(s32_processorid &gt; <total_cores>)return
0xd8e007fd;"</li>
</ul>
<p>* New code: "if(s32_processorid &gt;= <total_cores></p></td>
<td><p>s32_processorid &lt;= -4)return 0xd8e007fd;" This fixed an
off-by-one issue: if one would use processorid=total_cores, which isn't
actually a valid value, svcCreateThread would accept that value on
&lt;<a href="../10.0.0-27" title="wikilink">10.0.0-X</a>. This results in
data being written out-of-bounds(baseaddr = arrayaddr +
entrysize*processorid), which has the following result:</p>
<ul>
<li>Old3DS: Useless kernel-mode crash due to accessing unmapped
memory.</li>
<li>New3DS: uncontrolled data write into a kernel-mode L1 MMU-table.
This isn't really useful: the data can't be controlled, and the data
which gets overwritten is all-zero anyway(this isn't anywhere near MMU
L1 entries for actually mapped memory).</li>
</ul>
<p>The previous version also allowed large negative s32_processorid
values(negative processorid values are special values not actual
procids), but it appears using values like that won't actually do
anything(meaning no crash) besides the thread not running / thread not
running for a while(besides triggering a kernelpanic with certain
s32_processorid value(s)).</p></td>
<td><p>Nothing useful</p></td>
<td><p><a href="../10.0.0-27" title="wikilink">10.0.0-X</a></p></td>
<td><p><a href="../10.0.0-27" title="wikilink">10.0.0-X</a></p></td>
<td><p>svcCreateThread issue: May 31, 2015. The rest: September 8, 2015,
via v9.6-&gt;v10.0 ARM11-kernel code-diff.</p></td>
</tr>
<tr class="odd">
<td><p>memchunkhax</p></td>
<td><p>The kernel originally did not validate the data stored in the
FCRAM kernel heap <a href="../Memchunkhdr"
title="wikilink">memchunk-headers</a> for free-memory at all. Exploiting
this requires raw R/W access to these memchunk-headers, like
physical-memory access with gspwn.</p>
<p>There are <em>multiple</em> ways to exploit this, but the end-result
for most of these is the same: overwrite code in AXIWRAM via the
0xEFF00000/0xDFF00000 kernel virtual-memory mapping.</p>
<p>This was fixed in <a href="../9.3.0-21" title="wikilink">9.3.0-X</a> by
checking that the memchunk(including size, next, and prev ptrs) is
located within the currently used heap memory. The kernel may also check
that the next/prev ptrs are valid compared to other memchunk-headers
basically. When any of these checks fail, kernelpanic() is
called.</p></td>
<td><p>When combined with other flaws: ARM11-kernelmode code
execution</p></td>
<td><p><a href="../9.3.0-21" title="wikilink">9.3.0-21</a></p></td>
<td></td>
<td><p>February 2014</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p>Multiple <a href="../KLinkedListNode"
title="wikilink">KLinkedListNode</a> SlabHeap use after free
bugs</p></td>
<td><p>The ARM11-kernel did access the 'key' field of <a
href="../KLinkedListNode" title="wikilink">KLinkedListNode</a> objects,
which are located on the SlabHeap, after freeing them. Thus, triggering
an allocation of a new <a href="../KLinkedListNode"
title="wikilink">KLinkedListNode</a> object at the right time could
result in a type-confusion. Pseudo-code: SlabHeap_free(KLinkedListNode);
KObject *obj = KLinkedListNode-&gt;key; // the object there might have
changed! This bug appeared all over the place.</p></td>
<td><p>ARM11-kernelmode code exec maybe</p></td>
<td><p><a href="../8.0.0-18" title="wikilink">8.0.0-18</a></p></td>
<td></td>
<td><p>April 2015</p></td>
<td><p><a href="../User:Derrek" title="wikilink">derrek</a></p></td>
</tr>
<tr class="odd">
<td><p>PXI <a href="../RPC_Command_Structure" title="wikilink">Command</a>
input/output buffer permissions</p></td>
<td><p>Originally the ARM11-kernel didn't check permissions for PXI
input/output buffers for commands. Starting with <a href="../6.0.0-11"
title="wikilink">6.0.0</a> PXI input/output buffers must have RW
permissions, otherwise kernelpanic is triggered.</p></td>
<td></td>
<td><p><a href="../6.0.0-11" title="wikilink">6.0.0-11</a></p></td>
<td></td>
<td><p>2012</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p><a href="../SVC"
title="wikilink">svcStartInterProcessDma</a></p></td>
<td><p>For svcStartInterProcessDma, the kernel code had the following
flaws:</p>
<ul>
<li>Originally the ARM11-kernel read the input DmaConfig structure
directly in kernel-mode(ldr(b/h) instructions), without checking whether
the DmaConfig address is readable under userland. This was fixed by
copying that structure to the SVC-mode stack, using the ldrbt
instruction.</li>
</ul>
<ul>
<li>Integer overflows for srcaddr+size and dstaddr+size are now
checked(with <a href="../6.0.0-11" title="wikilink">6.0.0-11</a>), which
were not checked before.</li>
</ul>
<ul>
<li>The kernel now also checks whether the srcaddr/dstaddr (+size) is
within userland memory (0x20000000), the kernel now (with <a
href="../6.0.0-11" title="wikilink">6.0.0-11</a>) returns an error when the
address is beyond userland memory. Using an address &gt;=0x20000000
would result in the kernel reading from the process L1 MMU table, beyond
the memory allocated for that MMU table(for vaddr-&gt;physaddr
conversion).</li>
</ul></td>
<td></td>
<td><p><a href="../6.0.0-11" title="wikilink">6.0.0-11</a></p></td>
<td></td>
<td><p>DmaConfig issue: unknown. The rest: 2014</p></td>
<td><p><a href="../User:Plutooo" title="wikilink">plutoo</a>, <a
href="../User:Yellows8" title="wikilink">Yellows8</a>
independently</p></td>
</tr>
<tr class="odd">
<td><p><a href="../SVC" title="wikilink">svcControlMemory</a> Parameter
checks</p></td>
<td><p>For svcControlMemory the parameter check had these two flaws:</p>
<ul>
<li>The allowed range for addr0, addr1, size parameters depends on which
MemoryOperation is being specified. The limitation for GSP heap was only
checked if op=(u32)0x10003. By setting a random bit in op that has no
meaning (like bit17?), op would instead be (u32)0x30003, and the
range-check would be less strict and not accurate. However, the kernel
doesn't actually use the input address for LINEAR memory-mapping at all
besides the range-checks, so this isn't actually useful. This was fixed
in the kernel by just checking for the LINEAR bit, instead of comparing
the entire MemoryOperation value with 0x10003.</li>
</ul>
<ul>
<li>Integer overflows on (addr0+size) are now checked that previously
weren't (this also applies to most other address checks elsewhere in the
kernel).</li>
</ul></td>
<td></td>
<td><p><a href="../5.0.0-11" title="wikilink">5.0.0-11</a></p></td>
<td></td>
<td></td>
<td><p><a href="../User:Plutooo" title="wikilink">plutoo</a></p></td>
</tr>
<tr class="even">
<td><p><a href="../RPC_Command_Structure" title="wikilink">Command</a>
request/response buffer overflow</p></td>
<td><p>Originally the kernel did not check the word-values from the
command-header. Starting with <a href="../5.0.0-11"
title="wikilink">5.0.0-11</a>, the kernel will trigger a kernelpanic()
when the total word-size of the entire command(including the cmd-header)
is larger than 0x40-words (0x100-bytes). This allows overwriting
threadlocalstorage+0x180 in the destination thread. However, since the
data written there would be translate parameters (such as header-words +
buffer addresses), exploiting this would likely be very difficult, if
possible at all.</p>
<p>If the two words at threadlocalstorage+0x180 could be overwritten
with controlled data this way, one could then use a command with a
buffer-header of ((size&lt;&lt;14) | 2) to write arbitrary memory to any
RW userland memory in the destination process.</p></td>
<td></td>
<td><p><a href="../5.0.0-11" title="wikilink">5.0.0-11</a></p></td>
<td></td>
<td><p>v4.1 FIRM -&gt; v5.0 code diff</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="../SVC" title="wikilink">SVC stack allocation
overflows</a></p></td>
<td><ul>
<li>Syscalls that allocate a variable-length array on stack, only
checked bit31 before multiplying by 4/16 (when calculating how much
memory to allocate). If a large integer was passed as input to one of
these syscalls, an integer overflow would occur, and too little memory
would have been allocated on stack resulting in a buffer overrun.</li>
<li>The alignment (size+7)&amp;~7 calculation before allocation was not
checked for integer overflow.</li>
</ul>
<p>This might allow for ARM11 kernel code-execution.</p>
<p>(Applies to svcSetResourceLimitValues, svcGetThreadList,
svcGetProcessList, svcReplyAndReceive,
svcWaitSynchronizationN.)</p></td>
<td></td>
<td><p><a href="../5.0.0-11" title="wikilink">5.0.0-11</a></p></td>
<td></td>
<td><p>v4.1 FIRM -&gt; v5.0 code diff</p></td>
<td><p><a href="../User:Plutooo" title="wikilink">plutoo</a>, <a
href="../User:Yellows8" title="wikilink">Yellows8</a>
complementary</p></td>
</tr>
<tr class="even">
<td><p><a href="../SVC" title="wikilink">svcControlMemory</a>
MemoryOperation MAP memory-permissions</p></td>
<td><p>svcControlMemory with MemoryOperation=MAP allows mapping the
already-mapped process virtual-mem at addr1, to addr0. The lowest
address permitted for addr1 is 0x00100000. Originally the ARM11 kernel
didn't check memory permissions for addr1. Therefore .text as addr1
could be mapped elsewhere as RW- memory, which allowed ARM11 userland
code-execution.</p></td>
<td></td>
<td><p><a href="../4.1.0-8" title="wikilink">4.1.0-8</a></p></td>
<td></td>
<td><p>2012</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="../RPC_Command_Structure" title="wikilink">Command</a>
input/output buffer permissions</p></td>
<td><p>Originally the ARM11 kernel didn't check memory permissions for
the input/output buffers for commands. Starting with <a href="../4.0.0-7"
title="wikilink">4.0.0-7</a> the ARM11 kernel will trigger a
kernelpanic() if the input/output buffers don't have the required memory
permissions. For example, this allowed a FSUSER file-read to .text,
which therefore allowed ARM11-userland code execution.</p></td>
<td></td>
<td><p><a href="../4.0.0-7" title="wikilink">4.0.0-7</a></p></td>
<td></td>
<td><p>2012</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p><a href="../SVC"
title="wikilink">svcReadProcessMemory/svcWriteProcessMemory memory</a>
permissions</p></td>
<td><p>Originally the kernel only checked the first page(0x1000-bytes)
of the src/dst buffers, for svcReadProcessMemory and
svcWriteProcessMemory. There is no known retail processes which have
access to these SVCs.</p></td>
<td></td>
<td><p><a href="../4.0.0-7" title="wikilink">4.0.0-7</a></p></td>
<td></td>
<td><p>2012?</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
</tbody>
</table>

### [FIRM](FIRM "wikilink") Sysmodules

<table>
<thead>
<tr class="header">
<th><p>Summary</p></th>
<th><p>Description</p></th>
<th><p>Successful exploitation result</p></th>
<th><p>Fixed in <a href="../FIRM" title="wikilink">FIRM</a> system
version</p></th>
<th><p>Last <a href="../FIRM" title="wikilink">FIRM</a> system version this
flaw was checked for</p></th>
<th><p>Timeframe this was discovered</p></th>
<th><p>Discovered by</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><a href="../Services" title="wikilink">"srv:pm"</a> process
registration</p></td>
<td><p>Originally any process had access to the port "srv:pm". The PID's
used for the (un)registration commands are not checked either. This
allowed any process to re-register itself with "srv:pm", and therefore
allowed the process to give itself access to any service, bypassing the
exheader service-access-control list.</p>
<p>This was fixed in <a href="../7.0.0-13" title="wikilink">7.0.0-13</a>:
starting with <a href="../7.0.0-13" title="wikilink">7.0.0-13</a> "srv:pm"
is now a service instead of a globally accessible port. Only processes
with PID's less than 6 (in other words: fs, ldr, sm, pm, pxi modules)
have access to it. With <a href="../7.0.0-13" title="wikilink">7.0.0-13</a>
there can only be one session for "srv:pm" open at a time(this is used
by pm module), svcBreak will be executed if more sessions are opened by
the processes which can access this.</p>
<p>This flaw was needed for exploiting the &lt;=v4.x Process9 PXI
vulnerabilities from ARM11 userland ROP, since most applications don't
have access to those service(s).</p></td>
<td><p>Access to arbitrary services</p></td>
<td><p><a href="../7.0.0-13" title="wikilink">7.0.0-13</a></p></td>
<td></td>
<td><p>2012</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p>FSDIR null-deref</p></td>
<td><p><a href="../Filesystem_services" title="wikilink">FS</a>-module may
crash in some cases when handling directory reading. The trigger seems
to be due to using <a href="../FSDir:Close"
title="wikilink">FSDir:Close</a> without closing the dir-handle
afterwards?(Perhaps this is caused by out-of-memory?) This seems to be
useless since it's just a null-deref.</p></td>
<td></td>
<td><p>None</p></td>
<td><p><a href="../9.6.0-24" title="wikilink">9.6.0-X</a></p></td>
<td><p>May 19(?)-20, 2015</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p>Useless <a href="../SM" title="wikilink">SM</a> off-by-one
write</p></td>
<td><p>After accepting a new session, <a href="../SM"
title="wikilink">SM</a> writes a (handler ID (0 for srv: sessions (max.
64), 1 for the srv:pm one), pointer to session context structure in BSS)
pair in a global array. However that array is only 64-entry-big instead
of 65 (as it ought to be), and no bound check is done in that
regard.</p>
<p>Unfortunately, as of <a href="../11.4.0-37"
title="wikilink">11.4.0-37</a>, the overwritten fields are totally
unused after their initialization by
<code>__libc_init_array</code>.</p></td>
<td><p>Not currently exploitable</p></td>
<td><p>None</p></td>
<td><p><a href="../11.4.0-37" title="wikilink">11.4.0-37</a></p></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td><p>smpwn</p></td>
<td><p>When registering a new service (or "port"), no bound checks are
done on the service table. One can simply call RegisterPort repeatedly
to overflow that table: it will overflow into the command replay
structure.</p>
<p>Combined with a other minor bugs in the sysmodule, it is possible to
take over <a href="../SM" title="wikilink">SM</a> with this nevertheless
difficult-to-exploit vulnerability.</p></td>
<td><p>Code execution under <a href="../SM" title="wikilink">SM</a>,
etc.</p></td>
<td><p><a href="../11.16.0-48" title="wikilink">11.16.0-48</a></p></td>
<td><p><a href="../11.14.0-46" title="wikilink">11.14.0-46</a></p></td>
<td><p>July 2017</p></td>
<td><p><a href="../User:TuxSH" title="wikilink">TuxSH</a> (independently),
presumably ichfly before</p></td>
</tr>
<tr class="odd">
<td><p>PXI cmdbuf buffer overrun</p></td>
<td><p>Like its Arm9 counterpart, before version <a href="../5.0.0-11"
title="wikilink">5.0.0-X</a>, the PXI system module did not check the
command sizes. This makes it possible to get ROP under the PXI sysmodule
from a pwned Process9. safecerthax uses it to takeover the Arm11
processor after directly getting remote code execution on the Arm9 side.
Though, is useless in classic Arm11 -&gt; Arm9 chains.</p></td>
<td><p>ROP under <a href="../PXI_Services"
title="wikilink">PXI</a></p></td>
<td><p>probably <a href="../5.0.0-11" title="wikilink">5.0.0-X</a></p></td>
<td><p><a href="../11.14.0-46" title="wikilink">11.14.0-46</a></p></td>
<td></td>
<td><p>Everyone</p></td>
</tr>
</tbody>
</table>

### Standalone Sysmodules

<table>
<thead>
<tr class="header">
<th><p>Summary</p></th>
<th><p>Description</p></th>
<th><p>Successful exploitation result</p></th>
<th><p>Fixed in system-module system-version</p></th>
<th><p>Last system-module system-version this flaw was checked
for</p></th>
<th><p>Timeframe this was discovered</p></th>
<th><p>Timeframe this was added to wiki</p></th>
<th><p>Discovered by</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><a href="../CSND_Services" title="wikilink">CSND</a> sysmodule crash
due to out of bounds parameters.</p></td>
<td><p>The CSND command <a href="../CSND:PlaySoundDirectly"
title="wikilink">PlaySoundDirectly (0x00040080)</a> takes a channel ID
as the first parameter. Any value outside the range [0-3] makes the
system module become unstable or crash due to an out of bounds memory
read.</p></td>
<td><p>Out of bounds memory read, probably not exploitable. More
research needed.</p></td>
<td><p>None</p></td>
<td><p><a href="../11.14.0-46" title="wikilink">11.14.0-46</a></p></td>
<td><p>January 2021</p></td>
<td><p>January 22, 2021</p></td>
<td><p><a href="../User:PabloMK7" title="wikilink">PabloMK7</a></p></td>
</tr>
<tr class="even">
<td><p>SSLoth: <a href="../SSL_Services" title="wikilink">SSL</a> sysmodule
improper certificate verification</p></td>
<td><p>Initially, the SSL sysmodule missed the R_VERIFY_RES_SIGNATURE
entry in the "resource list" provided to the RSA BSAFE library.
Consequently, it did not check signatures when validating certificate
chains.</p></td>
<td><p>Forge fake certificates, spoof official servers and perform MitM
attacks on SSL/TLS connections.</p></td>
<td><p><a href="../11.14.0-46" title="wikilink">11.14.0-46</a></p></td>
<td><p><a href="../11.14.0-46" title="wikilink">11.14.0-46</a></p></td>
<td><p>2020</p></td>
<td><p>December 18, 2020</p></td>
<td><p><a href="../User:Nba_Yoh" title="wikilink">MrNbaYoh</a>,
shutterbug2000 (independently)</p></td>
</tr>
<tr class="odd">
<td><p><a href="../CECD_Services" title="wikilink">CECD:ndm</a>
SetNZoneMacFilter (cmd8) stack smashing</p></td>
<td><p>The length of the mac filter is not checked before being copied
to a fixed-size buffer on stack.</p></td>
<td><p>ROP under <a href="../CECD_Services" title="wikilink">CECD</a>
sysmodule</p></td>
<td><p>None</p></td>
<td><p><a href="../11.13.0-45" title="wikilink">11.13.0-45</a></p></td>
<td><p>2020</p></td>
<td><p>July 20, 2020</p></td>
<td><p><a href="../User:Nba_Yoh" title="wikilink">MrNbaYoh</a></p></td>
</tr>
<tr class="even">
<td><p><a href="../CECD_Services" title="wikilink">CECD</a> message box
access</p></td>
<td><p>CECD allows any process to write to any message box, thus
allowing to write Streetpass data to the message box of any
title.</p></td>
<td><p>Install exploit for any title having a vulnerability in
Streetpass data parsers (see CTRSDK Streetpass parser
vulnerability).</p></td>
<td><p>None</p></td>
<td><p>None</p></td>
<td><p>?</p></td>
<td><p>June 1, 2020</p></td>
<td><p>Everyone?</p></td>
</tr>
<tr class="odd">
<td><p><a href="../CECD_Services" title="wikilink">CECD</a> packet type
0x32/0x34 stack-smashing</p></td>
<td><p>When parsing Streetpass packets of type 0x32 and 0x34, CECD
copies a list without checking the number of entries. The packet length
is limited to 0x400 bytes, which is not enough to reach the end of the
stack frame and overwrite the return address. However, the buffer
located just next to the packet buffer is actually filled with data sent
just before, hence actually allowing to overwrite the whole stack frame
with conrolled data.</p></td>
<td><p>RCE under <a href="../CECD_Services"
title="wikilink">CECD</a></p></td>
<td><p><a href="../11.12.0-44" title="wikilink">11.12.0-44</a></p></td>
<td><p><a href="../11.12.0-44" title="wikilink">11.12.0-44</a></p></td>
<td><p>Summer 2019</p></td>
<td><p>June 1, 2020</p></td>
<td><p><a href="../User:Nba_Yoh" title="wikilink">MrNbaYoh</a></p></td>
</tr>
<tr class="even">
<td><p><a href="../CECD_Services" title="wikilink">CECD</a> TMP files
parser multiple vulnerabilities</p></td>
<td><p>When parsing "TMP_XXX" files, CECD does not check the number of
messages contained in the file. This allows to overflow the array of
message pointers and message sizes on the stack. Pointers aren't
controlled and sizes are limited (one cannot send gigabytes of data...),
yet the last message size can be an arbitrary value (the current message
pointer goes outside the file buffer and the parsing loop is broken).
This allows to overwrite a pointer to a lock object on the stack and
decrement an arbitrary value in memory. One can change the TMP file
parsing mode to have CECD trying to free all the message buffers after
parsing the next TMP file. The parsing mode is usually restored when
parsing a new TMP file, but an invalid TMP file allows to make a
function returns an error before the mode is restored , the return value
is not checked and the parser consider the file valid. The message
pointers and sizes arrays are not updated though, this is not a problem
since the previous TMP file buffer is reused for the new TMP file in
memory. Thus the message pointers actually points to controlled data.
This allows to get a bunch of fake heap chunk freed, thus a bunch of
unsafe unlink arbitrary writes.</p></td>
<td><p>RCE under <a href="../CECD_Services"
title="wikilink">CECD</a></p></td>
<td><p><a href="../11.12.0-44" title="wikilink">11.12.0-44</a></p></td>
<td><p><a href="../11.12.0-44" title="wikilink">11.12.0-44</a></p></td>
<td><p>Summer 2019</p></td>
<td><p>June 1, 2020</p></td>
<td><p><a href="../User:Nba_Yoh" title="wikilink">MrNbaYoh</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="../Config_Services"
title="wikilink">CFG</a>:CreateConfigInfoBlk integer underflow</p></td>
<td><p>When creating a new block it checks the size of the block is
&lt;= 0x8000, but it doesn't check that the block size is less than the
remaining space. This induces an integer underflow
(remaining_space-block_size), the result is then used for another check
(buf_start+current_offset+constant &lt;= remaining_space-block_size) and
then in a mempcy call (dest =
buf_start+(u16)(remaining_space-block_size), size =block_size). This
allow for writing past the buffer, however because of the u16 cast in
the memcpy call memory has to be mapped from buf_start to
buf_start+0x10000 (cannot write backward).</p></td>
<td><p>Theoritically ROP under CFG services, but BSS section is to small
(size &lt;= 0x10000) so it only results in a crash.</p></td>
<td><p>None</p></td>
<td><p><a href="../11.8.0-41" title="wikilink">11.8.0-41</a></p></td>
<td><p>November, 2018</p></td>
<td><p>November 24, 2018</p></td>
<td><p><a href="../User:Nba_Yoh" title="wikilink">MrNbaYoh</a></p></td>
</tr>
<tr class="even">
<td><p><a href="../MP:SendDataFrame" title="wikilink">MP:SendDataFrame</a>
missing input array index validation</p></td>
<td><p><a href="../MP:SendDataFrame" title="wikilink">MP:SendDataFrame</a>
doesn't validate the input index at cmdreq[1], unless the function for
flag=non-zero is executed. This is used to calculate the following,
without validating the index at all: someptr = stateptr + (index*0x924)
+ somestateoffset.</p>
<p>After validating some flags from someptr, when input_flag=0 the input
buffer data is copied to someptr+someotheroffset+0x14 with the u16 size
loaded from someptr+someotheroffset.</p>
<p>With a large input index someptr could be setup to be at a
<target address>, for overwriting memory.</p>
<p>This is probably difficult to exploit.</p></td>
<td></td>
<td><p>None</p></td>
<td><p><a href="../8.0.0-18" title="wikilink">8.0.0-18</a>(MP-sysmodule
v2048)</p></td>
<td><p>January 22, 2017</p></td>
<td><p>January 22, 2017</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="../MP_Services" title="wikilink">MP</a> cmd1 out-of-bounds
handle read</p></td>
<td><p>MP-sysmodule handles the input parameter for cmd1 as a s32. It
checks for &gt;=16, but not &lt;0. With &lt;16 it basically does the
following(array of entries 4-bytes each): *outhandle =
((Handle*)(stateptr+offsetinstate))[inputindex].</p>
<p>Hence, this can be used to load any handle in MP-sysmodule memory. MP
doesn't really have any service handles of interest however(can be
obtained from elsewhere too).</p></td>
<td><p>Reading any handle in MP-sysmodule memory.</p></td>
<td><p>None</p></td>
<td><p><a href="../8.0.0-18" title="wikilink">8.0.0-18</a>(MP-sysmodule
v2048)</p></td>
<td><p>January 21, 2017</p></td>
<td><p>January 22, 2017</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p>AM stack/.bss infoleak via <a href="../AM:ReadTwlBackupInfo"
title="wikilink">AM:ReadTwlBackupInfo</a>(<a
href="../AM:ReadTwlBackupInfoEx" title="wikilink">Ex</a>)</p></td>
<td><p>After writing the output-info structure to stack, it then copies
that structure to the output buffer ptr using the size from the command.
The size is not checked. This could be used to read data from the
AM-service-thread stack handling the command + .bss.</p>
<p><strong>This was not tested on hardware.</strong></p></td>
<td><p>Stack/.bss reading</p></td>
<td><p>None</p></td>
<td><p><a href="../10.0.0-27" title="wikilink">10.0.0-27</a>(AM
v9217)</p></td>
<td><p>Roughly October 17, 2016</p></td>
<td><p>October 25, 2016</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p>AM module APcert infoleak via 00000000.ctx files</p></td>
<td><p>Just after a download title is purchased from the eShop, the .ctx
is in an initialized state of all FFs past the header. During download,
the FF area is filled with the console APcert. Thus, it is possible to
create a xorpad from the initial state and use it to decrypt the APcert
filled state.</p></td>
<td><p>APcert contains the deviceID, which can beneficial in decrypting
the movable.sed (since deviceID is mathmatically related to the
LFCS).</p></td>
<td><p>None</p></td>
<td><p><a href="../11.16.0-49" title="wikilink">11.16.0-49</a></p></td>
<td><p>August, 2022</p></td>
<td><p>March 17, 2023</p></td>
<td><p>zoogie</p></td>
</tr>
<tr class="even">
<td><p><a href="../MVD_Services" title="wikilink">MVD</a>: Stack buffer
overflow with <a href="../MVDSTD:SetupOutputBuffers"
title="wikilink">MVDSTD:SetupOutputBuffers</a>.</p></td>
<td><p>The input total_entries is not validated when initially
processing the input entry-list. This fixed-size input entry-list is
copied to stack from the command request. The loop for processing this
initializes a global table, the converted linearmem-&gt;physaddrs used
there are also copied to stack(0x8-bytes of physaddrs per entry).</p>
<p>If total_entries is too large, MVD-sysmodule will crash due to
reading unmapped memory following the stack(0x10000000). Afterwards if
the out-of-bounds total_entries is smaller than that, it will crash due
accessing address 0x0, hence this useless.</p></td>
<td><p>MVD-sysmodule crash.</p></td>
<td><p>None</p></td>
<td><p><a href="../9.0.0-20" title="wikilink">9.0.0-20</a></p></td>
<td><p>April 22, 2016 (Tested on the 25th)</p></td>
<td><p>April 25, 2016</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="../NWM_Services" title="wikilink">NWM</a>: Using CTRSDK
heap with UDS sharedmem from the user-process.</p></td>
<td><p>See the HTTP-sysmodule section below.</p>
<p>CTRSDK heap is used with the sharedmem from <a
href="../NWMUDS:InitializeWithVersion"
title="wikilink">NWMUDS:InitializeWithVersion</a>. Buffers are
allocated/freed under this heap using <a href="../NWMUDS:Bind"
title="wikilink">NWMUDS:Bind</a> and <a href="../NWMUDS:Unbind"
title="wikilink">NWMUDS:Unbind</a>.</p>
<p>Hence, overwriting sharedmem with gspwn then using <a
href="../NWMUDS:Unbind" title="wikilink">NWMUDS:Unbind</a> results in the
usual controlled CTRSDK memchunk-header write, similar to
HTTP-sysmodule.</p>
<p>This could be done by creating an UDS network, without any other
nodes on the network.</p>
<p>Besides CTRSDK memchunk-headers, there are no addresses stored under
this sharedmem.</p></td>
<td><p>ROP under NWM-module.</p></td>
<td><p>None (need to check, but CTRSDK heap code is vulnerable)</p></td>
<td><p><a href="../9.0.0-20" title="wikilink">9.0.0-X</a></p></td>
<td><p>April 10, 2016</p></td>
<td><p>April 16, 2016</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p><a href="../DLP_Services" title="wikilink">DLP</a>: Out-of-bounds
memory access during spectator <a href="../Download_Play"
title="wikilink">data-frame</a> checksum calculation</p></td>
<td><p>DLP doesn't validate the frame_size when receiving spectator
data-frames at all, unlike non-spectator data-frames. The actual
spectator data-frame parsing code doesn't use that field either.
However, the data-frame checksum calculation code called during checksum
verification does use the frame_size for loading the size of the
framebuf.</p>
<p>Hence, using a large frame_size like 0xFFFF will result in the
checksum calculation code reading data out-of-bounds. This isn't really
useful, you could trigger a remote local-WLAN DLP-sysmodule crash while
a 3DS system is scanning for DLP networks(due to accessing unmapped
memory), but that's about all(trying to infoleak with this likely isn't
useful either).</p></td>
<td><p>DLP-sysmodule crash, handled by dlplay system-application by a
"connection interrupted" error eventually then a fatal-error via
ErrDisp.</p></td>
<td><p>None</p></td>
<td><p><a href="../10.0.0-27" title="wikilink">10.0.0-X</a></p></td>
<td><p>April 8, 2016 (Tested on the 10th)</p></td>
<td><p>April 10, 2016</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="../DLP_Services" title="wikilink">DLP</a>: Out-of-bounds
output data writing during spectator sysupdate titlelist <a
href="../Download_Play" title="wikilink">data-frame</a> handling</p></td>
<td><p>The total_entries and out_entryindex fields for the titlelist DLP
spectator data-frames are not validated. This is parsed during DLP
network scanning. Hence, the specified titlelist data can be written
out-of-bounds using the specified out_entryindex and total_entries. A
crash will occur while reading the input data-frame titlelist if
total_entries is larger than 0x27A, due to accessing unmapped
memory.</p>
<p>There's not much non-zero data to overwrite following the output
buffer(located in sharedmem), any ptrs are located in sharedmem.
Overwriting certain ptr(s) are only known to cause a crash when
attempting to use the DLP-client shutdown service-command.</p>
<p>There's no known way to exploit the above crash, since the
linked-list code involves writes zeros(with a controlled start
ptr).</p></td>
<td></td>
<td><p>None</p></td>
<td><p><a href="../10.0.0-27" title="wikilink">10.0.0-X</a></p></td>
<td><p>April 8-9, 2016</p></td>
<td><p>April 10, 2016</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p><a href="../IR_Services" title="wikilink">IR</a>: Stack buffer
overflow with custom hardware</p></td>
<td><p>Originally IR sysmodule used the read value from the I2C-IR
registers TXLVL and RXLVL without validating them at all. See <a
href="../10.6.0-31" title="wikilink">here</a> for the fix. This is the size
used for reading the data-recv FIFO, etc. The output buffer for reading
is located on the stack.</p>
<p>This should be exploitable if one could successfully setup the custom
hardware for this and if the entire intended sizes actually get read
from I2C.</p></td>
<td><p>ROP under IR sysmodule.</p></td>
<td><p><a href="../10.6.0-31" title="wikilink">10.6.0-31</a></p></td>
<td></td>
<td><p>February 23, 2016 (Unknown if it was noticed before
then)</p></td>
<td><p>February 23, 2016</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="../HTTP_Services" title="wikilink">HTTP</a>: Using CTRSDK
heap with sharedmem from the user-process.</p></td>
<td><p>The data from httpcAddPostDataAscii and other commands is stored
under a CTRSDK heap. That heap is the sharedmem specified by the
user-process via the HTTPC Initialize command. Normally this sharedmem
isn't accessible to the user-process once the sysmodule maps it, hence
using it is supposed to be "safe".</p>
<p>This isn't the case due to gspwn however. Since CTRSDK heap code is
so insecure in general, one can use gspwn to locate the HTTPC sharedmem
+ read/write it, then trigger a mem-write under the sysmodule. This can
then be used to get ROP going under HTTP-sysmodule.</p>
<p>This is exploited by <a
href="https://github.com/yellows8/ctr-httpwn/ctr-httpwn">ctr-httpwn</a>.</p></td>
<td><p>ROP under HTTP sysmdule.</p></td>
<td><p>None</p></td>
<td><p><a href="../11.13.0-45" title="wikilink">11.13.0-X</a></p></td>
<td><p>Late 2015</p></td>
<td><p>March 22, 2016</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p><a href="../NIM_Services" title="wikilink">NIM</a>: Downloading old
title-versions from eShop</p></td>
<td><p>Multiple NIM service commands(such as <a
href="../NIMS:StartDownload" title="wikilink">NIMS:StartDownload</a>) use a
title-version value specified by the user-process, NIM does not validate
that this input version matches the latest version available via SOAP.
Therefore, when combined with AM(PXI) <a href="../#Process9"
title="wikilink">title-downgrading</a> via deleting the target eShop
title with System Settings Data Management(if the title was already
installed), this allows downloading+installing any title-version from
eShop <em>if</em> it's still available from CDN. The easiest way to
exploit this is to just patch the eShop system-application code using
these NIM commands(ideally the code which loads the title-version).</p>
<p>Originally this was tested with a debugging-system via modded-FIRM,
eventually smea implemented it in HANS for the 32c3 release.</p></td>
<td><p>Downloading old title-versions from eShop</p></td>
<td><p>None</p></td>
<td><p><a href="../10.0.0-27" title="wikilink">10.0.0-X</a></p></td>
<td><p>October 24, 2015 (Unknown when exactly the first eShop title
downgrade was actually tested, maybe November)</p></td>
<td><p>January 7, 2016 (Same day Ironfall v1.0 was removed from CDN via
the main-CXI files)</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="../SPI_Services" title="wikilink">SPI</a> service
out-of-bounds write</p></td>
<td><p>cmd1 has out-of-bounds write allowing overwrite of some static
variables in .data.</p></td>
<td><p>Code execution under spi sysmodule; access to <a
href="../CONFIG11_Registers" title="wikilink">CFG11_GPUPROT</a> and
ultimately kernel code execution.</p></td>
<td><p>None</p></td>
<td><p><a href="../11.14.0-46" title="wikilink">11.14.0-46</a></p></td>
<td><p>March 2015</p></td>
<td></td>
<td><p><a href="../User:Plutooo" title="wikilink">plutoo</a></p></td>
</tr>
<tr class="even">
<td><p><a href="../NFC_Services" title="wikilink">NFC</a> module service
command buf-overflows</p></td>
<td><p>NFC module copies data with certain commands, from command input
buffers to stack without checking the size. These commands include the
following, it's unknown if there's more commands with similar issues:
"nfc:dev" &lt;0x000C....&gt; and "nfc:s" &lt;0x0037....&gt;. Since both
of these commands are stubbed in the Old3DS NFC module from the very
first version(those just return an error), these issues only affect the
New3DS NFC module.</p>
<p>There's no known retail titles which have access to either of these
services.</p></td>
<td><p>ROP under NFC module.</p></td>
<td><p>New3DS: None</p></td>
<td><p>New3DS: <a href="../9.5.0-22" title="wikilink">9.5.0-22</a></p></td>
<td><p>December 2014?</p></td>
<td></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="../News_Services" title="wikilink">NEWSS</a> service
command notificationID validation failure</p></td>
<td><p>This module does not validate the input notificationID for
"news:s" service commands. This is an out-of-bounds array index bug. For
example, <a href="../NEWSS:SetNotificationHeader"
title="wikilink">NEWSS:SetNotificationHeader</a> could be used to
exploit news module: this copies the input data(size is properly
checked) to: out = newsdb_savedata+0x10 +
(someu32array[notificationID]*0x70).</p></td>
<td><p>ROP under news module.</p></td>
<td><p>None</p></td>
<td><p><a href="../9.7.0-25" title="wikilink">9.7.0-X</a></p></td>
<td><p>December 2014</p></td>
<td></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p><a href="../NWMUDS:DecryptBeaconData"
title="wikilink">NWMUDS:DecryptBeaconData</a> heap buffer
overflow</p></td>
<td><p>input_size = 0x1E * &lt;value the u8 from input_<a
href="../NWM_Services" title="wikilink">networkstruct</a>+0x1D&gt;. Then
input_tag0 is copied to a heap buffer. When input_size is larger than
0xFA-bytes, it will then copy input_tag1 to
<end_address_of_previous_outbuf>, with size=input_size-0xFA.</p>
<p>This can be triggered by either using this command directly, or by
boadcasting a wifi beacon which triggers it while a 3DS system running
the target process is in range, when the process is scanning for hosts
to connect to. Processes will only pass tag data to this command when
the wlancommID and other thing(s) match the values for the process.</p>
<p>There's no known way to actually exploit this for getting ROP under
NWM-module, at the time of originally adding this to the wiki. This is
because the data which gets copied out-of-bounds *and* actually causes
crash(es), can't be controlled it seems(with just broadcasting a beacon
at least). It's unknown whether this could be exploited from just using
NWMUDS service-cmd(s) directly.</p></td>
<td><p>Without any actual way to exploit this: NWM-module DoS, resulting
in process termination(process crash). This breaks *everything*
involving wifi comms, a reboot is required to recover from
this.</p></td>
<td><p>None</p></td>
<td><p><a href="../9.0.0-20" title="wikilink">9.0.0-20</a></p></td>
<td><p>~September 23, 2014(see the <a href="../NWMUDS:DecryptBeaconData"
title="wikilink">NWMUDS:DecryptBeaconData</a> page history)</p></td>
<td><p>August 3, 2015</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="../HID_Services" title="wikilink">HID</a> module
shared-mem</p></td>
<td><p>HID module does not validate the index values in <a
href="../HID_Shared_Memory" title="wikilink">sharedmem</a>(just changes
index to 0 when index == maxval when updating), therefore large values
will result in HID module writing HID data to arbitrary
addresses.</p></td>
<td><p>ROP under HID module, but this is *very* unlikely to be
exploitable since the data written is HID data.</p></td>
<td><p>None</p></td>
<td><p><a href="../9.3.0-21" title="wikilink">9.3.0-21</a></p></td>
<td><p>2014?</p></td>
<td></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p>gspwn</p></td>
<td><p>GSP module does not validate addresses given to the GPU. This
allows a user-mode application/applet to read/write to a large part of
physical FCRAM using GPU DMA. From this, you can overwrite the .text
segment of the application you're running under, and gain real
code-execution from a ROP-chain. Normally applets' .text(<a
href="../Home_Menu" title="wikilink">Home Menu</a>, <a
href="../Internet_Browser" title="wikilink">Internet Browser</a>, etc) is
located beyond the area accessible by the GPU, except for <a
href="../RO_Services" title="wikilink">CROs</a> used by applets(<a
href="../Internet_Browser" title="wikilink">Internet Browser</a> for
example).</p>
<p>FCRAM is gpu-accessible up to physaddr 0x26800000 on Old3DS, and
0x2D800000 on New3DS. This is BASE_memregion_start(aka
SYSTEM_memregion_end)-0x400000 (0x800000 with New3DS) with the default
memory-layout on Old3DS/New3DS. With <a href="../11.3.0-36"
title="wikilink">11.3.0-X</a> the cutoff now varies due to the new <a
href="../SVC" title="wikilink">SVC</a> 0x59. The New3DS
"normal"(non-APPLICATION) cutoff was changed to 0x2D000000 due to the
new <a href="../SVC" title="wikilink">SVC</a> 0x59.</p></td>
<td><p>User-mode code execution.</p></td>
<td><p>None</p></td>
<td><p><a href="../9.6.0-24" title="wikilink">9.6.0-X</a></p></td>
<td><p>Early 2014</p></td>
<td></td>
<td><p>smea, <a href="../User:Yellows8"
title="wikilink">Yellows8</a>/others before then</p></td>
</tr>
<tr class="odd">
<td><p>rohax</p></td>
<td><p>Using gspwn, it is possible to overwrite a loaded <a href="../CRO0"
title="wikilink">CRO0</a>/<a href="../CRR0" title="wikilink">CRR0</a> after
its RSA-signature has been validated. Badly validated <a href="../CRO0"
title="wikilink">CRO0</a> header leads to arbitrary read/write of memory
in the ro-process. This gives code-execution in the ro module, who has
access to <a href="../SVC" title="wikilink">syscalls</a> 0x70-0x72,
0x7D.</p>
<p>This was fixed after <a href="../ninjhax" title="wikilink">ninjhax</a>
release by adding checks on <a href="../CRO0"
title="wikilink">CRO0</a>-based pointers before writing to
them.</p></td>
<td><p>Memory-mapping syscalls.</p></td>
<td><p><a href="../9.3.0-21" title="wikilink">9.3.0-21</a></p></td>
<td><p><a href="../9.4.0-21" title="wikilink">9.4.0-21</a></p></td>
<td></td>
<td></td>
<td><p>smea, <a href="../User:Plutooo" title="wikilink">plutoo</a> joint
effort</p></td>
</tr>
<tr class="even">
<td><p>Region free</p></td>
<td><p>Only <a href="../Home_Menu" title="wikilink">Home Menu</a> itself
checks gamecards' region when launching them. Therefore, any application
launch that is done directly with <a href="../NS" title="wikilink">NS</a>
without signaling Home Menu to launch the app, will result in region
checks being bypassed. This essentially means launching the gamecard
with the <a href="../NS_and_APT_Services" title="wikilink">"ns:s"</a>
service. The main way to exploit this is to trigger a FIRM launch with
an application specified, either with a normal FIRM launch or a hardware
<a href="../NSS:RebootSystem" title="wikilink">reboot</a>.</p></td>
<td><p>Launching gamecards from any region + bypassing Home Menu
gamecard-sysupdate installation</p></td>
<td><p>None</p></td>
<td><p>Last tested with <a href="../10.1.0-27"
title="wikilink">10.1.0-X</a>.</p></td>
<td><p>June(?) 2014</p></td>
<td></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="../NWM_Services" title="wikilink">NWM</a> service-cmd state
null-ptr deref</p></td>
<td><p>The NWMUDS service command code loads a ptr from .data, adds an
offset to that, then passes that as the state address for the actual
command-handler function. The value of the ptr loaded from .data is not
checked, therefore this will cause crashes due to that being 0x0 when
NWMUDS was not properly initialized. It's unknown whether any NWM
services besides NWMUDS have this issue.</p></td>
<td><p>This is rather useless since it's only a crash caused by a state
ptr based at 0x0.</p></td>
<td><p>None</p></td>
<td><p><a href="../9.0.0-20" title="wikilink">9.0.0-20</a></p></td>
<td><p>2013?</p></td>
<td></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
</tbody>
</table>

### General/CTRSDK

<table>
<thead>
<tr class="header">
<th><p>Summary</p></th>
<th><p>Description</p></th>
<th><p>Successful exploitation result</p></th>
<th><p>Fixed in version</p></th>
<th><p>Last version this flaw was checked for</p></th>
<th><p>Timeframe this was discovered</p></th>
<th><p>Discovered by</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><a href="../CECD_Services" title="wikilink">CECD</a> Streetpass
message exheader stack-smashing</p></td>
<td><p>When parsing streetpass messages, "nn::cec::CTR::<a
href="../Message::InputMessage">Message::InputMessage</a>" calls
"nn::cec::CTR::<a
href="../Message::SetExHeaderWithoutCalc">Message::SetExHeaderWithoutCalc</a>"
for each exheader entry in the input message. The number of entries
should not exceed 16 but remains unchecked, leading to a
stack-buffer-overflow.</p></td>
<td><p>ROP under any application parsing Streetpass messages Remote code
execution under <a href="../CECD_Services"
title="wikilink">CECD</a></p></td>
<td><p><a href="../11.12.0-44" title="wikilink">11.12.0-44</a></p></td>
<td></td>
<td><p>2019</p></td>
<td><p><a href="../User:Nba_Yoh" title="wikilink">MrNbaYoh</a></p></td>
</tr>
<tr class="even">
<td><p><a href="../NWM_Services" title="wikilink">UDS</a> beacon
additional-data buffer overflow</p></td>
<td><p>Originally CTRSDK did not validate the UDS additional-data size
before using that size to copy the additional-data to a <a
href="../NWM_Services" title="wikilink">networkstruct</a>. This was
eventually fixed. This was discovered while doing code RE with an old
dlp-module version. It's unknown in what specific CTRSDK version this
was fixed, or even what system-version updated titles with a fixed
version.</p>
<p>It's unknown if there's any titles using a vulnerable CTRSDK version
which are also exploitable with this(dlp module can't be exploited with
this).</p>
<p>The maximum number of bytes that can be written beyond the end of the
outbuf is 0x37-bytes, with additionaldata_size=0xFF.</p></td>
<td><p>Perhaps ROP, very difficult if possible with anything at
all</p></td>
<td><p>?</p></td>
<td></td>
<td><p>September(?) 2014</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="odd">
<td><p>CTPK buffer overflow</p></td>
<td><p>At offset 0x20 in CTPK is an array for each texture, each entry
is 0x20-bytes. This contains a wordindex(entry+0x18) for some srcdata
relative to CTPK+0, and an u8 wordsize(entry+0x14) for this data. The
CTRSDK function handling this doesn't validate the size, when copying
srcdata using this size to the output buffer. Applications usually have
the output buffer on the stack, hence stack buffer overflow.</p>
<p>While CTPK(*.ctpk) are normally only loaded from RomFS, some
application(s) load from elsewhere too.</p></td>
<td><p>ROP under the target application.</p></td>
<td><p>None?</p></td>
<td><p>"[SDK+NINTENDO:CTR_SDK-11_4_0_200_none]"</p></td>
<td><p>November 14, 2016</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a></p></td>
</tr>
<tr class="even">
<td><p>Pia vulns</p></td>
<td><p><a
href="https://switchbrew.org/wiki/Switch_System_Flaws#Pia">Originally
discovered in Pia v5.x for Switch</a>, these vulns are also present in
earlier versions (v3.x/4.x/5.x, possibly earlier?) for 3DS (and Wii U
too). Pia encryption generally wasn't used pre-Switch (sent packets are
plaintext). 3DS is affected by all Pia vulns listed above except for
LAN. The functionality for ParseLeaveMeshInvitation doesn't exist in 3DS
Pia v3.9.2. Wii U is affected by all listed Pia vulns except for the LAN
vulns.</p></td>
<td><p>See <a
href="https://switchbrew.org/wiki/Switch_System_Flaws#Pia">here</a>.</p></td>
<td><p>Unfixed on 3DS/Wii U</p></td>
<td><p>"[SDK+Nintendo:PIA_5_4_3]"</p></td>
<td><p>See <a
href="https://switchbrew.org/wiki/Switch_System_Flaws#Pia">here</a>;
separately checked later (UpdateConnectionReport) by <a
href="../User:Riley" title="wikilink">Riley</a> on: June 14, 2023</p></td>
<td><p><a href="../User:Yellows8" title="wikilink">Yellows8</a>; added to
3dbrew (UpdateConnectionReport) by <a href="../User:Riley"
title="wikilink">Riley</a> later</p></td>
</tr>
<tr class="odd">
<td><p>pialease nerf: stack overflow in Pia when parsing UDS packet
cmd=5 "UpdateMigrationNodeInfoMessage"</p></td>
<td><p>A UDS packet as received by Pia contains a command type, where
cmd=1 is higher-layer game-data, and other cmds are parsed
internally.</p>
<p>A function named "UdsNode::ParseUpdateMigrationNodeInfoMessage" is
called to handle packets with cmd=5.</p>
<p>This checks the player nodeID (returns if not player 1, that is, UDS
network host), then calls an additional function which does a loop of
64-bit copies to a fixed-size stack buffer using unchecked index and
data from the received packet contents.</p>
<p>This therefore leads to trivial RCE (of every UDS network client) by
just sending a single UDS packet; only 0xC u64s on stack can be
overwritten easily, but just 2 is enough to start a ROP chain and pivot
to the rest of the UDS packet contents elsewhere on the stack.</p>
<p>To exploit some games, an attacker would need to also reimplement the
DLP server protocol (and any quirks that game has when parsing the UDS
network passphrase obtained from the DLP server). One game that requires
this is Mario Party: Island Tour (only the dlplay child connects to a
UDS network).</p>
<p>Earliest version of Pia known to be vulnerable is v2.x. v1.x still
parses this packet, but does not have the stack-copy loop (index is
still unchecked there leading to heap overflow but due to overwrites not
being contiguous in memory it may or may not be exploitable).</p>
<p>Fixed with Pia version 4.x, which refactored the UDS send/receive
wrapper code and parses completely different commands.</p></td>
<td><p>ROP under the vulnerable application. A server can exploit every
client connected to it; a client can exploit every other client
connected to that server.</p></td>
<td><p>"[SDK+Nintendo:PIA_4_2_0]"</p></td>
<td><p>"[SDK+Nintendo:PIA_3_10_2]", "[SDK+Nintendo:PIA_4_2_0]"</p></td>
<td><p>Discovery: June 3, 2023.</p>
<p>Wiki: November 20, 2023.</p></td>
<td><p><a href="../User:Riley" title="wikilink">Riley</a></p></td>
</tr>
</tbody>
</table>