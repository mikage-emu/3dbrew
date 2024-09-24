# Request

{{#vardefine:ipc_offset\|0}}

# Response

{{#vardefine:ipc_offset\|0}}

# Description

This can only be used when [initialized](NFC:Initialize "wikilink") with
type3. Only bitmask 0xF from unk1 is used, it's written into state then
loaded later. That value is also compared with 1, depending on whether
it matches different sets of data for 3 fields are loaded into state.
[NFC:StartTagScanning](NFC:StartTagScanning "wikilink") does this as
well except it loads a value from state instead of from the cmdreq(where
that state field is set to 0xF by
[NFC:Initialize](NFC:Initialize "wikilink") with type2).

This 4-bit value seems to control what type(?) of NFC tag to scan for.
The default value of 0xF is for Amiibo. Using non-value-0xF results in
Amiibo tags not being found(TagState doesn't change to 3).

This is somewhat similar to
[NFC:StartTagScanning](NFC:StartTagScanning "wikilink").