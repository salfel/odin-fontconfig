/****************************************************************************
 *
 * ftmac.h
 *
 *   Additional Mac-specific API.
 *
 * Copyright (C) 1996-2025 by
 * Just van Rossum, David Turner, Robert Wilhelm, and Werner Lemberg.
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
 * NOTE: Include this file after `FT_FREETYPE_H` and after any
 *       Mac-specific headers (because this header uses Mac types such as
 *       'Handle', 'FSSpec', 'FSRef', etc.)
 *
 */
package freetype

foreign import lib "freetype.lib"
_ :: lib

