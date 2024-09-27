<noinclude> </noinclude>\|- \|
{{#var:ipc_offset_prefix}}{{#var:ipc_offset}}{{#vardefine:ipc_offset\|{{#expr:
{{#var:ipc_offset}} + 1}}}} \|

<table>
<thead>
<tr class="header">
<th><p>Header</p></th>
<th><p><span style="opacity:0.8">{{</p>
<ol>
<li>vardefine:headerlow|{{#expr:+(*64)}}}}{{</li>
<li>vardefine:looppow|12}}{{#while:</li>
</ol></th>
<th><p>{{#ifexpr: {{#var:looppow}} &gt;= 0 | true }}</p></th>
<th><p>{{#switch: {{#expr:trunc({{#var:headerlow}}/(2^{{#var:looppow}}))
mod 16}}</p></th>
<th><p>0 = 0</p></th>
<th><p>1 = 1</p></th>
<th><p>2 = 2</p></th>
<th><p>3 = 3</p></th>
<th><p>4 = 4</p></th>
<th><p>5 = 5</p></th>
<th><p>6 = 6</p></th>
<th><p>7 = 7</p></th>
<th><p>8 = 8</p></th>
<th><p>9 = 9</p></th>
<th><p>10 = A</p></th>
<th><p>11 = B</p></th>
<th><p>12 = C</p></th>
<th><p>13 = D</p></th>
<th><p>14 = E</p></th>
<th><p>15 = F</p></th>
<th><p>#default = ?
}}{{#vardefine:looppow|{{#expr:{{#var:looppow}}-4}}}} }}</span></p></th>
<th><p><abbr title="Command ID">Cmd</abbr></p></th>
<th><p></p></th>
<th><p><abbr title="Number of raw parameter words">Param</abbr></p></th>
<th><p></p></th>
<th><p><abbr title="Number of words in the translate section of the message">Xlat</abbr></p></th>
<th><p></p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

<noinclude> </noinclude>

[Category:IPC message contents
templates](Category:IPC_message_contents_templates "wikilink")