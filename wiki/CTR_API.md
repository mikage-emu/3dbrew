This page lists the spare knowledge people bothered to document on the
official CTR API.

# Synchronization Primitives

These are to be considered in extension to the system calls outlined in
[Multi-threading](Multi-threading "wikilink").

## Critical Section (light-weight mutex)

Similar to a mutex, but faster and no priority inheritance. Therefore
problems such as priority inversion may occur.

### CriticalSection::Initialize

Creates an object

### CriticalSection::Enter

Locks out threads from accessing a critical section.

### CriticalSection::Leave

Unlocks and allows for access to a critical section.

## Light Semaphore

API unknown.

## Light Event

API unknown.