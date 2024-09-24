+++
title = 'Procedural Texture Generation'
categories = ["GPU"]
+++

The 3DS GPU supports procedural generation of texture data using
[texture unit
3](GPU/Internal_Registers#GPUREG_TEXUNIT3_PROCTEX0 "wikilink"). Little
is known about this feature, albeit a few public hints have been
dropped. The contents of this page are solely based on reports on a
[presentation](http://www.4gamer.net/games/017/G001762/20120822007/)
given by DMP.

The related GPU registers can be found starting
[here](GPU/Internal_Registers#GPUREG_TEXUNIT3_PROCTEX0 "wikilink").

## Overview

Procedural texture generation has four stages:

- Noise Module (outputs u′,v′)
- Repeat Module (outputs u′′,v′′)
- Base Shape (also notated as G(u′′,v′′), output g)
- F(g) and Lookup Table

## Noise Module

This stage applies noise on the input coordinates. Little is known about
this other than that there are three noise parameters:

- Amplitude
- Frequency
- Phase

These parameters are configured starting
[here](GPU/Internal_Registers#GPUREG_TEXUNIT3_PROCTEX1 "wikilink").

## Repeat Module

This stage performs basic texture coordinate wrapping on the noised
coordinates. It supports symmetric and mirrored wrapping. They don't
seem to be configurable beyond that.

## Base Shape

The U’’ and V’’ coordinates are used to generate a scalar value in the
range \[0;1\] from the wrapped coordinates using one of six functions
documented
[here](GPU/Internal_Registers#GPUREG_TEXUNIT3_PROCTEX0 "wikilink").

The output of this function is named "g".

## F(g) and Lookup Table

F is a selectable function which transforms g to another scalar value.
There are two known options for F:

- the identity function
- a triangle function

The final texel color is determined by using the value of F(g) as an
index into a configurable [lookup
table](GPU/Internal_Registers#GPUREG_PROCTEX_LUT "wikilink").

[Category:GPU](Category:GPU "wikilink")