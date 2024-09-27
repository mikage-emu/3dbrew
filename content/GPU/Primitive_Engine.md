Primitive Engine (PE) is one of the PICA200's four vertex processor
units and provides some unique features which are used to implement a
geometry shader stage and variable-size primitive rendering.

The full functionality of PE is not yet understood and remains to be
reverse-engineered.

## Variable-size Primitives

Variable-size primitives are implemented by prefixing each per-primitive
sequence of indices in an index array with a primitive size. This is
used for various effects, for example Catmull-Clark subdivision and Loop
subdivision. It is unknown how this feature is enabled specifically.

[Category:GPU](Category:GPU "wikilink")