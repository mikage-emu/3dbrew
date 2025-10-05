+++
title = 'FS:SendInitializeInfoTo9'
+++

# Request

{{% ipc/request header="0x08390000" %}}
{{% / %}}

# Response

{{% ipc/request header="0x08390040" %}}
{{% ipc/result %}}
{{% / %}}

# Description

First waits until PTM has set bit0 of [address 0x1FF81086 in configuration memory](Configuration_Memory#shared_memory_page_for_arm11_processes "wikilink"), indicating that [MCU_HW_INFO](Configuration_Memory#mcu_hw_info "wikilink") has been written.

Then, [MCU_HW_INFO](Configuration_Memory#mcu_hw_info "wikilink") is retrieved from configuration memory and is passed into [FSPXI:SendInitializeInfoTo9](FSPXI:SendInitializeInfoTo9 "wikilink").
