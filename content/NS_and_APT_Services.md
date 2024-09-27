+++
title = 'NS and APT Services'
categories = ["Services"]
+++

The NS (**N**intendo User Interface **S**hell) system module is the
first module launched from a CTR-NAND title after the
[FIRM](FIRM "wikilink") processes are loaded (also see
[Bootloader](Bootloader "wikilink")). This module is launched by the pm
process, with the titleID loaded from NS state(hard-coded TID
initialized during applet TID-array initialization). NS first launches
[ErrDisp](ErrDisp "wikilink"), then the menu. On retail the menu TID is
loaded from NS state, while on dev/debug the menu TID is loaded from
[config](Config_Savegame "wikilink"). On dev-units if the menu TID block
doesn't exist in [config](Config_Savegame "wikilink"), NS will attempt
to launch the alternate menu instead. The TID of the launched menu is
then written to [ACTIVEMENUTID](Configuration_Memory "wikilink"). NS
uses [pm:app](PMApp:LaunchTitle "wikilink") to launch titles.

NS will not trigger the [fatal-error](ErrDisp "wikilink") screen when
launching the regular/alternate menu fails.

Like home menu NS is constantly running while the system is in 3DS-mode.
When attempting to return to home-menu when the home-menu process isn't
running(like when the process terminated/crashed), NS will trigger a
[fatal](ErrDisp "wikilink") error.

# Alternate menu

When launching the regular menu fails, NS will then attempt to launch
the alternate menu. This title could be used as a recovery process,
however it's normally not used after the factory.

At the factory for all 3DS systems, [Test
Menu](3DS_Development_Unit_GUI#test_menu "wikilink") is installed with
this TID. On retail this title is eventually deleted during [Factory
Setup](Factory_Setup "wikilink").

# Auto-boot

After [loading](PMApp:GetFIRMLaunchParams "wikilink")
[FIRM](FIRM "wikilink") params and prior to launching
[ErrDisp](ErrDisp "wikilink")/Home Menu, NS handles auto-booting titles.
The same code called by [<APT:Reboot>](APT:Reboot "wikilink") is used
for launching FIRM here. When the
[UPDATEFLAG](Configuration_Memory "wikilink") is set, NS will launch
SAFE_MODE_FIRM with the application titleID set to the [System
Updater](System_Settings#system_updater "wikilink") titleID for this
region. When the UPDATEFLAG is not set, NS can auto-boot the following
titles as well if [0x1FF80016](Configuration_Memory "wikilink") bit0 is
set.

When bit1 and bit2 are value zero in
[0x1FF80016](Configuration_Memory "wikilink"), NS will
[launch](NSS:LaunchFIRM "wikilink") the title specified by the
[FIRM](FIRM "wikilink") parameters if the title-info is set. This FIRM
launch is done after launching [ErrDisp](ErrDisp "wikilink") and Home
Menu. Otherwise when [0x1FF80016](Configuration_Memory "wikilink") is
value 2 and the output u8 from [PTMSYSM](PTM "wikilink") command
0x08140000 is value 0, NS will boot the title specified from the TWL
TLNC block from FIRMparams+0x300. This is the same TLNC block which DSi
titles wrote to RAM+0x300 for launching other titles via the launcher
title. When handling the TLNC block, NS will boot the 3DS System
Settings title when the TLNC titleID is the DSi System Settings
titleID(the region field in the TLNC TID is not checked/used). When the
TLNC titleID is not System Settings, NS will convert the input DSi
titleID-high to the 3DS TWL titleID-high(tidhigh = (TLNCtidhigh &
0x7FFF) \| 0x48000), then launch TWL_FIRM to run the title. NS does not
support launching from gamecard via TLNC.

# NS Workaround

A "ns_workaround" was [added](5.1.0-11 "wikilink") in NS to workaround
the flaw added with [5.0.0-11](5.0.0-11 "wikilink"). When NS is loading
before launching any ARM11 processes and certain [Configuration
Memory](Configuration_Memory "wikilink") fields are set, NS will launch
[AM](Application_Manager_Services "wikilink") then use command
[AM:InstallNATIVEFIRM](AM:InstallNATIVEFIRM "wikilink"). NS will then
execute the code called by
[<APT:StartNewestHomeMenu>](APT:StartNewestHomeMenu "wikilink"), the
code related to <APT:PrepareToStartNewestHomeMenu> is not executed here.

NS will only execute this code-path when
[0x1FF80016](Configuration_Memory "wikilink") is value zero, when
KERNEL_VERSIONMAJOR is value 2, and when KERNEL_VERSIONMINOR is less
than 35. Therefore, this code-path is only executed when the running
NATIVE_FIRM version is prior to [5.0.0-11](5.0.0-11 "wikilink").

# NS Service "ns:s"

| Command Header | Available since system version                                | Description                                                                             |
|----------------|---------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| 0x000100C0     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | [LaunchFIRM](NSS:LaunchFIRM "wikilink")                                                 |
| 0x000200C0     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | [LaunchTitle](NSS:LaunchTitle "wikilink")                                               |
| 0x00030000     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | [TerminateApplication](NSS:TerminateApplication "wikilink")                             |
| 0x00040040     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | [TerminateProcess](NSS:TerminateProcess "wikilink")                                     |
| 0x000500C0     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | [LaunchApplicationFIRM](NSS:LaunchApplicationFIRM "wikilink")                           |
| 0x00060042     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | [SetWirelessRebootInfo](NSS:SetWirelessRebootInfo "wikilink")                           |
| 0x00070042     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | [CardUpdateInitialize](NSS:CardUpdateInitialize "wikilink")                             |
| 0x00080000     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | [CardUpdateShutdown](NSS:CardUpdateShutdown "wikilink")                                 |
| 0x00090000     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | Gamecard system update related.                                                         |
| 0x000A0000     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | Gamecard system update related.                                                         |
| 0x000B0000     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | Gamecard system update related.                                                         |
| 0x000C0000     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | Gamecard system update related.                                                         |
| 0x000D0140     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | [SetTWLBannerHMAC](NSS:SetTWLBannerHMAC "wikilink")                                     |
| 0x000E0000     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | [ShutdownAsync](NSS:ShutdownAsync "wikilink")                                           |
| 0x000F0000     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | This calls [<APT:AppletUtility>](APT:AppletUtility "wikilink") with fixed input params. |
| 0x00100180     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | [RebootSystem](NSS:RebootSystem "wikilink")                                             |
| 0x00110100     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | [TerminateTitle](NSS:TerminateTitle "wikilink")                                         |
| 0x001200C0     | ?                                                             | [SetApplicationCpuTimeLimit](NSS:SetApplicationCpuTimeLimit "wikilink")                 |
| 0x00130000     | ?                                                             | ?                                                                                       |
| 0x00140042     | ?                                                             | ?                                                                                       |
| 0x00150140     | ?                                                             | [LaunchApplication](NSS:LaunchApplication "wikilink")                                   |
| 0x00160000     | [8.0.0-18](8.0.0-18 "wikilink")                               | [RebootSystemClean](NSS:RebootSystemClean "wikilink")                                   |

The maximum sessions that can be used with this service is two,
therefore only two processes can use this service at the same time.

# NS Power Service "ns:p"

| Command Header | Description                                   |
|----------------|-----------------------------------------------|
| 0x00010040     | [RebootSystem](NSP:RebootSystem "wikilink")   |
| 0x00020000     | [ShutdownAsync](NSS:ShutdownAsync "wikilink") |

This was added with [3.0.0-5](3.0.0-5 "wikilink"). The PTM sysmodule
connects to this service, and syncs whenever [ptm:s
GetShellState()](PTM "wikilink") changes.

# NS Service "ns:c"

| Command Header | Description                                                 |
|----------------|-------------------------------------------------------------|
| 0x00010100     | [LockSpecialContent](NSC:LockSpecialContent "wikilink")     |
| 0x00020100     | [UnlockSpecialContent](NSC:UnlockSpecialContent "wikilink") |

This was added with [5.0.0-11](5.0.0-11 "wikilink"). It is used by the
Instruction Manual applet, and is likely related to triggering SD/Game
Card removal errors when ejecting the media the manual is stored on.

# APT Services

| Command Header | Available since system version    | Accessible with <APT:U>                | Accessible with <APT:A>                | Description                                                                     |
|----------------|-----------------------------------|----------------------------------------|----------------------------------------|---------------------------------------------------------------------------------|
| 0x00010040     |                                   | Yes                                    | Yes                                    | [GetLockHandle](APT:GetLockHandle "wikilink")                                   |
| 0x00020080     |                                   | See [here](APT:Initialize "wikilink"). | See [here](APT:Initialize "wikilink"). | [Initialize](APT:Initialize "wikilink")                                         |
| 0x00030040     |                                   | Yes                                    | Yes                                    | [Enable](APT:Enable "wikilink")                                                 |
| 0x00040040     |                                   | Yes                                    | Yes                                    | [Finalize](APT:Finalize "wikilink")                                             |
| 0x00050040     |                                   | Yes                                    | Yes                                    | [GetAppletManInfo](APT:GetAppletManInfo "wikilink")                             |
| 0x00060040     |                                   | Yes (AppID != 0x300)                   | Yes                                    | [GetAppletInfo](APT:GetAppletInfo "wikilink")                                   |
| 0x00070000     |                                   | Yes                                    | Yes                                    | [GetLastSignaledAppletId](APT:GetLastSignaledAppletId "wikilink")               |
| 0x00080000     |                                   | Yes                                    | Yes                                    | [CountRegisteredApplet](APT:CountRegisteredApplet "wikilink")                   |
| 0x00090040     |                                   | Yes                                    | Yes                                    | [IsRegistered](APT:IsRegistered "wikilink")                                     |
| 0x000A0040     |                                   | Yes                                    | Yes                                    | [GetAttribute](APT:GetAttribute "wikilink")                                     |
| 0x000B0040     |                                   | Yes                                    | Yes                                    | [InquireNotification](APT:InquireNotification "wikilink")                       |
| 0x000C0104     |                                   | Yes                                    | Yes                                    | [SendParameter](APT:SendParameter "wikilink")                                   |
| 0x000D0080     |                                   | Yes                                    | Yes                                    | [ReceiveParameter](APT:ReceiveParameter "wikilink")                             |
| 0x000E0080     |                                   | Yes                                    | Yes                                    | [GlanceParameter](APT:GlanceParameter "wikilink")                               |
| 0x000F0100     |                                   | Yes                                    | Yes                                    | [CancelParameter](APT:CancelParameter "wikilink")                               |
| 0x001000C2     |                                   | Yes                                    | Yes                                    | [DebugFunc](APT:DebugFunc "wikilink")                                           |
| 0x001100C0     |                                   | Yes                                    | Yes                                    | [MapProgramIdForDebug](APT:MapProgramIdForDebug "wikilink")                     |
| 0x00120040     |                                   | Yes                                    | Yes                                    | [SetHomeMenuAppletIdForDebug](APT:SetHomeMenuAppletIdForDebug "wikilink")       |
| 0x00130000     |                                   | Yes                                    | Yes                                    | [GetPreparationState](APT:GetPreparationState "wikilink")                       |
| 0x00140040     |                                   | Yes                                    | Yes                                    | [SetPreparationState](APT:SetPreparationState "wikilink")                       |
| 0x00150140     |                                   | No                                     | No                                     | [PrepareToStartApplication](APT:PrepareToStartApplication "wikilink")           |
| 0x00160040     |                                   | Yes                                    | Yes                                    | [PreloadLibraryApplet](APT:PreloadLibraryApplet "wikilink")                     |
| 0x00170040     |                                   | Yes                                    | Yes                                    | [FinishPreloadingLibraryApplet](APT:FinishPreloadingLibraryApplet "wikilink")   |
| 0x00180040     |                                   | Yes                                    | Yes                                    | [PrepareToStartLibraryApplet](APT:PrepareToStartLibraryApplet "wikilink")       |
| 0x00190040     |                                   | Yes                                    | Yes                                    | [PrepareToStartSystemApplet](APT:PrepareToStartSystemApplet "wikilink")         |
| 0x001A0000     |                                   | Yes                                    | Yes                                    | [PrepareToStartNewestHomeMenu](APT:PrepareToStartNewestHomeMenu "wikilink")     |
| 0x001B00C4     |                                   | Yes                                    | Yes                                    | [StartApplication](APT:StartApplication "wikilink")                             |
| 0x001C0000     |                                   | Yes                                    | Yes                                    | [WakeupApplication](APT:WakeupApplication "wikilink")                           |
| 0x001D0000     |                                   | Yes                                    | Yes                                    | [CancelApplication](APT:CancelApplication "wikilink")                           |
| 0x001E0084     |                                   | Yes                                    | Yes                                    | [StartLibraryApplet](APT:StartLibraryApplet "wikilink")                         |
| 0x001F0084     |                                   | Yes                                    | Yes                                    | [StartSystemApplet](APT:StartSystemApplet "wikilink")                           |
| 0x00200044     |                                   | Yes                                    | Yes                                    | [StartNewestHomeMenu](APT:StartNewestHomeMenu "wikilink")                       |
| 0x00210000     |                                   | No                                     | No                                     | [OrderToCloseApplication](APT:OrderToCloseApplication "wikilink")               |
| 0x00220040     |                                   | Yes                                    | Yes                                    | [PrepareToCloseApplication](APT:PrepareToCloseApplication "wikilink")           |
| 0x00230040     |                                   | Yes                                    | Yes                                    | [PrepareToJumpToApplication](APT:PrepareToJumpToApplication "wikilink")         |
| 0x00240044     |                                   | Yes                                    | Yes                                    | [JumpToApplication](APT:JumpToApplication "wikilink")                           |
| 0x002500C0     |                                   | Yes                                    | Yes                                    | [PrepareToCloseLibraryApplet](APT:PrepareToCloseLibraryApplet "wikilink")       |
| 0x00260000     |                                   | Yes                                    | Yes                                    | [PrepareToCloseSystemApplet](APT:PrepareToCloseSystemApplet "wikilink")         |
| 0x00270044     |                                   | Yes                                    | Yes                                    | [CloseApplication](APT:CloseApplication "wikilink")                             |
| 0x00280044     |                                   | Yes                                    | Yes                                    | [CloseLibraryApplet](APT:CloseLibraryApplet "wikilink")                         |
| 0x00290044     |                                   | Yes                                    | Yes                                    | [CloseSystemApplet](APT:CloseSystemApplet "wikilink")                           |
| 0x002A0000     |                                   | Yes                                    | Yes                                    | [OrderToCloseSystemApplet](APT:OrderToCloseSystemApplet "wikilink")             |
| 0x002B0000     |                                   | Yes                                    | Yes                                    | [PrepareToJumpToHomeMenu](APT:PrepareToJumpToHomeMenu "wikilink")               |
| 0x002C0044     |                                   | Yes                                    | Yes                                    | [JumpToHomeMenu](APT:JumpToHomeMenu "wikilink")                                 |
| 0x002D0000     |                                   | Yes                                    | Yes                                    | [PrepareToLeaveHomeMenu](APT:PrepareToLeaveHomeMenu "wikilink")                 |
| 0x002E0044     |                                   | Yes                                    | Yes                                    | [LeaveHomeMenu](APT:LeaveHomeMenu "wikilink")                                   |
| 0x002F0040     |                                   | Yes                                    | Yes                                    | [PrepareToLeaveResidentApplet](APT:PrepareToLeaveResidentApplet "wikilink")     |
| 0x00300044     |                                   | Yes                                    | Yes                                    | [LeaveResidentApplet](APT:LeaveResidentApplet "wikilink")                       |
| 0x00310100     |                                   | Yes                                    | Yes                                    | [PrepareToDoApplicationJump](APT:PrepareToDoApplicationJump "wikilink")         |
| 0x00320084     |                                   | Yes                                    | Yes                                    | [DoApplicationJump](APT:DoApplicationJump "wikilink")                           |
| 0x00330000     |                                   | Yes                                    | Yes                                    | [GetProgramIdOnApplicationJump](APT:GetProgramIdOnApplicationJump "wikilink")   |
| 0x00340084     |                                   | Yes                                    | Yes                                    | [SendDeliverArg](APT:SendDeliverArg "wikilink")                                 |
| 0x00350080     |                                   | Yes                                    | Yes                                    | [ReceiveDeliverArg](APT:ReceiveDeliverArg "wikilink")                           |
| 0x00360040     |                                   | Yes                                    | Yes                                    | [LoadSysMenuArg](APT:LoadSysMenuArg "wikilink")                                 |
| 0x00370042     |                                   | Yes                                    | Yes                                    | [StoreSysMenuArg](APT:StoreSysMenuArg "wikilink")                               |
| 0x00380040     |                                   | Yes                                    | Yes                                    | [PreloadResidentApplet](APT:PreloadResidentApplet "wikilink")                   |
| 0x00390040     |                                   | Yes                                    | Yes                                    | [PrepareToStartResidentApplet](APT:PrepareToStartResidentApplet "wikilink")     |
| 0x003A0044     |                                   | Yes                                    | Yes                                    | [StartResidentApplet](APT:StartResidentApplet "wikilink")                       |
| 0x003B0040     |                                   | Yes                                    | Yes                                    | [CancelLibraryApplet](APT:CancelLibraryApplet "wikilink")                       |
| 0x003C0042     |                                   | Yes                                    | Yes                                    | [SendDspSleep](APT:SendDspSleep "wikilink")                                     |
| 0x003D0042     |                                   | Yes                                    | Yes                                    | [SendDspWakeUp](APT:SendDspWakeUp "wikilink")                                   |
| 0x003E0080     |                                   | Yes                                    | Yes                                    | [ReplySleepQuery](APT:ReplySleepQuery "wikilink")                               |
| 0x003F0040     |                                   | Yes                                    | Yes                                    | [ReplySleepNotificationComplete](APT:ReplySleepNotificationComplete "wikilink") |
| 0x00400042     |                                   | Yes                                    | Yes                                    | [SendCaptureBufferInfo](APT:SendCaptureBufferInfo "wikilink")                   |
| 0x00410040     |                                   | Yes                                    | Yes                                    | [ReceiveCaptureBufferInfo](APT:ReceiveCaptureBufferInfo "wikilink")             |
| 0x00420080     |                                   | Yes                                    | Yes                                    | [SleepSystem](APT:SleepSystem "wikilink")                                       |
| 0x00430040     |                                   | Yes                                    | Yes                                    | [NotifyToWait](APT:NotifyToWait "wikilink")                                     |
| 0x00440000     |                                   | Yes                                    | Yes                                    | [GetSharedFont](APT:GetSharedFont "wikilink")                                   |
| 0x00450040     |                                   | Yes                                    | Yes                                    | [GetWirelessRebootInfo](APT:GetWirelessRebootInfo "wikilink")                   |
| 0x00460104     |                                   | Yes                                    | Yes                                    | [Wrap](APT:Wrap "wikilink")                                                     |
| 0x00470104     |                                   | Yes                                    | Yes                                    | [Unwrap](APT:Unwrap "wikilink")                                                 |
| 0x00480100     |                                   | No                                     | No                                     | [GetProgramInfo](APT:GetProgramInfo "wikilink")                                 |
| 0x00490180     |                                   | No                                     | No                                     | [Reboot](APT:Reboot "wikilink")                                                 |
| 0x004A0040     |                                   | Yes                                    | Yes                                    | [GetCaptureInfo](APT:GetCaptureInfo "wikilink")                                 |
| 0x004B00C2     |                                   | Yes                                    | Yes                                    | [AppletUtility](APT:AppletUtility "wikilink")                                   |
| 0x004C0000     |                                   | Yes                                    | Yes                                    | [SetFatalErrDispMode](APT:SetFatalErrDispMode "wikilink")                       |
| 0x004D0080     |                                   | Yes                                    | Yes                                    | [GetAppletProgramInfo](APT:GetAppletProgramInfo "wikilink")                     |
| 0x004E0000     |                                   | Yes                                    | Yes                                    | [HardwareResetAsync](APT:HardwareResetAsync "wikilink")                         |
| 0x004F0080     | [2.2.0-X](2.2.0-X "wikilink")     | Yes                                    | Yes                                    | [SetApplicationCpuTimeLimit](APT:SetApplicationCpuTimeLimit "wikilink")         |
| 0x00500040     | [2.2.0-X](2.2.0-X "wikilink")     | Yes                                    | Yes                                    | [GetApplicationCpuTimeLimit](APT:GetApplicationCpuTimeLimit "wikilink")         |
| 0x00510080     | [3.0.0-5](3.0.0-5 "wikilink")     | Yes                                    | Yes                                    | [GetStartupArgument](APT:GetStartupArgument "wikilink")                         |
| 0x00520104     | [4.0.0-7](4.0.0-7 "wikilink")     | Yes                                    | Yes                                    | [Wrap1](APT:Wrap1 "wikilink")                                                   |
| 0x00530104     | [4.0.0-7](4.0.0-7 "wikilink")     | Yes                                    | Yes                                    | [Unwrap1](APT:Unwrap1 "wikilink")                                               |
| 0x00540040     | [5.0.0-11](5.0.0-11 "wikilink")   | Yes                                    | Yes                                    | Takes an unknown parameter, outputs a result code and media type.               |
| 0x00550040     | [7.0.0-13](7.0.0-13 "wikilink")   | Yes                                    | Yes                                    | [SetScreenCapturePostPermission](APT:SetScreenCapturePostPermission "wikilink") |
| 0x00560000     | [7.0.0-13](7.0.0-13 "wikilink")   | Yes                                    | Yes                                    | [GetScreenCapturePostPermission](APT:GetScreenCapturePostPermission "wikilink") |
| 0x00570044     | [7.0.0-13](7.0.0-13 "wikilink")   | Yes                                    | Yes                                    | [WakeupApplication2](APT:WakeupApplication2 "wikilink")                         |
| 0x00580002     | [7.0.0-13](7.0.0-13 "wikilink")   | Yes                                    | Yes                                    | [GetProgramID](APT:GetProgramID "wikilink")                                     |
| 0x01010000     | [8.0.0-18](8.0.0-18 "wikilink")   | Yes                                    | Yes                                    | [GetTargetPlatform](APT:GetTargetPlatform "wikilink")                           |
| 0x01020000     | [8.0.0-18](8.0.0-18 "wikilink")   | Yes                                    | Yes                                    | [CheckNew3DS](APT:CheckNew3DS "wikilink")                                       |
| 0x01030000     | [8.0.0-18](8.0.0-18 "wikilink")   | Yes                                    | Yes                                    | [GetApplicationRunningMode](APT:GetApplicationRunningMode "wikilink")           |
| 0x01040000     | [8.0.0-18](8.0.0-18 "wikilink")   | Yes                                    | Yes                                    | [IsStandardMemoryLayout](APT:IsStandardMemoryLayout "wikilink")                 |
| 0x01050100     | [10.4.0-29](10.4.0-29 "wikilink") | Yes                                    | Yes                                    | [IsTitleAllowed](APT:IsTitleAllowed "wikilink")                                 |

These "APT:U" and "APT:S" NS services can handle launching
titles/"applets", these services handle signaling for home/power button
as well. Only one session for either APT service can be open at a time,
normally processes close the service handle immediately once finished
using the service. The commands for <APT:U> and <APT:S> are exactly the
same, however certain commands are only accessible with <APT:S(NS>
module will call [svcBreak](SVC "wikilink") when the command isn't
accessible).

Applets returning to home-menu first use commands
<APT:PrepareToJumpToHomeMenu> and <APT:JumpToHomeMenu>, followed by
these commands to launch home-menu:
[<APT:PrepareToStartSystemApplet>](APT:PrepareToStartSystemApplet "wikilink")
and [<APT:StartSystemApplet>](APT:StartSystemApplet "wikilink").
[<APT:PrepareToStartSystemApplet>](APT:PrepareToStartSystemApplet "wikilink")
and [<APT:StartSystemApplet>](APT:StartSystemApplet "wikilink") are also
used for launching the [Internet Browser](Internet_Browser "wikilink"),
the camera applet, etc.

Processes launch applications via home-menu, not directly with
[<APT:PrepareToStartApplication>](APT:PrepareToStartApplication "wikilink")
and [<APT:StartApplication>](APT:StartApplication "wikilink"). Regular
applications can't directly launch applications since
[<APT:StartApplication>](APT:StartApplication "wikilink") launches the
process without terminating the currently running application.

<APT:PrepareToDoApplicationJump> and <APT:DoApplicationJump> are used by
applications, for launching native/<non-NATIVE_FIRM> applications. These
commands notify Home Menu that title launching needs done, Home Menu
does the actual title launching via NS commands.

## AppletAttr

| Bits | Description                                           |
|------|-------------------------------------------------------|
| 0-2  | [AppletPos](NS_and_APT_Services#appletpos "wikilink") |
| 3    | Manually Acquire/Release GPU Rights                   |
| 4    | Manually Acquire/Release DSP Rights                   |
| 5    | ?                                                     |

## DisplayBufferMode

| Value      | Description         |
|------------|---------------------|
| 0          | FORMAT_R8G8B8A8     |
| 1          | FORMAT_R8G8B8       |
| 2          | FORMAT_R5G6B5       |
| 3          | FORMAT_R5G5B5A1     |
| 4          | FORMAT_R4G4B4A4     |
| 0xFFFFFFFF | FORMAT_UNIMPORTABLE |

This is the same mapping as used for the [GPU framebuffer color
formats](GPU/External_Registers#framebuffer_color_formats "wikilink").

## AppletPos

| Value | Description  |
|-------|--------------|
| -1    | POS_NONE     |
| 0     | POS_APP      |
| 1     | POS_APPLIB   |
| 2     | POS_SYS      |
| 3     | POS_SYSLIB   |
| 4     | POS_RESIDENT |

## QueryReply

| Value | Description  |
|-------|--------------|
| 0     | REPLY_REJECT |
| 1     | REPLY_ACCEPT |
| 2     | REPLY_LATER  |

## Notification

| Value | Description                         |
|-------|-------------------------------------|
| 0     | NOTIFICATION_NONE                   |
| 1     | NOTIFICATION_HOME_BUTTON_1          |
| 2     | NOTIFICATION_HOME_BUTTON_2          |
| 3     | NOTIFICATION_SLEEP_QUERY            |
| 4     | NOTIFICATION_SLEEP_CANCELED_BY_OPEN |
| 5     | NOTIFICATION_SLEEP_ACCEPTED         |
| 6     | NOTIFICATION_SLEEP_AWAKE            |
| 7     | NOTIFICATION_SHUTDOWN               |
| 8     | NOTIFICATION_POWER_BUTTON_CLICK     |
| 9     | NOTIFICATION_POWER_BUTTON_CLEAR     |
| 10    | NOTIFICATION_TRY_SLEEP              |
| 11    | NOTIFICATION_ORDER_TO_CLOSE         |

## Command

| Value | Description                                                                                                                                                |
|-------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0     | COMMAND_NONE                                                                                                                                               |
| 1     | COMMAND_WAKEUP                                                                                                                                             |
| 2     | COMMAND_REQUEST                                                                                                                                            |
| 3     | COMMAND_RESPONSE                                                                                                                                           |
| 4     | COMMAND_EXIT                                                                                                                                               |
| 5     | COMMAND_MESSAGE                                                                                                                                            |
| 6     | COMMAND_HOME_BUTTON_SINGLE                                                                                                                                 |
| 7     | COMMAND_HOME_BUTTON_DOUBLE                                                                                                                                 |
| 8     | COMMAND_DSP_SLEEP                                                                                                                                          |
| 9     | COMMAND_DSP_WAKEUP                                                                                                                                         |
| 10    | COMMAND_WAKEUP_BY_EXIT                                                                                                                                     |
| 11    | COMMAND_WAKEUP_BY_PAUSE                                                                                                                                    |
| 12    | COMMAND_WAKEUP_BY_CANCEL                                                                                                                                   |
| 13    | COMMAND_WAKEUP_BY_CANCELALL                                                                                                                                |
| 14    | COMMAND_WAKEUP_BY_POWER_BUTTON_CLICK                                                                                                                       |
| 15    | COMMAND_WAKEUP_TO_JUMP_HOME                                                                                                                                |
| 16    | COMMAND_REQUEST_FOR_SYS_APPLET                                                                                                                             |
| 17    | COMMAND_WAKEUP_TO_LAUNCH_APPLICATION                                                                                                                       |
| 0x41  | Unknown. [Received](APT:ReceiveParameter "wikilink") by Home Menu during boot when the Home Menu process doesn't terminate properly(svcExitProcess/crash). |

## AppletPreparationState

| Value | Description                    |
|-------|--------------------------------|
| 0     | NO_PREPARATION                 |
| 1     | PREPARED_TO_LAUNCH_APP         |
| 2     | PREPARED_TO_CLOSE_APP          |
| 3     | PREPARED_TO_FORCE_TO_CLOSE_APP |
| 4     | PREPARED_TO_PRELOAD_APPLIB     |
| 5     | PREPARED_TO_LAUNCH_APPLIB      |
| 6     | PREPARED_TO_CLOSE_APPLIB       |
| 7     | PREPARED_TO_LAUNCH_SYS         |
| 8     | PREPARED_TO_CLOSE_SYS          |
| 9     | PREPARED_TO_PRELOAD_SYSLIB     |
| 10    | PREPARED_TO_LAUNCH_SYSLIB      |
| 11    | PREPARED_TO_CLOSE_SYSLIB       |
| 12    | PREPARED_TO_LAUNCH_RESIDENT    |
| 13    | PREPARED_TO_LEAVE_RESIDENT     |
| 14    | PREPARED_TO_DO_HOMEMENU        |
| 15    | PREPARED_TO_LEAVE_HOMEMENU     |
| 16    | PREPARED_TO_START_RESIDENT     |
| 17    | PREPARED_TO_DO_APP_JUMP        |
| 18    | PREPARED_TO_FORCE_TO_CLOSE_SYS |
| 19    | PREPARED_TO_LAUNCH_OTHER_SYS   |
| 20    | PREPARED_TO_JUMP_TO_APP        |

## StartupArgumentType

| Value | Description                       |
|-------|-----------------------------------|
| 0     | STARTUP_ARGUMENT_TYPE_OTHER_APP   |
| 1     | STARTUP_ARGUMENT_TYPE_RESTART     |
| 2     | STARTUP_ARGUMENT_TYPE_OTHER_MEDIA |

## CaptureBufferInfo

| Offset | Size | Description                                                                       |
|--------|------|-----------------------------------------------------------------------------------|
| 0x0    | 0x4  | u32, Size                                                                         |
| 0x4    | 0x1  | u8, 3D (0 = not 3D, 1 = 3D)                                                       |
| 0x5    | 0x3  | Reserved                                                                          |
| 0x8    | 0x4  | Main Screen Left Offset                                                           |
| 0xC    | 0x4  | Main Screen Right Offset                                                          |
| 0x10   | 0x4  | Main Screen [DisplayBufferMode](NS_and_APT_Services#displaybuffermode "wikilink") |
| 0x14   | 0x4  | Sub Screen Left Offset                                                            |
| 0x18   | 0x4  | Sub Screen Right Offset                                                           |
| 0x1C   | 0x4  | Sub Screen [DisplayBufferMode](NS_and_APT_Services#displaybuffermode "wikilink")  |

## WirelessRebootInfo

| Offset | Size | Description              |
|--------|------|--------------------------|
| 0x0    | 0x6  | Host MAC address.        |
| 0x6    | 0x9  | WirelessRebootPassphrase |
| 0xF    | 0x1  | Uninitialized            |

This is [setup](NSS:SetWirelessRebootInfo "wikilink") by the dlplay
system-application, before launching the DLP-child which can then use
[<APT:GetWirelessRebootInfo>](APT:GetWirelessRebootInfo "wikilink"). The
MAC address and passphrase is used for connecting to the host by the
DLP-child. See also [here](DLP_Services "wikilink").

# "APT:A" Service

This was added with [7.0.0-X](7.0.0-13 "wikilink"). Official apps built
with the CTRSDK for system-version \>=[7.0.0-X](7.0.0-13 "wikilink")
normally use the "APT:A" service instead of "APT:U". Those processes
also have "APT:A" instead of "APT:U" in the service-access-control.
Unlike APT:U, APT:A can call
[APT:GetAppletInfo](APT:GetAppletInfo "wikilink") with applet ID
0x300.

# Applets

NS module does not verify that the input appID for the APT service cmds
are correct for that type of command. For example, a process-launch of a
SystemApplet via LibraryApplet commands works fine(minus the
launched-process side of APT probably).

## System Applets

On Old3DS there could only be one applet here(Home Menu, Internet
Browser, Friend-List, etc) with programID-high 00040030 running at a
time. On Old3DS when directly launching one of these 00040030 applets
with Home Menu, the Home Menu process will terminate once the process is
launched. On Old3DS when returning to Home Menu from that launched
process, the Home Menu process is launched again.

On New3DS the Home Menu process is still running/in-memory, while
another system-applet is running. On New3DS it appears that the Home
Menu process is terminated+relaunched, when another system-applet
terminated without exiting with APT properly.

## Library Applets

Library applets can be launched by applications and regular applets.
These library applets render to the screen(s) when running, etc. For
example, this includes swkbd for text input. See the below appIDs in the
0x2XX range, the actual appID used is 0x4XX however.

Input data can be sent to the library applet via the NS
[parameter](APT:SendParameter "wikilink") buffer, and/or with
shared-memory with a shared-mem handle sent to the library applet.
Output data from the library applet can be received by
[<APT:ReceiveParameter>](APT:ReceiveParameter "wikilink"), the library
applet can also use the specified shared-mem for output too.

# AppIDs

| AppID | Description                                                                 |
|-------|-----------------------------------------------------------------------------|
| 0x101 | [Home Menu](Home_Menu "wikilink") (menu)                                    |
| 0x103 | Alternate Menu                                                              |
| 0x110 | Camera applet ([CtrApp](Camera_Applet "wikilink"))                          |
| 0x112 | Friends List applet ([friend](Friend_List "wikilink"))                      |
| 0x113 | Game Notes applet (Cherry)                                                  |
| 0x114 | [Internet Browser](Internet_Browser "wikilink") (spider/SKATER)             |
| 0x115 | Instruction Manual applet                                                   |
| 0x116 | [Notifications](Notifications "wikilink") applet (newslist)                 |
| 0x117 | Miiverse applet (olv)                                                       |
| 0x118 | [Miiverse](Miiverse "wikilink") posting applet (solv3)                      |
| 0x119 | Amiibo settings (cabinet)                                                   |
| 0x201 | Software Keyboard (swkbd) (?)                                               |
| 0x202 | [Mii Selector](Mii_Selector "wikilink") (appletEd) (?)                      |
| 0x204 | Photo Selector (PNOTE_AP) (?)                                               |
| 0x205 | Sound Selector (SNOTE_AP) (?)                                               |
| 0x206 | Error Display ([error](ErrDisp "wikilink")) (?)                             |
| 0x207 | eShop applet ([mint](EShop#ns_eshop_application_parameters "wikilink")) (?) |
| 0x208 | Circle Pad Pro Calibrator ([extrapad](Extrapad_Applet "wikilink")) (?)      |
| 0x209 | Notepad (memolib) (?)                                                       |
| 0x300 | Application                                                                 |
| 0x301 | eShop (tiger)                                                               |
| 0x401 | Software Keyboard (swkbd)                                                   |
| 0x402 | Mii Selector (appletEd)                                                     |
| 0x404 | Photo Selector (PNOTE_AP)                                                   |
| 0x405 | Sound Selector (SNOTE_AP)                                                   |
| 0x406 | Error Display (error)                                                       |
| 0x407 | eShop applet (mint)                                                         |
| 0x408 | Circle Pad Pro Calibrator ([extrapad](Extrapad_Applet "wikilink"))          |
| 0x409 | Notepad (memolib)                                                           |
| 0xF10 | ProgramID: 0004003000008900.                                                |
| 0xF11 | ProgramID: 000400000FFFFD00.                                                |
| 0xF12 | ProgramID: 000400000FFFFC00.                                                |
| 0xF13 | ProgramID: 000400000FFFFB00.                                                |
| 0xF14 | ProgramID: 000400000FFFF900.                                                |
| 0xF15 | ProgramID: 000400000FFFF800.                                                |
| 0xF16 | ProgramID: 000400000FFFF700.                                                |
| 0xF17 | ProgramID: 000400000FFFF600.                                                |
| 0xF18 | ProgramID: 000400000FFFF500.                                                |

These AppIDs are all for NAND titles, except for 0x300. AppIDs in the
0x1XX range are applets(programID-high 00040030), and the AppIDs in the
0x2XX range are "system libraries"(programID-high 00040030). The 0xFXX
AppID range is for development NAND applications, these are not
available for retail.

Note that at some point the total AppID entry count was changed from 28
to 27.

[Category:Services](Category:Services "wikilink")
