+++
title = 'Kernel ABI'
+++

# Calling Convention

Seems to be [AAPCS](https://github.com/ARM-software/abi-aa/blob/main/aapcs32/aapcs32.rst#the-base-procedure-call-standard)-based (with modifications)

## Overview

### Inputs

- `r0–r3` : Argument / Scratch registers (caller-saved), inherited from AAPCS. *If an input is to be placed on the stack, it will instead use the next free register starting from `r0`.*

### Outputs

- `r0-r1` : Result, inherited from AAPCS. *If multiple outputs are returned (e.g., `ControlMemory`), they are placed in consecutive registers starting from `r0`.*

## Example

```
Result ControlMemory(uintptr_t* out, uintptr_t addr0, uintptr_t addr1, size_t size, MemoryOperation operation, MemoryPermission permissions)
```

### Inputs

Following standard [AAPCS](https://github.com/ARM-software/abi-aa/blob/main/aapcs32/aapcs32.rst#the-base-procedure-call-standard) register selection:

`r1` -\> addr0  
`r2` -\> addr1  
`r3` -\> size  

As there are still more arguments, the next free registers are selected starting from `r0`

`r0` -\> operation  
`r4` -\> permissions  

### Outputs

`r0` -\> Result  
`r1` -\> uintptr_t out  

## System calls

<table>
<thead>
<tr>
<th>ID</th>
<th>Name</th>
<th>Inputs</th>
<th>Outputs</th>
</tr>
</thead>
<tbody>
<tr>
<td>0x01</td>
<td>ControlMemory</td>
<td><code>r0</code>: <a {{% href "../Memory_Management" %}} title="wikilink"><code>MemoryOperation</code></a><code> operation</code><br />
<code>r1</code>: <code>u32/void* addr0</code><br />
<code>r2</code>: <code>u32/void* addr1</code><br />
<code>r3</code>: <code>u32 size</code><br />
<code>r4</code>: <a {{% href "../Memory_Management" %}} title="wikilink"><code>MemoryPermission</code></a><code> permissions</code></td>
<td><code>r0</code>: <code>Result</code><br />
<code>r1</code>: <code>u32/void* addr_out</code></td>
</tr>
<tr>
<td>0x02</td>
<td>QueryMemory</td>
<td><code>r2</code>?: <code>u32/void* addr</code></td>
<td><code>r0</code>: <code>Result</code><br />
<code>r1</code>: <code>u32 base_process_virtual_address</code><br />
<code>r2</code>: <code>u32 size</code><br />
<code>r3</code>: <a {{% href "../Memory_Management" %}} title="wikilink"><code>MemoryPermission</code></a><code> permission</code><br />
<code>r4</code>: <a {{% href "../Memory_Management" %}} title="wikilink"><code>MemoryState</code></a><code> state</code><br />
<code>r5</code>: <a {{% href "../Memory_Management" %}} title="wikilink"><code>PageFlags</code></a><code> page_flags</code></td>
</tr>
<tr>
<td>0x03</td>
<td>ExitProcess</td>
<td>None</td>
<td>None, doesn't return</td>
</tr>
<tr>
<td>0x04</td>
<td>GetProcessAffinityMask</td>
<td><code>r0</code>: <code>[out] u8* affinitymask</code><br />
<code>r1</code>: <code>Handle&lt;</code><a {{% href "../KProcess" %}} title="wikilink"><code>KProcess</code></a><code>&gt; process</code><br />
<code>r2</code>: <code>s32 processorcount</code></td>
<td><code>r0</code>: <code>Result</code></td>
</tr>
<tr>
<td>0x05</td>
<td>SetProcessAffinityMask</td>
<td><code>r0</code>: <code>Handle&lt;</code><a {{% href "../KProcess" %}} title="wikilink"><code>KProcess</code></a><code>&gt; process</code><br />
<code>r1</code>: <code>[in] const u8* affinitymask</code><br />
<code>r2</code>: <code>s32 processorcount</code></td>
<td><code>r0</code>: <code>Result</code></td>
</tr>
<tr>
<td>0x06</td>
<td>GetProcessIdealProcessor</td>
<td><code>r1</code>?: <code>Handle&lt;</code><a {{% href "../KProcess" %}} title="wikilink"><code>KProcess</code></a><code>&gt; process</code></td>
<td><code>r0</code>: <code>Result</code><br />
<code>r1</code>: <code>s32 processorid</code><br />
<code>r2</code>: Clobbered?</td>
</tr>
<tr>
<td>0x07</td>
<td>SetProcessIdealProcessor</td>
<td><code>r0</code>: <code>Handle&lt;</code><a {{% href "../KProcess" %}} title="wikilink"><code>KProcess</code></a><code>&gt; process</code><br />
<code>r1</code>: <code>s32 processorid</code></td>
<td><code>r0</code>: <code>Result</code><br />
</td>
</tr>
<tr>
<td>0x08</td>
<td>CreateThread</td>
<td><code>r0</code>: <code>s32 thread_priority</code><br />
<code>r1</code>: <code>ThreadFunc entrypoint</code><br />
<code>r2</code>: <code>u32 arg</code><br />
<code>r3</code>: <code>u32/void* stack_top</code><br />
<code>r4</code>: <code>s32 processor_id</code></td>
<td><code>r0</code>: <code>Result</code><br />
<code>r1</code>: <code>Handle&lt;</code><a {{% href "../KThread" %}} title="wikilink"><code>KThread</code></a><code>&gt; thread_handle</code></td>
</tr>
<tr>
<td>0x09</td>
<td>ExitThread</td>
<td>None</td>
<td>None, doesn't return</td>
</tr>
<tr>
<td>0x0A</td>
<td>SleepThread</td>
<td><code>r0-r1</code>: <code>s64 nanoseconds</code></td>
<td>None</td>
</tr>
<tr>
<td>0x0B</td>
<td>GetThreadPriority</td>
<td><code>r0</code>: Ignored?<br />
<code>r1</code>: <code>Handle thread_handle</code></td>
<td><code>r0</code>: <code>Result</code><br />
<code>r1</code>: <code>s32 thread_priority</code><br />
<code>r2</code>: Clobbered?</td>
</tr>
<tr>
<td>0x0C</td>
<td>SetThreadPriority</td>
<td><code>r0</code>: <code>Handle&lt;</code><a {{% href "../KThread" %}} title="wikilink"><code>KThread</code></a><code>&gt; thread_handle</code><br />
<code>r1</code>: <code>s32 thread_priority</code></td>
<td><code>r0</code>: <code>Result</code></td>
</tr>
<tr>
<td>0x0D</td>
<td>GetThreadAffinityMask</td>
<td><code>r0</code>: <code>[out] u8* affinitymask</code><br />
<code>r1</code>: <code>Handle&lt;</code><a {{% href "../KThread" %}} title="wikilink"><code>KThread</code></a><code>&gt; thread_handle</code><br />
<code>r2</code>: <code>s32 processorcount</code></td>
<td><code>r0</code>: <code>Result</code></td>
</tr>
<tr>
<td>0x0E</td>
<td>SetThreadAffinityMask</td>
<td><code>r0</code>: <code>Handle&lt;</code><a {{% href "../KThread" %}} title="wikilink"><code>KThread</code></a><code>&gt; thread_handle</code><br />
<code>r1</code>: <code>[in] const u8* affinitymask</code><br />
<code>r2</code>: <code>s32 processorcount</code></td>
<td><code>r0</code>: <code>Result</code></td>
</tr>
<tr>
<td>0x0F</td>
<td>GetThreadIdealProcessor</td>
<td><code>r0</code>: Ignored?<br />
<code>r1</code>: <code>Handle&lt;</code><a {{% href "../KThread" %}} title="wikilink"><code>KThread</code></a><code>&gt; thread_handle</code></td>
<td><code>r0</code>: <code>Result</code><br />
<code>r1</code>: <code>s32 processorid</code></td>
</tr>
<tr>
<td>0x10</td>
<td>SetThreadIdealProcessor</td>
<td><code>r0</code>: <code>Handle&lt;</code><a {{% href "../KThread" %}} title="wikilink"><code>KThread</code></a><code>&gt; thread_handle</code><br />
<code>r1</code>: <code>s32 processorid</code></td>
<td><code>r0</code>: <code>Result</code></td>
</tr>
<tr>
<td>0x11</td>
<td>GetProcessorID</td>
<td>None</td>
<td><code>r0</code>: <code>s32 processorid</code></td>
</tr>
<tr>
<td>0x24</td>
<td>WaitSynchronization1</td>
<td><code>r0</code>: <code>Handle&lt;</code><a {{% href "../KSynchronizationObject" %}} title="wikilink"><code>KSynchronizationObject</code></a><code>&gt; handle</code><br />
<code>r2-r3</code>: <code>s64 timeout</code></td>
<td><code>r0</code>: <code>Result</code></td>
</tr>
<tr>
<td>0x1B</td>
<td>SetTimer</td>
<td>Timer handle, initial_low, interval_low, initial_high, interval_high</td>
<td>Result</td>
</tr>
<tr>
<td>0x28</td>
<td>GetSystemTick</td>
<td>None</td>
<td><code>r0</code>: <code>Low 32 bits of the tick count</code><br />
<code>r1</code>: <code>High 32 bits of the tick count</code></td>
</tr>
<tr>
<td>0x2D</td>
<td>ConnectToPort</td>
<td>??<br />
<code>r1</code>: <code>pointer to port name</code></td>
<td><code>r0</code>: <code>Result</code><br />
<code>r1</code>: <code>handle to </code><a {{% href "../KClientSession" %}} title="wikilink"><code>KClientSession</code></a></td>
</tr>
<tr>
<td>0x32</td>
<td>SendSyncRequest</td>
<td><code>r0</code>: <code>handle to </code><a {{% href "../KClientSession" %}} title="wikilink"><code>KClientSession</code></a></td>
<td><code>r0</code>: <code>Result<code></td>
</tr>
</tbody>
</table>
