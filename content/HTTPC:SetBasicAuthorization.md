+++
title = 'HTTPC:SetBasicAuthorization'
+++

# Request

| Index Word | Description                       |
|------------|-----------------------------------|
| 0          | Header code \[0x000F00C4\]        |
| 1          | HTTP context handle               |
| 2          | Username Length                   |
| 3          | Password Length                   |
| 4          | (usernameLength \<\< 14) \| 0x402 |
| 5          | char\* Username                   |
| 6          | (passwordLength \<\< 14) \| 0x802 |
| 7          | char\* Password                   |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |