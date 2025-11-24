/****************************************************************************
 *
 * ftstroke.h
 *
 *   FreeType path stroker (specification).
 *
 * Copyright (C) 2002-2025 by
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

Ft_Stroker :: ^i32

/**************************************************************************
*
* @enum:
*   FT_Stroker_LineJoin
*
* @description:
*   These values determine how two joining lines are rendered in a
*   stroker.
*
* @values:
*   FT_STROKER_LINEJOIN_ROUND ::
*     Used to render rounded line joins.  Circular arcs are used to join
*     two lines smoothly.
*
*   FT_STROKER_LINEJOIN_BEVEL ::
*     Used to render beveled line joins.  The outer corner of the joined
*     lines is filled by enclosing the triangular region of the corner
*     with a straight line between the outer corners of each stroke.
*
*   FT_STROKER_LINEJOIN_MITER_FIXED ::
*     Used to render mitered line joins, with fixed bevels if the miter
*     limit is exceeded.  The outer edges of the strokes for the two
*     segments are extended until they meet at an angle.  A bevel join
*     (see above) is used if the segments meet at too sharp an angle and
*     the outer edges meet beyond a distance corresponding to the meter
*     limit.  This prevents long spikes being created.
*     `FT_STROKER_LINEJOIN_MITER_FIXED` generates a miter line join as
*     used in PostScript and PDF.
*
*   FT_STROKER_LINEJOIN_MITER_VARIABLE ::
*   FT_STROKER_LINEJOIN_MITER ::
*     Used to render mitered line joins, with variable bevels if the miter
*     limit is exceeded.  The intersection of the strokes is clipped
*     perpendicularly to the bisector, at a distance corresponding to
*     the miter limit. This prevents long spikes being created.
*     `FT_STROKER_LINEJOIN_MITER_VARIABLE` generates a mitered line join
*     as used in XPS.  `FT_STROKER_LINEJOIN_MITER` is an alias for
*     `FT_STROKER_LINEJOIN_MITER_VARIABLE`, retained for backward
*     compatibility.
*/
Ft_Stroker_Line_Join :: enum u32 {
	ROUND          = 0,
	BEVEL          = 1,
	MITER_VARIABLE = 2,
	MITER          = 2,
	MITER_FIXED    = 3,
}

/**************************************************************************
*
* @enum:
*   FT_Stroker_LineCap
*
* @description:
*   These values determine how the end of opened sub-paths are rendered in
*   a stroke.
*
* @values:
*   FT_STROKER_LINECAP_BUTT ::
*     The end of lines is rendered as a full stop on the last point
*     itself.
*
*   FT_STROKER_LINECAP_ROUND ::
*     The end of lines is rendered as a half-circle around the last point.
*
*   FT_STROKER_LINECAP_SQUARE ::
*     The end of lines is rendered as a square around the last point.
*/
Ft_Stroker_Line_Cap :: enum u32 {
	BUTT   = 0,
	ROUND  = 1,
	SQUARE = 2,
}

/**************************************************************************
*
* @enum:
*   FT_StrokerBorder
*
* @description:
*   These values are used to select a given stroke border in
*   @FT_Stroker_GetBorderCounts and @FT_Stroker_ExportBorder.
*
* @values:
*   FT_STROKER_BORDER_LEFT ::
*     Select the left border, relative to the drawing direction.
*
*   FT_STROKER_BORDER_RIGHT ::
*     Select the right border, relative to the drawing direction.
*
* @note:
*   Applications are generally interested in the 'inside' and 'outside'
*   borders.  However, there is no direct mapping between these and the
*   'left' and 'right' ones, since this really depends on the glyph's
*   drawing orientation, which varies between font formats.
*
*   You can however use @FT_Outline_GetInsideBorder and
*   @FT_Outline_GetOutsideBorder to get these.
*/
Ft_Stroker_Border :: enum u32 {
	LEFT  = 0,
	RIGHT = 1,
}

