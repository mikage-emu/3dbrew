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
<th><p>Index Word</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>Header code</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Result code</p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>3</p></td>
<td><p>Handle to semaphore signaled on process notification</p></td>
</tr>
</tbody>
</table>

# Description

This creates and returns a semaphore handle which is released each time
a notification is sent to the process.

Called from processes launched directly by the kernel, this also
registers the process with an empty (and anyways irrelevant) service
access control list.