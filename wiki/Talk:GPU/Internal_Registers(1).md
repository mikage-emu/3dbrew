<s>FYI, fixed-point numbers are often denoted as "fixedX.Y", with X the
non-fractional and Y the fractional bits. Also note that one wouldn't
speak about "fixed-point" numbers when Y=0 (just say "X-bit integer"
instead). I found the latter a bit confusing in the recent changes,
since it sounded like "Z bias" was a fixed-point number with unspecified
fractional bits. [Neobrain](User:Neobrain "wikilink") 12:07, 3 December
2015 (CET)</s>

@Steveice: <s>Regarding the recent GPUREG_SH_BOOLUNIFORM confusion, I
agree that your version is the more sensible variant. However, note that
technically it depends on the semantics defined in
[Shader_Instruction_Set#Comparison_operator](Shader_Instruction_Set#Comparison_operator "wikilink"):
Switching between your version (0=false) and the original one (1=false)
is equivalent to e.g. replacing the CONDOP=0 semantic " cmp.x == REFX
\|\| cmp.y == REFY " with " !cmp.x == REFX \|\| !cmp.y == REFY". In
other words, this change implicltly changed the documented semantics of
shader conditions. Hence I wonder whether the Shader Instruction Set
needs any adjustments with the new documentation on
GPUREG_SH_BOOLUNIFORM. </s> Actually, I mixed up stuff. What actually
would need to be fixed up is the semantics of IFU, but that would yield
a counterintuitive notion of conditional execution.
[Neobrain](User:Neobrain "wikilink") 19:55, 5 December 2015 (CET)

The behaviour of the ifu command actually suggests 0=true and 1=false.
Earlier today, upon seeing the change in the wiki, I did tests with the
command. It turned out the positive block is executed when the bit is
cleared, and the negative block is executed when the bit is set; as it
was previously documented. Note the wording in the Shader Instruction
Set page: "If condition BOOL is true, then executes instructions until
DST, then jumps to DST+NUM; else, jumps to DST."
--[Fincs](User:Fincs "wikilink") 20:15, 5 December 2015 (CET)


From what I've seen so far, it seems to be used with 0 = false and 1 =
true, so... ¯\\(ツ)_/¯ --[Steveice10](User:Steveice10 "wikilink")
20:18, 5 December 2015 (CET)

<!-- -->



Could you elaborate? --[Neobrain](User:Neobrain "wikilink") 20:20, 5
December 2015 (CET)

<!-- -->



As in, disassembled code I've looked at seems to use 0 for false and 1
for true when changing the register value. Plus, the register bits are
specifically initialized to zeros.
--[Steveice10](User:Steveice10 "wikilink") 20:56, 5 December 2015 (CET)