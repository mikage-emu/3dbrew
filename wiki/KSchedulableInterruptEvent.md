class
[KSchedulableInterruptEvent](KSchedulableInterruptEvent "wikilink")
extends
[KSynchronizationInterruptEvent](KSynchronizationInterruptEvent "wikilink")

Size : 0x8 bytes

Abstract class used as base for [KScheduler](KScheduler "wikilink"),
[KFIQInterruptEvent](KFIQInterruptEvent "wikilink"),
[KUserBindableInterruptEvent](KUserBindableInterruptEvent "wikilink"),
[KThread](KThread "wikilink"), etc.

The virtual interrupt function of this class returns an instance to
`this` (as
[KSchedulableInterruptEvent](KSchedulableInterruptEvent "wikilink")).
After being added to the
[KSchedulableInterruptEventLinkedList](KSchedulableInterruptEventLinkedList "wikilink")
instance of the current core and picked up by its kernel thread, the
second virtual function is executed. The instances of the subclasses
that also inherit from
[KSynchronizationObject](KSynchronizationObject "wikilink") are signaled
as well.

| Offset | Type                                                                           | Description                                                                                                                                                                                             |
|--------|--------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | void \*\*                                                                      | Pointer to vtable                                                                                                                                                                                       |
| 0x4    | [KSynchronizationInterruptEvent](KSynchronizationInterruptEvent "wikilink") \* | Next interrupt event (associated with the current one), usually a [KSchedulableInterruptEvent](KSchedulableInterruptEvent "wikilink"). The linked list represented by this attribute can contain cycles |

[Category:Kernel interrupt
events](Category:Kernel_interrupt_events "wikilink")