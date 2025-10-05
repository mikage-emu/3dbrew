+++
title = 'PDNI:Control1'
+++

# Request

{{% ipc/request header="0x00010040" %}}
{{% ipc/param %}}bool, enable I2S1 clock{{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x00010040" %}}
{{% ipc/result %}}
{{% / %}}

# Description

Enables or disables the I2S1 clock using [PDN_I2S_CNT](PDN_Registers#pdn_i2s_cnt "wikilink").
