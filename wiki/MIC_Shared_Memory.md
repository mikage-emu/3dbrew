This is the shared memory used by the MIC service. It contains recorded
audio data and the offset of the current data's end.

| Index Byte         | Size               | Description                    |
|--------------------|--------------------|--------------------------------|
| 0x0                | sharedmem_size - 4 | Audio data.                    |
| sharedmem_size - 4 | 4                  | u32, Current audio end-offset. |