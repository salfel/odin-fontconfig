/****************************************************************************
 *
 * ftlist.h
 *
 *   Generic list support for FreeType (specification).
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


  /**************************************************************************
   *
   * This file implements functions relative to list processing.  Its data
   * structures are defined in `freetype.h`.
   *
   */
package freetype

foreign import lib "freetype.lib"
_ :: lib

/**************************************************************************
*
* @functype:
*   FT_List_Iterator
*
* @description:
*   An FT_List iterator function that is called during a list parse by
*   @FT_List_Iterate.
*
* @input:
*   node ::
*     The current iteration list node.
*
*   user ::
*     A typeless pointer passed to @FT_List_Iterate.  Can be used to point
*     to the iteration's state.
*/
Ft_Error :: proc "c" (^i32) -> i32

/**************************************************************************
*
* @functype:
*   FT_List_Destructor
*
* @description:
*   An @FT_List iterator function that is called during a list
*   finalization by @FT_List_Finalize to destroy all elements in a given
*   list.
*
* @input:
*   system ::
*     The current system object.
*
*   data ::
*     The current object to destroy.
*
*   user ::
*     A typeless pointer passed to @FT_List_Iterate.  It can be used to
*     point to the iteration's state.
*/
Ft_List_Destructor :: proc "c" (memory: i32, data: rawptr, user: rawptr)

