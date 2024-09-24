class [KMutex](KMutex "wikilink") extends
[KSynchronizationObject](KSynchronizationObject "wikilink");

Size : 0x2C bytes

| Offset | Type                                            | Description                                                                        |
|--------|-------------------------------------------------|------------------------------------------------------------------------------------|
| 0x0    | u32                                             | Pointer to vtable                                                                  |
| 0x4    | u32                                             | Reference count                                                                    |
| 0x8    | u32                                             | Node count for threads                                                             |
| 0xC    | [KLinkedListNode](KLinkedListNode "wikilink")\* | Pointer to first KLinkedListNode in the list of threads that sync with this object |
| 0x10   | [KLinkedListNode](KLinkedListNode "wikilink")\* | Pointer to last KLinkedListNode in the list of threads that sync with this object  |
| 0x14   | KMutexLinkedListNode                            | Previous and next mutexes                                                          |
| 0x1C   | u32                                             | Threads using this mutex                                                           |
| 0x20   | [KThread](KThread "wikilink") \*                | Thread that has the KMutex locked                                                  |
| 0x24   | u32                                             | Priority                                                                           |
| 0x28   | [KProcess](KProcess "wikilink")\*               | Owner                                                                              |
|        |                                                 |                                                                                    |

With the following declarations:
`struct KMutexLinkedList { KMutex *first, *last; };` and
`struct KMutexLinkedListNode { KMutex *prev, *next; };`.

[Category:Kernel synchronization
objects](Category:Kernel_synchronization_objects "wikilink")