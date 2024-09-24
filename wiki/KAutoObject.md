KAutoObject represents a reference counted object that destroys itself
when there are no more references to it.

Size : 0x8 bytes

| Offset | Type | Description       |
|--------|------|-------------------|
| 0x0    | u32  | Pointer to vtable |
| 0x4    | u32  | Reference count   |

# Class Definition

`   class KAutoObject {`
`    public:`
`       u32 m_referenceCount;       // 0x4`
`    protected:`
`       virtual ~KAutoObject() { }`
`   };`

[Category:Kernel auto objects](Category:Kernel_auto_objects "wikilink")