+++
title = 'Programming Guide'
categories = ["GPU"]
+++

This page is intended to contain more higher-level explanation of
concepts and features provided by the 3DS GPU. For more detailed
register-level information check [GPU/Internal
Registers](GPU/Internal_Registers "wikilink").

# Geometry Pipeline

## Fixed Vertex Attributes

If a certain vertex attribute is constant for the duration of a draw
call, instead of specifying a vertex array with repeated contents or
changing the shader to use a uniform, *fixed vertex attributes* can be
used. They let you specify a fixed value, which will be assumed by the
attribute for all vertices of the batch.

To use a fixed attribute, set the bit corresponding to the attribute in
[GPUREG_ATTRIBBUFFERS_FORMAT_HIGH](GPU/Internal_Registers#gpureg_attribbuffers_format_high "wikilink")
and ensure that no vertex arrays are configured for the attribute. (Any
configured arrays will override the fixed value, regardless of the bit
setting.) Even if a vertex array isn't being used for the attribute it
still needs to be counted in the number of active attributes specified
in the same register.

To specify the actual value of the fixed attribute, write the attribute
index to
[GPUREG_FIXEDATTRIB_INDEX](GPU/Internal_Registers#gpureg_fixedattrib_index "wikilink")
followed by writes with packed a float24 4-tuple to the 3
[GPUREG_FIXEDATTRIB_DATA](GPU/Internal_Registers#gpureg_fixedattrib_data0 "wikilink")
registers. The value is always specified as a float 4-component vector,
the configured type is ignored.

## Immediate-Mode Vertex Submission

Instead of using vertex arrays to supply vertex data, drawing can be
done by directly writing vertex data to a register. This allows vertex
data to be inlined directly in the command buffer. Since this is
restricted to 4-component float data, it is more useful for small draws
like UI elements or debug displays, to avoid using an unreasonable
amount of memory and processing time appending the vertices to the
command buffer.

To use this feature, configure the number of attributes per vertex in
[GPUREG_VSH_NUM_ATTR](GPU/Internal_Registers#gpureg_vsh_num_attr "wikilink").
(All settings in the registers related to the vertex loader are
ignored.) Then setup the GPU and shaders the same as if doing a regular
draw call with GPUREG_DRAWARRAYS or GPUREG_DRAWELEMENTS, but instead of
writing to either register, write the value 0xF to
[GPUREG_FIXEDATTRIB_INDEX](GPU/Internal_Registers#gpureg_fixedattrib_index "wikilink")
and then follow by repeatedly writing vertex data to
[GPUREG_FIXEDATTRIB_DATA](GPU/Internal_Registers#gpureg_fixedattrib_datai "wikilink").

Each set of writes to the 3 data registers specifies one attribute and
all attributes (as configured in GPUREG_VSH_NUM_ATTR) need to be
written, in order, to specify a vertex. Drawing happens automatically as
vertices are specified. After finishing specifying vertices, follow with
the same writes used after a draw arrays/elements.

When drawing using triangle strips or fans,
[GPUREG_RESTART_PRIMITIVE](GPU/Internal_Registers#gpureg_restart_primitive "wikilink")
should be used to end the previous strip before (or while) drawing.

## Drawing elements

The 3DS GPU is capable of drawing vertex + index arrays, triggered by
[GPUREG_DRAWELEMENTS](GPU/Internal_Registers#gpureg_drawelements "wikilink").
A set of commands commonly used by the standard GL implementation to
accomplish this is as follows:

| Command Index | Register                                                                                 | Description                           |
|---------------|------------------------------------------------------------------------------------------|---------------------------------------|
| 0             | [GPUREG_GEOSTAGE_CONFIG](GPU/Internal_Registers#gpureg_geostage_config "wikilink")       | Set whether drawing triangle elements |
| 1-2           | [GPUREG_GEOSTAGE_CONFIG2](GPU/Internal_Registers#gpureg_geostage_config2 "wikilink")     | Set whether drawing triangle elements |
| 3             | [GPUREG_PRIMITIVE_CONFIG](GPU/Internal_Registers#gpureg_primitive_config "wikilink")     | Set primitive mode                    |
| 4             | [GPUREG_PRIMITIVE_CONFIG](GPU/Internal_Registers#gpureg_primitive_config "wikilink")     | Set number of output map registers    |
| 5             | [GPUREG_RESTART_PRIMITIVE](GPU/Internal_Registers#gpureg_restart_primitive "wikilink")   | Trigger reset                         |
| 6             | [GPUREG_GEOSTAGE_CONFIG2](GPU/Internal_Registers#gpureg_geostage_config2 "wikilink")     | Set function indicator to 0           |
| 7             | [GPUREG_INDEXBUFFER_CONFIG](GPU/Internal_Registers#gpureg_indexbuffer_config "wikilink") | Set offset and type                   |
| 8             | [GPUREG_NUMVERTICES](GPU/Internal_Registers#gpureg_numvertices "wikilink")               | Set vertex count                      |
| 9             | [GPUREG_START_DRAW_FUNC0](GPU/Internal_Registers#gpureg_start_draw_func0 "wikilink")     | Set mode to drawing                   |
| 10            | [GPUREG_DRAWELEMENTS](GPU/Internal_Registers#gpureg_drawelements "wikilink")             | Trigger draw                          |
| 11            | [GPUREG_START_DRAW_FUNC0](GPU/Internal_Registers#gpureg_start_draw_func0 "wikilink")     | Set mode to configuration             |
| 12            | [GPUREG_VTX_FUNC](GPU/Internal_Registers#gpureg_vtx_func "wikilink")                     | Trigger post-vertex cache clear       |
| 13            | [GPUREG_FRAMEBUFFER_FLUSH](GPU/Internal_Registers#gpureg_framebuffer_flush "wikilink")   | Flush framebuffer                     |
| 14            | [GPUREG_GEOSTAGE_CONFIG](GPU/Internal_Registers#gpureg_geostage_config "wikilink")       | Clear drawing triangle elements       |
| 15            | [GPUREG_GEOSTAGE_CONFIG2](GPU/Internal_Registers#gpureg_geostage_config2 "wikilink")     | Clear drawing triangle elements       |
| 16            | [GPUREG_PRIMITIVE_CONFIG](GPU/Internal_Registers#gpureg_primitive_config "wikilink")     | Clear primitive mode                  |
| 17            | [GPUREG_VSH_ENTRYPOINT](GPU/Internal_Registers#gpureg_vsh_entrypoint "wikilink")         | Clear entry point                     |

[Category:GPU](Category:GPU "wikilink")
