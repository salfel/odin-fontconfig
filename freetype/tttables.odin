/****************************************************************************
 *
 * tttables.h
 *
 *   Basic SFNT/TrueType tables definitions and interface
 *   (specification only).
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

Tt_Header :: i32

/**************************************************************************
*
* @struct:
*   TT_HoriHeader
*
* @description:
*   A structure to model a TrueType horizontal header, the 'hhea' table,
*   as well as the corresponding horizontal metrics table, 'hmtx'.
*
* @fields:
*   Version ::
*     The table version.
*
*   Ascender ::
*     The font's ascender, i.e., the distance from the baseline to the
*     top-most of all glyph points found in the font.
*
*     This value is invalid in many fonts, as it is usually set by the
*     font designer, and often reflects only a portion of the glyphs found
*     in the font (maybe ASCII).
*
*     You should use the `sTypoAscender` field of the 'OS/2' table instead
*     if you want the correct one.
*
*   Descender ::
*     The font's descender, i.e., the distance from the baseline to the
*     bottom-most of all glyph points found in the font.  It is negative.
*
*     This value is invalid in many fonts, as it is usually set by the
*     font designer, and often reflects only a portion of the glyphs found
*     in the font (maybe ASCII).
*
*     You should use the `sTypoDescender` field of the 'OS/2' table
*     instead if you want the correct one.
*
*   Line_Gap ::
*     The font's line gap, i.e., the distance to add to the ascender and
*     descender to get the BTB, i.e., the baseline-to-baseline distance
*     for the font.
*
*   advance_Width_Max ::
*     This field is the maximum of all advance widths found in the font.
*     It can be used to compute the maximum width of an arbitrary string
*     of text.
*
*   min_Left_Side_Bearing ::
*     The minimum left side bearing of all glyphs within the font.
*
*   min_Right_Side_Bearing ::
*     The minimum right side bearing of all glyphs within the font.
*
*   xMax_Extent ::
*     The maximum horizontal extent (i.e., the 'width' of a glyph's
*     bounding box) for all glyphs in the font.
*
*   caret_Slope_Rise ::
*     The rise coefficient of the cursor's slope of the cursor
*     (slope=rise/run).
*
*   caret_Slope_Run ::
*     The run coefficient of the cursor's slope.
*
*   caret_Offset ::
*     The cursor's offset for slanted fonts.
*
*   Reserved ::
*     8~reserved bytes.
*
*   metric_Data_Format ::
*     Always~0.
*
*   number_Of_HMetrics ::
*     Number of HMetrics entries in the 'hmtx' table -- this value can be
*     smaller than the total number of glyphs in the font.
*
*   long_metrics ::
*     A pointer into the 'hmtx' table.
*
*   short_metrics ::
*     A pointer into the 'hmtx' table.
*
* @note:
*   For OpenType Font Variations, the values of the following fields can
*   change after a call to @FT_Set_Var_Design_Coordinates (and friends) if
*   the font contains an 'MVAR' table: `caret_Slope_Rise`,
*   `caret_Slope_Run`, and `caret_Offset`.
*/
Tt_Hori_Header :: struct {
	Version:                i32,
	Ascender:               i32,
	Descender:              i32,
	Line_Gap:               i32,
	advance_Width_Max:      i32, /* advance width maximum */
	min_Left_Side_Bearing:  i32, /* minimum left-sb       */
	min_Right_Side_Bearing: i32, /* minimum right-sb      */
	xMax_Extent:            i32, /* xmax extents          */
	caret_Slope_Rise:       i32,
	caret_Slope_Run:        i32,
	caret_Offset:           i32,
	Reserved:               [4]i32,
	metric_Data_Format:     i32,
	number_Of_HMetrics:     i32,

	/* The following fields are not defined by the OpenType specification */
	/* but they are used to connect the metrics header to the relevant    */
	/* 'hmtx' table.                                                      */
	long_metrics:  rawptr,
	short_metrics: rawptr,
}

/**************************************************************************
*
* @struct:
*   TT_VertHeader
*
* @description:
*   A structure used to model a TrueType vertical header, the 'vhea'
*   table, as well as the corresponding vertical metrics table, 'vmtx'.
*
* @fields:
*   Version ::
*     The table version.
*
*   Ascender ::
*     The font's ascender, i.e., the distance from the baseline to the
*     top-most of all glyph points found in the font.
*
*     This value is invalid in many fonts, as it is usually set by the
*     font designer, and often reflects only a portion of the glyphs found
*     in the font (maybe ASCII).
*
*     You should use the `sTypoAscender` field of the 'OS/2' table instead
*     if you want the correct one.
*
*   Descender ::
*     The font's descender, i.e., the distance from the baseline to the
*     bottom-most of all glyph points found in the font.  It is negative.
*
*     This value is invalid in many fonts, as it is usually set by the
*     font designer, and often reflects only a portion of the glyphs found
*     in the font (maybe ASCII).
*
*     You should use the `sTypoDescender` field of the 'OS/2' table
*     instead if you want the correct one.
*
*   Line_Gap ::
*     The font's line gap, i.e., the distance to add to the ascender and
*     descender to get the BTB, i.e., the baseline-to-baseline distance
*     for the font.
*
*   advance_Height_Max ::
*     This field is the maximum of all advance heights found in the font.
*     It can be used to compute the maximum height of an arbitrary string
*     of text.
*
*   min_Top_Side_Bearing ::
*     The minimum top side bearing of all glyphs within the font.
*
*   min_Bottom_Side_Bearing ::
*     The minimum bottom side bearing of all glyphs within the font.
*
*   yMax_Extent ::
*     The maximum vertical extent (i.e., the 'height' of a glyph's
*     bounding box) for all glyphs in the font.
*
*   caret_Slope_Rise ::
*     The rise coefficient of the cursor's slope of the cursor
*     (slope=rise/run).
*
*   caret_Slope_Run ::
*     The run coefficient of the cursor's slope.
*
*   caret_Offset ::
*     The cursor's offset for slanted fonts.
*
*   Reserved ::
*     8~reserved bytes.
*
*   metric_Data_Format ::
*     Always~0.
*
*   number_Of_VMetrics ::
*     Number of VMetrics entries in the 'vmtx' table -- this value can be
*     smaller than the total number of glyphs in the font.
*
*   long_metrics ::
*     A pointer into the 'vmtx' table.
*
*   short_metrics ::
*     A pointer into the 'vmtx' table.
*
* @note:
*   For OpenType Font Variations, the values of the following fields can
*   change after a call to @FT_Set_Var_Design_Coordinates (and friends) if
*   the font contains an 'MVAR' table: `Ascender`, `Descender`,
*   `Line_Gap`, `caret_Slope_Rise`, `caret_Slope_Run`, and `caret_Offset`.
*/
Tt_Vert_Header :: struct {
	Version:                 i32,
	Ascender:                i32,
	Descender:               i32,
	Line_Gap:                i32,
	advance_Height_Max:      i32, /* advance height maximum */
	min_Top_Side_Bearing:    i32, /* minimum top-sb          */
	min_Bottom_Side_Bearing: i32, /* minimum bottom-sb       */
	yMax_Extent:             i32, /* ymax extents            */
	caret_Slope_Rise:        i32,
	caret_Slope_Run:         i32,
	caret_Offset:            i32,
	Reserved:                [4]i32,
	metric_Data_Format:      i32,
	number_Of_VMetrics:      i32,

	/* The following fields are not defined by the OpenType specification */
	/* but they are used to connect the metrics header to the relevant    */
	/* 'vmtx' table.                                                      */
	long_metrics:  rawptr,
	short_metrics: rawptr,
}

/**************************************************************************
*
* @struct:
*   TT_OS2
*
* @description:
*   A structure to model a TrueType 'OS/2' table.  All fields comply to
*   the OpenType specification.
*
*   Note that we now support old Mac fonts that do not include an 'OS/2'
*   table.  In this case, the `version` field is always set to 0xFFFF.
*
* @note:
*   For OpenType Font Variations, the values of the following fields can
*   change after a call to @FT_Set_Var_Design_Coordinates (and friends) if
*   the font contains an 'MVAR' table: `sCapHeight`, `sTypoAscender`,
*   `sTypoDescender`, `sTypoLineGap`, `sxHeight`, `usWinAscent`,
*   `usWinDescent`, `yStrikeoutPosition`, `yStrikeoutSize`,
*   `ySubscriptXOffset`, `ySubScriptXSize`, `ySubscriptYOffset`,
*   `ySubscriptYSize`, `ySuperscriptXOffset`, `ySuperscriptXSize`,
*   `ySuperscriptYOffset`, and `ySuperscriptYSize`.
*
*   Possible values for bits in the `ulUnicodeRangeX` fields are given by
*   the @TT_UCR_XXX macros.
*/
Tt_Os2 :: struct {
	version:             i32, /* 0x0001 - more or 0xFFFF */
	xAvgCharWidth:       i32,
	usWeightClass:       i32,
	usWidthClass:        i32,
	fsType:              i32,
	ySubscriptXSize:     i32,
	ySubscriptYSize:     i32,
	ySubscriptXOffset:   i32,
	ySubscriptYOffset:   i32,
	ySuperscriptXSize:   i32,
	ySuperscriptYSize:   i32,
	ySuperscriptXOffset: i32,
	ySuperscriptYOffset: i32,
	yStrikeoutSize:      i32,
	yStrikeoutPosition:  i32,
	sFamilyClass:        i32,
	panose:              [10]i32,
	ulUnicodeRange1:     i32, /* Bits 0-31   */
	ulUnicodeRange2:     i32, /* Bits 32-63  */
	ulUnicodeRange3:     i32, /* Bits 64-95  */
	ulUnicodeRange4:     i32, /* Bits 96-127 */
	achVendID:           [4]i32,
	fsSelection:         i32,
	usFirstCharIndex:    i32,
	usLastCharIndex:     i32,
	sTypoAscender:       i32,
	sTypoDescender:      i32,
	sTypoLineGap:        i32,
	usWinAscent:         i32,
	usWinDescent:        i32,

	/* only version 1 and higher: */
	ulCodePageRange1: i32, /* Bits 0-31   */
	ulCodePageRange2: i32, /* Bits 32-63  */

	/* only version 2 and higher: */
	sxHeight:      i32,
	sCapHeight:    i32,
	usDefaultChar: i32,
	usBreakChar:   i32,
	usMaxContext:  i32,

	/* only version 5 and higher: */
	usLowerOpticalPointSize: i32, /* in twips (1/20 points) */
	usUpperOpticalPointSize: i32, /* in twips (1/20 points) */
}

/**************************************************************************
*
* @struct:
*   TT_Postscript
*
* @description:
*   A structure to model a TrueType 'post' table.  All fields comply to
*   the OpenType specification.  This structure does not reference a
*   font's PostScript glyph names; use @FT_Get_Glyph_Name to retrieve
*   them.
*
* @note:
*   For OpenType Font Variations, the values of the following fields can
*   change after a call to @FT_Set_Var_Design_Coordinates (and friends) if
*   the font contains an 'MVAR' table: `underlinePosition` and
*   `underlineThickness`.
*/
Tt_Postscript :: struct {
	FormatType:         i32,
	italicAngle:        i32,
	underlinePosition:  i32,
	underlineThickness: i32,
	isFixedPitch:       i32,
	minMemType42:       i32,
	maxMemType42:       i32,
	minMemType1:        i32,
	maxMemType1:        i32,
}

/**************************************************************************
*
* @struct:
*   TT_PCLT
*
* @description:
*   A structure to model a TrueType 'PCLT' table.  All fields comply to
*   the OpenType specification.
*/
Tt_Pclt :: struct {
	Version:             i32,
	FontNumber:          i32,
	Pitch:               i32,
	xHeight:             i32,
	Style:               i32,
	TypeFamily:          i32,
	CapHeight:           i32,
	SymbolSet:           i32,
	TypeFace:            [16]i32,
	CharacterComplement: [8]i32,
	FileName:            [6]i32,
	StrokeWeight:        i32,
	WidthType:           i32,
	SerifStyle:          i32,
	Reserved:            i32,
}

/**************************************************************************
*
* @struct:
*   TT_MaxProfile
*
* @description:
*   The maximum profile ('maxp') table contains many max values, which can
*   be used to pre-allocate arrays for speeding up glyph loading and
*   hinting.
*
* @fields:
*   version ::
*     The version number.
*
*   numGlyphs ::
*     The number of glyphs in this TrueType font.
*
*   maxPoints ::
*     The maximum number of points in a non-composite TrueType glyph.  See
*     also `maxCompositePoints`.
*
*   maxContours ::
*     The maximum number of contours in a non-composite TrueType glyph.
*     See also `maxCompositeContours`.
*
*   maxCompositePoints ::
*     The maximum number of points in a composite TrueType glyph.  See
*     also `maxPoints`.
*
*   maxCompositeContours ::
*     The maximum number of contours in a composite TrueType glyph.  See
*     also `maxContours`.
*
*   maxZones ::
*     The maximum number of zones used for glyph hinting.
*
*   maxTwilightPoints ::
*     The maximum number of points in the twilight zone used for glyph
*     hinting.
*
*   maxStorage ::
*     The maximum number of elements in the storage area used for glyph
*     hinting.
*
*   maxFunctionDefs ::
*     The maximum number of function definitions in the TrueType bytecode
*     for this font.
*
*   maxInstructionDefs ::
*     The maximum number of instruction definitions in the TrueType
*     bytecode for this font.
*
*   maxStackElements ::
*     The maximum number of stack elements used during bytecode
*     interpretation.
*
*   maxSizeOfInstructions ::
*     The maximum number of TrueType opcodes used for glyph hinting.
*
*   maxComponentElements ::
*     The maximum number of simple (i.e., non-composite) glyphs in a
*     composite glyph.
*
*   maxComponentDepth ::
*     The maximum nesting depth of composite glyphs.
*
* @note:
*   This structure is only used during font loading.
*/
Tt_Max_Profile :: struct {
	version:               i32,
	numGlyphs:             i32,
	maxPoints:             i32,
	maxContours:           i32,
	maxCompositePoints:    i32,
	maxCompositeContours:  i32,
	maxZones:              i32,
	maxTwilightPoints:     i32,
	maxStorage:            i32,
	maxFunctionDefs:       i32,
	maxInstructionDefs:    i32,
	maxStackElements:      i32,
	maxSizeOfInstructions: i32,
	maxComponentElements:  i32,
	maxComponentDepth:     i32,
}

/**************************************************************************
*
* @enum:
*   FT_Sfnt_Tag
*
* @description:
*   An enumeration to specify indices of SFNT tables loaded and parsed by
*   FreeType during initialization of an SFNT font.  Used in the
*   @FT_Get_Sfnt_Table API function.
*
* @values:
*   FT_SFNT_HEAD ::
*     To access the font's @TT_Header structure.
*
*   FT_SFNT_MAXP ::
*     To access the font's @TT_MaxProfile structure.
*
*   FT_SFNT_OS2 ::
*     To access the font's @TT_OS2 structure.
*
*   FT_SFNT_HHEA ::
*     To access the font's @TT_HoriHeader structure.
*
*   FT_SFNT_VHEA ::
*     To access the font's @TT_VertHeader structure.
*
*   FT_SFNT_POST ::
*     To access the font's @TT_Postscript structure.
*
*   FT_SFNT_PCLT ::
*     To access the font's @TT_PCLT structure.
*/
Ft_Sfnt_Tag :: enum u32 {
	HEAD = 0,
	MAXP = 1,
	OS2  = 2,
	HHEA = 3,
	VHEA = 4,
	POST = 5,
	PCLT = 6,
	MAX  = 7,
}

