/****************************************************************************
 *
 * fttypes.h
 *
 *   FreeType simple types definitions (specification only).
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

import "core:c"

foreign import lib "freetype.lib"
_ :: lib

Ft_Bool :: i32

/**************************************************************************
*
* @type:
*   FT_FWord
*
* @description:
*   A signed 16-bit integer used to store a distance in original font
*   units.
*/
Ft_Fword :: i16 /* distance in FUnits */

/**************************************************************************
*
* @type:
*   FT_UFWord
*
* @description:
*   An unsigned 16-bit integer used to store a distance in original font
*   units.
*/
Ft_Ufword :: u16 /* unsigned distance */

/**************************************************************************
*
* @type:
*   FT_Char
*
* @description:
*   A simple typedef for the _signed_ char type.
*/
Ft_Char :: i8

/**************************************************************************
*
* @type:
*   FT_Byte
*
* @description:
*   A simple typedef for the _unsigned_ char type.
*/
Ft_Byte :: u8

/**************************************************************************
*
* @type:
*   FT_Bytes
*
* @description:
*   A typedef for constant memory areas.
*/
Ft_Bytes :: ^Ft_Byte

/**************************************************************************
*
* @type:
*   FT_Tag
*
* @description:
*   A typedef for 32-bit tags (as used in the SFNT format).
*/
Ft_Tag :: i32

/**************************************************************************
*
* @type:
*   FT_String
*
* @description:
*   A simple typedef for the char type, usually used for strings.
*/
Ft_String :: i8

/**************************************************************************
*
* @type:
*   FT_Short
*
* @description:
*   A typedef for signed short.
*/
Ft_Short :: i16

/**************************************************************************
*
* @type:
*   FT_UShort
*
* @description:
*   A typedef for unsigned short.
*/
Ft_Ushort :: u16

/**************************************************************************
*
* @type:
*   FT_Int
*
* @description:
*   A typedef for the int type.
*/
Ft_Int :: i32

/**************************************************************************
*
* @type:
*   FT_UInt
*
* @description:
*   A typedef for the unsigned int type.
*/
Ft_Uint :: u32

/**************************************************************************
*
* @type:
*   FT_Long
*
* @description:
*   A typedef for signed long.
*/
Ft_Long :: c.long

/**************************************************************************
*
* @type:
*   FT_ULong
*
* @description:
*   A typedef for unsigned long.
*/
Ft_Ulong :: c.ulong

/**************************************************************************
*
* @type:
*   FT_F2Dot14
*
* @description:
*   A signed 2.14 fixed-point type used for unit vectors.
*/
Ft_F2dot14 :: i16

/**************************************************************************
*
* @type:
*   FT_F26Dot6
*
* @description:
*   A signed 26.6 fixed-point type used for vectorial pixel coordinates.
*/
Ft_F26dot6 :: c.long

/**************************************************************************
*
* @type:
*   FT_Fixed
*
* @description:
*   This type is used to store 16.16 fixed-point values, like scaling
*   values or matrix coefficients.
*/
Ft_Fixed :: c.long

/**************************************************************************
*
* @type:
*   FT_Error
*
* @description:
*   The FreeType error code type.  A value of~0 is always interpreted as a
*   successful operation.
*/
Ft_Error :: i32

/**************************************************************************
*
* @type:
*   FT_Pointer
*
* @description:
*   A simple typedef for a typeless pointer.
*/
Ft_Pointer :: rawptr

/**************************************************************************
*
* @type:
*   FT_Offset
*
* @description:
*   This is equivalent to the ANSI~C `size_t` type, i.e., the largest
*   _unsigned_ integer type used to express a file size or position, or a
*   memory block size.
*/
Ft_Offset :: i32

/**************************************************************************
*
* @type:
*   FT_PtrDist
*
* @description:
*   This is equivalent to the ANSI~C `ptrdiff_t` type, i.e., the largest
*   _signed_ integer type used to express the distance between two
*   pointers.
*/
Ft_Ptr_Dist :: i32

/**************************************************************************
*
* @struct:
*   FT_UnitVector
*
* @description:
*   A simple structure used to store a 2D vector unit vector.  Uses
*   FT_F2Dot14 types.
*
* @fields:
*   x ::
*     Horizontal coordinate.
*
*   y ::
*     Vertical coordinate.
*/
Ft_Unit_Vector :: struct {
	x: Ft_F2dot14,
	y: Ft_F2dot14,
}

/**************************************************************************
*
* @struct:
*   FT_Matrix
*
* @description:
*   A simple structure used to store a 2x2 matrix.  Coefficients are in
*   16.16 fixed-point format.  The computation performed is:
*
*   ```
*     x' = x*xx + y*xy
*     y' = x*yx + y*yy
*   ```
*
* @fields:
*   xx ::
*     Matrix coefficient.
*
*   xy ::
*     Matrix coefficient.
*
*   yx ::
*     Matrix coefficient.
*
*   yy ::
*     Matrix coefficient.
*/
Ft_Matrix :: struct {
	xx, xy: Ft_Fixed,
	yx, yy: Ft_Fixed,
}

/**************************************************************************
*
* @struct:
*   FT_Data
*
* @description:
*   Read-only binary data represented as a pointer and a length.
*
* @fields:
*   pointer ::
*     The data.
*
*   length ::
*     The length of the data in bytes.
*/
Ft_Data :: struct {
	pointer: ^Ft_Byte,
	length:  Ft_Uint,
}

/**************************************************************************
*
* @functype:
*   FT_Generic_Finalizer
*
* @description:
*   Describe a function used to destroy the 'client' data of any FreeType
*   object.  See the description of the @FT_Generic type for details of
*   usage.
*
* @input:
*   The address of the FreeType object that is under finalization.  Its
*   client data is accessed through its `generic` field.
*/
Ft_Generic_Finalizer :: proc "c" (object: rawptr)

/**************************************************************************
*
* @struct:
*   FT_Generic
*
* @description:
*   Client applications often need to associate their own data to a
*   variety of FreeType core objects.  For example, a text layout API
*   might want to associate a glyph cache to a given size object.
*
*   Some FreeType object contains a `generic` field, of type `FT_Generic`,
*   which usage is left to client applications and font servers.
*
*   It can be used to store a pointer to client-specific data, as well as
*   the address of a 'finalizer' function, which will be called by
*   FreeType when the object is destroyed (for example, the previous
*   client example would put the address of the glyph cache destructor in
*   the `finalizer` field).
*
* @fields:
*   data ::
*     A typeless pointer to any client-specified data. This field is
*     completely ignored by the FreeType library.
*
*   finalizer ::
*     A pointer to a 'generic finalizer' function, which will be called
*     when the object is destroyed.  If this field is set to `NULL`, no
*     code will be called.
*/
Ft_Generic :: struct {
	data:      rawptr,
	finalizer: Ft_Generic_Finalizer,
}

/**************************************************************************
*
* @type:
*   FT_ListNode
*
* @description:
*    Many elements and objects in FreeType are listed through an @FT_List
*    record (see @FT_ListRec).  As its name suggests, an FT_ListNode is a
*    handle to a single list element.
*/
Ft_List_Node :: ^Ft_List_Node_Rec

/**************************************************************************
*
* @type:
*   FT_List
*
* @description:
*   A handle to a list record (see @FT_ListRec).
*/
Ft_List :: ^Ft_List_Rec

/**************************************************************************
*
* @struct:
*   FT_ListNodeRec
*
* @description:
*   A structure used to hold a single list element.
*
* @fields:
*   prev ::
*     The previous element in the list.  `NULL` if first.
*
*   next ::
*     The next element in the list.  `NULL` if last.
*
*   data ::
*     A typeless pointer to the listed object.
*/
Ft_List_Node_Rec :: struct {
	prev: Ft_List_Node,
	next: Ft_List_Node,
	data: rawptr,
}

/**************************************************************************
*
* @struct:
*   FT_ListRec
*
* @description:
*   A structure used to hold a simple doubly-linked list.  These are used
*   in many parts of FreeType.
*
* @fields:
*   head ::
*     The head (first element) of doubly-linked list.
*
*   tail ::
*     The tail (last element) of doubly-linked list.
*/
Ft_List_Rec :: struct {
	head: Ft_List_Node,
	tail: Ft_List_Node,
}

