/****************************************************************************
 *
 * ftgxval.h
 *
 *   FreeType API for validating TrueTypeGX/AAT tables (specification).
 *
 * Copyright (C) 2004-2025 by
 * Masatake YAMATO, Redhat K.K,
 * David Turner, Robert Wilhelm, and Werner Lemberg.
 *
 * This file is part of the FreeType project, and may only be used,
 * modified, and distributed under the terms of the FreeType project
 * license, LICENSE.TXT.  By continuing to use, modify, or distribute
 * this file you indicate that you have read the license and
 * understand and accept it fully.
 *
 */

/****************************************************************************
 *
 * gxvalid is derived from both gxlayout module and otvalid module.
 * Development of gxlayout is supported by the Information-technology
 * Promotion Agency(IPA), Japan.
 *
 */
package freetype

foreign import lib "freetype.lib"
_ :: lib

/**************************************************************************
*
* @section:
*   gx_validation
*
* @title:
*   TrueTypeGX/AAT Validation
*
* @abstract:
*   An API to validate TrueTypeGX/AAT tables.
*
* @description:
*   This section contains the declaration of functions to validate some
*   TrueTypeGX tables (feat, mort, morx, bsln, just, kern, opbd, trak,
*   prop, lcar).
*
* @order:
*   FT_TrueTypeGX_Validate
*   FT_TrueTypeGX_Free
*
*   FT_ClassicKern_Validate
*   FT_ClassicKern_Free
*
*   FT_VALIDATE_GX_LENGTH
*   FT_VALIDATE_GXXXX
*   FT_VALIDATE_CKERNXXX
*
*/

/**************************************************************************
*
*
* Warning: Use `FT_VALIDATE_XXX` to validate a table.
*          Following definitions are for gxvalid developers.
*
*
*/
FT_VALIDATE_feat_INDEX     :: 0
FT_VALIDATE_mort_INDEX     :: 1
FT_VALIDATE_morx_INDEX     :: 2
FT_VALIDATE_bsln_INDEX     :: 3
FT_VALIDATE_just_INDEX     :: 4
FT_VALIDATE_kern_INDEX     :: 5
FT_VALIDATE_opbd_INDEX     :: 6
FT_VALIDATE_trak_INDEX     :: 7
FT_VALIDATE_prop_INDEX     :: 8
FT_VALIDATE_lcar_INDEX     :: 9
FT_VALIDATE_GX_LAST_INDEX  :: FT_VALIDATE_lcar_INDEX

/**************************************************************************
*
* @macro:
*   FT_VALIDATE_GX_LENGTH
*
* @description:
*   The number of tables checked in this module.  Use it as a parameter
*   for the `table-length` argument of function @FT_TrueTypeGX_Validate.
*/
FT_VALIDATE_GX_LENGTH  :: (FT_VALIDATE_GX_LAST_INDEX+1)

/* */

/* Up to 0x1000 is used by otvalid.
Ox2xxx is reserved for feature OT extension. */
FT_VALIDATE_GX_START  :: 0x4000

/**************************************************************************
*
* @enum:
*    FT_VALIDATE_CKERNXXX
*
* @description:
*    A list of bit-field constants used with @FT_ClassicKern_Validate to
*    indicate the classic kern dialect or dialects.  If the selected type
*    doesn't fit, @FT_ClassicKern_Validate regards the table as invalid.
*
* @values:
*    FT_VALIDATE_MS ::
*      Handle the 'kern' table as a classic Microsoft kern table.
*
*    FT_VALIDATE_APPLE ::
*      Handle the 'kern' table as a classic Apple kern table.
*
*    FT_VALIDATE_CKERN ::
*      Handle the 'kern' as either classic Apple or Microsoft kern table.
*/
FT_VALIDATE_MS     :: (FT_VALIDATE_GX_START0)
FT_VALIDATE_APPLE  :: (FT_VALIDATE_GX_START1)
FT_VALIDATE_CKERN  :: (FT_VALIDATE_MSFT_VALIDATE_APPLE)

