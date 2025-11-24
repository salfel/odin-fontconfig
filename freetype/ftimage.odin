/****************************************************************************
 *
 * ftimage.h
 *
 *   FreeType glyph image formats and default raster interface
 *   (specification).
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

  /**************************************************************************
   *
   * Note: A 'raster' is simply a scan-line converter, used to render
   *       `FT_Outline`s into `FT_Bitmap`s.
   *
   * Note: This file can be used for `STANDALONE_` compilation of raster
   *       (B/W) and smooth (anti-aliased) renderers.  Therefore, it must
   *       rely on standard variable types only instead of aliases in
   *       `fttypes.h`.
   *
   */
package freetype

import "core:c"

foreign import lib "freetype.lib"
_ :: lib

Ft_Pos :: i32

/**************************************************************************
*
* @struct:
*   FT_Vector
*
* @description:
*   A simple structure used to store a 2D vector; coordinates are of the
*   FT_Pos type.
*
* @fields:
*   x ::
*     The horizontal coordinate.
*   y ::
*     The vertical coordinate.
*/
Ft_Vector :: struct {
	x: Ft_Pos,
	y: Ft_Pos,
}

/**************************************************************************
*
* @struct:
*   FT_BBox
*
* @description:
*   A structure used to hold an outline's bounding box, i.e., the
*   coordinates of its extrema in the horizontal and vertical directions.
*
* @fields:
*   xMin ::
*     The horizontal minimum (left-most).
*
*   yMin ::
*     The vertical minimum (bottom-most).
*
*   xMax ::
*     The horizontal maximum (right-most).
*
*   yMax ::
*     The vertical maximum (top-most).
*
* @note:
*   The bounding box is specified with the coordinates of the lower left
*   and the upper right corner.  In PostScript, those values are often
*   called (llx,lly) and (urx,ury), respectively.
*
*   If `yMin` is negative, this value gives the glyph's descender.
*   Otherwise, the glyph doesn't descend below the baseline.  Similarly,
*   if `ymax` is positive, this value gives the glyph's ascender.
*
*   `xMin` gives the horizontal distance from the glyph's origin to the
*   left edge of the glyph's bounding box.  If `xMin` is negative, the
*   glyph extends to the left of the origin.
*/
Ft_Bbox :: struct {
	xMin, yMin: Ft_Pos,
	xMax, yMax: Ft_Pos,
}

/**************************************************************************
*
* @enum:
*   FT_Pixel_Mode
*
* @description:
*   An enumeration type used to describe the format of pixels in a given
*   bitmap.  Note that additional formats may be added in the future.
*
* @values:
*   FT_PIXEL_MODE_NONE ::
*     Value~0 is reserved.
*
*   FT_PIXEL_MODE_MONO ::
*     A monochrome bitmap, using 1~bit per pixel.  Note that pixels are
*     stored in most-significant order (MSB), which means that the
*     left-most pixel in a byte has value 128.
*
*   FT_PIXEL_MODE_GRAY ::
*     An 8-bit bitmap, generally used to represent anti-aliased glyph
*     images.  Each pixel is stored in one byte.  Note that the number of
*     'gray' levels is stored in the `num_grays` field of the @FT_Bitmap
*     structure (it generally is 256).
*
*   FT_PIXEL_MODE_GRAY2 ::
*     A 2-bit per pixel bitmap, used to represent embedded anti-aliased
*     bitmaps in font files according to the OpenType specification.  We
*     haven't found a single font using this format, however.
*
*   FT_PIXEL_MODE_GRAY4 ::
*     A 4-bit per pixel bitmap, representing embedded anti-aliased bitmaps
*     in font files according to the OpenType specification.  We haven't
*     found a single font using this format, however.
*
*   FT_PIXEL_MODE_LCD ::
*     An 8-bit bitmap, representing RGB or BGR decimated glyph images used
*     for display on LCD displays; the bitmap is three times wider than
*     the original glyph image.  See also @FT_RENDER_MODE_LCD.
*
*   FT_PIXEL_MODE_LCD_V ::
*     An 8-bit bitmap, representing RGB or BGR decimated glyph images used
*     for display on rotated LCD displays; the bitmap is three times
*     taller than the original glyph image.  See also
*     @FT_RENDER_MODE_LCD_V.
*
*   FT_PIXEL_MODE_BGRA ::
*     [Since 2.5] An image with four 8-bit channels per pixel,
*     representing a color image (such as emoticons) with alpha channel.
*     For each pixel, the format is BGRA, which means, the blue channel
*     comes first in memory.  The color channels are pre-multiplied and in
*     the sRGB colorspace.  For example, full red at half-translucent
*     opacity will be represented as '00,00,80,80', not '00,00,FF,80'.
*     See also @FT_LOAD_COLOR.
*/
Ft_Pixel_Mode :: enum u32 {
	NONE  = 0,
	MONO  = 1,
	GRAY  = 2,
	GRAY2 = 3,
	GRAY4 = 4,
	LCD   = 5,
	LCD_V = 6,
	BGRA  = 7,
	MAX   = 8, /* do not remove */
}

/**************************************************************************
*
* @struct:
*   FT_Bitmap
*
* @description:
*   A structure used to describe a bitmap or pixmap to the raster.  Note
*   that we now manage pixmaps of various depths through the `pixel_mode`
*   field.
*
* @fields:
*   rows ::
*     The number of bitmap rows.
*
*   width ::
*     The number of pixels in bitmap row.
*
*   pitch ::
*     The pitch's absolute value is the number of bytes taken by one
*     bitmap row, including padding.  However, the pitch is positive when
*     the bitmap has a 'down' flow, and negative when it has an 'up' flow.
*     In all cases, the pitch is an offset to add to a bitmap pointer in
*     order to go down one row.
*
*     Note that 'padding' means the alignment of a bitmap to a byte
*     border, and FreeType functions normally align to the smallest
*     possible integer value.
*
*     For the B/W rasterizer, `pitch` is always an even number.
*
*     To change the pitch of a bitmap (say, to make it a multiple of 4),
*     use @FT_Bitmap_Convert.  Alternatively, you might use callback
*     functions to directly render to the application's surface; see the
*     file `example2.cpp` in the tutorial for a demonstration.
*
*   buffer ::
*     A typeless pointer to the bitmap buffer.  This value should be
*     aligned on 32-bit boundaries in most cases.
*
*   num_grays ::
*     This field is only used with @FT_PIXEL_MODE_GRAY; it gives the
*     number of gray levels used in the bitmap.
*
*   pixel_mode ::
*     The pixel mode, i.e., how pixel bits are stored.  See @FT_Pixel_Mode
*     for possible values.
*
*   palette_mode ::
*     This field is intended for paletted pixel modes; it indicates how
*     the palette is stored.  Not used currently.
*
*   palette ::
*     A typeless pointer to the bitmap palette; this field is intended for
*     paletted pixel modes.  Not used currently.
*
* @note:
*   `width` and `rows` refer to the *physical* size of the bitmap, not the
*   *logical* one.  For example, if @FT_Pixel_Mode is set to
*   `FT_PIXEL_MODE_LCD`, the logical width is a just a third of the
*   physical one.
*
*   An empty bitmap with a NULL `buffer` is valid, with `rows` and/or
*   `pitch` also set to 0.  Such bitmaps might be produced while rendering
*   empty or degenerate outlines.
*/
Ft_Bitmap :: struct {
	rows:         u32,
	width:        u32,
	pitch:        i32,
	buffer:       ^u8,
	num_grays:    u16,
	pixel_mode:   u8,
	palette_mode: u8,
	palette:      rawptr,
}

/**************************************************************************
*
* @struct:
*   FT_Outline
*
* @description:
*   This structure is used to describe an outline to the scan-line
*   converter.
*
* @fields:
*   n_contours ::
*     The number of contours in the outline.
*
*   n_points ::
*     The number of points in the outline.
*
*   points ::
*     A pointer to an array of `n_points` @FT_Vector elements, giving the
*     outline's point coordinates.
*
*   tags ::
*     A pointer to an array of `n_points` chars, giving each outline
*     point's type.
*
*     If bit~0 is unset, the point is 'off' the curve, i.e., a Bezier
*     control point, while it is 'on' if set.
*
*     Bit~1 is meaningful for 'off' points only.  If set, it indicates a
*     third-order Bezier arc control point; and a second-order control
*     point if unset.
*
*     If bit~2 is set, bits 5-7 contain the drop-out mode (as defined in
*     the OpenType specification; the value is the same as the argument to
*     the 'SCANTYPE' instruction).
*
*     Bits 3 and~4 are reserved for internal purposes.
*
*   contours ::
*     An array of `n_contours` shorts, giving the end point of each
*     contour within the outline.  For example, the first contour is
*     defined by the points '0' to `contours[0]`, the second one is
*     defined by the points `contours[0]+1` to `contours[1]`, etc.
*
*   flags ::
*     A set of bit flags used to characterize the outline and give hints
*     to the scan-converter and hinter on how to convert/grid-fit it.  See
*     @FT_OUTLINE_XXX.
*
* @note:
*   The B/W rasterizer only checks bit~2 in the `tags` array for the first
*   point of each contour.  The drop-out mode as given with
*   @FT_OUTLINE_IGNORE_DROPOUTS, @FT_OUTLINE_SMART_DROPOUTS, and
*   @FT_OUTLINE_INCLUDE_STUBS in `flags` is then overridden.
*/
Ft_Outline :: struct {
	n_contours: u16,        /* number of contours in glyph        */
	n_points:   u16,        /* number of points in the glyph      */
	points:     ^Ft_Vector, /* the outline's points               */
	tags:       ^u8,        /* the points flags                   */
	contours:   ^u16,       /* the contour end points             */
	flags:      i32,        /* outline masks                      */
}

/**************************************************************************
*
* @enum:
*   FT_OUTLINE_XXX
*
* @description:
*   A list of bit-field constants used for the flags in an outline's
*   `flags` field.
*
* @values:
*   FT_OUTLINE_NONE ::
*     Value~0 is reserved.
*
*   FT_OUTLINE_OWNER ::
*     If set, this flag indicates that the outline's field arrays (i.e.,
*     `points`, `flags`, and `contours`) are 'owned' by the outline
*     object, and should thus be freed when it is destroyed.
*
*   FT_OUTLINE_EVEN_ODD_FILL ::
*     By default, outlines are filled using the non-zero winding rule.  If
*     set to 1, the outline will be filled using the even-odd fill rule
*     (only works with the smooth rasterizer).
*
*   FT_OUTLINE_REVERSE_FILL ::
*     By default, outside contours of an outline are oriented in
*     clock-wise direction, as defined in the TrueType specification.
*     This flag is set if the outline uses the opposite direction
*     (typically for Type~1 fonts).  This flag is ignored by the scan
*     converter.
*
*   FT_OUTLINE_IGNORE_DROPOUTS ::
*     By default, the scan converter will try to detect drop-outs in an
*     outline and correct the glyph bitmap to ensure consistent shape
*     continuity.  If set, this flag hints the scan-line converter to
*     ignore such cases.  See below for more information.
*
*   FT_OUTLINE_SMART_DROPOUTS ::
*     Select smart dropout control.  If unset, use simple dropout control.
*     Ignored if @FT_OUTLINE_IGNORE_DROPOUTS is set.  See below for more
*     information.
*
*   FT_OUTLINE_INCLUDE_STUBS ::
*     If set, turn pixels on for 'stubs', otherwise exclude them.  Ignored
*     if @FT_OUTLINE_IGNORE_DROPOUTS is set.  See below for more
*     information.
*
*   FT_OUTLINE_OVERLAP ::
*     [Since 2.10.3] This flag indicates that this outline contains
*     overlapping contours and the anti-aliased renderer should perform
*     oversampling to mitigate possible artifacts.  This flag should _not_
*     be set for well designed glyphs without overlaps because it quadruples
*     the rendering time.
*
*   FT_OUTLINE_HIGH_PRECISION ::
*     This flag indicates that the scan-line converter should try to
*     convert this outline to bitmaps with the highest possible quality.
*     It is typically set for small character sizes.  Note that this is
*     only a hint that might be completely ignored by a given
*     scan-converter.
*
*   FT_OUTLINE_SINGLE_PASS ::
*     This flag is set to force a given scan-converter to only use a
*     single pass over the outline to render a bitmap glyph image.
*     Normally, it is set for very large character sizes.  It is only a
*     hint that might be completely ignored by a given scan-converter.
*
* @note:
*   The flags @FT_OUTLINE_IGNORE_DROPOUTS, @FT_OUTLINE_SMART_DROPOUTS, and
*   @FT_OUTLINE_INCLUDE_STUBS are ignored by the smooth rasterizer.
*
*   There exists a second mechanism to pass the drop-out mode to the B/W
*   rasterizer; see the `tags` field in @FT_Outline.
*
*   Please refer to the description of the 'SCANTYPE' instruction in the
*   [OpenType specification](https://learn.microsoft.com/typography/opentype/spec/tt_instructions#scantype)
*   how simple drop-outs, smart drop-outs, and stubs are defined.
*/
FT_OUTLINE_NONE             :: 0x0
FT_OUTLINE_OWNER            :: 0x1
FT_OUTLINE_EVEN_ODD_FILL    :: 0x2
FT_OUTLINE_REVERSE_FILL     :: 0x4
FT_OUTLINE_IGNORE_DROPOUTS  :: 0x8
FT_OUTLINE_SMART_DROPOUTS   :: 0x10
FT_OUTLINE_INCLUDE_STUBS    :: 0x20
FT_OUTLINE_OVERLAP          :: 0x40
FT_OUTLINE_HIGH_PRECISION   :: 0x100
FT_OUTLINE_SINGLE_PASS      :: 0x200

/* these constants are deprecated; use the corresponding */
/* `FT_OUTLINE_XXX` values instead                       */
ft_outline_none             :: FT_OUTLINE_NONE
ft_outline_owner            :: FT_OUTLINE_OWNER
ft_outline_even_odd_fill    :: FT_OUTLINE_EVEN_ODD_FILL
ft_outline_reverse_fill     :: FT_OUTLINE_REVERSE_FILL
ft_outline_ignore_dropouts  :: FT_OUTLINE_IGNORE_DROPOUTS
ft_outline_high_precision   :: FT_OUTLINE_HIGH_PRECISION
ft_outline_single_pass      :: FT_OUTLINE_SINGLE_PASS

/* see the `tags` field in `FT_Outline` for a description of the values */
FT_CURVE_TAG_ON            :: 0x01
FT_CURVE_TAG_CONIC         :: 0x00
FT_CURVE_TAG_CUBIC         :: 0x02
FT_CURVE_TAG_HAS_SCANMODE  :: 0x04
FT_CURVE_TAG_TOUCH_X       :: 0x08  /* reserved for TrueType hinter */
FT_CURVE_TAG_TOUCH_Y       :: 0x10  /* reserved for TrueType hinter */
FT_CURVE_TAG_TOUCH_BOTH    :: (FT_CURVE_TAG_TOUCH_XFT_CURVE_TAG_TOUCH_Y)

/* values 0x20, 0x40, and 0x80 are reserved */


/* these constants are deprecated; use the corresponding */
/* `FT_CURVE_TAG_XXX` values instead                     */
FT_Curve_Tag_On       :: FT_CURVE_TAG_ON
FT_Curve_Tag_Conic    :: FT_CURVE_TAG_CONIC
FT_Curve_Tag_Cubic    :: FT_CURVE_TAG_CUBIC
FT_Curve_Tag_Touch_X  :: FT_CURVE_TAG_TOUCH_X
FT_Curve_Tag_Touch_Y  :: FT_CURVE_TAG_TOUCH_Y

/**************************************************************************
*
* @functype:
*   FT_Outline_MoveToFunc
*
* @description:
*   A function pointer type used to describe the signature of a 'move to'
*   function during outline walking/decomposition.
*
*   A 'move to' is emitted to start a new contour in an outline.
*
* @input:
*   to ::
*     A pointer to the target point of the 'move to'.
*
*   user ::
*     A typeless pointer, which is passed from the caller of the
*     decomposition function.
*
* @return:
*   Error code.  0~means success.
*/
Ft_Outline_Move_To_Func :: proc "c" (to: ^Ft_Vector, user: rawptr) -> i32

FT_Outline_MoveTo_Func  :: Ft_Outline_Move_To_Func

/**************************************************************************
*
* @functype:
*   FT_Outline_LineToFunc
*
* @description:
*   A function pointer type used to describe the signature of a 'line to'
*   function during outline walking/decomposition.
*
*   A 'line to' is emitted to indicate a segment in the outline.
*
* @input:
*   to ::
*     A pointer to the target point of the 'line to'.
*
*   user ::
*     A typeless pointer, which is passed from the caller of the
*     decomposition function.
*
* @return:
*   Error code.  0~means success.
*/
Ft_Outline_Line_To_Func :: proc "c" (to: ^Ft_Vector, user: rawptr) -> i32

FT_Outline_LineTo_Func  :: Ft_Outline_Line_To_Func

/**************************************************************************
*
* @functype:
*   FT_Outline_ConicToFunc
*
* @description:
*   A function pointer type used to describe the signature of a 'conic to'
*   function during outline walking or decomposition.
*
*   A 'conic to' is emitted to indicate a second-order Bezier arc in the
*   outline.
*
* @input:
*   control ::
*     An intermediate control point between the last position and the new
*     target in `to`.
*
*   to ::
*     A pointer to the target end point of the conic arc.
*
*   user ::
*     A typeless pointer, which is passed from the caller of the
*     decomposition function.
*
* @return:
*   Error code.  0~means success.
*/
Ft_Outline_Conic_To_Func :: proc "c" (control: ^Ft_Vector, to: ^Ft_Vector, user: rawptr) -> i32

FT_Outline_ConicTo_Func  :: Ft_Outline_Conic_To_Func

/**************************************************************************
*
* @functype:
*   FT_Outline_CubicToFunc
*
* @description:
*   A function pointer type used to describe the signature of a 'cubic to'
*   function during outline walking or decomposition.
*
*   A 'cubic to' is emitted to indicate a third-order Bezier arc.
*
* @input:
*   control1 ::
*     A pointer to the first Bezier control point.
*
*   control2 ::
*     A pointer to the second Bezier control point.
*
*   to ::
*     A pointer to the target end point.
*
*   user ::
*     A typeless pointer, which is passed from the caller of the
*     decomposition function.
*
* @return:
*   Error code.  0~means success.
*/
Ft_Outline_Cubic_To_Func :: proc "c" (control1: ^Ft_Vector, control2: ^Ft_Vector, to: ^Ft_Vector, user: rawptr) -> i32

FT_Outline_CubicTo_Func  :: Ft_Outline_Cubic_To_Func

/**************************************************************************
*
* @struct:
*   FT_Outline_Funcs
*
* @description:
*   A structure to hold various function pointers used during outline
*   decomposition in order to emit segments, conic, and cubic Beziers.
*
* @fields:
*   move_to ::
*     The 'move to' emitter.
*
*   line_to ::
*     The segment emitter.
*
*   conic_to ::
*     The second-order Bezier arc emitter.
*
*   cubic_to ::
*     The third-order Bezier arc emitter.
*
*   shift ::
*     The shift that is applied to coordinates before they are sent to the
*     emitter.
*
*   delta ::
*     The delta that is applied to coordinates before they are sent to the
*     emitter, but after the shift.
*
* @note:
*   The point coordinates sent to the emitters are the transformed version
*   of the original coordinates (this is important for high accuracy
*   during scan-conversion).  The transformation is simple:
*
*   ```
*     x' = (x << shift) - delta
*     y' = (y << shift) - delta
*   ```
*
*   Set the values of `shift` and `delta` to~0 to get the original point
*   coordinates.
*/
Ft_Outline_Funcs :: struct {
	move_to:  Ft_Outline_Move_To_Func,
	line_to:  Ft_Outline_Line_To_Func,
	conic_to: Ft_Outline_Conic_To_Func,
	cubic_to: Ft_Outline_Cubic_To_Func,
	shift:    i32,
	delta:    Ft_Pos,
}

/**************************************************************************
*
* @enum:
*   FT_Glyph_Format
*
* @description:
*   An enumeration type used to describe the format of a given glyph
*   image.  Note that this version of FreeType only supports two image
*   formats, even though future font drivers will be able to register
*   their own format.
*
* @values:
*   FT_GLYPH_FORMAT_NONE ::
*     The value~0 is reserved.
*
*   FT_GLYPH_FORMAT_COMPOSITE ::
*     The glyph image is a composite of several other images.  This format
*     is _only_ used with @FT_LOAD_NO_RECURSE, and is used to report
*     compound glyphs (like accented characters).
*
*   FT_GLYPH_FORMAT_BITMAP ::
*     The glyph image is a bitmap, and can be described as an @FT_Bitmap.
*     You generally need to access the `bitmap` field of the
*     @FT_GlyphSlotRec structure to read it.
*
*   FT_GLYPH_FORMAT_OUTLINE ::
*     The glyph image is a vectorial outline made of line segments and
*     Bezier arcs; it can be described as an @FT_Outline; you generally
*     want to access the `outline` field of the @FT_GlyphSlotRec structure
*     to read it.
*
*   FT_GLYPH_FORMAT_PLOTTER ::
*     The glyph image is a vectorial path with no inside and outside
*     contours.  Some Type~1 fonts, like those in the Hershey family,
*     contain glyphs in this format.  These are described as @FT_Outline,
*     but FreeType isn't currently capable of rendering them correctly.
*
*   FT_GLYPH_FORMAT_SVG ::
*     [Since 2.12] The glyph is represented by an SVG document in the
*     'SVG~' table.
*/
Ft_Glyph_Format :: enum u32 {
	NONE      = 0,
	COMPOSITE = 1,
	BITMAP    = 2,
	OUTLINE   = 3,
	PLOTTER   = 4,
	SVG       = 5,
}

/**************************************************************************
*
* @struct:
*   FT_Span
*
* @description:
*   A structure to model a single span of consecutive pixels when
*   rendering an anti-aliased bitmap.
*
* @fields:
*   x ::
*     The span's horizontal start position.
*
*   len ::
*     The span's length in pixels.
*
*   coverage ::
*     The span color/coverage, ranging from 0 (background) to 255
*     (foreground).
*
* @note:
*   This structure is used by the span drawing callback type named
*   @FT_SpanFunc that takes the y~coordinate of the span as a parameter.
*
*   The anti-aliased rasterizer produces coverage values from 0 to 255,
*   that is, from completely transparent to completely opaque.
*/
Ft_Span :: struct {
	x:        i16,
	len:      u16,
	coverage: u8,
}

/**************************************************************************
*
* @functype:
*   FT_SpanFunc
*
* @description:
*   A function used as a call-back by the anti-aliased renderer in order
*   to let client applications draw themselves the pixel spans on each
*   scan line.
*
* @input:
*   y ::
*     The scanline's upward y~coordinate.
*
*   count ::
*     The number of spans to draw on this scanline.
*
*   spans ::
*     A table of `count` spans to draw on the scanline.
*
*   user ::
*     User-supplied data that is passed to the callback.
*
* @note:
*   This callback allows client applications to directly render the spans
*   of the anti-aliased bitmap to any kind of surfaces.
*
*   This can be used to write anti-aliased outlines directly to a given
*   background bitmap using alpha compositing.  It can also be used for
*   oversampling and averaging.
*/
Ft_Span_Func :: proc "c" (y: i32, count: i32, spans: ^Ft_Span, user: rawptr)

FT_Raster_Span_Func  :: Ft_Span_Func

/**************************************************************************
*
* @functype:
*   FT_Raster_BitTest_Func
*
* @description:
*   Deprecated, unimplemented.
*/
Ft_Raster_Bit_Test_Func :: proc "c" (y: i32, x: i32, user: rawptr) -> i32

/**************************************************************************
*
* @functype:
*   FT_Raster_BitSet_Func
*
* @description:
*   Deprecated, unimplemented.
*/
Ft_Raster_Bit_Set_Func :: proc "c" (y: i32, x: i32, user: rawptr)

/**************************************************************************
*
* @enum:
*   FT_RASTER_FLAG_XXX
*
* @description:
*   A list of bit flag constants as used in the `flags` field of a
*   @FT_Raster_Params structure.
*
* @values:
*   FT_RASTER_FLAG_DEFAULT ::
*     This value is 0.
*
*   FT_RASTER_FLAG_AA ::
*     This flag is set to indicate that an anti-aliased glyph image should
*     be generated.  Otherwise, it will be monochrome (1-bit).
*
*   FT_RASTER_FLAG_DIRECT ::
*     This flag is set to indicate direct rendering.  In this mode, client
*     applications must provide their own span callback.  This lets them
*     directly draw or compose over an existing bitmap.  If this bit is
*     _not_ set, the target pixmap's buffer _must_ be zeroed before
*     rendering and the output will be clipped to its size.
*
*     Direct rendering is only possible with anti-aliased glyphs.
*
*   FT_RASTER_FLAG_CLIP ::
*     This flag is only used in direct rendering mode.  If set, the output
*     will be clipped to a box specified in the `clip_box` field of the
*     @FT_Raster_Params structure.  Otherwise, the `clip_box` is
*     effectively set to the bounding box and all spans are generated.
*
*   FT_RASTER_FLAG_SDF ::
*     This flag is set to indicate that a signed distance field glyph
*     image should be generated.  This is only used while rendering with
*     the @FT_RENDER_MODE_SDF render mode.
*/
FT_RASTER_FLAG_DEFAULT  :: 0x0
FT_RASTER_FLAG_AA       :: 0x1
FT_RASTER_FLAG_DIRECT   :: 0x2
FT_RASTER_FLAG_CLIP     :: 0x4
FT_RASTER_FLAG_SDF      :: 0x8

/* these constants are deprecated; use the corresponding */
/* `FT_RASTER_FLAG_XXX` values instead                   */
ft_raster_flag_default  :: FT_RASTER_FLAG_DEFAULT
ft_raster_flag_aa       :: FT_RASTER_FLAG_AA
ft_raster_flag_direct   :: FT_RASTER_FLAG_DIRECT
ft_raster_flag_clip     :: FT_RASTER_FLAG_CLIP

/**************************************************************************
*
* @struct:
*   FT_Raster_Params
*
* @description:
*   A structure to hold the parameters used by a raster's render function,
*   passed as an argument to @FT_Outline_Render.
*
* @fields:
*   target ::
*     The target bitmap.
*
*   source ::
*     A pointer to the source glyph image (e.g., an @FT_Outline).
*
*   flags ::
*     The rendering flags.
*
*   gray_spans ::
*     The gray span drawing callback.
*
*   black_spans ::
*     Unused.
*
*   bit_test ::
*     Unused.
*
*   bit_set ::
*     Unused.
*
*   user ::
*     User-supplied data that is passed to each drawing callback.
*
*   clip_box ::
*     An optional span clipping box expressed in _integer_ pixels
*     (not in 26.6 fixed-point units).
*
* @note:
*   The @FT_RASTER_FLAG_AA bit flag must be set in the `flags` to
*   generate an anti-aliased glyph bitmap, otherwise a monochrome bitmap
*   is generated.  The `target` should have appropriate pixel mode and its
*   dimensions define the clipping region.
*
*   If both @FT_RASTER_FLAG_AA and @FT_RASTER_FLAG_DIRECT bit flags
*   are set in `flags`, the raster calls an @FT_SpanFunc callback
*   `gray_spans` with `user` data as an argument ignoring `target`.  This
*   allows direct composition over a pre-existing user surface to perform
*   the span drawing and composition.  To optionally clip the spans, set
*   the @FT_RASTER_FLAG_CLIP flag and `clip_box`.  The monochrome raster
*   does not support the direct mode.
*
*   The gray-level rasterizer always uses 256 gray levels.  If you want
*   fewer gray levels, you have to use @FT_RASTER_FLAG_DIRECT and reduce
*   the levels in the callback function.
*/
Ft_Raster_Params :: struct {
	target:      ^Ft_Bitmap,
	source:      rawptr,
	flags:       i32,
	gray_spans:  Ft_Span_Func,
	black_spans: Ft_Span_Func,            /* unused */
	bit_test:    Ft_Raster_Bit_Test_Func, /* unused */
	_bit_set:    Ft_Raster_Bit_Set_Func,  /* unused */
	user:        rawptr,
	clip_box:    Ft_Bbox,
}

/**************************************************************************
*
* @type:
*   FT_Raster
*
* @description:
*   An opaque handle (pointer) to a raster object.  Each object can be
*   used independently to convert an outline into a bitmap or pixmap.
*
* @note:
*   In FreeType 2, all rasters are now encapsulated within specific
*   @FT_Renderer modules and only used in their context.
*
*/
Ft_Raster     :: ^Ft_Raster_Rec
Ft_Raster_Rec :: struct {}

/**************************************************************************
*
* @functype:
*   FT_Raster_NewFunc
*
* @description:
*   A function used to create a new raster object.
*
* @input:
*   memory ::
*     A handle to the memory allocator.
*
* @output:
*   raster ::
*     A handle to the new raster object.
*
* @return:
*   Error code.  0~means success.
*
* @note:
*   The `memory` parameter is a typeless pointer in order to avoid
*   un-wanted dependencies on the rest of the FreeType code.  In practice,
*   it is an @FT_Memory object, i.e., a handle to the standard FreeType
*   memory allocator.  However, this field can be completely ignored by a
*   given raster implementation.
*/
Ft_Raster_New_Func :: proc "c" (memory: rawptr, raster: ^Ft_Raster) -> i32

FT_Raster_New_Func  :: Ft_Raster_New_Func

/**************************************************************************
*
* @functype:
*   FT_Raster_DoneFunc
*
* @description:
*   A function used to destroy a given raster object.
*
* @input:
*   raster ::
*     A handle to the raster object.
*/
Ft_Raster_Done_Func :: proc "c" (raster: Ft_Raster)

FT_Raster_Done_Func  :: Ft_Raster_Done_Func

/**************************************************************************
*
* @functype:
*   FT_Raster_ResetFunc
*
* @description:
*   FreeType used to provide an area of memory called the 'render pool'
*   available to all registered rasterizers.  This was not thread safe,
*   however, and now FreeType never allocates this pool.
*
*   This function is called after a new raster object is created.
*
* @input:
*   raster ::
*     A handle to the new raster object.
*
*   pool_base ::
*     Previously, the address in memory of the render pool.  Set this to
*     `NULL`.
*
*   pool_size ::
*     Previously, the size in bytes of the render pool.  Set this to 0.
*
* @note:
*   Rasterizers should rely on dynamic or stack allocation if they want to
*   (a handle to the memory allocator is passed to the rasterizer
*   constructor).
*/
Ft_Raster_Reset_Func :: proc "c" (raster: Ft_Raster, pool_base: ^u8, pool_size: c.ulong)

FT_Raster_Reset_Func  :: Ft_Raster_Reset_Func

/**************************************************************************
*
* @functype:
*   FT_Raster_SetModeFunc
*
* @description:
*   This function is a generic facility to change modes or attributes in a
*   given raster.  This can be used for debugging purposes, or simply to
*   allow implementation-specific 'features' in a given raster module.
*
* @input:
*   raster ::
*     A handle to the new raster object.
*
*   mode ::
*     A 4-byte tag used to name the mode or property.
*
*   args ::
*     A pointer to the new mode/property to use.
*/
Ft_Raster_Set_Mode_Func :: proc "c" (raster: Ft_Raster, mode: c.ulong, args: rawptr) -> i32

FT_Raster_Set_Mode_Func  :: Ft_Raster_Set_Mode_Func

/**************************************************************************
*
* @functype:
*   FT_Raster_RenderFunc
*
* @description:
*   Invoke a given raster to scan-convert a given glyph image into a
*   target bitmap.
*
* @input:
*   raster ::
*     A handle to the raster object.
*
*   params ::
*     A pointer to an @FT_Raster_Params structure used to store the
*     rendering parameters.
*
* @return:
*   Error code.  0~means success.
*
* @note:
*   The exact format of the source image depends on the raster's glyph
*   format defined in its @FT_Raster_Funcs structure.  It can be an
*   @FT_Outline or anything else in order to support a large array of
*   glyph formats.
*
*   Note also that the render function can fail and return a
*   `FT_Err_Unimplemented_Feature` error code if the raster used does not
*   support direct composition.
*/
Ft_Raster_Render_Func :: proc "c" (raster: Ft_Raster, params: ^Ft_Raster_Params) -> i32

FT_Raster_Render_Func  :: Ft_Raster_Render_Func

/**************************************************************************
*
* @struct:
*   FT_Raster_Funcs
*
* @description:
*  A structure used to describe a given raster class to the library.
*
* @fields:
*   glyph_format ::
*     The supported glyph format for this raster.
*
*   raster_new ::
*     The raster constructor.
*
*   raster_reset ::
*     Used to reset the render pool within the raster.
*
*   raster_render ::
*     A function to render a glyph into a given bitmap.
*
*   raster_done ::
*     The raster destructor.
*/
Ft_Raster_Funcs :: struct {
	glyph_format:    Ft_Glyph_Format,
	raster_new:      Ft_Raster_New_Func,
	raster_reset:    Ft_Raster_Reset_Func,
	raster_set_mode: Ft_Raster_Set_Mode_Func,
	raster_render:   Ft_Raster_Render_Func,
	raster_done:     Ft_Raster_Done_Func,
}

