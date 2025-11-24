/****************************************************************************
 *
 * ftcolor.h
 *
 *   FreeType's glyph color management (specification).
 *
 * Copyright (C) 2018-2025 by
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

Ft_Color :: i32

/**************************************************************************
*
* @enum:
*   FT_PALETTE_XXX
*
* @description:
*   A list of bit field constants used in the `palette_flags` array of the
*   @FT_Palette_Data structure to indicate for which background a palette
*   with a given index is usable.
*
* @values:
*   FT_PALETTE_FOR_LIGHT_BACKGROUND ::
*     The palette is appropriate to use when displaying the font on a
*     light background such as white.
*
*   FT_PALETTE_FOR_DARK_BACKGROUND ::
*     The palette is appropriate to use when displaying the font on a dark
*     background such as black.
*
* @since:
*   2.10
*/
FT_PALETTE_FOR_LIGHT_BACKGROUND  :: 0x01
FT_PALETTE_FOR_DARK_BACKGROUND   :: 0x02

/**************************************************************************
*
* @struct:
*   FT_Palette_Data
*
* @description:
*   This structure holds the data of the 'CPAL' table.
*
* @fields:
*   num_palettes ::
*     The number of palettes.
*
*   palette_name_ids ::
*     An optional read-only array of palette name IDs with `num_palettes`
*     elements, corresponding to entries like 'dark' or 'light' in the
*     font's 'name' table.
*
*     An empty name ID in the 'CPAL' table gets represented as value
*     0xFFFF.
*
*     `NULL` if the font's 'CPAL' table doesn't contain appropriate data.
*
*   palette_flags ::
*     An optional read-only array of palette flags with `num_palettes`
*     elements.  Possible values are an ORed combination of
*     @FT_PALETTE_FOR_LIGHT_BACKGROUND and
*     @FT_PALETTE_FOR_DARK_BACKGROUND.
*
*     `NULL` if the font's 'CPAL' table doesn't contain appropriate data.
*
*   num_palette_entries ::
*     The number of entries in a single palette.  All palettes have the
*     same size.
*
*   palette_entry_name_ids ::
*     An optional read-only array of palette entry name IDs with
*     `num_palette_entries`.  In each palette, entries with the same index
*     have the same function.  For example, index~0 might correspond to
*     string 'outline' in the font's 'name' table to indicate that this
*     palette entry is used for outlines, index~1 might correspond to
*     'fill' to indicate the filling color palette entry, etc.
*
*     An empty entry name ID in the 'CPAL' table gets represented as value
*     0xFFFF.
*
*     `NULL` if the font's 'CPAL' table doesn't contain appropriate data.
*
* @note:
*   Use function @FT_Get_Sfnt_Name to map name IDs and entry name IDs to
*   name strings.
*
*   Use function @FT_Palette_Select to get the colors associated with a
*   palette entry.
*
* @since:
*   2.10
*/
Ft_Palette_Data :: struct {
	num_palettes:           i32,
	palette_name_ids:       ^i32,
	palette_flags:          ^i32,
	num_palette_entries:    i32,
	palette_entry_name_ids: ^i32,
}

/**************************************************************************
*
* @struct:
*   FT_LayerIterator
*
* @description:
*   This iterator object is needed for @FT_Get_Color_Glyph_Layer.
*
* @fields:
*   num_layers ::
*     The number of glyph layers for the requested glyph index.  Will be
*     set by @FT_Get_Color_Glyph_Layer.
*
*   layer ::
*     The current layer.  Will be set by @FT_Get_Color_Glyph_Layer.
*
*   p ::
*     An opaque pointer into 'COLR' table data.  The caller must set this
*     to `NULL` before the first call of @FT_Get_Color_Glyph_Layer.
*/
Ft_Layer_Iterator :: struct {
	num_layers: i32,
	layer:      i32,
	p:          ^i32,
}

/**************************************************************************
*
* @enum:
*   FT_PaintFormat
*
* @description:
*   Enumeration describing the different paint format types of the v1
*   extensions to the 'COLR' table, see
*   'https://github.com/googlefonts/colr-gradients-spec'.
*
*   The enumeration values loosely correspond with the format numbers of
*   the specification: FreeType always returns a fully specified 'Paint'
*   structure for the 'Transform', 'Translate', 'Scale', 'Rotate', and
*   'Skew' table types even though the specification has different formats
*   depending on whether or not a center is specified, whether the scale
*   is uniform in x and y~direction or not, etc.  Also, only non-variable
*   format identifiers are listed in this enumeration; as soon as support
*   for variable 'COLR' v1 fonts is implemented, interpolation is
*   performed dependent on axis coordinates, which are configured on the
*   @FT_Face through @FT_Set_Var_Design_Coordinates.  This implies that
*   always static, readily interpolated values are returned in the 'Paint'
*   structures.
*
* @since:
*   2.13
*/
Ft_Paint_Format :: enum u32 {
	FORMAT_COLR_LAYERS     = 1,
	FORMAT_SOLID           = 2,
	FORMAT_LINEAR_GRADIENT = 4,
	FORMAT_RADIAL_GRADIENT = 6,
	FORMAT_SWEEP_GRADIENT  = 8,
	FORMAT_GLYPH           = 10,
	FORMAT_COLR_GLYPH      = 11,
	FORMAT_TRANSFORM       = 12,
	FORMAT_TRANSLATE       = 14,
	FORMAT_SCALE           = 16,
	FORMAT_ROTATE          = 24,
	FORMAT_SKEW            = 28,
	FORMAT_COMPOSITE       = 32,
	_FORMAT_MAX            = 33,
	FORMAT_UNSUPPORTED     = 255,
}

/**************************************************************************
*
* @struct:
*   FT_ColorStopIterator
*
* @description:
*   This iterator object is needed for @FT_Get_Colorline_Stops.  It keeps
*   state while iterating over the stops of an @FT_ColorLine, representing
*   the `ColorLine` struct of the v1 extensions to 'COLR', see
*   'https://github.com/googlefonts/colr-gradients-spec'.  Do not manually
*   modify fields of this iterator.
*
* @fields:
*   num_color_stops ::
*     The number of color stops for the requested glyph index.  Set by
*     @FT_Get_Paint.
*
*   current_color_stop ::
*     The current color stop.  Set by @FT_Get_Colorline_Stops.
*
*   p ::
*     An opaque pointer into 'COLR' table data.  Set by @FT_Get_Paint.
*     Updated by @FT_Get_Colorline_Stops.
*
*   read_variable ::
*     A boolean keeping track of whether variable color lines are to be
*     read.  Set by @FT_Get_Paint.
*
* @since:
*   2.13
*/
Ft_Color_Stop_Iterator :: struct {
	num_color_stops:    i32,
	current_color_stop: i32,
	p:                  ^i32,
	read_variable:      i32,
}

/**************************************************************************
*
* @struct:
*   FT_ColorIndex
*
* @description:
*   A structure representing a `ColorIndex` value of the 'COLR' v1
*   extensions, see 'https://github.com/googlefonts/colr-gradients-spec'.
*
* @fields:
*   palette_index ::
*     The palette index into a 'CPAL' palette.
*
*   alpha ::
*     Alpha transparency value multiplied with the value from 'CPAL'.
*
* @since:
*   2.13
*/
Ft_Color_Index :: struct {
	palette_index: i32,
	alpha:         i32,
}

/**************************************************************************
*
* @struct:
*   FT_ColorStop
*
* @description:
*   A structure representing a `ColorStop` value of the 'COLR' v1
*   extensions, see 'https://github.com/googlefonts/colr-gradients-spec'.
*
* @fields:
*   stop_offset ::
*     The stop offset along the gradient, expressed as a 16.16 fixed-point
*     coordinate.
*
*   color ::
*     The color information for this stop, see @FT_ColorIndex.
*
* @since:
*   2.13
*/
Ft_Color_Stop :: struct {
	stop_offset: i32,
	color:       Ft_Color_Index,
}

/**************************************************************************
*
* @enum:
*   FT_PaintExtend
*
* @description:
*   An enumeration representing the 'Extend' mode of the 'COLR' v1
*   extensions, see 'https://github.com/googlefonts/colr-gradients-spec'.
*   It describes how the gradient fill continues at the other boundaries.
*
* @since:
*   2.13
*/
Ft_Paint_Extend :: enum u32 {
	PAD     = 0,
	REPEAT  = 1,
	REFLECT = 2,
}

/**************************************************************************
*
* @struct:
*   FT_ColorLine
*
* @description:
*   A structure representing a `ColorLine` value of the 'COLR' v1
*   extensions, see 'https://github.com/googlefonts/colr-gradients-spec'.
*   It describes a list of color stops along the defined gradient.
*
* @fields:
*   extend ::
*     The extend mode at the outer boundaries, see @FT_PaintExtend.
*
*   color_stop_iterator ::
*     The @FT_ColorStopIterator used to enumerate and retrieve the
*     actual @FT_ColorStop's.
*
* @since:
*   2.13
*/
Ft_Color_Line :: struct {
	extend:              Ft_Paint_Extend,
	color_stop_iterator: Ft_Color_Stop_Iterator,
}

/**************************************************************************
*
* @struct:
*   FT_Affine23
*
* @description:
*   A structure used to store a 2x3 matrix.  Coefficients are in
*   16.16 fixed-point format.  The computation performed is
*
*   ```
*     x' = x*xx + y*xy + dx
*     y' = x*yx + y*yy + dy
*   ```
*
* @fields:
*   xx ::
*     Matrix coefficient.
*
*   xy ::
*     Matrix coefficient.
*
*   dx ::
*     x translation.
*
*   yx ::
*     Matrix coefficient.
*
*   yy ::
*     Matrix coefficient.
*
*   dy ::
*     y translation.
*
* @since:
*   2.13
*/
Ft_Affine_23 :: struct {
	xx, xy, dx: i32,
	yx, yy, dy: i32,
}

/**************************************************************************
*
* @struct:
*   FT_Affine23
*
* @description:
*   A structure used to store a 2x3 matrix.  Coefficients are in
*   16.16 fixed-point format.  The computation performed is
*
*   ```
*     x' = x*xx + y*xy + dx
*     y' = x*yx + y*yy + dy
*   ```
*
* @fields:
*   xx ::
*     Matrix coefficient.
*
*   xy ::
*     Matrix coefficient.
*
*   dx ::
*     x translation.
*
*   yx ::
*     Matrix coefficient.
*
*   yy ::
*     Matrix coefficient.
*
*   dy ::
*     y translation.
*
* @since:
*   2.13
*/
Ft_Affine23 :: Ft_Affine_23

/**************************************************************************
*
* @enum:
*   FT_Composite_Mode
*
* @description:
*   An enumeration listing the 'COLR' v1 composite modes used in
*   @FT_PaintComposite.  For more details on each paint mode, see
*   'https://www.w3.org/TR/compositing-1/#porterduffcompositingoperators'.
*
* @since:
*   2.13
*/
Ft_Composite_Mode :: enum u32 {
	CLEAR          = 0,
	SRC            = 1,
	DEST           = 2,
	SRC_OVER       = 3,
	DEST_OVER      = 4,
	SRC_IN         = 5,
	DEST_IN        = 6,
	SRC_OUT        = 7,
	DEST_OUT       = 8,
	SRC_ATOP       = 9,
	DEST_ATOP      = 10,
	XOR            = 11,
	PLUS           = 12,
	SCREEN         = 13,
	OVERLAY        = 14,
	DARKEN         = 15,
	LIGHTEN        = 16,
	COLOR_DODGE    = 17,
	COLOR_BURN     = 18,
	HARD_LIGHT     = 19,
	SOFT_LIGHT     = 20,
	DIFFERENCE     = 21,
	EXCLUSION      = 22,
	MULTIPLY       = 23,
	HSL_HUE        = 24,
	HSL_SATURATION = 25,
	HSL_COLOR      = 26,
	HSL_LUMINOSITY = 27,
	MAX            = 28,
}

/**************************************************************************
*
* @struct:
*   FT_OpaquePaint
*
* @description:
*   A structure representing an offset to a `Paint` value stored in any
*   of the paint tables of a 'COLR' v1 font.  Compare Offset<24> there.
*   When 'COLR' v1 paint tables represented by FreeType objects such as
*   @FT_PaintColrLayers, @FT_PaintComposite, or @FT_PaintTransform
*   reference downstream nested paint tables, we do not immediately
*   retrieve them but encapsulate their location in this type.  Use
*   @FT_Get_Paint to retrieve the actual @FT_COLR_Paint object that
*   describes the details of the respective paint table.
*
* @fields:
*   p ::
*     An internal offset to a Paint table, needs to be set to NULL before
*     passing this struct as an argument to @FT_Get_Paint.
*
*   insert_root_transform ::
*     An internal boolean to track whether an initial root transform is
*     to be provided.  Do not set this value.
*
* @since:
*   2.13
*/
Ft_Opaque_Paint :: struct {
	p:                     ^i32,
	insert_root_transform: i32,
}

/**************************************************************************
*
* @struct:
*   FT_PaintColrLayers
*
* @description:
*   A structure representing a `PaintColrLayers` table of a 'COLR' v1
*   font.  This table describes a set of layers that are to be composited
*   with composite mode `FT_COLR_COMPOSITE_SRC_OVER`.  The return value
*   of this function is an @FT_LayerIterator initialized so that it can
*   be used with @FT_Get_Paint_Layers to retrieve the @FT_OpaquePaint
*   objects as references to each layer.
*
* @fields:
*   layer_iterator ::
*     The layer iterator that describes the layers of this paint.
*
* @since:
*   2.13
*/
Ft_Paint_Colr_Layers :: struct {
	layer_iterator: Ft_Layer_Iterator,
}

/**************************************************************************
*
* @struct:
*   FT_PaintSolid
*
* @description:
*   A structure representing a `PaintSolid` value of the 'COLR' v1
*   extensions, see 'https://github.com/googlefonts/colr-gradients-spec'.
*   Using a `PaintSolid` value means that the glyph layer filled with
*   this paint is solid-colored and does not contain a gradient.
*
* @fields:
*   color ::
*     The color information for this solid paint, see @FT_ColorIndex.
*
* @since:
*   2.13
*/
Ft_Paint_Solid :: struct {
	color: Ft_Color_Index,
}

/**************************************************************************
*
* @struct:
*   FT_PaintLinearGradient
*
* @description:
*   A structure representing a `PaintLinearGradient` value of the 'COLR'
*   v1 extensions, see
*   'https://github.com/googlefonts/colr-gradients-spec'.  The glyph
*   layer filled with this paint is drawn filled with a linear gradient.
*
* @fields:
*   colorline ::
*     The @FT_ColorLine information for this paint, i.e., the list of
*     color stops along the gradient.
*
*   p0 ::
*     The starting point of the gradient definition in font units
*     represented as a 16.16 fixed-point `FT_Vector`.
*
*   p1 ::
*     The end point of the gradient definition in font units
*     represented as a 16.16 fixed-point `FT_Vector`.
*
*   p2 ::
*     Optional point~p2 to rotate the gradient in font units
*     represented as a 16.16 fixed-point `FT_Vector`.
*     Otherwise equal to~p0.
*
* @since:
*   2.13
*/
Ft_Paint_Linear_Gradient :: struct {
	colorline: Ft_Color_Line,

	/* TODO: Potentially expose those as x0, y0 etc. */
	p0: i32,
	p1: i32,
	p2: i32,
}

/**************************************************************************
*
* @struct:
*   FT_PaintRadialGradient
*
* @description:
*   A structure representing a `PaintRadialGradient` value of the 'COLR'
*   v1 extensions, see
*   'https://github.com/googlefonts/colr-gradients-spec'.  The glyph
*   layer filled with this paint is drawn filled with a radial gradient.
*
* @fields:
*   colorline ::
*     The @FT_ColorLine information for this paint, i.e., the list of
*     color stops along the gradient.
*
*   c0 ::
*     The center of the starting point of the radial gradient in font
*     units represented as a 16.16 fixed-point `FT_Vector`.
*
*   r0 ::
*     The radius of the starting circle of the radial gradient in font
*     units represented as a 16.16 fixed-point value.
*
*   c1 ::
*     The center of the end point of the radial gradient in font units
*     represented as a 16.16 fixed-point `FT_Vector`.
*
*   r1 ::
*     The radius of the end circle of the radial gradient in font
*     units represented as a 16.16 fixed-point value.
*
* @since:
*   2.13
*/
Ft_Paint_Radial_Gradient :: struct {
	colorline: Ft_Color_Line,
	c0:        i32,
	r0:        i32,
	c1:        i32,
	r1:        i32,
}

/**************************************************************************
*
* @struct:
*   FT_PaintSweepGradient
*
* @description:
*   A structure representing a `PaintSweepGradient` value of the 'COLR'
*   v1 extensions, see
*   'https://github.com/googlefonts/colr-gradients-spec'.  The glyph
*   layer filled with this paint is drawn filled with a sweep gradient
*   from `start_angle` to `end_angle`.
*
* @fields:
*   colorline ::
*     The @FT_ColorLine information for this paint, i.e., the list of
*     color stops along the gradient.
*
*   center ::
*     The center of the sweep gradient in font units represented as a
*     vector of 16.16 fixed-point values.
*
*   start_angle ::
*     The start angle of the sweep gradient in 16.16 fixed-point
*     format specifying degrees divided by 180.0 (as in the
*     spec).  Multiply by 180.0f to receive degrees value.  Values are
*     given counter-clockwise, starting from the (positive) y~axis.
*
*   end_angle ::
*     The end angle of the sweep gradient in 16.16 fixed-point
*     format specifying degrees divided by 180.0 (as in the
*     spec).  Multiply by 180.0f to receive degrees value.  Values are
*     given counter-clockwise, starting from the (positive) y~axis.
*
* @since:
*   2.13
*/
Ft_Paint_Sweep_Gradient :: struct {
	colorline:   Ft_Color_Line,
	center:      i32,
	start_angle: i32,
	end_angle:   i32,
}

/**************************************************************************
*
* @struct:
*   FT_PaintGlyph
*
* @description:
*   A structure representing a 'COLR' v1 `PaintGlyph` paint table.
*
* @fields:
*   paint ::
*     An opaque paint object pointing to a `Paint` table that serves as
*     the fill for the glyph ID.
*
*   glyphID ::
*     The glyph ID from the 'glyf' table, which serves as the contour
*     information that is filled with paint.
*
* @since:
*   2.13
*/
Ft_Paint_Glyph :: struct {
	paint:   Ft_Opaque_Paint,
	glyphID: i32,
}

/**************************************************************************
*
* @struct:
*   FT_PaintColrGlyph
*
* @description:
*   A structure representing a 'COLR' v1 `PaintColorGlyph` paint table.
*
* @fields:
*   glyphID ::
*     The glyph ID from the `BaseGlyphV1List` table that is drawn for
*     this paint.
*
* @since:
*   2.13
*/
Ft_Paint_Colr_Glyph :: struct {
	glyphID: i32,
}

/**************************************************************************
*
* @struct:
*   FT_PaintTransform
*
* @description:
*   A structure representing a 'COLR' v1 `PaintTransform` paint table.
*
* @fields:
*   paint ::
*     An opaque paint that is subject to being transformed.
*
*   affine ::
*     A 2x3 transformation matrix in @FT_Affine23 format containing
*     16.16 fixed-point values.
*
* @since:
*   2.13
*/
Ft_Paint_Transform :: struct {
	paint:  Ft_Opaque_Paint,
	affine: Ft_Affine23,
}

/**************************************************************************
*
* @struct:
*   FT_PaintTranslate
*
* @description:
*   A structure representing a 'COLR' v1 `PaintTranslate` paint table.
*   Used for translating downstream paints by a given x and y~delta.
*
* @fields:
*   paint ::
*     An @FT_OpaquePaint object referencing the paint that is to be
*     rotated.
*
*   dx ::
*     Translation in x~direction in font units represented as a
*     16.16 fixed-point value.
*
*   dy ::
*     Translation in y~direction in font units represented as a
*     16.16 fixed-point value.
*
* @since:
*   2.13
*/
Ft_Paint_Translate :: struct {
	paint: Ft_Opaque_Paint,
	dx:    i32,
	dy:    i32,
}

/**************************************************************************
*
* @struct:
*   FT_PaintScale
*
* @description:
*   A structure representing all of the 'COLR' v1 'PaintScale*' paint
*   tables.  Used for scaling downstream paints by a given x and y~scale,
*   with a given center.  This structure is used for all 'PaintScale*'
*   types that are part of specification; fields of this structure are
*   filled accordingly.  If there is a center, the center values are set,
*   otherwise they are set to the zero coordinate.  If the source font
*   file has 'PaintScaleUniform*' set, the scale values are set
*   accordingly to the same value.
*
* @fields:
*   paint ::
*     An @FT_OpaquePaint object referencing the paint that is to be
*     scaled.
*
*   scale_x ::
*     Scale factor in x~direction represented as a
*     16.16 fixed-point value.
*
*   scale_y ::
*     Scale factor in y~direction represented as a
*     16.16 fixed-point value.
*
*   center_x ::
*     x~coordinate of center point to scale from represented as a
*     16.16 fixed-point value.
*
*   center_y ::
*     y~coordinate of center point to scale from represented as a
*     16.16 fixed-point value.
*
* @since:
*   2.13
*/
Ft_Paint_Scale :: struct {
	paint:    Ft_Opaque_Paint,
	scale_x:  i32,
	scale_y:  i32,
	center_x: i32,
	center_y: i32,
}

/**************************************************************************
*
* @struct:
*   FT_PaintRotate
*
* @description:
*   A structure representing a 'COLR' v1 `PaintRotate` paint table.  Used
*   for rotating downstream paints with a given center and angle.
*
* @fields:
*   paint ::
*     An @FT_OpaquePaint object referencing the paint that is to be
*     rotated.
*
*   angle ::
*     The rotation angle that is to be applied in degrees divided by
*     180.0 (as in the spec) represented as a 16.16 fixed-point
*     value.  Multiply by 180.0f to receive degrees value.
*
*   center_x ::
*     The x~coordinate of the pivot point of the rotation in font
*     units represented as a 16.16 fixed-point value.
*
*   center_y ::
*     The y~coordinate of the pivot point of the rotation in font
*     units represented as a 16.16 fixed-point value.
*
* @since:
*   2.13
*/
Ft_Paint_Rotate :: struct {
	paint:    Ft_Opaque_Paint,
	angle:    i32,
	center_x: i32,
	center_y: i32,
}

/**************************************************************************
*
* @struct:
*   FT_PaintSkew
*
* @description:
*   A structure representing a 'COLR' v1 `PaintSkew` paint table.  Used
*   for skewing or shearing downstream paints by a given center and
*   angle.
*
* @fields:
*   paint ::
*     An @FT_OpaquePaint object referencing the paint that is to be
*     skewed.
*
*   x_skew_angle ::
*     The skewing angle in x~direction in degrees divided by 180.0
*     (as in the spec) represented as a 16.16 fixed-point
*     value. Multiply by 180.0f to receive degrees.
*
*   y_skew_angle ::
*     The skewing angle in y~direction in degrees divided by 180.0
*     (as in the spec) represented as a 16.16 fixed-point
*     value.  Multiply by 180.0f to receive degrees.
*
*   center_x ::
*     The x~coordinate of the pivot point of the skew in font units
*     represented as a 16.16 fixed-point value.
*
*   center_y ::
*     The y~coordinate of the pivot point of the skew in font units
*     represented as a 16.16 fixed-point value.
*
* @since:
*   2.13
*/
Ft_Paint_Skew :: struct {
	paint:        Ft_Opaque_Paint,
	x_skew_angle: i32,
	y_skew_angle: i32,
	center_x:     i32,
	center_y:     i32,
}

/**************************************************************************
*
* @struct:
*   FT_PaintComposite
*
* @description:
*   A structure representing a 'COLR' v1 `PaintComposite` paint table.
*   Used for compositing two paints in a 'COLR' v1 directed acyclic graph.
*
* @fields:
*   source_paint ::
*     An @FT_OpaquePaint object referencing the source that is to be
*     composited.
*
*   composite_mode ::
*     An @FT_Composite_Mode enum value determining the composition
*     operation.
*
*   backdrop_paint ::
*     An @FT_OpaquePaint object referencing the backdrop paint that
*     `source_paint` is composited onto.
*
* @since:
*   2.13
*/
Ft_Paint_Composite :: struct {
	source_paint:   Ft_Opaque_Paint,
	composite_mode: Ft_Composite_Mode,
	backdrop_paint: Ft_Opaque_Paint,
}

/**************************************************************************
*
* @union:
*   FT_COLR_Paint
*
* @description:
*   A union object representing format and details of a paint table of a
*   'COLR' v1 font, see
*   'https://github.com/googlefonts/colr-gradients-spec'.  Use
*   @FT_Get_Paint to retrieve a @FT_COLR_Paint for an @FT_OpaquePaint
*   object.
*
* @fields:
*   format ::
*     The gradient format for this Paint structure.
*
*   u ::
*     Union of all paint table types:
*
*       * @FT_PaintColrLayers
*       * @FT_PaintGlyph
*       * @FT_PaintSolid
*       * @FT_PaintLinearGradient
*       * @FT_PaintRadialGradient
*       * @FT_PaintSweepGradient
*       * @FT_PaintTransform
*       * @FT_PaintTranslate
*       * @FT_PaintRotate
*       * @FT_PaintSkew
*       * @FT_PaintComposite
*       * @FT_PaintColrGlyph
*
* @since:
*   2.13
*/
Ft_Colr_Paint :: struct {
	format: Ft_Paint_Format,

	u: struct #raw_union {
		colr_layers:     Ft_Paint_Colr_Layers,
		glyph:           Ft_Paint_Glyph,
		solid:           Ft_Paint_Solid,
		linear_gradient: Ft_Paint_Linear_Gradient,
		radial_gradient: Ft_Paint_Radial_Gradient,
		sweep_gradient:  Ft_Paint_Sweep_Gradient,
		transform:       Ft_Paint_Transform,
		translate:       Ft_Paint_Translate,
		scale:           Ft_Paint_Scale,
		rotate:          Ft_Paint_Rotate,
		skew:            Ft_Paint_Skew,
		composite:       Ft_Paint_Composite,
		colr_glyph:      Ft_Paint_Colr_Glyph,
	},
}

/**************************************************************************
*
* @enum:
*   FT_Color_Root_Transform
*
* @description:
*   An enumeration to specify whether @FT_Get_Color_Glyph_Paint is to
*   return a root transform to configure the client's graphics context
*   matrix.
*
* @values:
*   FT_COLOR_INCLUDE_ROOT_TRANSFORM ::
*     Do include the root transform as the initial @FT_COLR_Paint object.
*
*   FT_COLOR_NO_ROOT_TRANSFORM ::
*     Do not output an initial root transform.
*
* @since:
*   2.13
*/
Ft_Color_Root_Transform :: enum u32 {
	INCLUDE_ROOT_TRANSFORM = 0,
	NO_ROOT_TRANSFORM      = 1,
	ROOT_TRANSFORM_MAX     = 2,
}

/**************************************************************************
*
* @struct:
*   FT_ClipBox
*
* @description:
*   A structure representing a 'COLR' v1 'ClipBox' table.  'COLR' v1
*   glyphs may optionally define a clip box for aiding allocation or
*   defining a maximum drawable region.  Use @FT_Get_Color_Glyph_ClipBox
*   to retrieve it.
*
* @fields:
*   bottom_left ::
*     The bottom left corner of the clip box as an @FT_Vector with
*     fixed-point coordinates in 26.6 format.
*
*   top_left ::
*     The top left corner of the clip box as an @FT_Vector with
*     fixed-point coordinates in 26.6 format.
*
*   top_right ::
*     The top right corner of the clip box as an @FT_Vector with
*     fixed-point coordinates in 26.6 format.
*
*   bottom_right ::
*     The bottom right corner of the clip box as an @FT_Vector with
*     fixed-point coordinates in 26.6 format.
*
* @since:
*   2.13
*/
Ft_Clip_Box :: struct {
	bottom_left:  i32,
	top_left:     i32,
	top_right:    i32,
	bottom_right: i32,
}

