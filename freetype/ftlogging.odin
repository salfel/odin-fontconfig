/****************************************************************************
 *
 * ftlogging.h
 *
 *   Additional debugging APIs.
 *
 * Copyright (C) 2020-2025 by
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
* @functype:
*   FT_Custom_Log_Handler
*
* @description:
*   A function typedef that is used to handle the logging of tracing and
*   debug messages on a file system.
*
* @input:
*   ft_component ::
*     The name of `FT_COMPONENT` from which the current debug or error
*     message is produced.
*
*   fmt ::
*     Actual debug or tracing message.
*
*   args::
*     Arguments of debug or tracing messages.
*
* @since:
*   2.11
*
*/
Ft_Custom_Log_Handler :: proc "c" (ft_component: cstring, fmt: cstring, args: i32)

