/****************************************************************************
 *
 * ftbdf.h
 *
 *   FreeType API for accessing BDF-specific strings (specification).
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

Bdf_Property_Type :: i32

/**************************************************************************
*
* @type:
*    BDF_Property
*
* @description:
*    A handle to a @BDF_PropertyRec structure to model a given BDF/PCF
*    property.
*/
Bdf_Property :: ^Bdf_Property_Rec

/**************************************************************************
*
* @struct:
*    BDF_PropertyRec
*
* @description:
*    This structure models a given BDF/PCF property.
*
* @fields:
*    type ::
*      The property type.
*
*    u.atom ::
*      The atom string, if type is @BDF_PROPERTY_TYPE_ATOM.  May be
*      `NULL`, indicating an empty string.
*
*    u.integer ::
*      A signed integer, if type is @BDF_PROPERTY_TYPE_INTEGER.
*
*    u.cardinal ::
*      An unsigned integer, if type is @BDF_PROPERTY_TYPE_CARDINAL.
*/
Bdf_Property_Rec :: struct {
	type: Bdf_Property_Type,

	u: struct #raw_union {
		atom:     cstring,
		integer:  i32,
		cardinal: i32,
	},
}

