Size : 0x28 bytes

This object

| Offset | Type                                    | Description                                       |
|--------|-----------------------------------------|---------------------------------------------------|
| 0x0    | u32                                     | Current count for object                          |
| 0x4    | KLinkedListNode\*                       | KLinkedListNode for first object in list          |
| 0x8    | KLinkedListNode\*                       | KLinkedListNode for last object in list           |
| 0xC    | [KObjectMutex](KObjectMutex "wikilink") | Mutex                                             |
| 0x14   | u16                                     | Total objects of this type that have been created |
| 0x16   | u16                                     | Alignment                                         |
| 0x18   | KObjectLink                             | Object info tracking                              |

[Category:Kernel objects](Category:Kernel_objects "wikilink")