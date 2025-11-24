/****************************************************************************
 *
 * ftadvanc.h
 *
 *   Quick computation of advance widths (specification only).
 *
 * Copyright (C) 2008-2025 by
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
*   quick_advance
*
* @title:
*   Quick retrieval of advance values
*
* @abstract:
*   Retrieve horizontal and vertical advance values without processing
*   glyph outlines, if possible.
*
* @description:
*   This section contains functions to quickly extract advance values
*   without handling glyph outlines, if possible.
*
* @order:
*   FT_Get_Advance
*   FT_Get_Advances
*
*/


/**************************************************************************
*
* @enum:
*   FT_ADVANCE_FLAG_FAST_ONLY
*
* @description:
*   A bit-flag to be OR-ed with the `flags` parameter of the
*   @FT_Get_Advance and @FT_Get_Advances functions.
*
*   If set, it indicates that you want these functions to fail if the
*   corresponding hinting mode or font driver doesn't allow for very quick
*   advance computation.
*
*   Typically, glyphs that are either unscaled, unhinted, bitmapped, or
*   light-hinted can have their advance width computed very quickly.
*
*   Normal and bytecode hinted modes that require loading, scaling, and
*   hinting of the glyph outline, are extremely slow by comparison.
*/
FT_ADVANCE_FLAG_FAST_ONLY  :: 0x20000000

