+++
title = 'IPC'
+++

The 3DS software stack follows a server/client architecture, where
common functionality is provided by global server processes through
interfaces called *ports* and *services*. Applications can access this
functionality by creating *sessions* to the provided services.
Technically, this is implemented using *interprocess communication*
(IPC).

## Concepts

### Sessions

Sessions are communication channels consisting of a client and server,
through which data can be exchanged in the form of a request and
response, respectively. Through sessions, the standard [IPC command
protocol](#Command_Structure "wikilink") is implemented. Clients use
their client session handle to send IPC commands to the server using
svcSendSyncRequest, while servers use svcReplyAndReceive to reply.
Client sessions can't be used with svcReplyAndReceive. In both cases,
the kernel takes care of transferring IPC command data from the [Thread
Local Storage](Thread_Local_Storage "wikilink") of the sending thread to
the TLS of the receiving thread. Sessions can be created through
svcCreateSession, which provides the caller with the client and server
handles.

Sessions are used in their raw form to implement [file
handles](FS:OpenFile "wikilink"). In this case, fs-module creates a raw
session using svcCreateSession, and provides the "fs:USER" client with
the resulting client session handle, keeping the server session handle
for its own use. These sessions expose their [own set of IPC
commands](Filesystem_services#File_service "wikilink") which act on the
file that was opened through fs:USER.

### Ports

Ports are interfaces for managing multiple client sessions to the same
high-level server. Ports are created through svcCreatePort, and can be
global or private. A global port is created by passing a name for the
port to svcCreatePort. Clients can start IPC sessions to global ports by
connecting to the port using svcConnectToPort, passing the desired port
name. If the port is private, it is not possible to create a session
through svcConnectToPort - sessions can only be created if one has a
handle to the port itself, obtained from the call to svcCreatePort. When
a client wishes to connect to a port (i.e. create a session), the server
must accept the new session using svcAcceptSession. The kernel notifies
the server whenever a new session is incoming via the server's port
handle. The server can wait for this notification through
svcWaitSynchronization or svcReplyAndReceive.

The two global ports usually found on retail are "srv:" ([service
manager](Services "wikilink")) and "err:f"
([ErrDisp](ErrDisp "wikilink")).

### Services

Services are an abstraction of ports that are managed by service
manager. Services cannot be connected to through svcConnectToPort, as
the underlying port is a private port. The service name is instead
entirely handled by service manager, and the kernel is not aware of it.
Clients are instead expected to open a session to a service using the
"srv:" port command [GetServiceHandle](SRV:GetServiceHandle "wikilink").
The client process must pass an access permission check for each service
(by name) that it attempts to request a session with. These permissions
are granted in the "service access control" of the title's [extended
header](NCCH/Extended_Header#ARM11_Local_System_Capabilities "wikilink").
A service is registered with service manager using the command
[RegisterService](SRV:RegisterService "wikilink").

Internally, service manager creates services by creating a private port
which it associates with the desired service name. The resulting server
port handle is returned in the RegisterService response, for the
server's own use (see ports). To create sessions to a service on behalf
of a client, service manager uses svcCreateSessionToPort, passing the
client port handle it obtained when creating the port, to the kernel.
Service manager then returns the resulting session handle to the client
in the GetServiceHandle response.

The majority of 3DS inter-process communication is implemented as
services.

### Shared Memory

Communication through port/service requests and replies may incur a big
bottleneck when exchanging large amounts of data because the kernel
needs to transfer the data between the two involved processes. There is
hence a complementary feature to share the same physical memory between
two processes. For this purpose, one process needs to create a block of
shared memory using svcCreateMemoryBlock such that the other process can
map it into its own virtual memory address space using
svcMapMemoryBlock. The memory block handle for the latter is provided
using a regular IPC command.

Many services use shared memory as a secondary command interface (e.g.
[GSP](GSP_Shared_Memory "wikilink")), the processing of which is
triggered through an IPC request (cf.
[GSPGPU:TriggerCmdReqQueue](GSPGPU:TriggerCmdReqQueue "wikilink")).

## Message Structure

IPC requests are written to the [Thread Local
Storage](Thread_Local_Storage "wikilink") at offset 0x80 and submitted
using [svcSendSyncRequest](SVC "wikilink"). If the kernel was able to
dispatch the request, the server reply will be written to TLS+0x80
before svcSendSyncRequest returns. By convention, the second word of the
response data is an error code (or 0 on success). IPC requests and IPC
replies follow the same structure.

Every IPC message starts with a u32 header code. Parameters (if any) are
written following this header. There are "normal parameters", which are
fixed-size words, and there are "translate parameters", which are of
flexible size and each of which begins with a header. The entire command
has the following structure:

| Word | Size | Description          |
|------|------|----------------------|
| 0    | 1    | Header code          |
| 1    | x    | Normal parameters    |
| 1+x  | y    | Translate parameters |

The IPC message header has the following structure:

| Bits  | Description                                                                                                                          |
|-------|--------------------------------------------------------------------------------------------------------------------------------------|
| 0-5   | Total size in words of the translate parameters (=y). Note that this is in general different from the number of translate parameters |
| 6-11  | Number of normal parameters (=x)                                                                                                     |
| 12-15 | Unused                                                                                                                               |
| 16-31 | Command ID                                                                                                                           |

When calling svcSendSyncRequest, the command id specifies a function
specific to the target service to call. When calling svcReplyAndReceive,
the command ID is generally ignored. However if it's 0xffff (and 0 is
passed for the reply target handle), the kernel will omit the IPC reply
and just wait for incoming IPC requests.

Each translate parameter starts with a translation descriptor:

| Bits | Description      |
|------|------------------|
| 1-3  | Translation type |

Translate parameters are modified/translated transparently by the
kernel. They are used to transfer handles/buffers between the different
processes.

The type of parameter is described by the bits 1-3 in the translation
descriptor. Parameter types accepted for sending by the kernel are: 0,
1, 2, 5, 6, 7.

For replies, only 0, 1, 5, 6, 7 are allowed. In other words any type 2
fields must be zeroed before calling svcReplyAndReceive on the
server-side. For replies, type 0, 1, and 2 are ignored. Types 5, 6, and
7 do something with the mem pointer upon reply. The type 0 descriptor
can be used to ignore parameters. The number of parameters covered by a
type-0 descriptor is (desc \>\> 26) + 1.

### Handle Translation

Translation type 0 is used to send handles across processes. The
corresponding translation descriptor has the following structure:

| Bits  | Description                                                                                                               |
|-------|---------------------------------------------------------------------------------------------------------------------------|
| 4     | If set, the handles are closed for the caller. Interaction with bit5 unknown.                                             |
| 5     | If set, the following handles are replaced by the process ID. Otherwise, translate each handle between client and server. |
| 26-31 | Number of handles following this descriptor (minus one).                                                                  |

Usage examples:

<table>
<thead>
<tr class="header">
<th scope="col" width="300"><p>Usual form</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x00000000 | ((num_handles-1)&lt;&lt;26)</p>
<p>&lt;handle 0&gt;</p>
<p>&lt;handle 1&gt; ...</p></td>
<td><p>Copies the given KHandles to the receiving process, i.e. creating
new handles in the target process while keeping around the ones of the
source process. When a handle value is 0x0, value 0x0 is written to the
destination cmdbuf without doing any actual handle-transfer.</p></td>
</tr>
<tr class="even">
<td><p>0x00000010 | ((num_handles-1)&lt;&lt;26)</p>
<p>&lt;handle 0&gt;</p>
<p>&lt;handle 1&gt; ...</p></td>
<td><p>Moves the given KHandles to the receiving process, i.e. creating
new handles in the target process and closing the ones of the source
process. When a handle value is 0x0, value 0x0 is written to the
destination cmdbuf without doing any actual handle-transfer.</p></td>
</tr>
<tr class="odd">
<td><p>0x00000020 <placeholder></p></td>
<td><p>Let kernel set value to calling process ProcessID.</p></td>
</tr>
</tbody>
</table>

### Static Buffer Translation

Each thread may set up up to 16 static buffer descriptors in their
[Thread Local Storage](Thread_Local_Storage "wikilink") at offset 0x180.
These contain information about buffers in the thread's memory space
that may be used for information exchange for communication with other
processes. In particular, a static buffer descriptor encodes the address
and size of a buffer.

Using IPC requests, data can be transferred from any location in the
source process to one of the static buffers set up in the target
process. This is done using a translation descriptor of type 1, which is
followed by a pointer to the source data. The translation descriptor has
the following structure:

| Bits  | Description                                                                                                                    |
|-------|--------------------------------------------------------------------------------------------------------------------------------|
| 1-3   | Translation type (characteristically 1)                                                                                        |
| 10-13 | Static buffer index of the receiving process                                                                                   |
| 14-31 | Size in bytes of the transferred data. Specifying an amount larger than the target static buffer will result in a kernelpanic. |

When encountering such a translation descriptor, the kernel will look up
the static buffer address and size corresponding to the given index and
(if the buffer can hold the requested amount of data) will copy the data
to the specified location.

Note that the translation descriptor and static buffer descriptor share
the same layout. However, it is unknown whether the kernel ever reads
fields other than the buffer address and size when dealing with static
buffer descriptors.

Usage examples:

| Usual form                                                   | Description                                                                                                                                                                                                                                                                                                                                        |
|--------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00000002 \| (size\<\<14) \| (static_buffer_id\<\<10) <ptr> | The corresponding value contains a ptr to a buffer of said size, that should be copied to an already set-up buffer in destination process at [Thread Local Storage](Thread_Local_Storage "wikilink") offset 0x180 + static_buffer_id\*8. The static_buffer_id is only 4 bits, making it possible for at most up to 16 buffers in total per thread. |

### Buffer Mapping Translation

The IPC subsystem can temporarily map a whole buffer of the sender's
memory into the receiver's memory space. This is useful for large
buffers, for which the overhead of copying static buffer data around
would be too expensive.

This kind of translation is enabled by setting bit3 in the translation
descriptor. The other two bits of what's documented as the translation
type above are used to specify buffer access permissions of the source
process.

Buffers will get mapped at virtual address 0x04000000+ in the
destination process. When this translation descriptor is submitted to
the kernel through svcReplyAndReceive, the given buffer will be unmapped
from the sending process(otherwise the buffer will be left mapped after
the cmd-reply is finished). Regardless of the descriptor used here, the
MMU-table entries for the source-process(from svcSendSyncRequest)
buffers are not changed: memory permissions are left at the original
while commands are being processed. The memory permissions for buffers
at 0x04000000+ is always RW-, regardless of the actual memory
permissions for the source-process buffer. Bitmask 0xFFF(low 12-bits) of
the start address of each buffer for 0x04000000+ is the same as bitmask
0xFFF from the source-process buffer address.

The buffer address written into the destination cmdbuf by the kernel
with svcSendSyncRequest is the allocated 0x04000000+ buffer. When doing
the same with svcSendSyncRequest, the buffer address is the same one
from the source cmdbuf(0x04000000+).

The first and last pages of the buffer at 0x04000000+ are allocated
under the BASE memregion(with data being copied to/from the original
source-process buffer as needed), with the rest being mapped to the
original buffer physmem. When the source-process buffer is 0x1000-byte
aligned, the first page for 0x04000000+ is mapped directly into the
original buffer physmem instead of allocating BASE memory(likewise for
the last page when the buffer size is 0x1000-byte aligned).

Each buffer at 0x04000000+ has 1 page of unmapped memory before and
after the mapped memory, used for separating each buffer. Hence, the
first buffer's page at 0x04000000+ is always mapped starting at
0x04001000 not 0x04000000.

| Bits | Description                                                                                                                      |
|------|----------------------------------------------------------------------------------------------------------------------------------|
| 1-2  | Access permission flags for the source process: 1=read-only, 2=write-only, 3=read/write. Specifying 0 will cause a kernel panic. |
| 3    | Characteristically 1 for this translation type.                                                                                  |
| 4-31 | Size in bytes of the shared memory block.                                                                                        |

Usage examples:

| Usual form                      | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
|---------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00000008                      | This command will cause a kernel panic.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| 0x0000000A \| (size\<\<4) <ptr> | The corresponding value contains a ptr to a buffer of said size. The buffer specified by the source process must have read permission(tested on hardware with a read-only buffer). Used for input buffers.                                                                                                                                                                                                                                                                                                                         |
| 0x0000000C \| (size\<\<4) <ptr> | The corresponding value contains a ptr to a buffer of said size. The buffer specified by the source process must have write permission. Used for output buffers. In the destination process with the buffer mapped at 0x04000000+, that buffer has same content as the buffer from the source buffer(like descriptor 0x0000000A). When handling command requests this is handled the same way as 0x0000000A, besides the descriptor type written into the dst cmdbuf and memory permissions.                                       |
| 0x0000000E \| (size\<\<4) <ptr> | The corresponding value contains a ptr to a buffer of said size. The buffer specified by the source process must have read permission during cmd-request handling(write permission is checked during cmd-reply handling for the original buffer). This isn't known to be used by any processes. When handling command requests this is handled the same way as 0x0000000A, and for handling command replies this is handled the same way as 0x0000000C(besides the descriptor type written into the dst cmdbuf for both of these). |

### Usage Examples for other Translation Types

| Type | Usual form                                                 | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|------|------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 2    | 0x00000004 \| (size\<\<8) \| (static_buffer_id\<\<4) <ptr> | This is typically used for RW buffers over PXI, but any process can use this. The address written to the destination cmd-buf is a phys-addr for a table located in the corresponding static buffer of the receiving process (which must be provided by the latter, otherwise the kernel dereferences NULL). Each static buffer needs to be page-aligned and musn't exceed a page's length (kernelpanic otherwise). This table contains the phys-addrs for the actual data, the array entries have the following format: {u32 \*datachunk_physaddr, u32 datachunk_bytesize}. |
| 3    | 0x00000006 \| (size\<\<8) \| (static_buffer_id\<\<4) <ptr> | Same as above except for read-only buffer. Prior(?) to the kernel version which implemented memory-permission checking for PXI buffers, this was unused and hence triggered a kernelpanic.                                                                                                                                                                                                                                                                                                                                                                                  |

## SVCs

### svcReplyAndReceive

**Signature:**

`Result ReplyAndReceive(s32* index, Handle* handles, s32 handleCount, Handle replyTarget)`

In a single operation, sends a IPC reply and waits for a new request.
`handles` should be a pointer to an array of `handleCount`
handles.<sup>TODO: Are only port/session handles supported?</sup>
`replyTarget` should contain a handle to the session to send the reply
to. (This is usually the session from which we received the previous
request.) If `replyTarget` is 0, no reply and the call will simply wait
for an incoming event.<sup>TODO: It doesn't seem like the 0xFFFF0000
command id mentioned in the above sections is necessary, but needs
confirmation.</sup>

Upon returning, `index` will contain an index into `handles` specifying
which object changed state. If it's a server port endpoint, it means
that there is a new incoming connection on that port which should be
accepted using svcAcceptSession. If it's a server session endpoint it
means that we received a request from that session and should process
and then reply to it by calling svcReplyAndReceive again with
`replyTarget` set to that session's handle.

An example of a server svcReplyAndReceive loop is:

`#define MAX_CLIENTS 4`
`Handle server_port = ...;`
`s32 requesting_index;`
`Handle handles[1 + MAX_CLIENTS] = { server_port };`
`s32 connected_clients = 0;`
`Handle reply_target = 0;`

`while (true) {`
`    Result res = svcReplyAndReceive(&requesting_index, handles, 1 + connected_clients, reply_target);`

`    if (res == 0xC920181A) {`
`        // Session was closed by remote`
`        // TODO: Handle disconnects`
`        reply_target = 0;`
`        continue;`
`    }`

`    if (requesting_index == 0) {`
`        // New connection in server_port`
`        ASSERT(connected_client < MAX_CLIENTS);`
`        svcAcceptSession(&handles[1 + connected_clients++], server_port);`
`        reply_target = 0;`
`        continue;`
`    }`

`    reply_target = handles[requesting_index];`

`    // Handle command here and write reply to command buffer`
`}`