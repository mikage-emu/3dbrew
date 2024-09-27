+++
title = 'Kernel ABI'
+++

Inputs are read from registers starting from r0 and outputs are written
back to the same registers (also starting with r0).

<table>
<thead>
<tr class="header">
<th>ID</th>
<th>Name</th>
<th>Inputs</th>
<th>Outputs</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x01</p></td>
<td><p>ControlMemory</p></td>
<td><p><code>r0</code>: <a href="../Memory_Management#enum_MemoryOperation"
title="wikilink"><code>MemoryOperation</code></a><code> operation</code><br />
<code>r1</code>: <code>u32/void* addr0</code><br />
<code>r2</code>: <code>u32/void* addr1</code><br />
<code>r3</code>: <code>u32 size</code><br />
<code>r4</code>: <a href="../Memory_Management#enum_MemoryPermission"
title="wikilink"><code>MemoryPermission</code></a><code> permissions</code></p></td>
<td><p><code>r0</code>: <code>Result</code><br />
<code>r1</code>: <code>u32/void* addr_out</code></p></td>
</tr>
<tr class="even">
<td><p>0x02</p></td>
<td><p>QueryMemory</p></td>
<td><p><code>r2</code>?: <code>u32/void* addr</code></p></td>
<td><p><code>r0</code>: <code>Result</code><br />
<code>r1</code>: <code>u32 base_process_virtual_address</code><br />
<code>r2</code>: <code>u32 size</code><br />
<code>r3</code>: <a href="../Memory_Management#enum_MemoryPermission"
title="wikilink"><code>MemoryPermission</code></a><code> permission</code><br />
<code>r4</code>: <a href="../Memory_Management#enum_MemoryState"
title="wikilink"><code>MemoryState</code></a><code> state</code><br />
<code>r5</code>: <a href="../Memory_Management#enum_PageFlags"
title="wikilink"><code>PageFlags</code></a><code> page_flags</code></p></td>
</tr>
<tr class="odd">
<td><p>0x03</p></td>
<td><p>ExitProcess</p></td>
<td><p>None</p></td>
<td><p>None, doesn't return</p></td>
</tr>
<tr class="even">
<td><p>0x04</p></td>
<td><p>GetProcessAffinityMask</p></td>
<td><p><code>r0</code>: <code>[out] u8* affinitymask</code><br />
<code>r1</code>: <code>Handle&lt;</code><a href="../KProcess"
title="wikilink"><code>KProcess</code></a><code>&gt; process</code><br />
<code>r2</code>: <code>s32 processorcount</code></p></td>
<td><p><code>r0</code>: <code>Result</code></p></td>
</tr>
<tr class="odd">
<td><p>0x05</p></td>
<td><p>SetProcessAffinityMask</p></td>
<td><p><code>r0</code>: <code>Handle&lt;</code><a href="../KProcess"
title="wikilink"><code>KProcess</code></a><code>&gt; process</code><br />
<code>r1</code>: <code>[in] const u8* affinitymask</code><br />
<code>r2</code>: <code>s32 processorcount</code></p></td>
<td><p><code>r0</code>: <code>Result</code></p></td>
</tr>
<tr class="even">
<td><p>0x06</p></td>
<td><p>GetProcessIdealProcessor</p></td>
<td><p><code>r1</code>?: <code>Handle&lt;</code><a href="../KProcess"
title="wikilink"><code>KProcess</code></a><code>&gt; process</code></p></td>
<td><p><code>r0</code>: <code>Result</code><br />
<code>r1</code>: <code>s32 processorid</code><br />
<code>r2</code>: Clobbered?</p></td>
</tr>
<tr class="odd">
<td><p>0x07</p></td>
<td><p>SetProcessIdealProcessor</p></td>
<td><p><code>r0</code>: <code>Handle&lt;</code><a href="../KProcess"
title="wikilink"><code>KProcess</code></a><code>&gt; process</code><br />
<code>r1</code>: <code>s32 processorid</code></p></td>
<td><p><code>r0</code>: <code>Result</code><br />
</p></td>
</tr>
<tr class="even">
<td><p>0x08</p></td>
<td><p>CreateThread</p></td>
<td><p><code>r0</code>: <code>s32 thread_priority</code><br />
<code>r1</code>: <code>ThreadFunc entrypoint</code><br />
<code>r2</code>: <code>u32 arg</code><br />
<code>r3</code>: <code>u32/void* stack_top</code><br />
<code>r4</code>: <code>s32 processor_id</code></p></td>
<td><p><code>r0</code>: <code>Result</code><br />
<code>r1</code>: <code>Handle&lt;</code><a href="../KThread"
title="wikilink"><code>KThread</code></a><code>&gt; thread_handle</code></p></td>
</tr>
<tr class="odd">
<td><p>0x09</p></td>
<td><p>ExitThread</p></td>
<td><p>None</p></td>
<td><p>None, doesn't return</p></td>
</tr>
<tr class="even">
<td><p>0x0A</p></td>
<td><p>SleepThread</p></td>
<td><p><code>r0-r1</code>: <code>s64 nanoseconds</code></p></td>
<td><p>None</p></td>
</tr>
<tr class="odd">
<td><p>0x0B</p></td>
<td><p>GetThreadPriority</p></td>
<td><p><code>r0</code>: Ignored?<br />
<code>r1</code>: <code>Handle thread_handle</code></p></td>
<td><p><code>r0</code>: <code>Result</code><br />
<code>r1</code>: <code>s32 thread_priority</code><br />
<code>r2</code>: Clobbered?</p></td>
</tr>
<tr class="even">
<td><p>0x0C</p></td>
<td><p>SetThreadPriority</p></td>
<td><p><code>r0</code>: <code>Handle&lt;</code><a href="../KThread"
title="wikilink"><code>KThread</code></a><code>&gt; thread_handle</code><br />
<code>r1</code>: <code>s32 thread_priority</code></p></td>
<td><p><code>r0</code>: <code>Result</code></p></td>
</tr>
<tr class="odd">
<td><p>0x0D</p></td>
<td><p>GetThreadAffinityMask</p></td>
<td><p><code>r0</code>: <code>[out] u8* affinitymask</code><br />
<code>r1</code>: <code>Handle&lt;</code><a href="../KThread"
title="wikilink"><code>KThread</code></a><code>&gt; thread_handle</code><br />
<code>r2</code>: <code>s32 processorcount</code></p></td>
<td><p><code>r0</code>: <code>Result</code></p></td>
</tr>
<tr class="even">
<td><p>0x0E</p></td>
<td><p>SetThreadAffinityMask</p></td>
<td><p><code>r0</code>: <code>Handle&lt;</code><a href="../KThread"
title="wikilink"><code>KThread</code></a><code>&gt; thread_handle</code><br />
<code>r1</code>: <code>[in] const u8* affinitymask</code><br />
<code>r2</code>: <code>s32 processorcount</code></p></td>
<td><p><code>r0</code>: <code>Result</code></p></td>
</tr>
<tr class="odd">
<td><p>0x0F</p></td>
<td><p>GetThreadIdealProcessor</p></td>
<td><p><code>r0</code>: Ignored?<br />
<code>r1</code>: <code>Handle&lt;</code><a href="../KThread"
title="wikilink"><code>KThread</code></a><code>&gt; thread_handle</code></p></td>
<td><p><code>r0</code>: <code>Result</code><br />
<code>r1</code>: <code>s32 processorid</code></p></td>
</tr>
<tr class="even">
<td><p>0x10</p></td>
<td><p>SetThreadIdealProcessor</p></td>
<td><p><code>r0</code>: <code>Handle&lt;</code><a href="../KThread"
title="wikilink"><code>KThread</code></a><code>&gt; thread_handle</code><br />
<code>r1</code>: <code>s32 processorid</code></p></td>
<td><p><code>r0</code>: <code>Result</code></p></td>
</tr>
<tr class="odd">
<td><p>0x11</p></td>
<td><p>GetProcessorID</p></td>
<td><p>None</p></td>
<td><p><code>r0</code>: <code>s32 processorid</code></p></td>
</tr>
<tr class="even">
<td><p>0x24</p></td>
<td><p>WaitSynchronization1</p></td>
<td><p><code>r0</code>: <code>Handle&lt;</code><a
href="../KSynchronizationObject"
title="wikilink"><code>KSynchronizationObject</code></a><code>&gt; handle</code><br />
<code>r2-r3</code>: <code>s64 timeout</code></p></td>
<td><p><code>r0</code>: <code>Result</code></p></td>
</tr>
<tr class="odd">
<td><p>0x1B</p></td>
<td><p>SetTimer</p></td>
<td><p>Timer handle, initial_low, interval_low, initial_high,
interval_high</p></td>
<td><p>Result</p></td>
</tr>
<tr class="even">
<td><p>0x28</p></td>
<td><p>GetSystemTick</p></td>
<td><p>None</p></td>
<td><p><code>r0</code>: <code>Low 32 bits of the tick count</code><br />
<code>r1</code>: <code>High 32 bits of the tick count</code></p></td>
</tr>
<tr class="odd">
<td><p>0x2D</p></td>
<td><p>ConnectToPort</p></td>
<td><p>??<br />
<code>r1</code>: <code>pointer to port name</code></p></td>
<td><p><code>r0</code>: <code>Result</code><br />
<code>r1</code>: <code>handle to </code><a href="../KClientSession"
title="wikilink"><code>KClientSession</code></a></p></td>
</tr>
<tr class="even">
<td><p>0x32</p></td>
<td><p>SendSyncRequest</p></td>
<td><p><code>r0</code>: <code>handle to </code><a href="../KClientSession"
title="wikilink"><code>KClientSession</code></a></p></td>
<td><p><code>r0</code>: <code>Result<code></p></td>
</tr>
</tbody>
</table>
