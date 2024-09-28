+++
title = 'APT:AppletUtility'
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
<td>Header code [0x004B00C2]</td>
</tr>
<tr class="even">
<td>1</td>
<td><a {{% href "../APT:AppletUtility" %}}
title="wikilink">Utility</a></td>
</tr>
<tr class="odd">
<td>2</td>
<td>Input Size</td>
</tr>
<tr class="even">
<td>3</td>
<td>Output Size</td>
</tr>
<tr class="odd">
<td>4</td>
<td></td>
</tr>
<tr class="even">
<td>5</td>
<td>void*, Input</td>
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

| ID  | Description                                                                                  |
|-----|----------------------------------------------------------------------------------------------|
| 0   | void ClearPowerButtonState()                                                                 |
| 1   | ?                                                                                            |
| 2   | Sets current applet slot to Home Menu?                                                       |
| 3   | void ClearExclusiveControl()                                                                 |
| 4   | void SleepIfShellClosed()                                                                    |
| 5   | void LockTransition(u32 transition)                                                          |
| 6   | bool TryLockTransition(u32 transition)                                                       |
| 7   | void UnlockTransition(u32 transition)                                                        |
| 10  | void StartExitTask()                                                                         |
| 11  | void SetInitialSenderId(u32 id)                                                              |
| 12  | void SetPowerButtonClick()                                                                   |
| 16  | void UnlockCartAndSdSlot(bool unlocked) (Prevents a "card removed" error when passing true)  |
| 17  | ?                                                                                            |
| 18  | ?                                                                                            |
