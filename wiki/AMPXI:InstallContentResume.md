# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001B0040\] |
| 1          | Content ID                 |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001B00C0\] |
| 1          | Result code                |
| 2-3        | u64, Resume offset         |