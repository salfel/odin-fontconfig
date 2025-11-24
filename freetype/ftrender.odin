/****************************************************************************
 *
 * ftrender.h
 *
 *   FreeType renderer modules public interface (specification).
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

Ft_Error :: proc "c" (glyph: i32, slot: i32, FT_Glyph_InitFunc: ^i32) -> proc "c" (i32, i32) -> i32

/* destroys a given glyph object */
Ft_Glyph_Done_Func      :: proc "c" (glyph: i32)
Ft_Glyph_Transform_Func :: proc "c" (glyph: i32, _matrix: ^i32, delta: ^i32)
Ft_Glyph_Get_Bbox_Func  :: proc "c" (glyph: i32, abbox: ^i32)
Ft_Glyph_Copy_Func      :: proc "c" (i32, i32) -> i32
Ft_Glyph_Prepare_Func   :: proc "c" (i32, i32) -> i32

FT_Glyph_Done_Func       :: Ft_Glyph_Done_Func
FT_Glyph_Transform_Func  :: Ft_Glyph_Transform_Func
FT_Glyph_BBox_Func       :: Ft_Glyph_Get_Bbox_Func
FT_Glyph_Copy_Func       :: Ft_Glyph_Copy_Func
FT_Glyph_Prepare_Func    :: Ft_Glyph_Prepare_Func

Ft_Glyph_Class :: struct {
	glyph_size:      i32,
	glyph_format:    i32,
	glyph_init:      i32,
	glyph_done:      Ft_Glyph_Done_Func,
	glyph_copy:      Ft_Glyph_Copy_Func,
	glyph_transform: Ft_Glyph_Transform_Func,
	glyph_bbox:      Ft_Glyph_Get_Bbox_Func,
	glyph_prepare:   Ft_Glyph_Prepare_Func,
}

Ft_Renderer_Render_Func    :: proc "c" (i32, i32, i32, ^i32) -> i32
Ft_Renderer_Transform_Func :: proc "c" (i32, i32, ^i32, ^i32) -> i32
Ft_Renderer_Get_Cbox_Func  :: proc "c" (renderer: i32, slot: i32, cbox: ^i32)
Ft_Renderer_Set_Mode_Func  :: proc "c" (i32, i32, i32) -> i32

/* deprecated identifiers */
FTRenderer_render    :: Ft_Renderer_Render_Func
FTRenderer_transform  :: Ft_Renderer_Transform_Func
FTRenderer_getCBox   :: Ft_Renderer_Get_Cbox_Func
FTRenderer_setMode   :: Ft_Renderer_Set_Mode_Func

/**************************************************************************
*
* @struct:
*   FT_Renderer_Class
*
* @description:
*   The renderer module class descriptor.
*
* @fields:
*   root ::
*     The root @FT_Module_Class fields.
*
*   glyph_format ::
*     The glyph image format this renderer handles.
*
*   render_glyph ::
*     A method used to render the image that is in a given glyph slot into
*     a bitmap.
*
*   transform_glyph ::
*     A method used to transform the image that is in a given glyph slot.
*
*   get_glyph_cbox ::
*     A method used to access the glyph's cbox.
*
*   set_mode ::
*     A method used to pass additional parameters.
*
*   raster_class ::
*     For @FT_GLYPH_FORMAT_OUTLINE renderers only.  This is a pointer to
*     its raster's class.
*/
Ft_Renderer_Class :: struct {
	root:            i32,
	glyph_format:    i32,
	render_glyph:    Ft_Renderer_Render_Func,
	transform_glyph: Ft_Renderer_Transform_Func,
	get_glyph_cbox:  Ft_Renderer_Get_Cbox_Func,
	set_mode:        Ft_Renderer_Set_Mode_Func,
	raster_class:    ^i32,
}

