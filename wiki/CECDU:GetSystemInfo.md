# Request

{{#vardefine:ipc_offset\|0}}

# Response

{{#vardefine:ipc_offset\|0}}

# Info Type

| Type | Description                                                                                            | Param                                                                      | Output in buffer                |
|------|--------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------|---------------------------------|
| 0    | ?                                                                                                      | Ignore?                                                                    | size=8, ?                       |
| 1    | EULA version, a wrapper of [GetConfigInfoBlk8](CfgS:GetConfigInfoBlk8 "wikilink") with BlkID=0xD0000   | Ignore                                                                     | size=2, version of agreed EULA  |
| 2    | EULA, a wrapper of [GetConfigInfoBlk8](CfgS:GetConfigInfoBlk8 "wikilink") with BlkID=0xD0000           | Ignore                                                                     | size=1, bool is_eula_agreed     |
| 3    | Parent Control, a wrapper of [GetConfigInfoBlk8](CfgS:GetConfigInfoBlk8 "wikilink") with BlkID=0xC0000 | Ignore                                                                     | size=1, bool has_parent_control |
| 6    | ?                                                                                                      | size=13? struct{u32 ncch_program_id; bool is_out_box; u8 message_id\[8\];} | ?                               |
| 7    | ?                                                                                                      | size=13? struct{u32 ncch_program_id; bool is_out_box; u8 message_id\[8\];} | ?                               |
| 8    | ?                                                                                                      | Ignore                                                                     | size=4?                         |