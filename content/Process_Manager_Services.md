# Process Manager app service "pm:app"

| Command Header | Description                                                     |
|----------------|-----------------------------------------------------------------|
| 0x00010140     | [LaunchTitle](PMApp:LaunchTitle "wikilink")                     |
| 0x00020082     | [LaunchFIRM](PMApp:LaunchFIRM "wikilink")                       |
| 0x00030080     | [TerminateApplication](PMApp:TerminateApplication "wikilink")   |
| 0x00040100     | [TerminateTitle](PMApp:TerminateTitle "wikilink")               |
| 0x000500C0     | [TerminateProcess](PMApp:TerminateProcess "wikilink")           |
| 0x00060082     | [PrepareForReboot](PMApp:PrepareForReboot "wikilink")           |
| 0x00070042     | [GetFIRMLaunchParams](PMApp:GetFIRMLaunchParams "wikilink")     |
| 0x00080100     | [GetTitleExheaderFlags](PMApp:GetTitleExheaderFlags "wikilink") |
| 0x00090042     | [SetFIRMLaunchParams](PMApp:SetFIRMLaunchParams "wikilink")     |
| 0x000A0140     | [SetAppResourceLimit](PMApp:SetAppResourceLimit "wikilink")     |
| 0x000B0140     | [GetAppResourceLimit](PMApp:GetAppResourceLimit "wikilink")     |
| 0x000C0080     | [UnregisterProcess](PMApp:UnregisterProcess "wikilink")         |
| 0x000D0240     | [LaunchTitleUpdate](PMApp:LaunchTitleUpdate "wikilink")         |

# Process Manager debug service "pm:dbg"

| Command Header | Description                                           |
|----------------|-------------------------------------------------------|
| 0x00010140     | [LaunchAppDebug](PMDbg:LaunchAppDebug "wikilink")     |
| 0x00020140     | [LaunchApp](PMDbg:LaunchApp "wikilink")               |
| 0x00030000     | [RunQueuedProcess](PMDbg:RunQueuedProcess "wikilink") |

A maximum of three sessions can be open with both of these services
combined, therefore only three processes can use either of these
services at once.

[Category:Services](Category:Services "wikilink")