+++
title = 'PDNG:Control'
+++

# Request

{{% ipc/request header="0x000100c0" %}}
{{% ipc/param %}}bool, enable{{% / %}}
{{% ipc/param %}}bool, reset{{% / %}}
{{% ipc/param %}}bool, resetRegisters{{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x00010040" %}}
{{% ipc/result %}}
{{% / %}}

# Description

Controls the GPU by enabling and/or resetting it using [PDN_GPU_CNT](PDN_Registers#pdn_gpu_cnt "wikilink").
