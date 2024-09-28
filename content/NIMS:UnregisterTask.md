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
<td>0</td>
<td>Header code [0x00050082]</td>
</tr>
<tr class="even">
<td>1-2</td>
<td>Title ID of the title whose task to remove</td>
</tr>
<tr class="odd">
<td>3</td>
<td>for <a {{% href "../IPC" %}} title="wikilink">process
ID</a></td>
</tr>
<tr class="even">
<td>4</td>
<td>Placeholder for process ID</td>
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
