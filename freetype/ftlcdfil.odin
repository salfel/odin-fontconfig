/****************************************************************************
 *
 * ftlcdfil.h
 *
 *   FreeType API for color filtering of subpixel bitmap glyphs
 *   (specification).
 *
 * Copyright (C) 2006-2025 by
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

Ft_Lcd_Filter :: i32

/**************************************************************************
*
* @type:
*   FT_LcdFiveTapFilter
*
* @description:
*   A typedef for passing the five LCD filter weights to
*   @FT_Face_Properties within an @FT_Parameter structure.
*
* @since:
*   2.8
*
*/
FT_LCD_FILTER_FIVE_TAPS  :: 5

Ft_Lcd_Five_Tap_Filter :: [5]i32

