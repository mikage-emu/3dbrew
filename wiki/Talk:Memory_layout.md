VRAM Map While Running System Applets may be incorrect in browser on
4.5. I executed the following code, but the bottom screen didn't change.
void _Noreturn _start() __attribute__((section (".text.start")));
void _Noreturn _start() {

`   int32_t *p;`

`   for (p = (int32_t *)0x48F000; (uintptr_t)p < 0x4C7400; p++)`
`       *p = 0;`
`   svcExitProcess();`

} --[173210](User:173210 "wikilink") 09:13, 28 March 2015 (CET)

That code is wrong for writing to VRAM, you're writing to the .code
area(if anything). You can't directly write to VRAM anyway.
--[Yellows8](User:Yellows8 "wikilink") 15:44, 28 March 2015 (CET)