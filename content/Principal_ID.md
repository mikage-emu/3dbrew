+++
title = 'Principal ID'
+++

The **Principal ID** is an identification number that can be seen as a
login name for Nintendo's game servers.

## Get your Principal ID from your Friend Code

The Pincipal ID is part of the Friend Code.

To get your Pincipal ID from your Friend Code. You have to transform
your Friend Code into hexadecimal and strip the most signifcant byte so
that you have 4 bytes left. For exmaple take this Friend Code
1234-5678-9012.
First remove the hyphens then convert the decimal number into
hexadecimal:
0x1CBE991A14

Then remove the most significant byte:
0xBE991A14
This number is the Principal ID and would be 3197704724 in decimal

The most significant byte that was removed is actually the checksum that
validates a friend code (in this case this it would be an invalid friend
code)

## See also

[FRDU:IsValidFriendCode](FRDU:IsValidFriendCode "wikilink")
[FRDU:PrincipalIdToFriendCode](FRDU:PrincipalIdToFriendCode "wikilink")