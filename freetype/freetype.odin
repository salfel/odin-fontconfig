/****************************************************************************
 *
 * freetype.h
 *
 *   FreeType high-level API and common types (specification only).
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

Ft_Glyph_Metrics :: i32

/**************************************************************************
*
* @struct:
*   FT_Bitmap_Size
*
* @description:
*   This structure models the metrics of a bitmap strike (i.e., a set of
*   glyphs for a given point size and resolution) in a bitmap font.  It is
*   used for the `available_sizes` field of @FT_Face.
*
* @fields:
*   height ::
*     The vertical distance, in pixels, between two consecutive baselines.
*     It is always positive.
*
*   width ::
*     The average width, in pixels, of all glyphs in the strike.
*
*   size ::
*     The nominal size of the strike in 26.6 fractional points.  This
*     field is not very useful.
*
*   x_ppem ::
*     The horizontal ppem (nominal width) in 26.6 fractional pixels.
*
*   y_ppem ::
*     The vertical ppem (nominal height) in 26.6 fractional pixels.
*
* @note:
*   Windows FNT:
*     The nominal size given in a FNT font is not reliable.  If the driver
*     finds it incorrect, it sets `size` to some calculated values, and
*     `x_ppem` and `y_ppem` to the pixel width and height given in the
*     font, respectively.
*
*   TrueType embedded bitmaps:
*     `size`, `width`, and `height` values are not contained in the bitmap
*     strike itself.  They are computed from the global font parameters.
*/
Ft_Bitmap_Size :: struct {
	height: i32,
	width:  i32,
	size:   i32,
	x_ppem: i32,
	y_ppem: i32,
}

Ft_Library_Rec :: struct {}

/**************************************************************************
*
* @type:
*   FT_Library
*
* @description:
*   A handle to a FreeType library instance.  Each 'library' is completely
*   independent from the others; it is the 'root' of a set of objects like
*   fonts, faces, sizes, etc.
*
*   It also embeds a memory manager (see @FT_Memory), as well as a
*   scan-line converter object (see @FT_Raster).
*
*   [Since 2.5.6] In multi-threaded applications it is easiest to use one
*   `FT_Library` object per thread.  In case this is too cumbersome, a
*   single `FT_Library` object across threads is possible also, as long as
*   a mutex lock is used around @FT_New_Face and @FT_Done_Face.
*
* @note:
*   Library objects are normally created by @FT_Init_FreeType, and
*   destroyed with @FT_Done_FreeType.  If you need reference-counting
*   (cf. @FT_Reference_Library), use @FT_New_Library and @FT_Done_Library.
*/
Ft_Library    :: ^Ft_Library_Rec
Ft_Module_Rec :: struct {}

/**************************************************************************
*
* @type:
*   FT_Module
*
* @description:
*   A handle to a given FreeType module object.  A module can be a font
*   driver, a renderer, or anything else that provides services to the
*   former.
*/
Ft_Module     :: ^Ft_Module_Rec
Ft_Driver_Rec :: struct {}

/**************************************************************************
*
* @type:
*   FT_Driver
*
* @description:
*   A handle to a given FreeType font driver object.  A font driver is a
*   module capable of creating faces from font files.
*/
Ft_Driver       :: ^Ft_Driver_Rec
Ft_Renderer_Rec :: struct {}

/**************************************************************************
*
* @type:
*   FT_Renderer
*
* @description:
*   A handle to a given FreeType renderer.  A renderer is a module in
*   charge of converting a glyph's outline image to a bitmap.  It supports
*   a single glyph image format, and one or more target surface depths.
*/
Ft_Renderer :: ^Ft_Renderer_Rec

/**************************************************************************
*
* @type:
*   FT_Face
*
* @description:
*   A handle to a typographic face object.  A face object models a given
*   typeface, in a given style.
*
* @note:
*   A face object also owns a single @FT_GlyphSlot object, as well as one
*   or more @FT_Size objects.
*
*   Use @FT_New_Face or @FT_Open_Face to create a new face object from a
*   given filepath or a custom input stream.
*
*   Use @FT_Done_Face to destroy it (along with its slot and sizes).
*
*   An `FT_Face` object can only be safely used from one thread at a time.
*   Similarly, creation and destruction of `FT_Face` with the same
*   @FT_Library object can only be done from one thread at a time.  On the
*   other hand, functions like @FT_Load_Glyph and its siblings are
*   thread-safe and do not need the lock to be held as long as the same
*   `FT_Face` object is not used from multiple threads at the same time.
*
* @also:
*   See @FT_FaceRec for the publicly accessible fields of a given face
*   object.
*/
Ft_Face :: ^Ft_Face_Rec

/**************************************************************************
*
* @type:
*   FT_Size
*
* @description:
*   A handle to an object that models a face scaled to a given character
*   size.
*
* @note:
*   An @FT_Face has one _active_ `FT_Size` object that is used by
*   functions like @FT_Load_Glyph to determine the scaling transformation
*   that in turn is used to load and hint glyphs and metrics.
*
*   A newly created `FT_Size` object contains only meaningless zero values.
*   You must use @FT_Set_Char_Size, @FT_Set_Pixel_Sizes, @FT_Request_Size
*   or even @FT_Select_Size to change the content (i.e., the scaling
*   values) of the active `FT_Size`.  Otherwise, the scaling and hinting
*   will not be performed.
*
*   You can use @FT_New_Size to create additional size objects for a given
*   @FT_Face, but they won't be used by other functions until you activate
*   it through @FT_Activate_Size.  Only one size can be activated at any
*   given time per face.
*
* @also:
*   See @FT_SizeRec for the publicly accessible fields of a given size
*   object.
*/
Ft_Size :: ^Ft_Size_Rec

/**************************************************************************
*
* @type:
*   FT_GlyphSlot
*
* @description:
*   A handle to a given 'glyph slot'.  A slot is a container that can hold
*   any of the glyphs contained in its parent face.
*
*   In other words, each time you call @FT_Load_Glyph or @FT_Load_Char,
*   the slot's content is erased by the new glyph data, i.e., the glyph's
*   metrics, its image (bitmap or outline), and other control information.
*
* @also:
*   See @FT_GlyphSlotRec for the publicly accessible glyph fields.
*/
Ft_Glyph_Slot :: ^Ft_Glyph_Slot_Rec

/**************************************************************************
*
* @type:
*   FT_CharMap
*
* @description:
*   A handle to a character map (usually abbreviated to 'charmap').  A
*   charmap is used to translate character codes in a given encoding into
*   glyph indexes for its parent's face.  Some font formats may provide
*   several charmaps per font.
*
*   Each face object owns zero or more charmaps, but only one of them can
*   be 'active', providing the data used by @FT_Get_Char_Index or
*   @FT_Load_Char.
*
*   The list of available charmaps in a face is available through the
*   `face->num_charmaps` and `face->charmaps` fields of @FT_FaceRec.
*
*   The currently active charmap is available as `face->charmap`.  You
*   should call @FT_Set_Charmap to change it.
*
* @note:
*   When a new face is created (either through @FT_New_Face or
*   @FT_Open_Face), the library looks for a Unicode charmap within the
*   list and automatically activates it.  If there is no Unicode charmap,
*   FreeType doesn't set an 'active' charmap.
*
* @also:
*   See @FT_CharMapRec for the publicly accessible fields of a given
*   character map.
*/
Ft_Char_Map :: ^Ft_Char_Map_Rec

/**************************************************************************
*
* @enum:
*   FT_Encoding
*
* @description:
*   An enumeration to specify character sets supported by charmaps.  Used
*   in the @FT_Select_Charmap API function.
*
* @note:
*   Despite the name, this enumeration lists specific character
*   repertoires (i.e., charsets), and not text encoding methods (e.g.,
*   UTF-8, UTF-16, etc.).
*
*   Other encodings might be defined in the future.
*
* @values:
*   FT_ENCODING_NONE ::
*     The encoding value~0 is reserved for all formats except BDF, PCF,
*     and Windows FNT; see below for more information.
*
*   FT_ENCODING_UNICODE ::
*     The Unicode character set.  This value covers all versions of the
*     Unicode repertoire, including ASCII and Latin-1.  Most fonts include
*     a Unicode charmap, but not all of them.
*
*     For example, if you want to access Unicode value U+1F028 (and the
*     font contains it), use value 0x1F028 as the input value for
*     @FT_Get_Char_Index.
*
*   FT_ENCODING_MS_SYMBOL ::
*     Microsoft Symbol encoding, used to encode mathematical symbols and
*     wingdings.  For more information, see
*     'https://learn.microsoft.com/typography/opentype/spec/recom#non-standard-symbol-fonts',
*     'http://www.kostis.net/charsets/symbol.htm', and
*     'http://www.kostis.net/charsets/wingding.htm'.
*
*     This encoding uses character codes from the PUA (Private Unicode
*     Area) in the range U+F020-U+F0FF.
*
*   FT_ENCODING_SJIS ::
*     Shift JIS encoding for Japanese.  More info at
*     'https://en.wikipedia.org/wiki/Shift_JIS'.  See note on multi-byte
*     encodings below.
*
*   FT_ENCODING_PRC ::
*     Corresponds to encoding systems mainly for Simplified Chinese as
*     used in People's Republic of China (PRC).  The encoding layout is
*     based on GB~2312 and its supersets GBK and GB~18030.
*
*   FT_ENCODING_BIG5 ::
*     Corresponds to an encoding system for Traditional Chinese as used in
*     Taiwan and Hong Kong.
*
*   FT_ENCODING_WANSUNG ::
*     Corresponds to the Korean encoding system known as Extended Wansung
*     (MS Windows code page 949).  For more information see
*     'https://www.unicode.org/Public/MAPPINGS/VENDORS/MICSFT/WindowsBestFit/bestfit949.txt'.
*
*   FT_ENCODING_JOHAB ::
*     The Korean standard character set (KS~C 5601-1992), which
*     corresponds to MS Windows code page 1361.  This character set
*     includes all possible Hangul character combinations.
*
*   FT_ENCODING_ADOBE_LATIN_1 ::
*     Corresponds to a Latin-1 encoding as defined in a Type~1 PostScript
*     font.  It is limited to 256 character codes.
*
*   FT_ENCODING_ADOBE_STANDARD ::
*     Adobe Standard encoding, as found in Type~1, CFF, and OpenType/CFF
*     fonts.  It is limited to 256 character codes.
*
*   FT_ENCODING_ADOBE_EXPERT ::
*     Adobe Expert encoding, as found in Type~1, CFF, and OpenType/CFF
*     fonts.  It is limited to 256 character codes.
*
*   FT_ENCODING_ADOBE_CUSTOM ::
*     Corresponds to a custom encoding, as found in Type~1, CFF, and
*     OpenType/CFF fonts.  It is limited to 256 character codes.
*
*   FT_ENCODING_APPLE_ROMAN ::
*     Apple roman encoding.  Many TrueType and OpenType fonts contain a
*     charmap for this 8-bit encoding, since older versions of Mac OS are
*     able to use it.
*
*   FT_ENCODING_OLD_LATIN_2 ::
*     This value is deprecated and was neither used nor reported by
*     FreeType.  Don't use or test for it.
*
*   FT_ENCODING_MS_SJIS ::
*     Same as FT_ENCODING_SJIS.  Deprecated.
*
*   FT_ENCODING_MS_GB2312 ::
*     Same as FT_ENCODING_PRC.  Deprecated.
*
*   FT_ENCODING_MS_BIG5 ::
*     Same as FT_ENCODING_BIG5.  Deprecated.
*
*   FT_ENCODING_MS_WANSUNG ::
*     Same as FT_ENCODING_WANSUNG.  Deprecated.
*
*   FT_ENCODING_MS_JOHAB ::
*     Same as FT_ENCODING_JOHAB.  Deprecated.
*
* @note:
*   When loading a font, FreeType makes a Unicode charmap active if
*   possible (either if the font provides such a charmap, or if FreeType
*   can synthesize one from PostScript glyph name dictionaries; in either
*   case, the charmap is tagged with `FT_ENCODING_UNICODE`).  If such a
*   charmap is synthesized, it is placed at the first position of the
*   charmap array.
*
*   All other encodings are considered legacy and tagged only if
*   explicitly defined in the font file.  Otherwise, `FT_ENCODING_NONE` is
*   used.
*
*   `FT_ENCODING_NONE` is set by the BDF and PCF drivers if the charmap is
*   neither Unicode nor ISO-8859-1 (otherwise it is set to
*   `FT_ENCODING_UNICODE`).  Use @FT_Get_BDF_Charset_ID to find out which
*   encoding is really present.  If, for example, the `cs_registry` field
*   is 'KOI8' and the `cs_encoding` field is 'R', the font is encoded in
*   KOI8-R.
*
*   `FT_ENCODING_NONE` is always set (with a single exception) by the
*   winfonts driver.  Use @FT_Get_WinFNT_Header and examine the `charset`
*   field of the @FT_WinFNT_HeaderRec structure to find out which encoding
*   is really present.  For example, @FT_WinFNT_ID_CP1251 (204) means
*   Windows code page 1251 (for Russian).
*
*   `FT_ENCODING_NONE` is set if `platform_id` is @TT_PLATFORM_MACINTOSH
*   and `encoding_id` is not `TT_MAC_ID_ROMAN` (otherwise it is set to
*   `FT_ENCODING_APPLE_ROMAN`).
*
*   If `platform_id` is @TT_PLATFORM_MACINTOSH, use the function
*   @FT_Get_CMap_Language_ID to query the Mac language ID that may be
*   needed to be able to distinguish Apple encoding variants.  See
*
*     https://www.unicode.org/Public/MAPPINGS/VENDORS/APPLE/Readme.txt
*
*   to get an idea how to do that.  Basically, if the language ID is~0,
*   don't use it, otherwise subtract 1 from the language ID.  Then examine
*   `encoding_id`.  If, for example, `encoding_id` is `TT_MAC_ID_ROMAN`
*   and the language ID (minus~1) is `TT_MAC_LANGID_GREEK`, it is the
*   Greek encoding, not Roman.  `TT_MAC_ID_ARABIC` with
*   `TT_MAC_LANGID_FARSI` means the Farsi variant of the Arabic encoding.
*/
Ft_Encoding :: enum u32 {
	NONE           = 0,
	MS_SYMBOL      = 1,
	UNICODE        = 2,
	SJIS           = 3,
	PRC            = 4,
	BIG5           = 5,
	WANSUNG        = 6,
	JOHAB          = 7,

	/* for backward compatibility */
	GB2312         = 4,
	MS_SJIS        = 3,
	MS_GB2312      = 4,
	MS_BIG5        = 5,
	MS_WANSUNG     = 6,
	MS_JOHAB       = 7,
	ADOBE_STANDARD = 8,
	ADOBE_EXPERT   = 9,
	ADOBE_CUSTOM   = 10,
	ADOBE_LATIN_1  = 11,
	OLD_LATIN_2    = 12,
	APPLE_ROMAN    = 13,
}

/**************************************************************************
*
* @struct:
*   FT_CharMapRec
*
* @description:
*   The base charmap structure.
*
* @fields:
*   face ::
*     A handle to the parent face object.
*
*   encoding ::
*     An @FT_Encoding tag identifying the charmap.  Use this with
*     @FT_Select_Charmap.
*
*   platform_id ::
*     An ID number describing the platform for the following encoding ID.
*     This comes directly from the TrueType specification and gets
*     emulated for other formats.
*
*   encoding_id ::
*     A platform-specific encoding number.  This also comes from the
*     TrueType specification and gets emulated similarly.
*/
Ft_Char_Map_Rec :: struct {
	face:        Ft_Face,
	encoding:    Ft_Encoding,
	platform_id: i32,
	encoding_id: i32,
}

Ft_Face_Internal_Rec :: struct {}

/**************************************************************************
*
* @type:
*   FT_Face_Internal
*
* @description:
*   An opaque handle to an `FT_Face_InternalRec` structure that models the
*   private data of a given @FT_Face object.
*
*   This structure might change between releases of FreeType~2 and is not
*   generally available to client applications.
*/
Ft_Face_Internal :: ^Ft_Face_Internal_Rec

/**************************************************************************
*
* @struct:
*   FT_FaceRec
*
* @description:
*   FreeType root face class structure.  A face object models a typeface
*   in a font file.
*
* @fields:
*   num_faces ::
*     The number of faces in the font file.  Some font formats can have
*     multiple faces in a single font file.
*
*   face_index ::
*     This field holds two different values.  Bits 0-15 are the index of
*     the face in the font file (starting with value~0).  They are set
*     to~0 if there is only one face in the font file.
*
*     [Since 2.6.1] Bits 16-30 are relevant to TrueType GX and OpenType
*     Font Variations only, holding the named instance index for the
*     current face index (starting with value~1; value~0 indicates font
*     access without a named instance).  For non-variation fonts, bits
*     16-30 are ignored.  If we have the third named instance of face~4,
*     say, `face_index` is set to 0x00030004.
*
*     Bit 31 is always zero (that is, `face_index` is always a positive
*     value).
*
*     [Since 2.9] Changing the design coordinates with
*     @FT_Set_Var_Design_Coordinates or @FT_Set_Var_Blend_Coordinates does
*     not influence the named instance index value (only
*     @FT_Set_Named_Instance does that).
*
*   face_flags ::
*     A set of bit flags that give important information about the face;
*     see @FT_FACE_FLAG_XXX for the details.
*
*   style_flags ::
*     The lower 16~bits contain a set of bit flags indicating the style of
*     the face; see @FT_STYLE_FLAG_XXX for the details.
*
*     [Since 2.6.1] Bits 16-30 hold the number of named instances
*     available for the current face if we have a TrueType GX or OpenType
*     Font Variation.  Bit 31 is always zero (that is, `style_flags` is
*     always a positive value).  Note that a variation font has always at
*     least one named instance, namely the default instance.
*
*   num_glyphs ::
*     The number of glyphs in the face.  If the face is scalable and has
*     sbits (see `num_fixed_sizes`), it is set to the number of outline
*     glyphs.
*
*     For CID-keyed fonts (not in an SFNT wrapper) this value gives the
*     highest CID used in the font.
*
*   family_name ::
*     The face's family name.  This is an ASCII string, usually in
*     English, that describes the typeface's family (like 'Times New
*     Roman', 'Bodoni', 'Garamond', etc).  This is a least common
*     denominator used to list fonts.  Some formats (TrueType & OpenType)
*     provide localized and Unicode versions of this string.  Applications
*     should use the format-specific interface to access them.  Can be
*     `NULL` (e.g., in fonts embedded in a PDF file).
*
*     In case the font doesn't provide a specific family name entry,
*     FreeType tries to synthesize one, deriving it from other name
*     entries.
*
*   style_name ::
*     The face's style name.  This is an ASCII string, usually in English,
*     that describes the typeface's style (like 'Italic', 'Bold',
*     'Condensed', etc).  Not all font formats provide a style name, so
*     this field is optional, and can be set to `NULL`.  As for
*     `family_name`, some formats provide localized and Unicode versions
*     of this string.  Applications should use the format-specific
*     interface to access them.
*
*   num_fixed_sizes ::
*     The number of bitmap strikes in the face.  Even if the face is
*     scalable, there might still be bitmap strikes, which are called
*     'sbits' in that case.
*
*   available_sizes ::
*     An array of @FT_Bitmap_Size for all bitmap strikes in the face.  It
*     is set to `NULL` if there is no bitmap strike.
*
*     Note that FreeType tries to sanitize the strike data since they are
*     sometimes sloppy or incorrect, but this can easily fail.
*
*   num_charmaps ::
*     The number of charmaps in the face.
*
*   charmaps ::
*     An array of the charmaps of the face.
*
*   generic ::
*     A field reserved for client uses.  See the @FT_Generic type
*     description.
*
*   bbox ::
*     The font bounding box.  Coordinates are expressed in font units (see
*     `units_per_EM`).  The box is large enough to contain any glyph from
*     the font.  Thus, `bbox.yMax` can be seen as the 'maximum ascender',
*     and `bbox.yMin` as the 'minimum descender'.  Only relevant for
*     scalable formats.
*
*     Note that the bounding box might be off by (at least) one pixel for
*     hinted fonts.  See @FT_Size_Metrics for further discussion.
*
*     Note that the bounding box does not vary in OpenType Font Variations
*     and should only be used in relation to the default instance.
*
*   units_per_EM ::
*     The number of font units per EM square for this face.  This is
*     typically 2048 for TrueType fonts, and 1000 for Type~1 fonts.  Only
*     relevant for scalable formats.
*
*   ascender ::
*     The typographic ascender of the face, expressed in font units.  For
*     font formats not having this information, it is set to `bbox.yMax`.
*     Only relevant for scalable formats.
*
*   descender ::
*     The typographic descender of the face, expressed in font units.  For
*     font formats not having this information, it is set to `bbox.yMin`.
*     Note that this field is negative for values below the baseline.
*     Only relevant for scalable formats.
*
*   height ::
*     This value is the vertical distance between two consecutive
*     baselines, expressed in font units.  It is always positive.  Only
*     relevant for scalable formats.
*
*     If you want the global glyph height, use `ascender - descender`.
*
*   max_advance_width ::
*     The maximum advance width, in font units, for all glyphs in this
*     face.  This can be used to make word wrapping computations faster.
*     Only relevant for scalable formats.
*
*   max_advance_height ::
*     The maximum advance height, in font units, for all glyphs in this
*     face.  This is only relevant for vertical layouts, and is set to
*     `height` for fonts that do not provide vertical metrics.  Only
*     relevant for scalable formats.
*
*   underline_position ::
*     The position, in font units, of the underline line for this face.
*     It is the center of the underlining stem.  Only relevant for
*     scalable formats.
*
*   underline_thickness ::
*     The thickness, in font units, of the underline for this face.  Only
*     relevant for scalable formats.
*
*   glyph ::
*     The face's associated glyph slot(s).
*
*   size ::
*     The current active size for this face.
*
*   charmap ::
*     The current active charmap for this face.
*
* @note:
*   Fields may be changed after a call to @FT_Attach_File or
*   @FT_Attach_Stream.
*
*   For OpenType Font Variations, the values of the following fields can
*   change after a call to @FT_Set_Var_Design_Coordinates (and friends) if
*   the font contains an 'MVAR' table: `ascender`, `descender`, `height`,
*   `underline_position`, and `underline_thickness`.
*
*   Especially for TrueType fonts see also the documentation for
*   @FT_Size_Metrics.
*/
Ft_Face_Rec :: struct {
	num_faces:       i32,
	face_index:      i32,
	face_flags:      i32,
	style_flags:     i32,
	num_glyphs:      i32,
	family_name:     ^i32,
	style_name:      ^i32,
	num_fixed_sizes: i32,
	available_sizes: ^Ft_Bitmap_Size,
	num_charmaps:    i32,
	charmaps:        ^Ft_Char_Map,
	generic:         i32,

	/* The following member variables (down to `underline_thickness`) */
	/* are only relevant to scalable outlines; cf. @FT_Bitmap_Size    */
	/* for bitmap fonts.                                              */
	bbox:                i32,
	units_per_EM:        i32,
	ascender:            i32,
	descender:           i32,
	height:              i32,
	max_advance_width:   i32,
	max_advance_height:  i32,
	underline_position:  i32,
	underline_thickness: i32,
	glyph:               Ft_Glyph_Slot,
	size:                Ft_Size,
	charmap:             Ft_Char_Map,

	/* private fields, internal to FreeType */
	driver:     Ft_Driver,
	memory:     i32,
	stream:     i32,
	sizes_list: i32,
	autohint:   i32,    /* face-specific auto-hinter data */
	extensions: rawptr, /* unused                         */
	internal:   Ft_Face_Internal,
}

/**************************************************************************
*
* @enum:
*   FT_FACE_FLAG_XXX
*
* @description:
*   A list of bit flags used in the `face_flags` field of the @FT_FaceRec
*   structure.  They inform client applications of properties of the
*   corresponding face.
*
* @values:
*   FT_FACE_FLAG_SCALABLE ::
*     The face contains outline glyphs.  Note that a face can contain
*     bitmap strikes also, i.e., a face can have both this flag and
*     @FT_FACE_FLAG_FIXED_SIZES set.
*
*   FT_FACE_FLAG_FIXED_SIZES ::
*     The face contains bitmap strikes.  See also the `num_fixed_sizes`
*     and `available_sizes` fields of @FT_FaceRec.
*
*   FT_FACE_FLAG_FIXED_WIDTH ::
*     The face contains fixed-width characters (like Courier, Lucida,
*     MonoType, etc.).
*
*   FT_FACE_FLAG_SFNT ::
*     The face uses the SFNT storage scheme.  For now, this means TrueType
*     and OpenType.
*
*   FT_FACE_FLAG_HORIZONTAL ::
*     The face contains horizontal glyph metrics.  This should be set for
*     all common formats.
*
*   FT_FACE_FLAG_VERTICAL ::
*     The face contains vertical glyph metrics.  This is only available in
*     some formats, not all of them.
*
*   FT_FACE_FLAG_KERNING ::
*     The face contains kerning information.  If set, the kerning distance
*     can be retrieved using the function @FT_Get_Kerning.  Otherwise the
*     function always returns the vector (0,0).
*
*     Note that for TrueType fonts only, FreeType supports both the 'kern'
*     table and the basic, pair-wise kerning feature from the 'GPOS' table
*     (with `TT_CONFIG_OPTION_GPOS_KERNING` enabled), though FreeType does
*     not support the more advanced GPOS layout features; use a library
*     like HarfBuzz for those instead.
*
*   FT_FACE_FLAG_FAST_GLYPHS ::
*     THIS FLAG IS DEPRECATED.  DO NOT USE OR TEST IT.
*
*   FT_FACE_FLAG_MULTIPLE_MASTERS ::
*     The face contains multiple masters and is capable of interpolating
*     between them.  Supported formats are Adobe MM, TrueType GX, and
*     OpenType Font Variations.
*
*     See section @multiple_masters for API details.
*
*   FT_FACE_FLAG_GLYPH_NAMES ::
*     The face contains glyph names, which can be retrieved using
*     @FT_Get_Glyph_Name.  Note that some TrueType fonts contain broken
*     glyph name tables.  Use the function @FT_Has_PS_Glyph_Names when
*     needed.
*
*   FT_FACE_FLAG_EXTERNAL_STREAM ::
*     Used internally by FreeType to indicate that a face's stream was
*     provided by the client application and should not be destroyed when
*     @FT_Done_Face is called.  Don't read or test this flag.
*
*   FT_FACE_FLAG_HINTER ::
*     The font driver has a hinting machine of its own.  For example, with
*     TrueType fonts, it makes sense to use data from the SFNT 'gasp'
*     table only if the native TrueType hinting engine (with the bytecode
*     interpreter) is available and active.
*
*   FT_FACE_FLAG_CID_KEYED ::
*     The face is CID-keyed.  In that case, the face is not accessed by
*     glyph indices but by CID values.  For subsetted CID-keyed fonts this
*     has the consequence that not all index values are a valid argument
*     to @FT_Load_Glyph.  Only the CID values for which corresponding
*     glyphs in the subsetted font exist make `FT_Load_Glyph` return
*     successfully; in all other cases you get an
*     `FT_Err_Invalid_Argument` error.
*
*     Note that CID-keyed fonts that are in an SFNT wrapper (that is, all
*     OpenType/CFF fonts) don't have this flag set since the glyphs are
*     accessed in the normal way (using contiguous indices); the
*     'CID-ness' isn't visible to the application.
*
*   FT_FACE_FLAG_TRICKY ::
*     The face is 'tricky', that is, it always needs the font format's
*     native hinting engine to get a reasonable result.  A typical example
*     is the old Chinese font `mingli.ttf` (but not `mingliu.ttc`) that
*     uses TrueType bytecode instructions to move and scale all of its
*     subglyphs.
*
*     It is not possible to auto-hint such fonts using
*     @FT_LOAD_FORCE_AUTOHINT; it will also ignore @FT_LOAD_NO_HINTING.
*     You have to set both @FT_LOAD_NO_HINTING and @FT_LOAD_NO_AUTOHINT to
*     really disable hinting; however, you probably never want this except
*     for demonstration purposes.
*
*     Currently, there are about a dozen TrueType fonts in the list of
*     tricky fonts; they are hard-coded in file `ttobjs.c`.
*
*   FT_FACE_FLAG_COLOR ::
*     [Since 2.5.1] The face has color glyph tables.  See @FT_LOAD_COLOR
*     for more information.
*
*   FT_FACE_FLAG_VARIATION ::
*     [Since 2.9] Set if the current face (or named instance) has been
*     altered with @FT_Set_MM_Design_Coordinates,
*     @FT_Set_Var_Design_Coordinates, @FT_Set_Var_Blend_Coordinates, or
*     @FT_Set_MM_WeightVector to select a non-default instance.
*
*   FT_FACE_FLAG_SVG ::
*     [Since 2.12] The face has an 'SVG~' OpenType table.
*
*   FT_FACE_FLAG_SBIX ::
*     [Since 2.12] The face has an 'sbix' OpenType table *and* outlines.
*     For such fonts, @FT_FACE_FLAG_SCALABLE is not set by default to
*     retain backward compatibility.
*
*   FT_FACE_FLAG_SBIX_OVERLAY ::
*     [Since 2.12] The face has an 'sbix' OpenType table where outlines
*     should be drawn on top of bitmap strikes.
*
*/
FT_FACE_FLAG_SCALABLE          :: (10)
FT_FACE_FLAG_FIXED_SIZES       :: (11)
FT_FACE_FLAG_FIXED_WIDTH       :: (12)
FT_FACE_FLAG_SFNT              :: (13)
FT_FACE_FLAG_HORIZONTAL        :: (14)
FT_FACE_FLAG_VERTICAL          :: (15)
FT_FACE_FLAG_KERNING           :: (16)
FT_FACE_FLAG_FAST_GLYPHS       :: (17)
FT_FACE_FLAG_MULTIPLE_MASTERS  :: (18)
FT_FACE_FLAG_GLYPH_NAMES       :: (19)
FT_FACE_FLAG_EXTERNAL_STREAM   :: (110)
FT_FACE_FLAG_HINTER            :: (111)
FT_FACE_FLAG_CID_KEYED         :: (112)
FT_FACE_FLAG_TRICKY            :: (113)
FT_FACE_FLAG_COLOR             :: (114)
FT_FACE_FLAG_VARIATION         :: (115)
FT_FACE_FLAG_SVG               :: (116)
FT_FACE_FLAG_SBIX              :: (117)
FT_FACE_FLAG_SBIX_OVERLAY      :: (118)

/**************************************************************************
*
* @section:
*   face_creation
*
*/

/**************************************************************************
*
* @enum:
*   FT_STYLE_FLAG_XXX
*
* @description:
*   A list of bit flags to indicate the style of a given face.  These are
*   used in the `style_flags` field of @FT_FaceRec.
*
* @values:
*   FT_STYLE_FLAG_ITALIC ::
*     The face style is italic or oblique.
*
*   FT_STYLE_FLAG_BOLD ::
*     The face is bold.
*
* @note:
*   The style information as provided by FreeType is very basic.  More
*   details are beyond the scope and should be done on a higher level (for
*   example, by analyzing various fields of the 'OS/2' table in SFNT based
*   fonts).
*/
FT_STYLE_FLAG_ITALIC  :: (10)
FT_STYLE_FLAG_BOLD    :: (11)

Ft_Size_Internal_Rec :: struct {}

/**************************************************************************
*
* @type:
*   FT_Size_Internal
*
* @description:
*   An opaque handle to an `FT_Size_InternalRec` structure, used to model
*   private data of a given @FT_Size object.
*/
Ft_Size_Internal :: ^Ft_Size_Internal_Rec

/**************************************************************************
*
* @struct:
*   FT_Size_Metrics
*
* @description:
*   The size metrics structure gives the metrics of a size object.
*
* @fields:
*   x_ppem ::
*     The width of the scaled EM square in pixels, hence the term 'ppem'
*     (pixels per EM).  It is also referred to as 'nominal width'.
*
*   y_ppem ::
*     The height of the scaled EM square in pixels, hence the term 'ppem'
*     (pixels per EM).  It is also referred to as 'nominal height'.
*
*   x_scale ::
*     A 16.16 fractional scaling value to convert horizontal metrics from
*     font units to 26.6 fractional pixels.  Only relevant for scalable
*     font formats.
*
*   y_scale ::
*     A 16.16 fractional scaling value to convert vertical metrics from
*     font units to 26.6 fractional pixels.  Only relevant for scalable
*     font formats.
*
*   ascender ::
*     The ascender in 26.6 fractional pixels, rounded up to an integer
*     value.  See @FT_FaceRec for the details.
*
*   descender ::
*     The descender in 26.6 fractional pixels, rounded down to an integer
*     value.  See @FT_FaceRec for the details.
*
*   height ::
*     The height in 26.6 fractional pixels, rounded to an integer value.
*     See @FT_FaceRec for the details.
*
*   max_advance ::
*     The maximum advance width in 26.6 fractional pixels, rounded to an
*     integer value.  See @FT_FaceRec for the details.
*
* @note:
*   The scaling values, if relevant, are determined first during a size
*   changing operation.  The remaining fields are then set by the driver.
*   For scalable formats, they are usually set to scaled values of the
*   corresponding fields in @FT_FaceRec.  Some values like ascender or
*   descender are rounded for historical reasons; more precise values (for
*   outline fonts) can be derived by scaling the corresponding @FT_FaceRec
*   values manually, with code similar to the following.
*
*   ```
*     scaled_ascender = FT_MulFix( face->ascender,
*                                  size_metrics->y_scale );
*   ```
*
*   Note that due to glyph hinting and the selected rendering mode these
*   values are usually not exact; consequently, they must be treated as
*   unreliable with an error margin of at least one pixel!
*
*   Indeed, the only way to get the exact metrics is to render _all_
*   glyphs.  As this would be a definite performance hit, it is up to
*   client applications to perform such computations.
*
*   The `FT_Size_Metrics` structure is valid for bitmap fonts also.
*
*
*   **TrueType fonts with native bytecode hinting**
*
*   All applications that handle TrueType fonts with native hinting must
*   be aware that TTFs expect different rounding of vertical font
*   dimensions.  The application has to cater for this, especially if it
*   wants to rely on a TTF's vertical data (for example, to properly align
*   box characters vertically).
*
*   Only the application knows _in advance_ that it is going to use native
*   hinting for TTFs!  FreeType, on the other hand, selects the hinting
*   mode not at the time of creating an @FT_Size object but much later,
*   namely while calling @FT_Load_Glyph.
*
*   Here is some pseudo code that illustrates a possible solution.
*
*   ```
*     font_format = FT_Get_Font_Format( face );
*
*     if ( !strcmp( font_format, "TrueType" ) &&
*          do_native_bytecode_hinting         )
*     {
*       ascender  = ROUND( FT_MulFix( face->ascender,
*                                     size_metrics->y_scale ) );
*       descender = ROUND( FT_MulFix( face->descender,
*                                     size_metrics->y_scale ) );
*     }
*     else
*     {
*       ascender  = size_metrics->ascender;
*       descender = size_metrics->descender;
*     }
*
*     height      = size_metrics->height;
*     max_advance = size_metrics->max_advance;
*   ```
*/
Ft_Size_Metrics :: struct {
	x_ppem:      i32, /* horizontal pixels per EM               */
	y_ppem:      i32, /* vertical pixels per EM                 */
	x_scale:     i32, /* scaling values used to convert font    */
	y_scale:     i32, /* units to 26.6 fractional pixels        */
	ascender:    i32, /* ascender in 26.6 frac. pixels          */
	descender:   i32, /* descender in 26.6 frac. pixels         */
	height:      i32, /* text height in 26.6 frac. pixels       */
	max_advance: i32, /* max horizontal advance, in 26.6 pixels */
}

/**************************************************************************
*
* @struct:
*   FT_SizeRec
*
* @description:
*   FreeType root size class structure.  A size object models a face
*   object at a given size.
*
* @fields:
*   face ::
*     Handle to the parent face object.
*
*   generic ::
*     A typeless pointer, unused by the FreeType library or any of its
*     drivers.  It can be used by client applications to link their own
*     data to each size object.
*
*   metrics ::
*     Metrics for this size object.  This field is read-only.
*/
Ft_Size_Rec :: struct {
	face:     Ft_Face,         /* parent face object              */
	generic:  i32,             /* generic pointer for client uses */
	metrics:  Ft_Size_Metrics, /* size metrics                    */
	internal: Ft_Size_Internal,
}

/**************************************************************************
*
* @struct:
*   FT_SubGlyph
*
* @description:
*   The subglyph structure is an internal object used to describe
*   subglyphs (for example, in the case of composites).
*
* @note:
*   The subglyph implementation is not part of the high-level API, hence
*   the forward structure declaration.
*
*   You can however retrieve subglyph information with
*   @FT_Get_SubGlyph_Info.
*/
Ft_Sub_Glyph     :: ^Ft_Sub_Glyph_Rec
Ft_Sub_Glyph_Rec :: struct {}

/**************************************************************************
*
* @type:
*   FT_Slot_Internal
*
* @description:
*   An opaque handle to an `FT_Slot_InternalRec` structure, used to model
*   private data of a given @FT_GlyphSlot object.
*/
Ft_Slot_Internal     :: ^Ft_Slot_Internal_Rec
Ft_Slot_Internal_Rec :: struct {}

/**************************************************************************
*
* @struct:
*   FT_GlyphSlotRec
*
* @description:
*   FreeType root glyph slot class structure.  A glyph slot is a container
*   where individual glyphs can be loaded, be they in outline or bitmap
*   format.
*
* @fields:
*   library ::
*     A handle to the FreeType library instance this slot belongs to.
*
*   face ::
*     A handle to the parent face object.
*
*   next ::
*     In some cases (like some font tools), several glyph slots per face
*     object can be a good thing.  As this is rare, the glyph slots are
*     listed through a direct, single-linked list using its `next` field.
*
*   glyph_index ::
*     [Since 2.10] The glyph index passed as an argument to @FT_Load_Glyph
*     while initializing the glyph slot.
*
*   generic ::
*     A typeless pointer unused by the FreeType library or any of its
*     drivers.  It can be used by client applications to link their own
*     data to each glyph slot object.
*
*   metrics ::
*     The metrics of the last loaded glyph in the slot.  The returned
*     values depend on the last load flags (see the @FT_Load_Glyph API
*     function) and can be expressed either in 26.6 fractional pixels or
*     font units.
*
*     Note that even when the glyph image is transformed, the metrics are
*     not.
*
*   linearHoriAdvance ::
*     The advance width of the unhinted glyph.  Its value is expressed in
*     16.16 fractional pixels, unless @FT_LOAD_LINEAR_DESIGN is set when
*     loading the glyph.  This field can be important to perform correct
*     WYSIWYG layout.  Only relevant for scalable glyphs.
*
*   linearVertAdvance ::
*     The advance height of the unhinted glyph.  Its value is expressed in
*     16.16 fractional pixels, unless @FT_LOAD_LINEAR_DESIGN is set when
*     loading the glyph.  This field can be important to perform correct
*     WYSIWYG layout.  Only relevant for scalable glyphs.
*
*   advance ::
*     This shorthand is, depending on @FT_LOAD_IGNORE_TRANSFORM, the
*     transformed (hinted) advance width for the glyph, in 26.6 fractional
*     pixel format.  As specified with @FT_LOAD_VERTICAL_LAYOUT, it uses
*     either the `horiAdvance` or the `vertAdvance` value of `metrics`
*     field.
*
*   format ::
*     This field indicates the format of the image contained in the glyph
*     slot.  Typically @FT_GLYPH_FORMAT_BITMAP, @FT_GLYPH_FORMAT_OUTLINE,
*     or @FT_GLYPH_FORMAT_COMPOSITE, but other values are possible.
*
*   bitmap ::
*     This field is used as a bitmap descriptor.  Note that the address
*     and content of the bitmap buffer can change between calls of
*     @FT_Load_Glyph and a few other functions.
*
*   bitmap_left ::
*     The bitmap's left bearing expressed in integer pixels.
*
*   bitmap_top ::
*     The bitmap's top bearing expressed in integer pixels.  This is the
*     distance from the baseline to the top-most glyph scanline, upwards
*     y~coordinates being **positive**.
*
*   outline ::
*     The outline descriptor for the current glyph image if its format is
*     @FT_GLYPH_FORMAT_OUTLINE.  Once a glyph is loaded, `outline` can be
*     transformed, distorted, emboldened, etc.  However, it must not be
*     freed.
*
*     [Since 2.10.1] If @FT_LOAD_NO_SCALE is set, outline coordinates of
*     OpenType Font Variations for a selected instance are internally
*     handled as 26.6 fractional font units but returned as (rounded)
*     integers, as expected.  To get unrounded font units, don't use
*     @FT_LOAD_NO_SCALE but load the glyph with @FT_LOAD_NO_HINTING and
*     scale it, using the font's `units_per_EM` value as the ppem.
*
*   num_subglyphs ::
*     The number of subglyphs in a composite glyph.  This field is only
*     valid for the composite glyph format that should normally only be
*     loaded with the @FT_LOAD_NO_RECURSE flag.
*
*   subglyphs ::
*     An array of subglyph descriptors for composite glyphs.  There are
*     `num_subglyphs` elements in there.  Currently internal to FreeType.
*
*   control_data ::
*     Certain font drivers can also return the control data for a given
*     glyph image (e.g.  TrueType bytecode, Type~1 charstrings, etc.).
*     This field is a pointer to such data; it is currently internal to
*     FreeType.
*
*   control_len ::
*     This is the length in bytes of the control data.  Currently internal
*     to FreeType.
*
*   other ::
*     Reserved.
*
*   lsb_delta ::
*     The difference between hinted and unhinted left side bearing while
*     auto-hinting is active.  Zero otherwise.
*
*   rsb_delta ::
*     The difference between hinted and unhinted right side bearing while
*     auto-hinting is active.  Zero otherwise.
*
* @note:
*   If @FT_Load_Glyph is called with default flags (see @FT_LOAD_DEFAULT)
*   the glyph image is loaded in the glyph slot in its native format
*   (e.g., an outline glyph for TrueType and Type~1 formats).  [Since 2.9]
*   The prospective bitmap metrics are calculated according to
*   @FT_LOAD_TARGET_XXX and other flags even for the outline glyph, even
*   if @FT_LOAD_RENDER is not set.
*
*   This image can later be converted into a bitmap by calling
*   @FT_Render_Glyph.  This function searches the current renderer for the
*   native image's format, then invokes it.
*
*   The renderer is in charge of transforming the native image through the
*   slot's face transformation fields, then converting it into a bitmap
*   that is returned in `slot->bitmap`.
*
*   Note that `slot->bitmap_left` and `slot->bitmap_top` are also used to
*   specify the position of the bitmap relative to the current pen
*   position (e.g., coordinates (0,0) on the baseline).  Of course,
*   `slot->format` is also changed to @FT_GLYPH_FORMAT_BITMAP.
*
*   Here is a small pseudo code fragment that shows how to use `lsb_delta`
*   and `rsb_delta` to do fractional positioning of glyphs:
*
*   ```
*     FT_GlyphSlot  slot     = face->glyph;
*     FT_Pos        origin_x = 0;
*
*
*     for all glyphs do
*       <load glyph with `FT_Load_Glyph'>
*
*       FT_Outline_Translate( slot->outline, origin_x & 63, 0 );
*
*       <save glyph image, or render glyph, or ...>
*
*       <compute kern between current and next glyph
*        and add it to `origin_x'>
*
*       origin_x += slot->advance.x;
*       origin_x += slot->lsb_delta - slot->rsb_delta;
*     endfor
*   ```
*
*   Here is another small pseudo code fragment that shows how to use
*   `lsb_delta` and `rsb_delta` to improve integer positioning of glyphs:
*
*   ```
*     FT_GlyphSlot  slot           = face->glyph;
*     FT_Pos        origin_x       = 0;
*     FT_Pos        prev_rsb_delta = 0;
*
*
*     for all glyphs do
*       <compute kern between current and previous glyph
*        and add it to `origin_x'>
*
*       <load glyph with `FT_Load_Glyph'>
*
*       if ( prev_rsb_delta - slot->lsb_delta >  32 )
*         origin_x -= 64;
*       else if ( prev_rsb_delta - slot->lsb_delta < -31 )
*         origin_x += 64;
*
*       prev_rsb_delta = slot->rsb_delta;
*
*       <save glyph image, or render glyph, or ...>
*
*       origin_x += slot->advance.x;
*     endfor
*   ```
*
*   If you use strong auto-hinting, you **must** apply these delta values!
*   Otherwise you will experience far too large inter-glyph spacing at
*   small rendering sizes in most cases.  Note that it doesn't harm to use
*   the above code for other hinting modes also, since the delta values
*   are zero then.
*/
Ft_Glyph_Slot_Rec :: struct {
	library:           Ft_Library,
	face:              Ft_Face,
	next:              Ft_Glyph_Slot,
	glyph_index:       i32, /* new in 2.10; was reserved previously */
	generic:           i32,
	metrics:           Ft_Glyph_Metrics,
	linearHoriAdvance: i32,
	linearVertAdvance: i32,
	advance:           i32,
	format:            i32,
	bitmap:            i32,
	bitmap_left:       i32,
	bitmap_top:        i32,
	outline:           i32,
	num_subglyphs:     i32,
	subglyphs:         Ft_Sub_Glyph,
	control_data:      rawptr,
	control_len:       c.long,
	lsb_delta:         i32,
	rsb_delta:         i32,
	other:             rawptr,
	internal:          Ft_Slot_Internal,
}

/**************************************************************************
*
* @section:
*   face_creation
*
*/

/**************************************************************************
*
* @enum:
*   FT_OPEN_XXX
*
* @description:
*   A list of bit field constants used within the `flags` field of the
*   @FT_Open_Args structure.
*
* @values:
*   FT_OPEN_MEMORY ::
*     This is a memory-based stream.
*
*   FT_OPEN_STREAM ::
*     Copy the stream from the `stream` field.
*
*   FT_OPEN_PATHNAME ::
*     Create a new input stream from a C~path name.
*
*   FT_OPEN_DRIVER ::
*     Use the `driver` field.
*
*   FT_OPEN_PARAMS ::
*     Use the `num_params` and `params` fields.
*
* @note:
*   The `FT_OPEN_MEMORY`, `FT_OPEN_STREAM`, and `FT_OPEN_PATHNAME` flags
*   are mutually exclusive.
*/
FT_OPEN_MEMORY    :: 0x1
FT_OPEN_STREAM    :: 0x2
FT_OPEN_PATHNAME  :: 0x4
FT_OPEN_DRIVER    :: 0x8
FT_OPEN_PARAMS    :: 0x10

/* these constants are deprecated; use the corresponding `FT_OPEN_XXX` */
/* values instead                                                      */
ft_open_memory    :: FT_OPEN_MEMORY
ft_open_stream    :: FT_OPEN_STREAM
ft_open_pathname  :: FT_OPEN_PATHNAME
ft_open_driver    :: FT_OPEN_DRIVER
ft_open_params    :: FT_OPEN_PARAMS

/**************************************************************************
*
* @struct:
*   FT_Parameter
*
* @description:
*   A simple structure to pass more or less generic parameters to
*   @FT_Open_Face and @FT_Face_Properties.
*
* @fields:
*   tag ::
*     A four-byte identification tag.
*
*   data ::
*     A pointer to the parameter data.
*
* @note:
*   The ID and function of parameters are driver-specific.  See section
*   @parameter_tags for more information.
*/
Ft_Parameter :: struct {
	tag:  i32,
	data: i32,
}

/**************************************************************************
*
* @struct:
*   FT_Open_Args
*
* @description:
*   A structure to indicate how to open a new font file or stream.  A
*   pointer to such a structure can be used as a parameter for the
*   functions @FT_Open_Face and @FT_Attach_Stream.
*
* @fields:
*   flags ::
*     A set of bit flags indicating how to use the structure.
*
*   memory_base ::
*     The first byte of the file in memory.
*
*   memory_size ::
*     The size in bytes of the file in memory.
*
*   pathname ::
*     A pointer to an 8-bit file pathname, which must be a C~string (i.e.,
*     no null bytes except at the very end).  The pointer is not owned by
*     FreeType.
*
*   stream ::
*     A handle to a source stream object.
*
*   driver ::
*     This field is exclusively used by @FT_Open_Face; it simply specifies
*     the font driver to use for opening the face.  If set to `NULL`,
*     FreeType tries to load the face with each one of the drivers in its
*     list.
*
*   num_params ::
*     The number of extra parameters.
*
*   params ::
*     Extra parameters passed to the font driver when opening a new face.
*
* @note:
*   The stream type is determined by the contents of `flags`:
*
*   If the @FT_OPEN_MEMORY bit is set, assume that this is a memory file
*   of `memory_size` bytes, located at `memory_address`.  The data are not
*   copied, and the client is responsible for releasing and destroying
*   them _after_ the corresponding call to @FT_Done_Face.
*
*   Otherwise, if the @FT_OPEN_STREAM bit is set, assume that a custom
*   input stream `stream` is used.
*
*   Otherwise, if the @FT_OPEN_PATHNAME bit is set, assume that this is a
*   normal file and use `pathname` to open it.
*
*   If none of the above bits are set or if multiple are set at the same
*   time, the flags are invalid and @FT_Open_Face fails.
*
*   If the @FT_OPEN_DRIVER bit is set, @FT_Open_Face only tries to open
*   the file with the driver whose handler is in `driver`.
*
*   If the @FT_OPEN_PARAMS bit is set, the parameters given by
*   `num_params` and `params` is used.  They are ignored otherwise.
*
*   Ideally, both the `pathname` and `params` fields should be tagged as
*   'const'; this is missing for API backward compatibility.  In other
*   words, applications should treat them as read-only.
*/
Ft_Open_Args :: struct {
	flags:       i32,
	memory_base: ^i32,
	memory_size: i32,
	pathname:    ^i32,
	stream:      i32,
	driver:      Ft_Module,
	num_params:  i32,
	params:      ^Ft_Parameter,
}

/**************************************************************************
*
* @enum:
*   FT_Size_Request_Type
*
* @description:
*   An enumeration type that lists the supported size request types, i.e.,
*   what input size (in font units) maps to the requested output size (in
*   pixels, as computed from the arguments of @FT_Size_Request).
*
* @values:
*   FT_SIZE_REQUEST_TYPE_NOMINAL ::
*     The nominal size.  The `units_per_EM` field of @FT_FaceRec is used
*     to determine both scaling values.
*
*     This is the standard scaling found in most applications.  In
*     particular, use this size request type for TrueType fonts if they
*     provide optical scaling or something similar.  Note, however, that
*     `units_per_EM` is a rather abstract value which bears no relation to
*     the actual size of the glyphs in a font.
*
*   FT_SIZE_REQUEST_TYPE_REAL_DIM ::
*     The real dimension.  The sum of the `ascender` and (minus of) the
*     `descender` fields of @FT_FaceRec is used to determine both scaling
*     values.
*
*   FT_SIZE_REQUEST_TYPE_BBOX ::
*     The font bounding box.  The width and height of the `bbox` field of
*     @FT_FaceRec are used to determine the horizontal and vertical
*     scaling value, respectively.
*
*   FT_SIZE_REQUEST_TYPE_CELL ::
*     The `max_advance_width` field of @FT_FaceRec is used to determine
*     the horizontal scaling value; the vertical scaling value is
*     determined the same way as @FT_SIZE_REQUEST_TYPE_REAL_DIM does.
*     Finally, both scaling values are set to the smaller one.  This type
*     is useful if you want to specify the font size for, say, a window of
*     a given dimension and 80x24 cells.
*
*   FT_SIZE_REQUEST_TYPE_SCALES ::
*     Specify the scaling values directly.
*
* @note:
*   The above descriptions only apply to scalable formats.  For bitmap
*   formats, the behaviour is up to the driver.
*
*   See the note section of @FT_Size_Metrics if you wonder how size
*   requesting relates to scaling values.
*/
Ft_Size_Request_Type :: enum u32 {
	NOMINAL  = 0,
	REAL_DIM = 1,
	BBOX     = 2,
	CELL     = 3,
	SCALES   = 4,
	MAX      = 5,
}

/**************************************************************************
*
* @struct:
*   FT_Size_RequestRec
*
* @description:
*   A structure to model a size request.
*
* @fields:
*   type ::
*     See @FT_Size_Request_Type.
*
*   width ::
*     The desired width, given as a 26.6 fractional point value (with 72pt
*     = 1in).
*
*   height ::
*     The desired height, given as a 26.6 fractional point value (with
*     72pt = 1in).
*
*   horiResolution ::
*     The horizontal resolution (dpi, i.e., pixels per inch).  If set to
*     zero, `width` is treated as a 26.6 fractional **pixel** value, which
*     gets internally rounded to an integer.
*
*   vertResolution ::
*     The vertical resolution (dpi, i.e., pixels per inch).  If set to
*     zero, `height` is treated as a 26.6 fractional **pixel** value,
*     which gets internally rounded to an integer.
*
* @note:
*   If `width` is zero, the horizontal scaling value is set equal to the
*   vertical scaling value, and vice versa.
*
*   If `type` is `FT_SIZE_REQUEST_TYPE_SCALES`, `width` and `height` are
*   interpreted directly as 16.16 fractional scaling values, without any
*   further modification, and both `horiResolution` and `vertResolution`
*   are ignored.
*/
Ft_Size_Request_Rec :: struct {
	type:           Ft_Size_Request_Type,
	width:          i32,
	height:         i32,
	horiResolution: i32,
	vertResolution: i32,
}

/**************************************************************************
*
* @struct:
*   FT_Size_Request
*
* @description:
*   A handle to a size request structure.
*/
Ft_Size_Request :: ^Ft_Size_Request_Rec

/**************************************************************************
*
* @section:
*   glyph_retrieval
*
*/

/**************************************************************************
*
* @enum:
*   FT_LOAD_XXX
*
* @description:
*   A list of bit field constants for @FT_Load_Glyph to indicate what kind
*   of operations to perform during glyph loading.
*
* @values:
*   FT_LOAD_DEFAULT ::
*     Corresponding to~0, this value is used as the default glyph load
*     operation.  In this case, the following happens:
*
*     1. FreeType looks for a bitmap for the glyph corresponding to the
*     face's current size.  If one is found, the function returns.  The
*     bitmap data can be accessed from the glyph slot (see note below).
*
*     2. If no embedded bitmap is searched for or found, FreeType looks
*     for a scalable outline.  If one is found, it is loaded from the font
*     file, scaled to device pixels, then 'hinted' to the pixel grid in
*     order to optimize it.  The outline data can be accessed from the
*     glyph slot (see note below).
*
*     Note that by default the glyph loader doesn't render outlines into
*     bitmaps.  The following flags are used to modify this default
*     behaviour to more specific and useful cases.
*
*   FT_LOAD_NO_SCALE ::
*     Don't scale the loaded outline glyph but keep it in font units.
*     This flag is also assumed if @FT_Size owned by the face was not
*     properly initialized.
*
*     This flag implies @FT_LOAD_NO_HINTING and @FT_LOAD_NO_BITMAP, and
*     unsets @FT_LOAD_RENDER.
*
*     If the font is 'tricky' (see @FT_FACE_FLAG_TRICKY for more), using
*     `FT_LOAD_NO_SCALE` usually yields meaningless outlines because the
*     subglyphs must be scaled and positioned with hinting instructions.
*     This can be solved by loading the font without `FT_LOAD_NO_SCALE`
*     and setting the character size to `font->units_per_EM`.
*
*   FT_LOAD_NO_HINTING ::
*     Disable hinting.  This generally generates 'blurrier' bitmap glyphs
*     when the glyphs are rendered in any of the anti-aliased modes.  See
*     also the note below.
*
*     This flag is implied by @FT_LOAD_NO_SCALE.
*
*   FT_LOAD_RENDER ::
*     Call @FT_Render_Glyph after the glyph is loaded.  By default, the
*     glyph is rendered in @FT_RENDER_MODE_NORMAL mode.  This can be
*     overridden by @FT_LOAD_TARGET_XXX or @FT_LOAD_MONOCHROME.
*
*     This flag is unset by @FT_LOAD_NO_SCALE.
*
*   FT_LOAD_NO_BITMAP ::
*     Ignore bitmap strikes when loading.  Bitmap-only fonts ignore this
*     flag.
*
*     @FT_LOAD_NO_SCALE always sets this flag.
*
*   FT_LOAD_SBITS_ONLY ::
*     [Since 2.12] This is the opposite of @FT_LOAD_NO_BITMAP, more or
*     less: @FT_Load_Glyph returns `FT_Err_Invalid_Argument` if the face
*     contains a bitmap strike for the given size (or the strike selected
*     by @FT_Select_Size) but there is no glyph in the strike.
*
*     Note that this load flag was part of FreeType since version 2.0.6
*     but previously tagged as internal.
*
*   FT_LOAD_VERTICAL_LAYOUT ::
*     Load the glyph for vertical text layout.  In particular, the
*     `advance` value in the @FT_GlyphSlotRec structure is set to the
*     `vertAdvance` value of the `metrics` field.
*
*     In case @FT_HAS_VERTICAL doesn't return true, you shouldn't use this
*     flag currently.  Reason is that in this case vertical metrics get
*     synthesized, and those values are not always consistent across
*     various font formats.
*
*   FT_LOAD_FORCE_AUTOHINT ::
*     Prefer the auto-hinter over the font's native hinter.  See also the
*     note below.
*
*   FT_LOAD_PEDANTIC ::
*     Make the font driver perform pedantic verifications during glyph
*     loading and hinting.  This is mostly used to detect broken glyphs in
*     fonts.  By default, FreeType tries to handle broken fonts also.
*
*     In particular, errors from the TrueType bytecode engine are not
*     passed to the application if this flag is not set; this might result
*     in partially hinted or distorted glyphs in case a glyph's bytecode
*     is buggy.
*
*   FT_LOAD_NO_RECURSE ::
*     Don't load composite glyphs recursively.  Instead, the font driver
*     fills the `num_subglyph` and `subglyphs` values of the glyph slot;
*     it also sets `glyph->format` to @FT_GLYPH_FORMAT_COMPOSITE.  The
*     description of subglyphs can then be accessed with
*     @FT_Get_SubGlyph_Info.
*
*     Don't use this flag for retrieving metrics information since some
*     font drivers only return rudimentary data.
*
*     This flag implies @FT_LOAD_NO_SCALE and @FT_LOAD_IGNORE_TRANSFORM.
*
*   FT_LOAD_IGNORE_TRANSFORM ::
*     Ignore the transform matrix set by @FT_Set_Transform.
*
*   FT_LOAD_MONOCHROME ::
*     This flag is used with @FT_LOAD_RENDER to indicate that you want to
*     render an outline glyph to a 1-bit monochrome bitmap glyph, with
*     8~pixels packed into each byte of the bitmap data.
*
*     Note that this has no effect on the hinting algorithm used.  You
*     should rather use @FT_LOAD_TARGET_MONO so that the
*     monochrome-optimized hinting algorithm is used.
*
*   FT_LOAD_LINEAR_DESIGN ::
*     Keep `linearHoriAdvance` and `linearVertAdvance` fields of
*     @FT_GlyphSlotRec in font units.  See @FT_GlyphSlotRec for details.
*
*   FT_LOAD_NO_AUTOHINT ::
*     Disable the auto-hinter.  See also the note below.
*
*   FT_LOAD_COLOR ::
*     Load colored glyphs.  FreeType searches in the following order;
*     there are slight differences depending on the font format.
*
*     [Since 2.5] Load embedded color bitmap images (provided
*     @FT_LOAD_NO_BITMAP is not set).  The resulting color bitmaps, if
*     available, have the @FT_PIXEL_MODE_BGRA format, with pre-multiplied
*     color channels.  If the flag is not set and color bitmaps are found,
*     they are converted to 256-level gray bitmaps, using the
*     @FT_PIXEL_MODE_GRAY format.
*
*     [Since 2.12] If the glyph index maps to an entry in the face's
*     'SVG~' table, load the associated SVG document from this table and
*     set the `format` field of @FT_GlyphSlotRec to @FT_GLYPH_FORMAT_SVG
*     ([since 2.13.1] provided @FT_LOAD_NO_SVG is not set).  Note that
*     FreeType itself can't render SVG documents; however, the library
*     provides hooks to seamlessly integrate an external renderer.  See
*     sections @ot_svg_driver and @svg_fonts for more.
*
*     [Since 2.10, experimental] If the glyph index maps to an entry in
*     the face's 'COLR' table with a 'CPAL' palette table (as defined in
*     the OpenType specification), make @FT_Render_Glyph provide a default
*     blending of the color glyph layers associated with the glyph index,
*     using the same bitmap format as embedded color bitmap images.  This
*     is mainly for convenience and works only for glyphs in 'COLR' v0
*     tables.  **There is no rendering support for 'COLR' v1** (with the
*     exception of v1 tables that exclusively use v0 features)!  You need
*     a graphics library like Skia or Cairo to interpret the graphics
*     commands stored in v1 tables.  For full control of color layers use
*     @FT_Get_Color_Glyph_Layer and FreeType's color functions like
*     @FT_Palette_Select instead of setting @FT_LOAD_COLOR for rendering
*     so that the client application can handle blending by itself.
*
*   FT_LOAD_NO_SVG ::
*     [Since 2.13.1] Ignore SVG glyph data when loading.
*
*   FT_LOAD_COMPUTE_METRICS ::
*     [Since 2.6.1] Compute glyph metrics from the glyph data, without the
*     use of bundled metrics tables (for example, the 'hdmx' table in
*     TrueType fonts).  This flag is mainly used by font validating or
*     font editing applications, which need to ignore, verify, or edit
*     those tables.
*
*     Currently, this flag is only implemented for TrueType fonts.
*
*   FT_LOAD_BITMAP_METRICS_ONLY ::
*     [Since 2.7.1] Request loading of the metrics and bitmap image
*     information of a (possibly embedded) bitmap glyph without allocating
*     or copying the bitmap image data itself.  No effect if the target
*     glyph is not a bitmap image.
*
*     This flag unsets @FT_LOAD_RENDER.
*
*   FT_LOAD_CROP_BITMAP ::
*     Ignored.  Deprecated.
*
*   FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH ::
*     Ignored.  Deprecated.
*
* @note:
*   By default, hinting is enabled and the font's native hinter (see
*   @FT_FACE_FLAG_HINTER) is preferred over the auto-hinter.  You can
*   disable hinting by setting @FT_LOAD_NO_HINTING or change the
*   precedence by setting @FT_LOAD_FORCE_AUTOHINT.  You can also set
*   @FT_LOAD_NO_AUTOHINT in case you don't want the auto-hinter to be used
*   at all.
*
*   See the description of @FT_FACE_FLAG_TRICKY for a special exception
*   (affecting only a handful of Asian fonts).
*
*   Besides deciding which hinter to use, you can also decide which
*   hinting algorithm to use.  See @FT_LOAD_TARGET_XXX for details.
*
*   Note that the auto-hinter needs a valid Unicode cmap (either a native
*   one or synthesized by FreeType) for producing correct results.  If a
*   font provides an incorrect mapping (for example, assigning the
*   character code U+005A, LATIN CAPITAL LETTER~Z, to a glyph depicting a
*   mathematical integral sign), the auto-hinter might produce useless
*   results.
*
*/
FT_LOAD_DEFAULT                      :: 0x0
FT_LOAD_NO_SCALE                     :: (10)
FT_LOAD_NO_HINTING                   :: (11)
FT_LOAD_RENDER                       :: (12)
FT_LOAD_NO_BITMAP                    :: (13)
FT_LOAD_VERTICAL_LAYOUT              :: (14)
FT_LOAD_FORCE_AUTOHINT               :: (15)
FT_LOAD_CROP_BITMAP                  :: (16)
FT_LOAD_PEDANTIC                     :: (17)
FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH  :: (19)
FT_LOAD_NO_RECURSE                   :: (110)
FT_LOAD_IGNORE_TRANSFORM             :: (111)
FT_LOAD_MONOCHROME                   :: (112)
FT_LOAD_LINEAR_DESIGN                :: (113)
FT_LOAD_SBITS_ONLY                   :: (114)
FT_LOAD_NO_AUTOHINT                  :: (115)

/* Bits 16-19 are used by `FT_LOAD_TARGET_` */
FT_LOAD_COLOR                        :: (120)
FT_LOAD_COMPUTE_METRICS              :: (121)
FT_LOAD_BITMAP_METRICS_ONLY          :: (122)
FT_LOAD_NO_SVG                       :: (124)

/* */

/* used internally only by certain font drivers */
FT_LOAD_ADVANCE_ONLY                 :: (18)
FT_LOAD_SVG_ONLY                     :: (123)

/**************************************************************************
*
* @enum:
*   FT_Render_Mode
*
* @description:
*   Render modes supported by FreeType~2.  Each mode corresponds to a
*   specific type of scanline conversion performed on the outline.
*
*   For bitmap fonts and embedded bitmaps the `bitmap->pixel_mode` field
*   in the @FT_GlyphSlotRec structure gives the format of the returned
*   bitmap.
*
*   All modes except @FT_RENDER_MODE_MONO use 256 levels of opacity,
*   indicating pixel coverage.  Use linear alpha blending and gamma
*   correction to correctly render non-monochrome glyph bitmaps onto a
*   surface; see @FT_Render_Glyph.
*
*   The @FT_RENDER_MODE_SDF is a special render mode that uses up to 256
*   distance values, indicating the signed distance from the grid position
*   to the nearest outline.
*
* @values:
*   FT_RENDER_MODE_NORMAL ::
*     Default render mode; it corresponds to 8-bit anti-aliased bitmaps.
*
*   FT_RENDER_MODE_LIGHT ::
*     This is equivalent to @FT_RENDER_MODE_NORMAL.  It is only defined as
*     a separate value because render modes are also used indirectly to
*     define hinting algorithm selectors.  See @FT_LOAD_TARGET_XXX for
*     details.
*
*   FT_RENDER_MODE_MONO ::
*     This mode corresponds to 1-bit bitmaps (with 2~levels of opacity).
*
*   FT_RENDER_MODE_LCD ::
*     This mode corresponds to horizontal RGB and BGR subpixel displays
*     like LCD screens.  It produces 8-bit bitmaps that are 3~times the
*     width of the original glyph outline in pixels, and which use the
*     @FT_PIXEL_MODE_LCD mode.
*
*   FT_RENDER_MODE_LCD_V ::
*     This mode corresponds to vertical RGB and BGR subpixel displays
*     (like PDA screens, rotated LCD displays, etc.).  It produces 8-bit
*     bitmaps that are 3~times the height of the original glyph outline in
*     pixels and use the @FT_PIXEL_MODE_LCD_V mode.
*
*   FT_RENDER_MODE_SDF ::
*     The positive (unsigned) 8-bit bitmap values can be converted to the
*     single-channel signed distance field (SDF) by subtracting 128, with
*     the positive and negative results corresponding to the inside and
*     the outside of a glyph contour, respectively.  The distance units are
*     arbitrarily determined by an adjustable @spread property.
*
* @note:
*   The selected render mode only affects scalable vector glyphs of a font.
*   Embedded bitmaps often have a different pixel mode like
*   @FT_PIXEL_MODE_MONO.  You can use @FT_Bitmap_Convert to transform them
*   into 8-bit pixmaps.
*
*/
Ft_Render_Mode :: enum u32 {
	NORMAL = 0,
	LIGHT  = 1,
	MONO   = 2,
	LCD    = 3,
	LCD_V  = 4,
	SDF    = 5,
	MAX    = 6,
}

/**************************************************************************
*
* @enum:
*   FT_Kerning_Mode
*
* @description:
*   An enumeration to specify the format of kerning values returned by
*   @FT_Get_Kerning.
*
* @values:
*   FT_KERNING_DEFAULT ::
*     Return grid-fitted kerning distances in 26.6 fractional pixels.
*
*   FT_KERNING_UNFITTED ::
*     Return un-grid-fitted kerning distances in 26.6 fractional pixels.
*
*   FT_KERNING_UNSCALED ::
*     Return the kerning vector in original font units.
*
* @note:
*   `FT_KERNING_DEFAULT` returns full pixel values; it also makes FreeType
*   heuristically scale down kerning distances at small ppem values so
*   that they don't become too big.
*
*   Both `FT_KERNING_DEFAULT` and `FT_KERNING_UNFITTED` use the current
*   horizontal scaling factor (as set e.g. with @FT_Set_Char_Size) to
*   convert font units to pixels.
*/
Ft_Kerning_Mode :: enum u32 {
	DEFAULT  = 0,
	UNFITTED = 1,
	UNSCALED = 2,
}

/**************************************************************************
*
* @enum:
*   FT_SUBGLYPH_FLAG_XXX
*
* @description:
*   A list of constants describing subglyphs.  Please refer to the 'glyf'
*   table description in the OpenType specification for the meaning of the
*   various flags (which get synthesized for non-OpenType subglyphs).
*
*     https://learn.microsoft.com/typography/opentype/spec/glyf#composite-glyph-description
*
* @values:
*   FT_SUBGLYPH_FLAG_ARGS_ARE_WORDS ::
*   FT_SUBGLYPH_FLAG_ARGS_ARE_XY_VALUES ::
*   FT_SUBGLYPH_FLAG_ROUND_XY_TO_GRID ::
*   FT_SUBGLYPH_FLAG_SCALE ::
*   FT_SUBGLYPH_FLAG_XY_SCALE ::
*   FT_SUBGLYPH_FLAG_2X2 ::
*   FT_SUBGLYPH_FLAG_USE_MY_METRICS ::
*
*/
FT_SUBGLYPH_FLAG_ARGS_ARE_WORDS          :: 1
FT_SUBGLYPH_FLAG_ARGS_ARE_XY_VALUES      :: 2
FT_SUBGLYPH_FLAG_ROUND_XY_TO_GRID        :: 4
FT_SUBGLYPH_FLAG_SCALE                   :: 8
FT_SUBGLYPH_FLAG_XY_SCALE             :: 0x40
FT_SUBGLYPH_FLAG_2X2                  :: 0x80
FT_SUBGLYPH_FLAG_USE_MY_METRICS      :: 0x200

/**************************************************************************
*
* @enum:
*   FT_FSTYPE_XXX
*
* @description:
*   A list of bit flags used in the `fsType` field of the OS/2 table in a
*   TrueType or OpenType font and the `FSType` entry in a PostScript font.
*   These bit flags are returned by @FT_Get_FSType_Flags; they inform
*   client applications of embedding and subsetting restrictions
*   associated with a font.
*
*   See
*   https://adobe-type-tools.github.io/font-tech-notes/pdfs/AcrobatDC_FontPolicies.pdf
*   for more details.
*
* @values:
*   FT_FSTYPE_INSTALLABLE_EMBEDDING ::
*     Fonts with no fsType bit set may be embedded and permanently
*     installed on the remote system by an application.
*
*   FT_FSTYPE_RESTRICTED_LICENSE_EMBEDDING ::
*     Fonts that have only this bit set must not be modified, embedded or
*     exchanged in any manner without first obtaining permission of the
*     font software copyright owner.
*
*   FT_FSTYPE_PREVIEW_AND_PRINT_EMBEDDING ::
*     The font may be embedded and temporarily loaded on the remote
*     system.  Documents containing Preview & Print fonts must be opened
*     'read-only'; no edits can be applied to the document.
*
*   FT_FSTYPE_EDITABLE_EMBEDDING ::
*     The font may be embedded but must only be installed temporarily on
*     other systems.  In contrast to Preview & Print fonts, documents
*     containing editable fonts may be opened for reading, editing is
*     permitted, and changes may be saved.
*
*   FT_FSTYPE_NO_SUBSETTING ::
*     The font may not be subsetted prior to embedding.
*
*   FT_FSTYPE_BITMAP_EMBEDDING_ONLY ::
*     Only bitmaps contained in the font may be embedded; no outline data
*     may be embedded.  If there are no bitmaps available in the font,
*     then the font is unembeddable.
*
* @note:
*   The flags are ORed together, thus more than a single value can be
*   returned.
*
*   While the `fsType` flags can indicate that a font may be embedded, a
*   license with the font vendor may be separately required to use the
*   font in this way.
*/
FT_FSTYPE_INSTALLABLE_EMBEDDING         :: 0x0000
FT_FSTYPE_RESTRICTED_LICENSE_EMBEDDING  :: 0x0002
FT_FSTYPE_PREVIEW_AND_PRINT_EMBEDDING   :: 0x0004
FT_FSTYPE_EDITABLE_EMBEDDING            :: 0x0008
FT_FSTYPE_NO_SUBSETTING                 :: 0x0100
FT_FSTYPE_BITMAP_EMBEDDING_ONLY         :: 0x0200

/**************************************************************************
*
* @section:
*   library_setup
*
*/

/**************************************************************************
*
* @enum:
*   FREETYPE_XXX
*
* @description:
*   These three macros identify the FreeType source code version.  Use
*   @FT_Library_Version to access them at runtime.
*
* @values:
*   FREETYPE_MAJOR ::
*     The major version number.
*   FREETYPE_MINOR ::
*     The minor version number.
*   FREETYPE_PATCH ::
*     The patch level.
*
* @note:
*   The version number of FreeType if built as a dynamic link library with
*   the 'libtool' package is _not_ controlled by these three macros.
*
*/
FREETYPE_MAJOR  :: 2
FREETYPE_MINOR  :: 14
FREETYPE_PATCH  :: 1

