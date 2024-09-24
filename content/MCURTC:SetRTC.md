+++
title = 'MCURTC:SetRTC'
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
<td><p>Header code [0x00010080]</p></td>
</tr>
<tr class="even">
<td><p>1-2</p></td>
<td><p><code> u8 seconds,</code><br />
<code> u8 minutes,</code><br />
<code> u8 hours,</code><br />
<code> u8 dayofweek,</code><br />
<code> u8 dayofmonth,</code><br />
<code> u8 month,</code><br />
<code> u8 year,</code><br />
<code> u8 leapcount</code></p></td>
</tr>
</tbody>
</table>

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This sets the RTC time on the MCU device.
