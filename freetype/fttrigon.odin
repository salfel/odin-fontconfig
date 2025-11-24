/****************************************************************************
 *
 * fttrigon.h
 *
 *   FreeType trigonometric functions (specification).
 *
 * Copyright (C) 2001-2025 by
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

Ft_Fixed :: i32

/**************************************************************************
*
* @macro:
*   FT_ANGLE_PI
*
* @description:
*   The angle pi expressed in @FT_Angle units.
*
*/
FT_ANGLE_PI  :: (18016)

/**************************************************************************
*
* @macro:
*   FT_ANGLE_2PI
*
* @description:
*   The angle 2*pi expressed in @FT_Angle units.
*
*/
FT_ANGLE_2PI  :: (FT_ANGLE_PI*2)

/**************************************************************************
*
* @macro:
*   FT_ANGLE_PI2
*
* @description:
*   The angle pi/2 expressed in @FT_Angle units.
*
*/
FT_ANGLE_PI2  :: (FT_ANGLE_PI/2)

/**************************************************************************
*
* @macro:
*   FT_ANGLE_PI4
*
* @description:
*   The angle pi/4 expressed in @FT_Angle units.
*
*/
FT_ANGLE_PI4  :: (FT_ANGLE_PI/4)

