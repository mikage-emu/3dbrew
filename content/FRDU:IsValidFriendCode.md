# Request

| Index Word | Description                   |
|------------|-------------------------------|
| 0          | Header code \[0x00260080\]    |
| 1-2        | (u64) friend code to validate |

The friend code can be derived from the textual form of "1234-5678-9012"
by stripping the slashes and then converting the string to an integer.

This function just calls
[FRDU:PrincipalIdToFriendCode](FRDU:PrincipalIdToFriendCode "wikilink")
with the lower half of the friend code and checks if the checksum byte
returned matches the input.

# Response

| Index Word | Description                                         |
|------------|-----------------------------------------------------|
| 0          | Header code                                         |
| 1          | Result code                                         |
| 2          | 1 if the provided friend code is valid, 0 otherwise |