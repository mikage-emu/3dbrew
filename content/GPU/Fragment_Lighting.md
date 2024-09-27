+++
title = 'Fragment Lighting'
categories = ["GPU"]
+++

Fragment lighting is a DMP extension to the standard OpenGL pipeline
with which applications can calculate object lighting for each rendered
pixel instead of just per vertex. The fragment lighting algorithm
furthermore supports the shading models Blinn-Phong, Cook-Terrance,
Ward, and microfacet-based BRDF-models. While the lighting calculations
take place in a very localized position of the pixel processing
pipeline, the feature interacts with different other pipeline stages.

## Overview

In general, lighting is calculated at a particular point in space X by
determining the angles (i.e. dot products) between different vectors:

- The face normal vector N, which points from X to the direction
  perpendicular to the lighted object
- The tangent vector T, which points from X to a direction which is
  tangential to the lighted object
- The bitangent vector B, which points to a tangential direction such
  that it is orthogonal to both N and T
- The view vector V, which points from X "into the camera"
- The light vector L, which points from X to the light source (note that
  lighting is always evaluated separately for each light source; the
  results for multiple light sources can simply be added to each other)

For example, in the Blinn-Phong shading model the dot product of L and N
determined the intensity of a lighting type called diffuse lighting.
More generally, the dot products between these vectors (from now on
simply referred to as "dot products") are combined to a lighting
equation, which is evaluated once per light source at each considered
point in space.

Before pixel shaders were common, the lighting equation was only
considered at each vertex, and the output color was then interpolated
across the triangle. To achieve higher visual quality, pixel shaders can
be used nowadays to evaluate the lighting equation at each pixel. The
PICA200 does not have a programmable pixel shader, but has a
fixed-function pipeline stage to achieve the same quality.

In any case, per-pixel lighting requires to somehow obtain a normal
vector for each pixel. Theoretically, the vertex shader could output one
normal vector per vertex, and per-pixel normals could then be obtained
by interpolating these vectors in a specific way. This, however, is very
inefficient, which is why vertex shaders on the PICA200 instead output
mathematical objects called quaternions: Quaternions can be computed
from normal/tangent vectors, and vice versa, so no information is lost
by doing so. However, quaternion interpolation is a lot faster (see the
"Kuijk and Blake" source below), and so the GPU can compute per-pixel
normals simply using the interpolated quaternion. This is just the
general idea, and the dirty mathematical details are explained below.

In addition to allowing per-pixel calculations, the lighting equation
used in the PICA200 involves using the dot products as indices into
configurable lookup tables. A good example of why this is useful is
cell-shading, which can be achieved simply by setting adjacent lookup
table values to the same color.

## Quaternions as Shader Outputs

The shaders are usually the point where normal and tangent vector
information flows in. Usually, the source vertex data will include
normal vectors for each vertex. This need not be the case though; one
could also just input raw vertex positions, and have a geometry shader
automatically calculate normal vector information.

In any case: There is no vertex output attribute semantic for normal or
tangent vectors. To use fragment lighting, the shader must actually
output an attribute with the quaternion semantic. So some sort of
conversion needs to happen from normal and tangent vectors to
quaternions. This can be done using the surface-local matrix.

## Quaternion Interpolation

Quaternion interpolation needs to happen to obtain a per-fragment
quaternion, from which in turn per-fragment normals and tangent vectors
can be computed. It is unknown how quaternions are interpolated on the
PICA200. The architecture suggests that plain linear interpolation is
used, but there are also more sophisticated algorithms like Slerp and
Nlerp.

## Quaternions and Normal/Tangent Vectors

Quaternions describe a transformation from surface-local space to eye
space. In surface-local space, by definition (and up to permutation) the
normal vector is (0,0,1), the tangent vector is (1,0,0), and the
bitangent vector is (0,1,0).

Alternatively, one may consider quaternions a transformation from eye
space to surface-local space.

## Fragment Lighting Equation

There are two lighting equations: One for the primary color and one for
the secondary color. Both of them are given in section 3.2.2 of the
"Kazakov and Ohbuchi" source below. In addition, the fragment lighting
can be set up to write to the alpha channel of the primary or secondary
color depending on a selectable angle and a LUT. The equations used can
be found here: <http://mathb.in/26766>

Some common setups include:

| Model                                     | LutD0                         | LutD1                                            | ReflectionLuts                                 | Geometry factors | SpotlightLut                             |
|-------------------------------------------|-------------------------------|--------------------------------------------------|------------------------------------------------|------------------|------------------------------------------|
| Blinn-Phong                               | Input: N dot H, Contents: x^s | --                                               | --                                             | Disabled         | Spotlight setup or no-op                 |
| Cook-Torrance                             | --                            | Input: N dot H, D(x)                             | Input: V dot H, Contents: F(x)                 | Enabled          | Spotlight setup or no-op                 |
| Schlick-like                              | --                            | Input: N dot H, Contents: Schlick Z(x)           | Input: V dot H, Contents: F(x)                 | Enabled          | Input: cos phi_i, Contents: Schlick A(x) |
| Subsurface scattering (not entirely sure) | --                            | Input: N dot V, Contents: Transmittance by angle | Input: L dot N, Contents: Reflectance by angle | Disabled         | Spotlight setup or no-op                 |

s is the specularity factor for Blinn-Phong.

Spotlight setup means input -L dot P and contents spotlight falloff.

F and D can be found in
<http://inst.cs.berkeley.edu/~cs294-13/fa09/lectures/cookpaper.pdf>

Schlick Z and Schlick A are defined in
<http://www.cs.virginia.edu/~jdl/bib/appearance/analytic%20models/schlick94b.pdf>
.

The Fresnel LUT can be used to, for example, blend two colours according
to how oblique the view angle is, or to simply additively blend white
onto fragments with an exponential falloff, resulting in rim lighting.

## Fragment Lighting Output

The fragment lighting results are accessible as two inputs to the
texture combiners (one for the primary color, one for the secondary
color).

## Resources

This wiki page can only give a short overview of the fragment lighting
feature. Luckily, there is a plethora of public literature available
which describes the feature in more detail:

- Everitt - "Per-Pixel Lighting": A presentation given at the Game
  Developers Conference 2001 about per-pixel lighting. It doesn't have
  anything to do with the PICA200 algorithm, but explains the core ideas
  very well (especially the concepts of surface-local space and how it
  relates to other coordinate systems).
- Kazakov and Ohbuchi - "Primitive Processing and Advanced Shading
  Architecture for Embedded Space": Provides a general overview over the
  fragment lighting algorithm used by the PICA200 and provides explicit
  formulas for the primary and secondary lighting output. NOTE: There
  exist both a scientific publication and a short presentation with this
  title. Both are useful, but the former goes into much greater detail.
- Ohbuchi and Unno - "A Real-Time Configurable Shader Based on Lookup
  Tables": Provides a very detailed explanantion of the fragment
  lighting implementation
- Kuijk and Blake - "Faster Phong Shading via Angular Interpolation":
  Explains in greater detail how quaternions can be used to encode
  information about normals and tangents (and how quaternions are easier
  to interpolate than vectors).

[Category:GPU](Category:GPU "wikilink")
