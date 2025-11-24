/****************************************************************************
 *
 * t1tables.h
 *
 *   Basic Type 1/Type 2 tables definitions and interface (specification
 *   only).
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

Ps_Font_Info_Rec :: i32

/**************************************************************************
*
* @struct:
*   PS_FontInfo
*
* @description:
*   A handle to a @PS_FontInfoRec structure.
*/
Ps_Font_Info :: ^Ps_Font_Info_Rec

/**************************************************************************
*
* @struct:
*   T1_FontInfo
*
* @description:
*   This type is equivalent to @PS_FontInfoRec.  It is deprecated but kept
*   to maintain source compatibility between various versions of FreeType.
*/
T1_Font_Info :: Ps_Font_Info_Rec

/**************************************************************************
*
* @struct:
*   PS_PrivateRec
*
* @description:
*   A structure used to model a Type~1 or Type~2 private dictionary.  Note
*   that for Multiple Master fonts, each instance has its own Private
*   dictionary.
*/
Ps_Private_Rec :: struct {
	unique_id:              i32,
	lenIV:                  i32,
	num_blue_values:        i32,
	num_other_blues:        i32,
	num_family_blues:       i32,
	num_family_other_blues: i32,
	blue_values:            [14]i32,
	other_blues:            [10]i32,
	family_blues:           [14]i32,
	family_other_blues:     [10]i32,
	blue_scale:             i32,
	blue_shift:             i32,
	blue_fuzz:              i32,
	standard_width:         [1]i32,
	standard_height:        [1]i32,
	num_snap_widths:        i32,
	num_snap_heights:       i32,
	force_bold:             i32,
	round_stem_up:          i32,
	snap_widths:            [13]i32, /* including std width  */
	snap_heights:           [13]i32, /* including std height */
	expansion_factor:       i32,
	language_group:         i32,
	password:               i32,
	min_feature:            [2]i32,
}

/**************************************************************************
*
* @struct:
*   PS_Private
*
* @description:
*   A handle to a @PS_PrivateRec structure.
*/
Ps_Private :: ^Ps_Private_Rec

/**************************************************************************
*
* @struct:
*   T1_Private
*
* @description:
*  This type is equivalent to @PS_PrivateRec.  It is deprecated but kept
*  to maintain source compatibility between various versions of FreeType.
*/
T1_Private :: Ps_Private_Rec

/**************************************************************************
*
* @enum:
*   T1_Blend_Flags
*
* @description:
*   A set of flags used to indicate which fields are present in a given
*   blend dictionary (font info or private).  Used to support Multiple
*   Masters fonts.
*
* @values:
*   T1_BLEND_UNDERLINE_POSITION ::
*   T1_BLEND_UNDERLINE_THICKNESS ::
*   T1_BLEND_ITALIC_ANGLE ::
*   T1_BLEND_BLUE_VALUES ::
*   T1_BLEND_OTHER_BLUES ::
*   T1_BLEND_STANDARD_WIDTH ::
*   T1_BLEND_STANDARD_HEIGHT ::
*   T1_BLEND_STEM_SNAP_WIDTHS ::
*   T1_BLEND_STEM_SNAP_HEIGHTS ::
*   T1_BLEND_BLUE_SCALE ::
*   T1_BLEND_BLUE_SHIFT ::
*   T1_BLEND_FAMILY_BLUES ::
*   T1_BLEND_FAMILY_OTHER_BLUES ::
*   T1_BLEND_FORCE_BOLD ::
*/
T1_Blend_Flags :: enum u32 {
	/* required fields in a FontInfo blend dictionary */
	UNDERLINE_POSITION  = 0,
	UNDERLINE_THICKNESS = 1,
	ITALIC_ANGLE        = 2,

	/* required fields in a Private blend dictionary */
	BLUE_VALUES         = 3,
	OTHER_BLUES         = 4,
	STANDARD_WIDTH      = 5,
	STANDARD_HEIGHT     = 6,
	STEM_SNAP_WIDTHS    = 7,
	STEM_SNAP_HEIGHTS   = 8,
	BLUE_SCALE          = 9,
	BLUE_SHIFT          = 10,
	FAMILY_BLUES        = 11,
	FAMILY_OTHER_BLUES  = 12,
	FORCE_BOLD          = 13,
	MAX                 = 14, /* do not remove */
}

/**************************************************************************
*
* @struct:
*   CID_FaceDictRec
*
* @description:
*   A structure used to represent data in a CID top-level dictionary.  In
*   most cases, they are part of the font's '/FDArray' array.  Within a
*   CID font file, such (internal) subfont dictionaries are enclosed by
*   '%ADOBeginFontDict' and '%ADOEndFontDict' comments.
*
*   Note that `CID_FaceDictRec` misses a field for the '/FontName'
*   keyword, specifying the subfont's name (the top-level font name is
*   given by the '/CIDFontName' keyword).  This is an oversight, but it
*   doesn't limit the 'cid' font module's functionality because FreeType
*   neither needs this entry nor gives access to CID subfonts.
*/
Cid_Face_Dict_Rec :: struct {
	private_dict:        Ps_Private_Rec,
	len_buildchar:       i32,
	forcebold_threshold: i32,
	stroke_width:        i32,
	expansion_factor:    i32, /* this is a duplicate of           */

	/* `private_dict->expansion_factor' */
	paint_type:     i32,
	font_type:      i32,
	font_matrix:    i32,
	font_offset:    i32,
	num_subrs:      i32,
	subrmap_offset: i32,
	sd_bytes:       i32,
}

/**************************************************************************
*
* @struct:
*   CID_FaceDict
*
* @description:
*   A handle to a @CID_FaceDictRec structure.
*/
Cid_Face_Dict :: ^Cid_Face_Dict_Rec

/**************************************************************************
*
* @struct:
*   CID_FontDict
*
* @description:
*   This type is equivalent to @CID_FaceDictRec.  It is deprecated but
*   kept to maintain source compatibility between various versions of
*   FreeType.
*/
Cid_Font_Dict :: Cid_Face_Dict_Rec

/**************************************************************************
*
* @struct:
*   CID_FaceInfoRec
*
* @description:
*   A structure used to represent CID Face information.
*/
Cid_Face_Info_Rec :: struct {
	cid_font_name: ^i32,
	cid_version:   i32,
	cid_font_type: i32,
	registry:      ^i32,
	ordering:      ^i32,
	supplement:    i32,
	font_info:     Ps_Font_Info_Rec,
	font_bbox:     i32,
	uid_base:      i32,
	num_xuid:      i32,
	xuid:          [16]i32,
	cidmap_offset: i32,
	fd_bytes:      i32,
	gd_bytes:      i32,
	cid_count:     i32,
	num_dicts:     i32,
	font_dicts:    Cid_Face_Dict,
	data_offset:   i32,
}

/**************************************************************************
*
* @struct:
*   CID_FaceInfo
*
* @description:
*   A handle to a @CID_FaceInfoRec structure.
*/
Cid_Face_Info :: ^Cid_Face_Info_Rec

/**************************************************************************
*
* @struct:
*   CID_Info
*
* @description:
*  This type is equivalent to @CID_FaceInfoRec.  It is deprecated but kept
*  to maintain source compatibility between various versions of FreeType.
*/
Cid_Info :: Cid_Face_Info_Rec

/**************************************************************************
*
* @enum:
*   T1_EncodingType
*
* @description:
*   An enumeration describing the 'Encoding' entry in a Type 1 dictionary.
*
* @values:
*   T1_ENCODING_TYPE_NONE ::
*   T1_ENCODING_TYPE_ARRAY ::
*   T1_ENCODING_TYPE_STANDARD ::
*   T1_ENCODING_TYPE_ISOLATIN1 ::
*   T1_ENCODING_TYPE_EXPERT ::
*
* @since:
*   2.4.8
*/
T1_Encoding_Type :: enum u32 {
	NONE      = 0,
	ARRAY     = 1,
	STANDARD  = 2,
	ISOLATIN1 = 3,
	EXPERT    = 4,
}

/**************************************************************************
*
* @enum:
*   PS_Dict_Keys
*
* @description:
*   An enumeration used in calls to @FT_Get_PS_Font_Value to identify the
*   Type~1 dictionary entry to retrieve.
*
* @values:
*   PS_DICT_FONT_TYPE ::
*   PS_DICT_FONT_MATRIX ::
*   PS_DICT_FONT_BBOX ::
*   PS_DICT_PAINT_TYPE ::
*   PS_DICT_FONT_NAME ::
*   PS_DICT_UNIQUE_ID ::
*   PS_DICT_NUM_CHAR_STRINGS ::
*   PS_DICT_CHAR_STRING_KEY ::
*   PS_DICT_CHAR_STRING ::
*   PS_DICT_ENCODING_TYPE ::
*   PS_DICT_ENCODING_ENTRY ::
*   PS_DICT_NUM_SUBRS ::
*   PS_DICT_SUBR ::
*   PS_DICT_STD_HW ::
*   PS_DICT_STD_VW ::
*   PS_DICT_NUM_BLUE_VALUES ::
*   PS_DICT_BLUE_VALUE ::
*   PS_DICT_BLUE_FUZZ ::
*   PS_DICT_NUM_OTHER_BLUES ::
*   PS_DICT_OTHER_BLUE ::
*   PS_DICT_NUM_FAMILY_BLUES ::
*   PS_DICT_FAMILY_BLUE ::
*   PS_DICT_NUM_FAMILY_OTHER_BLUES ::
*   PS_DICT_FAMILY_OTHER_BLUE ::
*   PS_DICT_BLUE_SCALE ::
*   PS_DICT_BLUE_SHIFT ::
*   PS_DICT_NUM_STEM_SNAP_H ::
*   PS_DICT_STEM_SNAP_H ::
*   PS_DICT_NUM_STEM_SNAP_V ::
*   PS_DICT_STEM_SNAP_V ::
*   PS_DICT_FORCE_BOLD ::
*   PS_DICT_RND_STEM_UP ::
*   PS_DICT_MIN_FEATURE ::
*   PS_DICT_LEN_IV ::
*   PS_DICT_PASSWORD ::
*   PS_DICT_LANGUAGE_GROUP ::
*   PS_DICT_VERSION ::
*   PS_DICT_NOTICE ::
*   PS_DICT_FULL_NAME ::
*   PS_DICT_FAMILY_NAME ::
*   PS_DICT_WEIGHT ::
*   PS_DICT_IS_FIXED_PITCH ::
*   PS_DICT_UNDERLINE_POSITION ::
*   PS_DICT_UNDERLINE_THICKNESS ::
*   PS_DICT_FS_TYPE ::
*   PS_DICT_ITALIC_ANGLE ::
*
* @since:
*   2.4.8
*/
Ps_Dict_Keys :: enum u32 {
	/* conventionally in the font dictionary */
	FONT_TYPE              = 0,  /* FT_Byte         */
	FONT_MATRIX            = 1,  /* FT_Fixed        */
	FONT_BBOX              = 2,  /* FT_Fixed        */
	PAINT_TYPE             = 3,  /* FT_Byte         */
	FONT_NAME              = 4,  /* FT_String*      */
	UNIQUE_ID              = 5,  /* FT_Int          */
	NUM_CHAR_STRINGS       = 6,  /* FT_Int          */
	CHAR_STRING_KEY        = 7,  /* FT_String*      */
	CHAR_STRING            = 8,  /* FT_String*      */
	ENCODING_TYPE          = 9,  /* T1_EncodingType */
	ENCODING_ENTRY         = 10, /* FT_String*      */

	/* conventionally in the font Private dictionary */
	NUM_SUBRS              = 11, /* FT_Int     */
	SUBR                   = 12, /* FT_String* */
	STD_HW                 = 13, /* FT_UShort  */
	STD_VW                 = 14, /* FT_UShort  */
	NUM_BLUE_VALUES        = 15, /* FT_Byte    */
	BLUE_VALUE             = 16, /* FT_Short   */
	BLUE_FUZZ              = 17, /* FT_Int     */
	NUM_OTHER_BLUES        = 18, /* FT_Byte    */
	OTHER_BLUE             = 19, /* FT_Short   */
	NUM_FAMILY_BLUES       = 20, /* FT_Byte    */
	FAMILY_BLUE            = 21, /* FT_Short   */
	NUM_FAMILY_OTHER_BLUES = 22, /* FT_Byte    */
	FAMILY_OTHER_BLUE      = 23, /* FT_Short   */
	BLUE_SCALE             = 24, /* FT_Fixed   */
	BLUE_SHIFT             = 25, /* FT_Int     */
	NUM_STEM_SNAP_H        = 26, /* FT_Byte    */
	STEM_SNAP_H            = 27, /* FT_Short   */
	NUM_STEM_SNAP_V        = 28, /* FT_Byte    */
	STEM_SNAP_V            = 29, /* FT_Short   */
	FORCE_BOLD             = 30, /* FT_Bool    */
	RND_STEM_UP            = 31, /* FT_Bool    */
	MIN_FEATURE            = 32, /* FT_Short   */
	LEN_IV                 = 33, /* FT_Int     */
	PASSWORD               = 34, /* FT_Long    */
	LANGUAGE_GROUP         = 35, /* FT_Long    */

	/* conventionally in the font FontInfo dictionary */
	VERSION                = 36, /* FT_String* */
	NOTICE                 = 37, /* FT_String* */
	FULL_NAME              = 38, /* FT_String* */
	FAMILY_NAME            = 39, /* FT_String* */
	WEIGHT                 = 40, /* FT_String* */
	IS_FIXED_PITCH         = 41, /* FT_Bool    */
	UNDERLINE_POSITION     = 42, /* FT_Short   */
	UNDERLINE_THICKNESS    = 43, /* FT_UShort  */
	FS_TYPE                = 44, /* FT_UShort  */
	ITALIC_ANGLE           = 45, /* FT_Fixed   */
	MAX                    = 45,
}

