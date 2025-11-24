/****************************************************************************
 *
 * ftoutln.h
 *
 *   Support for the FT_Outline type used to store glyph shapes of
 *   most scalable font formats (specification).
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
* @enum:
*   FT_Orientation
*
* @description:
*   A list of values used to describe an outline's contour orientation.
*
*   The TrueType and PostScript specifications use different conventions
*   to determine whether outline contours should be filled or unfilled.
*
* @values:
*   FT_ORIENTATION_TRUETYPE ::
*     According to the TrueType specification, clockwise contours must be
*     filled, and counter-clockwise ones must be unfilled.
*
*   FT_ORIENTATION_POSTSCRIPT ::
*     According to the PostScript specification, counter-clockwise
*     contours must be filled, and clockwise ones must be unfilled.
*
*   FT_ORIENTATION_FILL_RIGHT ::
*     This is identical to @FT_ORIENTATION_TRUETYPE, but is used to
*     remember that in TrueType, everything that is to the right of the
*     drawing direction of a contour must be filled.
*
*   FT_ORIENTATION_FILL_LEFT ::
*     This is identical to @FT_ORIENTATION_POSTSCRIPT, but is used to
*     remember that in PostScript, everything that is to the left of the
*     drawing direction of a contour must be filled.
*
*   FT_ORIENTATION_NONE ::
*     The orientation cannot be determined.  That is, different parts of
*     the glyph have different orientation.
*
*/
Ft_Orientation :: enum u32 {
	TRUETYPE   = 0,
	POSTSCRIPT = 1,
	FILL_RIGHT = 0,
	FILL_LEFT  = 1,
	NONE       = 2,
}

