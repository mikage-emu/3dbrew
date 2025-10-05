+++
title = 'PDND:Control'
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

Controls the DSP by enabling, resetting, or holding it in reset using [PDN_DSP_CNT](PDN_Registers#pdn_dsp_cnt "wikilink").
