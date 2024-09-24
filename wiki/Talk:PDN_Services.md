that is what the unknown functions do

pdn:g(u8 a0,u8 a1,u8 a2) {

`   if((a1 | a2) & ~a0)`
`   {`
`       u32 temp = a0;`
`       if(!temp) temp = 0x10000;`
`       if(a2)*(u32*)(0x1ec41200) = (a1^0x1) | temp;`
`       else *(u32*)(0x1ec41200) = 0x7E | (a1^0x1)| temp;`
`       if(a1 | a2)`
`       {`
`           wait(4);`
`           *(u32*)(0x1ec41200) = 0x7F | temp;`
`       }`
`       return 1; //worked`
`   }`
`   else`
`   {`
`       return 0; //error Invalid argument`
`   }`

}

pdn:d(u8 a0,u8 a1,u8 a2) {

`   u8 temp = a0 & ~a2;`
`   if(temp)`
`   {`
`       *(u8*)(0x1ec41230) = (a1^0x1) | temp << 1;`
`       if(a1 & a2)`
`       {`
`           wait(0x10);`
`           *(u8*)(0x1ec41230) = 0x1 | a0 << 1;`
`       }`
`       return 1; //worked`
`   }`
`   else`
`   {`
`       return 0; //error Invalid argument`
`   }`

}