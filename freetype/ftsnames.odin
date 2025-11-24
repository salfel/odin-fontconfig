/****************************************************************************
 *
 * ftsnames.h
 *
 *   Simple interface to access SFNT 'name' tables (which are used
 *   to hold font names, copyright info, notices, etc.) (specification).
 *
 *   This is _not_ used to retrieve glyph names!
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

Ft_Sfnt_Name :: i32

/**************************************************************************
*
* @struct:
*   FT_SfntLangTag
*
* @description:
*   A structure to model a language tag entry from an SFNT 'name' table.
*
* @fields:
*   string ::
*     The language tag string, encoded in UTF-16BE (without trailing
*     `NULL` bytes).
*
*   string_len ::
*     The length of `string` in **bytes**.
*
* @note:
*   Please refer to the TrueType or OpenType specification for more
*   details.
*
* @since:
*   2.8
*/
Ft_Sfnt_Lang_Tag :: struct {
	_string:    ^i32, /* this string is *not* null-terminated! */
	string_len: i32,  /* in bytes                              */
}

