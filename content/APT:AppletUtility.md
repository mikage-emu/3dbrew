+++
title = 'APT:AppletUtility'
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
<td><p>Header code [0x004B00C2]</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p><a href="../APT:AppletUtility#Utility"
title="wikilink">Utility</a></p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td><p>Input Size</p></td>
</tr>
<tr class="even">
<td><p>3</p></td>
<td><p>Output Size</p></td>
</tr>
<tr class="odd">
<td><p>4</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>5</p></td>
<td><p>void*, Input</p></td>
</tr>
</tbody>
</table>

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                |
|------------|----------------------------|
| 0          | (Output Size \<\< 14) \| 2 |
| 1          | void\*, Output             |

# Response

| Index Word | Description   |
|------------|---------------|
| 0          | Header code   |
| 1          | Result code   |
| 2          | Applet Result |

# Utility

| ID  | Description                            |
|-----|----------------------------------------|
| 0   | void ClearPowerButtonState()           |
| 1   | ?                                      |
| 2   | Sets current applet slot to Home Menu? |
| 3   | void ClearExclusiveControl()           |
| 4   | void SleepIfShellClosed()              |
| 5   | void LockTransition(u32 transition)    |
| 6   | bool TryLockTransition(u32 transition) |
| 7   | void UnlockTransition(u32 transition)  |
| 10  | void StartExitTask()                   |
| 11  | void SetInitialSenderId(u32 id)        |
| 12  | void SetPowerButtonClick()             |
| 16  | ?                                      |
| 17  | ?                                      |
| 18  | ?                                      |