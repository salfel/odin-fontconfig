/****************************************************************************
 *
 * ftotval.h
 *
 *   FreeType API for validating OpenType tables (specification).
 *
 * Copyright (C) 2004-2025 by
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
 *
 * Warning: This module might be moved to a different library in the
 *          future to avoid a tight dependency between FreeType and the
 *          OpenType specification.
 *
 *
 */
package freetype

foreign import lib "freetype.lib"
_ :: lib

/**************************************************************************
*
* @section:
*   ot_validation
*
* @title:
*   OpenType Validation
*
* @abstract:
*   An API to validate OpenType tables.
*
* @description:
*   This section contains the declaration of functions to validate some
*   OpenType tables (BASE, GDEF, GPOS, GSUB, JSTF, MATH).
*
* @order:
*   FT_OpenType_Validate
*   FT_OpenType_Free
*
*   FT_VALIDATE_OTXXX
*
*/


/**************************************************************************
*
* @enum:
*    FT_VALIDATE_OTXXX
*
* @description:
*    A list of bit-field constants used with @FT_OpenType_Validate to
*    indicate which OpenType tables should be validated.
*
* @values:
*    FT_VALIDATE_BASE ::
*      Validate BASE table.
*
*    FT_VALIDATE_GDEF ::
*      Validate GDEF table.
*
*    FT_VALIDATE_GPOS ::
*      Validate GPOS table.
*
*    FT_VALIDATE_GSUB ::
*      Validate GSUB table.
*
*    FT_VALIDATE_JSTF ::
*      Validate JSTF table.
*
*    FT_VALIDATE_MATH ::
*      Validate MATH table.
*
*    FT_VALIDATE_OT ::
*      Validate all OpenType tables (BASE, GDEF, GPOS, GSUB, JSTF, MATH).
*
*/
FT_VALIDATE_BASE  :: 0x0100
FT_VALIDATE_GDEF  :: 0x0200
FT_VALIDATE_GPOS  :: 0x0400
FT_VALIDATE_GSUB  :: 0x0800
FT_VALIDATE_JSTF  :: 0x1000
FT_VALIDATE_MATH  :: 0x2000
FT_VALIDATE_OT   :: (FT_VALIDATE_BASEFT_VALIDATE_GDEFFT_VALIDATE_GPOSFT_VALIDATE_GSUBFT_VALIDATE_JSTFFT_VALIDATE_MATH)

