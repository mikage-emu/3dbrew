Size : 0x1000 bytes (1 page)

Each [thread](KThread "wikilink") is allocated a 0x1000-byte page in
this region for the [thread context](KThreadContext "wikilink"). Each
thread has its context address stored as 2 members:

| Offset | Type  | Description                                                                                                     |
|--------|-------|-----------------------------------------------------------------------------------------------------------------|
| 0x88   | u32\* | Ptr to svc mode register storage for KThread inside the thread context.                                         |
| 0x8C   | u32\* | End-address of the page for this thread context allocated in the [0xFF4XX000](Memory_layout "wikilink") region. |

KThread offset 0x88 points to offset 0xF50 in the thread context and
0x8C points to the end of the thread context page. The kernel refers to
the thread context page by subtracting from the end instead of adding
from the beginning.

<table>
<thead>
<tr class="header">
<th><p>Offset</p></th>
<th><p>Type</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0xF38 (page_end - 0xC8)</p></td>
<td><p>u32[4]</p></td>
<td><p>SVC access control data copied from KThread's owner
process</p></td>
</tr>
<tr class="even">
<td><p>0xF48 (page_end - 0xB8)</p></td>
<td><p>u8[4]</p></td>
<td><p>Debug info (read by the SVC handler): 0: Bit0: reschedule. Bit1:
switch context. If non zero, and depending on
<code>currentThread-&gt;shallTerminate</code>, send thread exit debug
events after handling valid/authorized SVCs (except 0xFF). Cleared to
zero after handling. Bit2: lock debug features</p>
<p>1: "Allow debug" flag from the process's exheader. If set,
<code>{r0-r7, r12, lr_svc}</code> will be pushed (they'll always be when
handling invalid/unauthorized SVCs/SVC 0xFF). Needed for
svcGetThreadContext and svcSetThreadContext to work properly in contexts
other than exception handling (incl. hardware breakpoints). If lr_svc is
set to one in this frame, the registers are reloaded from it (used with
svcBreak, svc 0xff, etc).</p>
<p>2: ?</p>
<p>3: ID of the SVC being handled (reset to 0 when done).</p></td>
</tr>
<tr class="odd">
<td><p>0xF50 (page_end - 0xB0)</p></td>
<td><p>u32[10]</p></td>
<td><p>SVC mode registers, r4-r11, r13, r14</p></td>
</tr>
<tr class="even">
<td><p>0xF78</p></td>
<td><p>f64[16]</p></td>
<td><p>VFP registers aliased as 16 double precision, 64-bit
registers</p></td>
</tr>
<tr class="odd">
<td><p>0xFF8</p></td>
<td><p>u32</p></td>
<td><p>FPEXC, floating point exception register for thread- stored and
loaded on context switches</p></td>
</tr>
<tr class="even">
<td><p>0xFFC</p></td>
<td><p>u32</p></td>
<td><p>FPSCR, floating point status and control register</p></td>
</tr>
</tbody>
</table>

When switching thread contexts the kernel does, in order:

- Load FPEXC
- Save the LR to r1- this LR is the return back to the main scheduling
  and context switching function
- Load r4-r11, SP, LR
- Branch back to r1, preserving the LR which was just reloaded, back to
  the main scheduling function, but in the context of the newly
  switched-to thread
- Disable Interrupts
- Check if that core's KScheduler object indicates that it needs
  switching again and exit if it does not
- Otherwise, run the thread scheduler again and repeat all the steps to
  switch contexts again

[Category:Kernel objects](Category:Kernel_objects "wikilink")