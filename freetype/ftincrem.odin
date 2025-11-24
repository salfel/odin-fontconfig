/****************************************************************************
 *
 * ftincrem.h
 *
 *   FreeType incremental loading (specification).
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

Ft_Incremental :: ^i32

/**************************************************************************
*
* @struct:
*   FT_Incremental_MetricsRec
*
* @description:
*   A small structure used to contain the basic glyph metrics returned by
*   the @FT_Incremental_GetGlyphMetricsFunc method.
*
* @fields:
*   bearing_x ::
*     Left bearing, in font units.
*
*   bearing_y ::
*     Top bearing, in font units.
*
*   advance ::
*     Horizontal component of glyph advance, in font units.
*
*   advance_v ::
*     Vertical component of glyph advance, in font units.
*
* @note:
*   These correspond to horizontal or vertical metrics depending on the
*   value of the `vertical` argument to the function
*   @FT_Incremental_GetGlyphMetricsFunc.
*
*/
Ft_Incremental_Metrics_Rec :: struct {
	bearing_x: i32,
	bearing_y: i32,
	advance:   i32,
	advance_v: i32, /* since 2.3.12 */
}

/**************************************************************************
*
* @struct:
*   FT_Incremental_Metrics
*
* @description:
*   A handle to an @FT_Incremental_MetricsRec structure.
*
*/
Ft_Incremental_Metrics :: ^Ft_Incremental_Metrics_Rec

/**************************************************************************
*
* @type:
*   FT_Incremental_GetGlyphDataFunc
*
* @description:
*   A function called by FreeType to access a given glyph's data bytes
*   during @FT_Load_Glyph or @FT_Load_Char if incremental loading is
*   enabled.
*
*   Note that the format of the glyph's data bytes depends on the font
*   file format.  For TrueType, it must correspond to the raw bytes within
*   the 'glyf' table.  For PostScript formats, it must correspond to the
*   **unencrypted** charstring bytes, without any `lenIV` header.  It is
*   undefined for any other format.
*
* @input:
*   incremental ::
*     Handle to an opaque @FT_Incremental handle provided by the client
*     application.
*
*   glyph_index ::
*     Index of relevant glyph.
*
* @output:
*   adata ::
*     A structure describing the returned glyph data bytes (which will be
*     accessed as a read-only byte block).
*
* @return:
*   FreeType error code.  0~means success.
*
* @note:
*   If this function returns successfully the method
*   @FT_Incremental_FreeGlyphDataFunc will be called later to release the
*   data bytes.
*
*   Nested calls to @FT_Incremental_GetGlyphDataFunc can happen for
*   compound glyphs.
*
*/
Ft_Error :: proc "c" (^i32) -> i32

/**************************************************************************
*
* @type:
*   FT_Incremental_FreeGlyphDataFunc
*
* @description:
*   A function used to release the glyph data bytes returned by a
*   successful call to @FT_Incremental_GetGlyphDataFunc.
*
* @input:
*   incremental ::
*     A handle to an opaque @FT_Incremental handle provided by the client
*     application.
*
*   data ::
*     A structure describing the glyph data bytes (which will be accessed
*     as a read-only byte block).
*
*/
Ft_Incremental_Free_Glyph_Data_Func :: proc "c" (incremental: Ft_Incremental, data: ^i32)

/**************************************************************************
*
* @type:
*   FT_Incremental_GetGlyphMetricsFunc
*
* @description:
*   A function used to retrieve the basic metrics of a given glyph index
*   before accessing its data.  This allows for handling font types such
*   as PCL~XL Format~1, Class~2 downloaded TrueType fonts, where the glyph
*   metrics (`hmtx` and `vmtx` tables) are permitted to be omitted from
*   the font, and the relevant metrics included in the header of the glyph
*   outline data.  Importantly, this is not intended to allow custom glyph
*   metrics (for example, Postscript Metrics dictionaries), because that
*   conflicts with the requirements of outline hinting.  Such custom
*   metrics must be handled separately, by the calling application.
*
* @input:
*   incremental ::
*     A handle to an opaque @FT_Incremental handle provided by the client
*     application.
*
*   glyph_index ::
*     Index of relevant glyph.
*
*   vertical ::
*     If true, return vertical metrics.
*
*   ametrics ::
*     This parameter is used for both input and output.  The original
*     glyph metrics, if any, in font units.  If metrics are not available
*     all the values must be set to zero.
*
* @output:
*   ametrics ::
*     The glyph metrics in font units.
*
*/
Ft_Incremental_Get_Glyph_Metrics_Func :: proc "c" (Ft_Incremental, i32, i32, ^Ft_Incremental_Metrics_Rec) -> i32

/**************************************************************************
*
* @struct:
*   FT_Incremental_FuncsRec
*
* @description:
*   A table of functions for accessing fonts that load data incrementally.
*   Used in @FT_Incremental_InterfaceRec.
*
* @fields:
*   get_glyph_data ::
*     The function to get glyph data.  Must not be null.
*
*   free_glyph_data ::
*     The function to release glyph data.  Must not be null.
*
*   get_glyph_metrics ::
*     The function to get glyph metrics.  May be null if the font does not
*     require it.
*
*/
Ft_Incremental_Funcs_Rec :: struct {
	get_glyph_data:    i32,
	free_glyph_data:   Ft_Incremental_Free_Glyph_Data_Func,
	get_glyph_metrics: Ft_Incremental_Get_Glyph_Metrics_Func,
}

/**************************************************************************
*
* @struct:
*   FT_Incremental_InterfaceRec
*
* @description:
*   A structure to be used with @FT_Open_Face to indicate that the user
*   wants to support incremental glyph loading.  You should use it with
*   @FT_PARAM_TAG_INCREMENTAL as in the following example:
*
*   ```
*     FT_Incremental_InterfaceRec  inc_int;
*     FT_Parameter                 parameter;
*     FT_Open_Args                 open_args;
*
*
*     // set up incremental descriptor
*     inc_int.funcs  = my_funcs;
*     inc_int.object = my_object;
*
*     // set up optional parameter
*     parameter.tag  = FT_PARAM_TAG_INCREMENTAL;
*     parameter.data = &inc_int;
*
*     // set up FT_Open_Args structure
*     open_args.flags      = FT_OPEN_PATHNAME | FT_OPEN_PARAMS;
*     open_args.pathname   = my_font_pathname;
*     open_args.num_params = 1;
*     open_args.params     = &parameter; // we use one optional argument
*
*     // open the font
*     error = FT_Open_Face( library, &open_args, index, &face );
*     ...
*   ```
*
*/
Ft_Incremental_Interface_Rec :: struct {
	funcs:  ^Ft_Incremental_Funcs_Rec,
	object: Ft_Incremental,
}

/**************************************************************************
*
* @type:
*   FT_Incremental_Interface
*
* @description:
*   A pointer to an @FT_Incremental_InterfaceRec structure.
*
*/
Ft_Incremental_Interface :: ^Ft_Incremental_Interface_Rec

