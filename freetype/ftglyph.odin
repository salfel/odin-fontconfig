/****************************************************************************
 *
 * ftglyph.h
 *
 *   FreeType convenience functions to handle glyphs (specification).
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
   * This file contains the definition of several convenience functions that
   * can be used by client applications to easily retrieve glyph bitmaps and
   * outlines from a given face.
   *
   * These functions should be optional if you are writing a font server or
   * text layout engine on top of FreeType.  However, they are pretty handy
   * for many other simple uses of the library.
   *
   */
package freetype

foreign import lib "freetype.lib"
_ :: lib

Ft_Glyph_Class :: i32

/**************************************************************************
*
* @type:
*   FT_Glyph
*
* @description:
*   Handle to an object used to model generic glyph images.  It is a
*   pointer to the @FT_GlyphRec structure and can contain a glyph bitmap
*   or pointer.
*
* @note:
*   Glyph objects are not owned by the library.  You must thus release
*   them manually (through @FT_Done_Glyph) _before_ calling
*   @FT_Done_FreeType.
*/
Ft_Glyph :: ^Ft_Glyph_Rec

/**************************************************************************
*
* @struct:
*   FT_GlyphRec
*
* @description:
*   The root glyph structure contains a given glyph image plus its advance
*   width in 16.16 fixed-point format.
*
* @fields:
*   library ::
*     A handle to the FreeType library object.
*
*   clazz ::
*     A pointer to the glyph's class.  Private.
*
*   format ::
*     The format of the glyph's image.
*
*   advance ::
*     A 16.16 vector that gives the glyph's advance width.
*/
Ft_Glyph_Rec :: struct {
	library: i32,
	clazz:   ^Ft_Glyph_Class,
	format:  i32,
	advance: i32,
}

/**************************************************************************
*
* @type:
*   FT_BitmapGlyph
*
* @description:
*   A handle to an object used to model a bitmap glyph image.  This is a
*   'sub-class' of @FT_Glyph, and a pointer to @FT_BitmapGlyphRec.
*/
Ft_Bitmap_Glyph :: ^Ft_Bitmap_Glyph_Rec

/**************************************************************************
*
* @struct:
*   FT_BitmapGlyphRec
*
* @description:
*   A structure used for bitmap glyph images.  This really is a
*   'sub-class' of @FT_GlyphRec.
*
* @fields:
*   root ::
*     The root fields of @FT_Glyph.
*
*   left ::
*     The left-side bearing, i.e., the horizontal distance from the
*     current pen position to the left border of the glyph bitmap.
*
*   top ::
*     The top-side bearing, i.e., the vertical distance from the current
*     pen position to the top border of the glyph bitmap.  This distance
*     is positive for upwards~y!
*
*   bitmap ::
*     A descriptor for the bitmap.
*
* @note:
*   You can typecast an @FT_Glyph to @FT_BitmapGlyph if you have
*   `glyph->format == FT_GLYPH_FORMAT_BITMAP`.  This lets you access the
*   bitmap's contents easily.
*
*   The corresponding pixel buffer is always owned by @FT_BitmapGlyph and
*   is thus created and destroyed with it.
*/
Ft_Bitmap_Glyph_Rec :: struct {
	root:   Ft_Glyph_Rec,
	left:   i32,
	top:    i32,
	bitmap: i32,
}

/**************************************************************************
*
* @type:
*   FT_OutlineGlyph
*
* @description:
*   A handle to an object used to model an outline glyph image.  This is a
*   'sub-class' of @FT_Glyph, and a pointer to @FT_OutlineGlyphRec.
*/
Ft_Outline_Glyph :: ^Ft_Outline_Glyph_Rec

/**************************************************************************
*
* @struct:
*   FT_OutlineGlyphRec
*
* @description:
*   A structure used for outline (vectorial) glyph images.  This really is
*   a 'sub-class' of @FT_GlyphRec.
*
* @fields:
*   root ::
*     The root @FT_Glyph fields.
*
*   outline ::
*     A descriptor for the outline.
*
* @note:
*   You can typecast an @FT_Glyph to @FT_OutlineGlyph if you have
*   `glyph->format == FT_GLYPH_FORMAT_OUTLINE`.  This lets you access the
*   outline's content easily.
*
*   As the outline is extracted from a glyph slot, its coordinates are
*   expressed normally in 26.6 pixels, unless the flag @FT_LOAD_NO_SCALE
*   was used in @FT_Load_Glyph or @FT_Load_Char.
*
*   The outline's tables are always owned by the object and are destroyed
*   with it.
*/
Ft_Outline_Glyph_Rec :: struct {
	root:    Ft_Glyph_Rec,
	outline: i32,
}

/**************************************************************************
*
* @type:
*   FT_SvgGlyph
*
* @description:
*   A handle to an object used to model an SVG glyph.  This is a
*   'sub-class' of @FT_Glyph, and a pointer to @FT_SvgGlyphRec.
*
* @since:
*   2.12
*/
Ft_Svg_Glyph :: ^Ft_Svg_Glyph_Rec

/**************************************************************************
*
* @struct:
*   FT_SvgGlyphRec
*
* @description:
*   A structure used for OT-SVG glyphs.  This is a 'sub-class' of
*   @FT_GlyphRec.
*
* @fields:
*   root ::
*     The root @FT_GlyphRec fields.
*
*   svg_document ::
*     A pointer to the SVG document.
*
*   svg_document_length ::
*     The length of `svg_document`.
*
*   glyph_index ::
*     The index of the glyph to be rendered.
*
*   metrics ::
*     A metrics object storing the size information.
*
*   units_per_EM ::
*     The size of the EM square.
*
*   start_glyph_id ::
*     The first glyph ID in the glyph range covered by this document.
*
*   end_glyph_id ::
*     The last glyph ID in the glyph range covered by this document.
*
*   transform ::
*     A 2x2 transformation matrix to apply to the glyph while rendering
*     it.
*
*   delta ::
*     Translation to apply to the glyph while rendering.
*
* @note:
*   The Glyph Management API requires @FT_Glyph or its 'sub-class' to have
*   all the information needed to completely define the glyph's rendering.
*   Outline-based glyphs can directly apply transformations to the outline
*   but this is not possible for an SVG document that hasn't been parsed.
*   Therefore, the transformation is stored along with the document.  In
*   the absence of a 'ViewBox' or 'Width'/'Height' attribute, the size of
*   the ViewPort should be assumed to be 'units_per_EM'.
*/
Ft_Svg_Glyph_Rec :: struct {
	root:                Ft_Glyph_Rec,
	svg_document:        ^i32,
	svg_document_length: i32,
	glyph_index:         i32,
	metrics:             i32,
	units_per_EM:        i32,
	start_glyph_id:      i32,
	end_glyph_id:        i32,
	transform:           i32,
	delta:               i32,
}

/**************************************************************************
*
* @enum:
*   FT_Glyph_BBox_Mode
*
* @description:
*   The mode how the values of @FT_Glyph_Get_CBox are returned.
*
* @values:
*   FT_GLYPH_BBOX_UNSCALED ::
*     Return unscaled font units.
*
*   FT_GLYPH_BBOX_SUBPIXELS ::
*     Return unfitted 26.6 coordinates.
*
*   FT_GLYPH_BBOX_GRIDFIT ::
*     Return grid-fitted 26.6 coordinates.
*
*   FT_GLYPH_BBOX_TRUNCATE ::
*     Return coordinates in integer pixels.
*
*   FT_GLYPH_BBOX_PIXELS ::
*     Return grid-fitted pixel coordinates.
*/
Ft_Glyph_Bbox_Mode :: enum u32 {
	UNSCALED  = 0,
	SUBPIXELS = 0,
	GRIDFIT   = 1,
	TRUNCATE  = 2,
	PIXELS    = 3,
}

