+++
title = 'SOCU:gethostbyaddr'
+++

# Request

| Index Word | Description                                |
|------------|--------------------------------------------|
| 0          | Header code \[0x000E00C2\]                 |
| 1          | Input address buffer size.                 |
| 2          | Type (should be AF_INET)                   |
| 3          | Output buffer size, normally 0x1A88-bytes. |
| 4          | (insize\<\<14) \| 0x1002                   |
| 5          | Pointer to input address buffer            |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description           |
|------------|-----------------------|
| 0          | (outsize\<\<14) \| 2  |
| 1          | Pointer to output buf |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | POSIX return value |

# struct hostent

Internally the sysmodule uses the standard hostent struct, but using s16
for h_addrtype and h_length:

```
struct hostent {
   char*  h_name;
   char** h_aliases;
   s16    h_addrtype;
   s16    h_length;
   char** h_addr_list;
};
```

However, the struct returned is different from the internal one:

```
struct hostent_3ds_t {
   s16           h_addrtype;    //< Host address type
   s16           h_length;      //< Length of address. Maximum of 16 for IPV6
   s16           h_addr_count;  //< Number of addresses returned. Maximum of 24
   s16           h_alias_count; //< Number of aliases returned. Maximum of 24
   char[256]     h_name;        //< Official name of host
   char[256][24] h_aliases;     //< Alias list
   char[16][24]  h_addr_list;   //< List of addresses from name server
};
```

Its size is of 0x1A88 bytes.