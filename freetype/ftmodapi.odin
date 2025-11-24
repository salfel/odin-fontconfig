/****************************************************************************
 *
 * ftmodapi.h
 *
 *   FreeType modules public interface (specification).
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

/**************************************************************************
*
* @section:
*   module_management
*
* @title:
*   Module Management
*
* @abstract:
*   How to add, upgrade, remove, and control modules from FreeType.
*
* @description:
*   The definitions below are used to manage modules within FreeType.
*   Internal and external modules can be added, upgraded, and removed at
*   runtime.  For example, an alternative renderer or proprietary font
*   driver can be registered and prioritized.  Additionally, some module
*   properties can also be controlled.
*
*   Here is a list of existing values of the `module_name` field in the
*   @FT_Module_Class structure.
*
*   ```
*     autofitter
*     bdf
*     cff
*     gxvalid
*     otvalid
*     pcf
*     pfr
*     psaux
*     pshinter
*     psnames
*     raster1
*     sfnt
*     smooth
*     truetype
*     type1
*     type42
*     t1cid
*     winfonts
*   ```
*
*   Note that the FreeType Cache sub-system is not a FreeType module.
*
* @order:
*   FT_Module
*   FT_Module_Constructor
*   FT_Module_Destructor
*   FT_Module_Requester
*   FT_Module_Class
*
*   FT_Add_Module
*   FT_Get_Module
*   FT_Remove_Module
*   FT_Add_Default_Modules
*
*   FT_FACE_DRIVER_NAME
*   FT_Property_Set
*   FT_Property_Get
*   FT_Set_Default_Properties
*
*   FT_New_Library
*   FT_Done_Library
*   FT_Reference_Library
*
*   FT_Renderer
*   FT_Renderer_Class
*
*   FT_Get_Renderer
*   FT_Set_Renderer
*
*   FT_Set_Debug_Hook
*
*/


/* module bit flags */
FT_MODULE_FONT_DRIVER         :: 1      /* this module is a font driver  */
FT_MODULE_RENDERER            :: 2      /* this module is a renderer     */
FT_MODULE_HINTER              :: 4      /* this module is a glyph hinter */
FT_MODULE_STYLER              :: 8      /* this module is a styler       */
FT_MODULE_DRIVER_SCALABLE      :: 0x100  /* the driver supports      */

/* scalable fonts           */
FT_MODULE_DRIVER_NO_OUTLINES   :: 0x200  /* the driver does not      */

/* support vector outlines  */
FT_MODULE_DRIVER_HAS_HINTER    :: 0x400  /* the driver provides its  */

/* own hinter               */
FT_MODULE_DRIVER_HINTS_LIGHTLY :: 0x800  /* the driver's hinter      */

/* produces LIGHT hints     */


/* deprecated values */
ft_module_font_driver          :: FT_MODULE_FONT_DRIVER
ft_module_renderer             :: FT_MODULE_RENDERER
ft_module_hinter               :: FT_MODULE_HINTER
ft_module_styler               :: FT_MODULE_STYLER
ft_module_driver_scalable       :: FT_MODULE_DRIVER_SCALABLE
ft_module_driver_no_outlines    :: FT_MODULE_DRIVER_NO_OUTLINES
ft_module_driver_has_hinter     :: FT_MODULE_DRIVER_HAS_HINTER
ft_module_driver_hints_lightly  :: FT_MODULE_DRIVER_HINTS_LIGHTLY

Ft_Pointer :: i32

/**************************************************************************
*
* @functype:
*   FT_Module_Constructor
*
* @description:
*   A function used to initialize (not create) a new module object.
*
* @input:
*   module ::
*     The module to initialize.
*/
Ft_Error :: proc "c" (^i32) -> i32

/**************************************************************************
*
* @functype:
*   FT_Module_Destructor
*
* @description:
*   A function used to finalize (not destroy) a given module object.
*
* @input:
*   module ::
*     The module to finalize.
*/
Ft_Module_Destructor :: proc "c" (module: i32)

/**************************************************************************
*
* @functype:
*   FT_Module_Requester
*
* @description:
*   A function used to query a given module for a specific interface.
*
* @input:
*   module ::
*     The module to be searched.
*
*   name ::
*     The name of the interface in the module.
*/
Ft_Module_Interface :: proc "c" (^i32) -> i32

/**************************************************************************
*
* @struct:
*   FT_Module_Class
*
* @description:
*   The module class descriptor.  While being a public structure necessary
*   for FreeType's module bookkeeping, most of the fields are essentially
*   internal, not to be used directly by an application.
*
* @fields:
*   module_flags ::
*     Bit flags describing the module.
*
*   module_size ::
*     The size of one module object/instance in bytes.
*
*   module_name ::
*     The name of the module.
*
*   module_version ::
*     The version, as a 16.16 fixed number (major.minor).
*
*   module_requires ::
*     The version of FreeType this module requires, as a 16.16 fixed
*     number (major.minor).  Starts at version 2.0, i.e., 0x20000.
*
*   module_interface ::
*     A typeless pointer to a structure (which varies between different
*     modules) that holds the module's interface functions.  This is
*     essentially what `get_interface` returns.
*
*   module_init ::
*     The initializing function.
*
*   module_done ::
*     The finalizing function.
*
*   get_interface ::
*     The interface requesting function.
*/
Ft_Module_Class :: struct {
	module_flags:     i32,
	module_size:      i32,
	module_name:      ^i32,
	module_version:   i32,
	module_requires:  i32,
	module_interface: rawptr,
	module_init:      i32,
	module_done:      Ft_Module_Destructor,
	get_interface:    i32,
}

/**************************************************************************
*
* @functype:
*   FT_DebugHook_Func
*
* @description:
*   A drop-in replacement (or rather a wrapper) for the bytecode or
*   charstring interpreter's main loop function.
*
*   Its job is essentially
*
*   - to activate debug mode to enforce single-stepping,
*
*   - to call the main loop function to interpret the next opcode, and
*
*   - to show the changed context to the user.
*
*   An example for such a main loop function is `TT_RunIns` (declared in
*   FreeType's internal header file `src/truetype/ttinterp.h`).
*
*   Have a look at the source code of the `ttdebug` FreeType demo program
*   for an example of a drop-in replacement.
*
* @inout:
*   arg ::
*     A typeless pointer, to be cast to the main loop function's data
*     structure (which depends on the font module).  For TrueType fonts
*     it is bytecode interpreter's execution context, `TT_ExecContext`,
*     which is declared in FreeType's internal header file `tttypes.h`.
*/
Ft_Debug_Hook_Func :: proc "c" (rawptr) -> i32

/**************************************************************************
*
* @enum:
*   FT_DEBUG_HOOK_XXX
*
* @description:
*   A list of named debug hook indices.
*
* @values:
*   FT_DEBUG_HOOK_TRUETYPE::
*     This hook index identifies the TrueType bytecode debugger.
*/
FT_DEBUG_HOOK_TRUETYPE  :: 0

/**************************************************************************
*
* @enum:
*    FT_TrueTypeEngineType
*
* @description:
*    A list of values describing which kind of TrueType bytecode engine is
*    implemented in a given FT_Library instance.  It is used by the
*    @FT_Get_TrueType_Engine_Type function.
*
* @values:
*    FT_TRUETYPE_ENGINE_TYPE_NONE ::
*      The library doesn't implement any kind of bytecode interpreter.
*
*    FT_TRUETYPE_ENGINE_TYPE_UNPATENTED ::
*      Deprecated and removed.
*
*    FT_TRUETYPE_ENGINE_TYPE_PATENTED ::
*      The library implements a bytecode interpreter that covers the full
*      instruction set of the TrueType virtual machine (this was governed
*      by patents until May 2010, hence the name).
*
* @since:
*    2.2
*
*/
Ft_True_Type_Engine_Type :: enum u32 {
	NONE       = 0,
	UNPATENTED = 1,
	PATENTED   = 2,
}

