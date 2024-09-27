+++
title = 'KThreadContext'
categories = ["Kernel objects"]
+++

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
<th>Offset</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0xF38 (page_end - 0xC8)</td>
<td>u32[4]</td>
<td>SVC access control data copied from KThread's owner
process</td>
</tr>
<tr class="even">
<td>0xF48 (page_end - 0xB8)</td>
<td>u8[4]</td>
<td>Debug info (read by the SVC handler): 0: Bit0: reschedule. Bit1:
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
<p>3: ID of the SVC being handled (reset to 0 when done).</td>
</tr>
<tr class="odd">
<td>0xF50 (page_end - 0xB0)</td>
<td>u32[10]</td>
<td>SVC mode registers, r4-r11, r13, r14</td>
</tr>
<tr class="even">
<td>0xF78</td>
<td>f64[16]</td>
<td>VFP registers aliased as 16 double precision, 64-bit
registers</td>
</tr>
<tr class="odd">
<td>0xFF8</td>
<td>u32</td>
<td>FPEXC, floating point exception register for thread- stored and
loaded on context switches</td>
</tr>
<tr class="even">
<td>0xFFC</td>
<td>u32</td>
<td>FPSCR, floating point status and control register</td>
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
