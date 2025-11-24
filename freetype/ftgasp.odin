/****************************************************************************
 *
 * ftgasp.h
 *
 *   Access of TrueType's 'gasp' table (specification).
 *
 * Copyright (C) 2007-2025 by
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
*   gasp_table
*
* @title:
*   Gasp Table
*
* @abstract:
*   Retrieving TrueType 'gasp' table entries.
*
* @description:
*   The function @FT_Get_Gasp can be used to query a TrueType or OpenType
*   font for specific entries in its 'gasp' table, if any.  This is mainly
*   useful when implementing native TrueType hinting with the bytecode
*   interpreter to duplicate the Windows text rendering results.
*/

/**************************************************************************
*
* @enum:
*   FT_GASP_XXX
*
* @description:
*   A list of values and/or bit-flags returned by the @FT_Get_Gasp
*   function.
*
* @values:
*   FT_GASP_NO_TABLE ::
*     This special value means that there is no GASP table in this face.
*     It is up to the client to decide what to do.
*
*   FT_GASP_DO_GRIDFIT ::
*     Grid-fitting and hinting should be performed at the specified ppem.
*     This **really** means TrueType bytecode interpretation.  If this bit
*     is not set, no hinting gets applied.
*
*   FT_GASP_DO_GRAY ::
*     Anti-aliased rendering should be performed at the specified ppem.
*     If not set, do monochrome rendering.
*
*   FT_GASP_SYMMETRIC_SMOOTHING ::
*     If set, smoothing along multiple axes must be used with ClearType.
*
*   FT_GASP_SYMMETRIC_GRIDFIT ::
*     Grid-fitting must be used with ClearType's symmetric smoothing.
*
* @note:
*   The bit-flags `FT_GASP_DO_GRIDFIT` and `FT_GASP_DO_GRAY` are to be
*   used for standard font rasterization only.  Independently of that,
*   `FT_GASP_SYMMETRIC_SMOOTHING` and `FT_GASP_SYMMETRIC_GRIDFIT` are to
*   be used if ClearType is enabled (and `FT_GASP_DO_GRIDFIT` and
*   `FT_GASP_DO_GRAY` are consequently ignored).
*
*   'ClearType' is Microsoft's implementation of LCD rendering, partly
*   protected by patents.
*
* @since:
*   2.3.0
*/
FT_GASP_NO_TABLE               :: -1
FT_GASP_DO_GRIDFIT           :: 0x01
FT_GASP_DO_GRAY              :: 0x02
FT_GASP_SYMMETRIC_GRIDFIT    :: 0x04
FT_GASP_SYMMETRIC_SMOOTHING  :: 0x08

