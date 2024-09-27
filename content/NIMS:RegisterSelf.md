+++
title = 'NIMS:RegisterSelf'
+++

# Request

<table>
<thead>
<tr class="header">
<th><p>Index Word</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>Header code [0x003C0002]</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>for <a href="IPC#Handle_Translation" title="wikilink">process
ID</a></p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td><p>0x10</p></td>
</tr>
</tbody>
</table>

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Registers the current process with [NIM](NIM_Services "wikilink"). This
is *required* before any networking actions can be taken.