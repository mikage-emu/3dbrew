+++
title = 'BOSS Services'
+++

## BOSS Service "boss:U"

| Command Header | Description                                                                                                                                                                                                                                        |
|----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00010082     | [InitializeSession](BOSSU:InitializeSession "wikilink")                                                                                                                                                                                            |
| 0x00020100     | [SetStorageInfo](BOSS:SetStorageInfo "wikilink")                                                                                                                                                                                                   |
| 0x00030000     | [UnregisterStorage](BOSS:UnregisterStorage "wikilink")                                                                                                                                                                                             |
| 0x00040000     | GetStorageInfo                                                                                                                                                                                                                                     |
| 0x00050042     | RegisterPrivateRootCa                                                                                                                                                                                                                              |
| 0x00060084     | RegisterPrivateClientCert (u32 Size0, u32 Size1, ((Size0\<\<4) \| 10), Buf0, ((Size1\<\<4) \| 10), Buf1) This writes the content of the input buffers into files "bossdb:/%s_CL" and "bossdb:/%s_CLK", where "%s" is generated from the programID. |
| 0x00070000     | GetNewArrivalFlag                                                                                                                                                                                                                                  |
| 0x00080002     | [RegisterNewArrivalEvent](BOSS:RegisterNewArrivalEvent "wikilink"): Used for sending a handle. This is used with a table of programIDs etc with a maximum of 5 entries.                                                                            |
| 0x00090040     | [SetOptoutFlag](BOSS:SetOptoutFlag "wikilink")                                                                                                                                                                                                     |
| 0x000A0000     | [GetOptoutFlag](BOSS:GetOptoutFlag "wikilink")                                                                                                                                                                                                     |
| 0x000B00C2     | [RegisterTask](BOSSU:RegisterTask "wikilink")                                                                                                                                                                                                      |
| 0x000C0082     | [UnregisterTask](BOSSU:UnregisterTask "wikilink")                                                                                                                                                                                                  |
| 0x000D0082     | [ReconfigureTask](BOSSU:ReconfigureTask "wikilink")                                                                                                                                                                                                |
| 0x000E0000     | [GetTaskIdList](BOSSU:GetTaskIdList "wikilink")                                                                                                                                                                                                    |
| 0x000F0042     | GetStepIdList                                                                                                                                                                                                                                      |
| 0x00100102     | [GetNsDataIdList](BOSSU:GetNsDataIdList "wikilink")                                                                                                                                                                                                |
| 0x00110102     | [GetNsDataIdList1](BOSS:GetNsDataIdList1 "wikilink")                                                                                                                                                                                               |
| 0x00120102     | [GetNsDataIdList2](BOSS:GetNsDataIdList2 "wikilink")                                                                                                                                                                                               |
| 0x00130102     | [GetNsDataIdList3](BOSS:GetNsDataIdList3 "wikilink")                                                                                                                                                                                               |
| 0x00140082     | [SendProperty](BOSSU:SendProperty "wikilink")                                                                                                                                                                                                      |
| 0x00150042     | [SendPropertyHandle](BOSSU:SendPropertyHandle "wikilink")                                                                                                                                                                                          |
| 0x00160082     | [ReceiveProperty](BOSSU:ReceiveProperty "wikilink")                                                                                                                                                                                                |
| 0x00170082     | UpdateTaskInterval                                                                                                                                                                                                                                 |
| 0x00180082     | UpdateTaskCount                                                                                                                                                                                                                                    |
| 0x00190042     | GetTaskInterval                                                                                                                                                                                                                                    |
| 0x001A0042     | GetTaskCount                                                                                                                                                                                                                                       |
| 0x001B0042     | GetTaskServiceStatus                                                                                                                                                                                                                               |
| 0x001C0042     | [StartTask](BOSSU:StartTask "wikilink")                                                                                                                                                                                                            |
| 0x001D0042     | [StartTaskImmediate](BOSSU:StartTaskImmediate "wikilink")                                                                                                                                                                                          |
| 0x001E0042     | [CancelTask](BOSSU:CancelTask "wikilink")                                                                                                                                                                                                          |
| 0x001F0000     | [GetTaskFinishHandle](BOSS:GetTaskFinishHandle "wikilink")                                                                                                                                                                                         |
| 0x00200082     | [GetTaskState](BOSSU:GetTaskState "wikilink")                                                                                                                                                                                                      |
| 0x00210042     | GetTaskResult                                                                                                                                                                                                                                      |
| 0x00220042     | GetTaskCommErrorCode                                                                                                                                                                                                                               |
| 0x002300C2     | GetTaskStatus                                                                                                                                                                                                                                      |
| 0x00240082     | GetTaskError                                                                                                                                                                                                                                       |
| 0x00250082     | GetTaskInfo                                                                                                                                                                                                                                        |
| 0x00260040     | [DeleteNsData](BOSS:DeleteNsData "wikilink")                                                                                                                                                                                                       |
| 0x002700C2     | [GetNsDataHeaderInfo](BOSSU:GetNsDataHeaderInfo "wikilink")                                                                                                                                                                                        |
| 0x00280102     | [ReadNsData](BOSSU:ReadNsData "wikilink")                                                                                                                                                                                                          |
| 0x00290080     | SetNsDataAdditionalInfo                                                                                                                                                                                                                            |
| 0x002A0040     | GetNsDataAdditionalInfo. Writes an output u32 to cmdreply\[2\].                                                                                                                                                                                    |
| 0x002B0080     | SetNsDataNewFlag                                                                                                                                                                                                                                   |
| 0x002C0040     | GetNsDataNewFlag                                                                                                                                                                                                                                   |
| 0x002D0040     | GetNsDataLastUpdate (u32 NsDataId) Writes an output u64 to cmdreply\[2-3\], from the content file in extdata.                                                                                                                                      |
| 0x002E0040     | [GetErrorCode](BOSS:GetErrorCode "wikilink")                                                                                                                                                                                                       |
| 0x002F0140     | RegisterStorageEntry                                                                                                                                                                                                                               |
| 0x00300000     | GetStorageEntryInfo                                                                                                                                                                                                                                |
| 0x00310100     | SetStorageOption                                                                                                                                                                                                                                   |
| 0x00320000     | GetStorageOption                                                                                                                                                                                                                                   |
| 0x00330042     | [StartBgImmediate](BOSS:StartBgImmediate "wikilink")                                                                                                                                                                                               |
| 0x00340042     | [GetTaskProperty0](BOSS:GetTaskProperty0 "wikilink")                                                                                                                                                                                               |
| 0x003500C2     | RegisterImmediateTask                                                                                                                                                                                                                              |
| 0x00360084     | SetTaskQuery (u32 TaskID_Size, u32 BufSize, ((TaskID_Size\<\<4) \| 10), TaskID_buf, ((BufSize\<\<4) \| 10), Buf) BufSize must match 0x60.                                                                                                          |
| 0x00370084     | GetTaskQuery (u32 TaskID_Size, u32 BufSize, ((TaskID_Size\<\<4) \| 10), TaskID_buf, ((BufSize\<\<4) \| 10), Buf) BufSize must match 0x60.                                                                                                          |

## Privileged BOSS Service "boss:P"

| Command Header | Description                                                                     |
|----------------|---------------------------------------------------------------------------------|
| 0x04010082     | [InitializeSessionPrivileged](BOSSP:InitializeSessionPrivileged "wikilink")     |
| 0x04040080     | [GetAppNewFlag](BOSSP:GetAppNewFlag "wikilink")                                 |
| 0x040500C0     | unknown...                                                                      |
| 0x040600C0     | unknown...                                                                      |
| 0x04070080     | unknown...                                                                      |
| 0x04090102     | unknown...                                                                      |
| 0x040B0080     | unknown...                                                                      |
| 0x040D0182     | [GetNsDataIdListPrivileged](BOSSP:GetNsDataIdListPrivileged "wikilink")         |
| 0x040E0182     | [GetNsDataIdListPrivileged1](BOSSP:GetNsDataIdListPrivileged1 "wikilink")       |
| 0x04130082     | [SendPropertyPrivileged](BOSSP:SendPropertyPrivileged "wikilink")               |
| 0x041500C0     | DeleteNsDataPrivileged                                                          |
| 0x04160142     | [GetNsDataHeaderInfoPrivileged](BOSSP:GetNsDataHeaderInfoPrivileged "wikilink") |
| 0x04170182     | [ReadNsDataPrivileged](BOSSP:ReadNsDataPrivileged "wikilink")                   |
| 0x041A0100     | SetNsDataNewFlagPrivileged                                                      |
| 0x041B00C0     | GetNsDataNewFlagPrivileged                                                      |
| 0x041C00C0     | unknown...                                                                      |
| 0x042E00C2     | unknown...                                                                      |
| 0x042F00C2     | unknown...                                                                      |
| 0x043000C2     | unknown...                                                                      |
| 0x04490142     | unknown...                                                                      |
| 0x044A0180     | unknown...                                                                      |
| 0x044D0080     | unknown...                                                                      |
| 0x04500102     | unknown...                                                                      |
| 0x04540102     | unknown...                                                                      |
| 0x045500C2     | unknown...                                                                      |
| 0x04580104     | ?                                                                               |

boss:P also contains all of the commands from boss:U.

When Home Menu loads the SpotPass [CBMD](CBMD "wikilink") with
[Extended_Banner](Extended_Banner "wikilink"), it uses bossP command
0x040D0182 first. Then it uses GetNsDataHeaderInfoPrivileged, then
ReadNsDataPrivileged for loading the actual banner data.

## BOSS Service "boss:M"

## programIDs

BOSS uses programIDs raw without any handling for the New3DS
programID-low bitmask. For example, attempting a NsDataId listing with
the New3DS bitmask set will fail, if BOSS is only setup for that
programID with the New3DS bitmask clear.

When [initializing](BOSSU:InitializeSession "wikilink") BOSS with the
default programID, the New3DS programID-low bitmask is always clear for
New3DS titles since that's how it was originally registered with
[FS](Filesystem_services "wikilink"). Hence, the programID in the
[BOSS-container](SpotPass "wikilink") must always have the New3DS
bitmask clear. This also means everything using the BOSSP commands with
the raw programIDs loaded from AM title-listing are broken with New3DS
titles, for example [Extended_Banner](Extended_Banner "wikilink").

## Content Data Storage

SpotPass content for each application is stored under the extdata
specified by [BOSS:SetStorageInfo](BOSS:SetStorageInfo "wikilink").
Certain commands verify that the PID associated with the current service
session has access to the specified extdata by using
[FS:CheckAuthorityToAccessExtSaveData](FS:CheckAuthorityToAccessExtSaveData "wikilink"),
returning an error on failure. This basically renders SpotPass unusable
under user-processes(when initialized under those processes) which don't
have access to any SD extdata(unless NAND extdata is used instead).

All of these commands using
[FS:CheckAuthorityToAccessExtSaveData](FS:CheckAuthorityToAccessExtSaveData "wikilink")
are: [BOSS:SetStorageInfo](BOSS:SetStorageInfo "wikilink") and
RegisterStorageEntry, for both BOSSU and BOSSP.

BOSS-container content is stored in the extdata registered for the
programID specified in the BOSS-container, what task it's associated
with / what title registered it is irrelevant with BOSS-container data
storage.

## Custom SpotPass content

SpotPass supports raw content download without using the
encrypted+signed SpotPass container(raw content is used by [Home
Menu](Home_Menu "wikilink") SpotPass VersionList for example). However,
this is incompatible with the data-loading method used with
SpotPass-container content(NsData commands can't be used with it).

When writing the raw content, it firsts deletes and creates the
"<taskID>" file under the data-storage extdata with normal extdata(not
the separate boss archive). Once successful, the final filename
specified by the task config will be deleted if needed, then the
"<taskID>" file will be renamed to the final filename. Afterwards, the
user-process can access the final file just like any other extdata file.

For using custom content with the SpotPass container(like official
titles), the only known ways to do so is: "CFW" / ARM11-kernelhax with
the sigchecks for this patched, or some sort of BOSS-sysmodule exploit
if there's any vulns to begin with.

## HTTP upload

SpotPass tasks can be used for uploading data via HTTP POST. The exact
method varies, but the main one is a
[raw](HTTPC:SendPOSTDataRawTimeout "wikilink") POST.

The content data is loaded from the following path: snprintf(outpath,
outpathsize, "%s/%s%02x.up", archivepath, taskidstr_probably, unk);

The archivepath can be either "bossdb:"(BOSS-sysmodule NAND savedata) or
the content-data-storage extdata. Certain other paths in the BOSS
savedata can be used too.

## BOSS Tasks

The TaskID is a 8-byte buffer containing a string including
NUL-terminator(taskIDs are compared with: strncmp(str0, str1, 7)).

When disabling SpotPass, applications use
[BOSSU:CancelTask](BOSSU:CancelTask "wikilink") then
[BOSSU:UnregisterTask](BOSSU:UnregisterTask "wikilink"), to delete each
task.

Each process can only access tasks which it created, not other
processes' tasks(even when using bossP with
[init_programID](BOSSP:InitializeSessionPrivileged "wikilink")=0).

After registration, tasks will not automatically run until they are
started using one of the start-task commands.

## NsDataId

This is an u32 ID for SpotPass content, used with the NsData service
commands etc.

## NsDataHeaderInfo

When the input type is not one of the below or when the specified output
size doesn't match the expected size for this type, an error is
returned.

### Type0

Total size is 0x8-bytes.

| Offset | Size | Description |
|--------|------|-------------|
| 0x0    | 0x8  | programID   |

### Type1

Total size is 0x4-bytes.

| Offset | Size | Description |
|--------|------|-------------|
| 0x0    | 0x4  | ?           |

### Type2

Total size is 0x4-bytes.

| Offset | Size | Description                                                                   |
|--------|------|-------------------------------------------------------------------------------|
| 0x0    | 0x4  | Content data-type, originally from the [BOSS-container](SpotPass "wikilink"). |

### Type3

Total size is 0x4-bytes.

| Offset | Size | Description  |
|--------|------|--------------|
| 0x0    | 0x4  | Content size |

### Type4

Total size is 0x4-bytes.

| Offset | Size | Description |
|--------|------|-------------|
| 0x0    | 0x4  | ?           |

### Type5

Total size is 0x4-bytes.

| Offset | Size | Description |
|--------|------|-------------|
| 0x0    | 0x4  | ?           |

### Type6

Total size is 0x20-bytes.

| Offset | Size | Description                    |
|--------|------|--------------------------------|
| 0x0    | 0x8  | programID. Same data as Type0. |
| 0x8    | 0x4  | Same data as Type1.            |
| 0xC    | 0x4  | ?                              |
| 0x10   | 0x4  | Same data as Type3.            |
| 0x14   | 0xC  | ?                              |

## PropertyIDs

| ID   | Size  | Description                                                                                                                                                                                                                                                                                               |
|------|-------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0  | 0x1   | Unknown. Example values used by official titles: 0x7D, 0xAA, ...                                                                                                                                                                                                                                          |
| 0x1  | 0x1   | Unknown. Usually 0x1?                                                                                                                                                                                                                                                                                     |
| 0x2  | 0x4   | Unknown. Usually 0x0?                                                                                                                                                                                                                                                                                     |
| 0x3  | 0x4   | Interval in seconds.                                                                                                                                                                                                                                                                                      |
| 0x4  | 0x4   | Duration(?), ~0 = infinite. 0x1 can be used for running the task just once. Usually set to 0x64(100). When not set to ~0 this is decreased by 1 each time the task runs(or at least when it fails). Task processing is skipped when the current state value is already 0x0.                               |
| 0x5  | 0x1   | Unknown. Usually 0x2?                                                                                                                                                                                                                                                                                     |
| 0x6  | 0x1   | ?                                                                                                                                                                                                                                                                                                         |
| 0x7  | 0x200 | URL                                                                                                                                                                                                                                                                                                       |
| 0x8  | 0x4   | ?                                                                                                                                                                                                                                                                                                         |
| 0x9  | 0x1   | ?                                                                                                                                                                                                                                                                                                         |
| 0xA  | 0x100 | ?                                                                                                                                                                                                                                                                                                         |
| 0xB  | 0x200 | ?                                                                                                                                                                                                                                                                                                         |
| 0xC  |       | [BOSSU:SendPropertyHandle](BOSSU:SendPropertyHandle "wikilink") is used for this. This property is only setup for HTTP uploads? This can be used with [BOSSU:SendProperty](BOSSU:SendProperty "wikilink") too but that's not the intended use.                                                            |
| 0xD  | 0x360 | Contains additional HTTP headers to send in the request, otherwise this is all-zero. This is an array of 3 entries: +0x0 size 0x20 is the header name, and +0x20 size 0x100 is the header value. Example: header-name "Content-Type" at 0x0, with header-value "application/octet-stream" at offset 0x20. |
| 0xE  | 0x4   | This u32 is passed directly as an u32 certID for [HTTPC:SetClientCertDefault](HTTPC:SetClientCertDefault "wikilink")(without masking to u8), even when this field is set to 0.                                                                                                                            |
| 0xF  | 0xC   | 3 words. Last word is unknown, normally 0(non-zero doesn't seem to affect any HTTPC commands). [HTTPC:AddDefaultCert](HTTPC:AddDefaultCert "wikilink") is called twice for each of the first two words which are used as certIDs(not masked to u8).                                                       |
| 0x10 | 0x1   | When non-zero this enables loading the client cert+privk from FS, requires the filepaths to be actually set.                                                                                                                                                                                              |
| 0x11 | 0x1   | When non-zero this enables loading a trusted rootCA cert DER from FS, requires the filepath to be actually set.                                                                                                                                                                                           |
| 0x12 | 0x1   | ?                                                                                                                                                                                                                                                                                                         |
| 0x13 | 0x4   | ?                                                                                                                                                                                                                                                                                                         |
| 0x14 | 0x4   | ?                                                                                                                                                                                                                                                                                                         |
| 0x15 | 0x40  | ?                                                                                                                                                                                                                                                                                                         |
| 0x16 | 0x4   | ?                                                                                                                                                                                                                                                                                                         |
| 0x18 | 0x1   | ?                                                                                                                                                                                                                                                                                                         |
| 0x19 | 0x1   | ?                                                                                                                                                                                                                                                                                                         |
| 0x1A | 0x1   | ?                                                                                                                                                                                                                                                                                                         |
| 0x1B | 0x4   | ?                                                                                                                                                                                                                                                                                                         |
| 0x1C | 0x4   | ?                                                                                                                                                                                                                                                                                                         |
| 0x35 | 0x2   | u16 total_tasks. [BOSSU:GetTaskIdList](BOSSU:GetTaskIdList "wikilink") is used before [reading](BOSSU:ReceiveProperty "wikilink") this.                                                                                                                                                                   |
| 0x36 | 0x400 | List of TaskIDs. [BOSSU:GetTaskIdList](BOSSU:GetTaskIdList "wikilink") is used before [reading](BOSSU:ReceiveProperty "wikilink") this.                                                                                                                                                                   |
| 0x3B | 0x4   | ?                                                                                                                                                                                                                                                                                                         |
| 0x3E | 0x200 | ?                                                                                                                                                                                                                                                                                                         |
| 0x3F | 0x1   | ?                                                                                                                                                                                                                                                                                                         |

The only valid PropertyIDs for
[BOSSU:SendProperty](BOSSU:SendProperty "wikilink") are the ones listed
above, except 0x35 and 0x36. If the specified size for the command is
larger than the property size, it will use the actual property size
instead. When the specified size is less than the actual property size,
all of the property data that won't be written to is cleared.

## TaskStatus

| Value | Description                                                               |
|-------|---------------------------------------------------------------------------|
| 0x0   | Last task run was successful?                                             |
| 0x2   | Task started.                                                             |
| 0x5   | Task not started(also the initial state immediately after task creation). |
| 0x6   | Unknown                                                                   |
| 0x7   | Task processing failed(such as network error).                            |

This u8 is returned by
[BOSSU:GetTaskState](BOSSU:GetTaskState "wikilink").

## Errors

| Error-code | Description                                    |
|------------|------------------------------------------------|
| 0xC8A0F833 | taskID not found.                              |
| 0xC8A0F836 | taskID already exists, for task creation.      |
| 0xC8A0F842 | The specified programID is not setup for BOSS. |
| 0xC8A0F843 | The specified NsDataId was not found.          |