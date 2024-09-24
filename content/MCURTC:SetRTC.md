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
<td>0</td>
<td>Header code [0x00010080]</td>
</tr>
<tr class="even">
<td>1-2</td>
<td><code> u8 seconds,</code><br />
<code> u8 minutes,</code><br />
<code> u8 hours,</code><br />
<code> u8 dayofweek,</code><br />
<code> u8 dayofmonth,</code><br />
<code> u8 month,</code><br />
<code> u8 year,</code><br />
<code> u8 leapcount</code></td>
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
