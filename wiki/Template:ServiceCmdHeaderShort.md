<abbr title="Command {{{1}}} with {{{2}}} raw parameter and {{{3}}} translate words"><span style="opacity:0.8">{{

1.  vardefine:headerlow\|{{#expr:+(\*64)}}}}{{
2.  vardefine:looppow\|12}}{{#while:

`| {{#ifexpr: {{#var:looppow}} >= 0 | true }}`
`| {{#switch: {{#expr:trunc({{#var:headerlow}}/(2^{{#var:looppow}})) mod 16}}`
`| 0 = 0`
`| 1 = 1`
`| 2 = 2`
`| 3 = 3`
`| 4 = 4`
`| 5 = 5`
`| 6 = 6`
`| 7 = 7`
`| 8 = 8`
`| 9 = 9`
`| 10 = A`
`| 11 = B`
`| 12 = C`
`| 13 = D`
`| 14 = E`
`| 15 = F`
`| #default = ?`

}}{{#vardefine:looppow\|{{#expr:{{#var:looppow}}-4}}}}
}}</span></abbr><noinclude> </noinclude>