+++
title = 'SRV:EnableNotification'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00020000\] |

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
<td>Header code</td>
</tr>
<tr class="even">
<td>1</td>
<td>Result code</td>
</tr>
<tr class="odd">
<td>2</td>
<td></td>
</tr>
<tr class="even">
<td>3</td>
<td>Handle to semaphore signaled on process notification</td>
</tr>
</tbody>
</table>

# Description

This creates and returns a semaphore handle which is released each time
a notification is sent to the process.

Called from processes launched directly by the kernel, this also
registers the process with an empty (and anyways irrelevant) service
access control list.
