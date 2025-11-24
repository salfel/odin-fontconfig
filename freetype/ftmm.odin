/****************************************************************************
 *
 * ftmm.h
 *
 *   FreeType variation font interface (specification).
 *
 * Copyright (C) 1996-2025 by
 * David Turner, Robert Wilhelm, and Werner Lemberg.
 *
 * This file is part of the FreeType project, and may only be used,
 * modified, and distributed under the terms of the FreeType project
 * license, LICENSE.TXT.  By continuing to use, modify, or distribute
 * this file you indicate that you have read the license and
 * understand and accept it fully.
 *
 */
package freetype

foreign import lib "freetype.lib"
_ :: lib

/**************************************************************************
*
* @section:
*   multiple_masters
*
* @title:
*   OpenType Font Variations, TrueType GX, and Adobe MM Fonts
*
* @abstract:
*   How to manage variable fonts with multiple design axes.
*
* @description:
*   The following types and functions manage OpenType Font Variations,
*   Adobe Multiple Master (MM) fonts, and Apple TrueType GX fonts.  These
*   formats have in common that they allow the selection of specific
*   design instances by setting design coordinates for one or more axes
*   like font weight or width.
*
*   For historical reasons there are two interfaces.  The first, older one
*   can be used with Adobe MM fonts only, and the second, newer one is a
*   unified interface that handles all three font formats.  However, some
*   differences remain and are documented accordingly; in particular,
*   Adobe MM fonts don't have named instances (see below).
*
*   For Adobe MM fonts, macro @FT_IS_SFNT returns false.  For TrueType GX
*   and OpenType Font Variations, it returns true.
*
*   We use mostly the terminology of the OpenType standard.  Here are some
*   important technical terms.
*
*   * A 'named instance' is a tuple of design coordinates that has a
*     string ID (i.e., an index into the font's 'name' table) associated
*     with it.  The font can tell the user that, for example,
*     [Weight=700,Width=110] is 'Bold'.  Another name for 'named instance'
*     is 'named style'.
*
*       Adobe MM fonts don't have named instances.
*
*   * The 'default instance' of a variation font is that instance for
*     which the nth axis coordinate is equal to the nth default axis
*     coordinate (i.e., `axis[n].def` as specified in the @FT_MM_Var
*     structure), with~n covering all axes.  In TrueType GX and OpenType
*     Font Variations, the default instance is explicitly given.  In Adobe
*     MM fonts, the `WeightVector` entry as found in the font file is
*     taken as the default instance.
*
*       For TrueType GX and OpenType Font Variations, FreeType synthesizes
*       a named instance for the default instance if the font does not
*       contain such an entry.
*
*   * 'Design coordinates' are the axis values found in a variation font
*      file.  Their meaning is specified by the font designer and the
*      values are rather arbitrary.
*
*       For example, the 'weight' axis in design coordinates might vary
*       between 100 (thin) and 900 (heavy) in font~A, while font~B
*       contains values between 400 (normal) and 800 (extra bold).
*
*   * 'Normalized coordinates' are design coordinates mapped to a standard
*     range; they are also called 'blend coordinates'.
*
*       For TrueType GX and OpenType Font Variations, the range is [-1;1],
*       with the minimum mapped to value~-1, the default mapped to
*       value~0, and the maximum mapped to value~1, and all other
*       coordinates mapped to intervening points.  Please look up the
*       [OpenType
*       specification](https://learn.microsoft.com/en-us/typography/opentype/spec/otvaroverview)
*       on how this mapping works in detail.
*
*       For Adobe MM fonts, this standard range is [0;1], with the minimum
*       mapped to value~0 and the maximum mapped to value~1, and all other
*       coordinates mapped to intervening points.  Please look up [Adobe
*       TechNote
*       #5015](https://adobe-type-tools.github.io/font-tech-notes/pdfs/5015.Type1_Supp.pdf)
*       on how this mapping works in detail.
*
*       Assuming that the two fonts in the previous example are OpenType
*       Font Variations, both font~A's [100;900] and font~B's [400;800]
*       coordinate ranges get mapped to [-1;1].
*/


/**************************************************************************
*
* @enum:
*   T1_MAX_MM_XXX
*
* @description:
*   Adobe MM font limits as defined in their specifications.
*
* @values:
*   T1_MAX_MM_AXIS ::
*     The maximum number of Adobe MM font axes.
*
*   T1_MAX_MM_DESIGNS ::
*     The maximum number of Adobe MM font designs.
*
*   T1_MAX_MM_MAP_POINTS ::
*     The maximum number of elements in a design map.
*
*/
T1_MAX_MM_AXIS         :: 4
T1_MAX_MM_DESIGNS     :: 16
T1_MAX_MM_MAP_POINTS  :: 20

Ft_Mm_Axis :: i32

/**************************************************************************
*
* @struct:
*   FT_Multi_Master
*
* @description:
*   A structure to model the axes and space of an Adobe MM font.
*
*   This structure can't be used with TrueType GX or OpenType Font
*   Variations.
*
* @fields:
*   num_axis ::
*     Number of axes.  Cannot exceed~4.
*
*   num_designs ::
*     Number of designs; should be normally `2^num_axis` even though the
*     Type~1 specification strangely allows for intermediate designs to be
*     present.  This number cannot exceed~16.
*
*   axis ::
*     A table of axis descriptors.
*/
Ft_Multi_Master :: struct {
	num_axis:    i32,
	num_designs: i32,
	axis:        [4]Ft_Mm_Axis,
}

/**************************************************************************
*
* @struct:
*   FT_Var_Axis
*
* @description:
*   A structure to model a given axis in design space for Adobe MM fonts,
*   TrueType GX, and OpenType Font Variations.
*
* @fields:
*   name ::
*     The axis's name.  Not always meaningful for TrueType GX or OpenType
*     Font Variations.
*
*   minimum ::
*     The axis's minimum design coordinate.
*
*   def ::
*     The axis's default design coordinate.  FreeType computes meaningful
*     default values for Adobe MM fonts.
*
*   maximum ::
*     The axis's maximum design coordinate.
*
*   tag ::
*     The axis's tag (the equivalent to 'name' for TrueType GX and
*     OpenType Font Variations).  FreeType provides default values for
*     Adobe MM fonts if possible.
*
*   strid ::
*     The axis name entry in the font's 'name' table.  This is another
*     (and often better) version of the 'name' field for TrueType GX or
*     OpenType Font Variations.  Not meaningful for Adobe MM fonts.
*
* @note:
*   The fields `minimum`, `def`, and `maximum` are 16.16 fractional values
*   for TrueType GX and OpenType Font Variations.  For Adobe MM fonts, the
*   values are whole numbers (i.e., the fractional part is zero).
*/
Ft_Var_Axis :: struct {
	name:    ^i32,
	minimum: i32,
	def:     i32,
	maximum: i32,
	tag:     i32,
	strid:   i32,
}

/**************************************************************************
*
* @struct:
*   FT_Var_Named_Style
*
* @description:
*   A structure to model a named instance in a TrueType GX or OpenType
*   Font Variations.
*
*   This structure can't be used for Adobe MM fonts.
*
* @fields:
*   coords ::
*     The design coordinates for this instance.  This is an array with one
*     entry for each axis.
*
*   strid ::
*     An index into the 'name' table identifying this instance.
*
*   psid ::
*     An index into the 'name' table identifying a PostScript name for
*     this instance.  Value 0xFFFF indicates a missing entry.
*/
Ft_Var_Named_Style :: struct {
	coords: ^i32,
	strid:  i32,
	psid:   i32, /* since 2.7.1 */
}

/**************************************************************************
*
* @struct:
*   FT_MM_Var
*
* @description:
*   A structure to model the axes and space of Adobe MM fonts, TrueType
*   GX, or OpenType Font Variations.
*
*   Some fields are specific to one format and not to the others.
*
* @fields:
*   num_axis ::
*     The number of axes.  The maximum value is~4 for Adobe MM fonts; no
*     limit in TrueType GX or OpenType Font Variations.
*
*   num_designs ::
*     The number of designs; should be normally `2^num_axis` for Adobe MM
*     fonts.  Not meaningful for TrueType GX or OpenType Font Variations
*     (where every glyph could have a different number of designs).
*
*   num_namedstyles ::
*     The number of named instances.  For Adobe MM fonts, this value is
*     always zero.
*
*   axis ::
*     An axis descriptor table.  TrueType GX and OpenType Font Variations
*     contain slightly more data than Adobe MM fonts.  Memory management
*     of this pointer is done internally by FreeType.
*
*   namedstyle ::
*     An array of named instances.  Only meaningful for TrueType GX and
*     OpenType Font Variations.  Memory management of this pointer is done
*     internally by FreeType.
*/
Ft_Mm_Var :: struct {
	num_axis:        i32,
	num_designs:     i32,
	num_namedstyles: i32,
	axis:            ^Ft_Var_Axis,
	namedstyle:      ^Ft_Var_Named_Style,
}

/**************************************************************************
*
* @enum:
*   FT_VAR_AXIS_FLAG_XXX
*
* @description:
*   A list of bit flags used in the return value of
*   @FT_Get_Var_Axis_Flags.
*
* @values:
*   FT_VAR_AXIS_FLAG_HIDDEN ::
*     The variation axis should not be exposed to user interfaces.
*
* @since:
*   2.8.1
*/
FT_VAR_AXIS_FLAG_HIDDEN  :: 1

