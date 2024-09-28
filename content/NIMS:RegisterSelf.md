+++
title = 'NIMS:RegisterSelf'
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
<td>Header code [0x003C0002]</td>
</tr>
<tr class="even">
<td>1</td>
<td>for <a {{% href "../IPC" %}} title="wikilink">process
ID</a></td>
</tr>
<tr class="odd">
<td>2</td>
<td>0x10</td>
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
