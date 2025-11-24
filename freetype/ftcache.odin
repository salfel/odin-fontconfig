/****************************************************************************
 *
 * ftcache.h
 *
 *   FreeType Cache subsystem (specification).
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

Ft_Pointer :: i32

/**************************************************************************
*
* @functype:
*   FTC_Face_Requester
*
* @description:
*   A callback function provided by client applications.  It is used by
*   the cache manager to translate a given @FTC_FaceID into a new valid
*   @FT_Face object, on demand.
*
* @input:
*   face_id ::
*     The face ID to resolve.
*
*   library ::
*     A handle to a FreeType library object.
*
*   req_data ::
*     Application-provided request data (see note below).
*
* @output:
*   aface ::
*     A new @FT_Face handle.
*
* @return:
*   FreeType error code.  0~means success.
*
* @note:
*   The third parameter `req_data` is the same as the one passed by the
*   client when @FTC_Manager_New is called.
*
*   The face requester should not perform funny things on the returned
*   face object, like creating a new @FT_Size for it, or setting a
*   transformation through @FT_Set_Transform!
*/
Ft_Error        :: proc "c" (^i32) -> i32
Ftc_Manager_Rec :: struct {}

/**************************************************************************
*
* @type:
*   FTC_Manager
*
* @description:
*   This object corresponds to one instance of the cache-subsystem.  It is
*   used to cache one or more @FT_Face objects, along with corresponding
*   @FT_Size objects.
*
*   The manager intentionally limits the total number of opened @FT_Face
*   and @FT_Size objects to control memory usage.  See the `max_faces` and
*   `max_sizes` parameters of @FTC_Manager_New.
*
*   The manager is also used to cache 'nodes' of various types while
*   limiting their total memory usage.
*
*   All limitations are enforced by keeping lists of managed objects in
*   most-recently-used order, and flushing old nodes to make room for new
*   ones.
*/
Ftc_Manager  :: ^Ftc_Manager_Rec
Ftc_Node_Rec :: struct {}

/**************************************************************************
*
* @type:
*   FTC_Node
*
* @description:
*   An opaque handle to a cache node object.  Each cache node is
*   reference-counted.  A node with a count of~0 might be flushed out of a
*   full cache whenever a lookup request is performed.
*
*   If you look up nodes, you have the ability to 'acquire' them, i.e., to
*   increment their reference count.  This will prevent the node from
*   being flushed out of the cache until you explicitly 'release' it (see
*   @FTC_Node_Unref).
*
*   See also @FTC_SBitCache_Lookup and @FTC_ImageCache_Lookup.
*/
Ftc_Node :: ^Ftc_Node_Rec

/**************************************************************************
*
* @struct:
*   FTC_ScalerRec
*
* @description:
*   A structure used to describe a given character size in either pixels
*   or points to the cache manager.  See @FTC_Manager_LookupSize.
*
* @fields:
*   face_id ::
*     The source face ID.
*
*   width ::
*     The character width.
*
*   height ::
*     The character height.
*
*   pixel ::
*     A Boolean.  If 1, the `width` and `height` fields are interpreted as
*     integer pixel character sizes.  Otherwise, they are expressed as
*     1/64 of points.
*
*   x_res ::
*     Only used when `pixel` is value~0 to indicate the horizontal
*     resolution in dpi.
*
*   y_res ::
*     Only used when `pixel` is value~0 to indicate the vertical
*     resolution in dpi.
*
* @note:
*   This type is mainly used to retrieve @FT_Size objects through the
*   cache manager.
*/
Ftc_Scaler_Rec :: struct {
	face_id: i32,
	width:   i32,
	height:  i32,
	pixel:   i32,
	x_res:   i32,
	y_res:   i32,
}

/**************************************************************************
*
* @struct:
*   FTC_Scaler
*
* @description:
*   A handle to an @FTC_ScalerRec structure.
*/
Ftc_Scaler         :: ^Ftc_Scaler_Rec
Ftc_Cmap_Cache_Rec :: struct {}

/**************************************************************************
*
* @type:
*   FTC_CMapCache
*
* @description:
*   An opaque handle used to model a charmap cache.  This cache is to hold
*   character codes -> glyph indices mappings.
*
*/
Ftc_Cmap_Cache :: ^Ftc_Cmap_Cache_Rec

/**************************************************************************
*
* @struct:
*   FTC_ImageTypeRec
*
* @description:
*   A structure used to model the type of images in a glyph cache.
*
* @fields:
*   face_id ::
*     The face ID.
*
*   width ::
*     The width in pixels.
*
*   height ::
*     The height in pixels.
*
*   flags ::
*     The load flags, as in @FT_Load_Glyph.
*
*/
Ftc_Image_Type_Rec :: struct {
	face_id: i32,
	width:   i32,
	height:  i32,
	flags:   i32,
}

/**************************************************************************
*
* @type:
*   FTC_ImageType
*
* @description:
*   A handle to an @FTC_ImageTypeRec structure.
*
*/
Ftc_Image_Type      :: ^Ftc_Image_Type_Rec
Ftc_Image_Cache_Rec :: struct {}

/**************************************************************************
*
* @type:
*   FTC_ImageCache
*
* @description:
*   A handle to a glyph image cache object.  They are designed to hold
*   many distinct glyph images while not exceeding a certain memory
*   threshold.
*/
Ftc_Image_Cache :: ^Ftc_Image_Cache_Rec

/**************************************************************************
*
* @type:
*   FTC_SBit
*
* @description:
*   A handle to a small bitmap descriptor.  See the @FTC_SBitRec structure
*   for details.
*/
Ftc_Sbit :: ^Ftc_Sbit_Rec

/**************************************************************************
*
* @struct:
*   FTC_SBitRec
*
* @description:
*   A very compact structure used to describe a small glyph bitmap.
*
* @fields:
*   width ::
*     The bitmap width in pixels.
*
*   height ::
*     The bitmap height in pixels.
*
*   left ::
*     The horizontal distance from the pen position to the left bitmap
*     border (a.k.a. 'left side bearing', or 'lsb').
*
*   top ::
*     The vertical distance from the pen position (on the baseline) to the
*     upper bitmap border (a.k.a. 'top side bearing').  The distance is
*     positive for upwards y~coordinates.
*
*   format ::
*     The format of the glyph bitmap (monochrome or gray).
*
*   max_grays ::
*     Maximum gray level value (in the range 1 to~255).
*
*   pitch ::
*     The number of bytes per bitmap line.  May be positive or negative.
*
*   xadvance ::
*     The horizontal advance width in pixels.
*
*   yadvance ::
*     The vertical advance height in pixels.
*
*   buffer ::
*     A pointer to the bitmap pixels.
*/
Ftc_Sbit_Rec :: struct {
	width:     i32,
	height:    i32,
	left:      i32,
	top:       i32,
	format:    i32,
	max_grays: i32,
	pitch:     i32,
	xadvance:  i32,
	yadvance:  i32,
	buffer:    ^i32,
}

Ftc_Sbit_Cache_Rec :: struct {}

/**************************************************************************
*
* @type:
*   FTC_SBitCache
*
* @description:
*   A handle to a small bitmap cache.  These are special cache objects
*   used to store small glyph bitmaps (and anti-aliased pixmaps) in a much
*   more efficient way than the traditional glyph image cache implemented
*   by @FTC_ImageCache.
*/
Ftc_Sbit_Cache :: ^Ftc_Sbit_Cache_Rec

