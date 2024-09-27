+++
title = 'GSPGPU:RegisterInterruptRelayQueue'
+++

# Request

<table>
<thead>
<tr class="header">
<th>Index Word</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0</td>
<td>Header code [0x00130042]</td>
</tr>
<tr class="even">
<td>1</td>
<td>Flags</td>
</tr>
<tr class="odd">
<td>2</td>
<td></td>
</tr>
<tr class="even">
<td>3</td>
<td><a href="../KEvent" title="wikilink">KEvent</a> handle</td>
</tr>
</tbody>
</table>

# Response

<table>
<thead>
<tr class="header">
<th>Index Word</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0</td>
<td>Header code [0x00130082]</td>
</tr>
<tr class="even">
<td>1</td>
<td>Result code</td>
</tr>
<tr class="odd">
<td>2</td>
<td>GSP module thread index</td>
</tr>
<tr class="even">
<td>3</td>
<td></td>
</tr>
<tr class="odd">
<td>4</td>
<td><a href="../SVC" title="wikilink">Shared</a> memory handle</td>
</tr>
</tbody>
</table>

# Description

The specified KEvent handle is used by the application GSP thread, when
the event is triggered by GSP module this application thread can then
write [GX commands](GSP_Shared_Memory "wikilink") to the shared memory.
