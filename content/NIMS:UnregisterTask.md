+++
title = 'NIMS:UnregisterTask'
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
<td><p>0</p></td>
<td><p>Header code [0x00050082]</p></td>
</tr>
<tr class="even">
<td><p>1-2</p></td>
<td><p>Title ID of the title whose task to remove</p></td>
</tr>
<tr class="odd">
<td><p>3</p></td>
<td><p>for <a href="../IPC#Handle_Translation" title="wikilink">process
ID</a></p></td>
</tr>
<tr class="even">
<td><p>4</p></td>
<td><p>Placeholder for process ID</p></td>
</tr>
</tbody>
</table>

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Removes a task registered with
[NIMS:RegisterTask](NIMS:RegisterTask "wikilink").
