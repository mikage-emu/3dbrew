# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00060040\] |
| 1          | HTTP context handle        |

# Response

| Index Word | Description                                                  |
|------------|--------------------------------------------------------------|
| 0          | Header code                                                  |
| 1          | Result code                                                  |
| 2          | Total content data downloaded so far                         |
| 3          | Total content size from the "Content-Length" response header |