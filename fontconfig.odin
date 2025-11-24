/*
 * fontconfig/fontconfig/fontconfig.h
 *
 * Copyright © 2001 Keith Packard
 *
 * Permission to use, copy, modify, distribute, and sell this software and its
 * documentation for any purpose is hereby granted without fee, provided that
 * the above copyright notice appear in all copies and that both that
 * copyright notice and this permission notice appear in supporting
 * documentation, and that the name of the author(s) not be used in
 * advertising or publicity pertaining to distribution of the software without
 * specific, written prior permission.  The authors make no
 * representations about the suitability of this software for any purpose.  It
 * is provided "as is" without express or implied warranty.
 *
 * THE AUTHOR(S) DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
 * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
 * EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY SPECIAL, INDIRECT OR
 * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
 * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
 * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
 * PERFORMANCE OF THIS SOFTWARE.
 */
package fontconfig

foreign import lib "libfontconfig.lib"
_ :: lib

Fc_Char8  :: u8
Fc_Char16 :: u16
Fc_Char32 :: u32
Fc_Bool   :: i32

/*
* Current Fontconfig version number.  This same number
* must appear in the fontconfig configure.in file. Yes,
* it'a a pain to synchronize version numbers like this.
*/
FC_MAJOR                :: 2
FC_MINOR                :: 17
FC_REVISION             :: 1
FC_VERSION              :: ((FC_MAJOR*10000)+(FC_MINOR*100)+(FC_REVISION))

/*
* Current font cache file format version
* This is appended to the cache files so that multiple
* versions of the library will peacefully coexist
*
* Change this value whenever the disk format for the cache file
* changes in any non-compatible way.  Try to avoid such changes as
* it means multiple copies of the font information.
*/
FC_CACHE_VERSION_NUMBER :: 9
FcFalse                 :: 0
FcTrue                  :: 1
FcDontCare              :: 2
FC_FAMILY               :: "family"         /* String */
FC_STYLE                :: "style"          /* String */
FC_SLANT                :: "slant"          /* Int */
FC_WEIGHT               :: "weight"         /* Int */
FC_SIZE                 :: "size"           /* Range (double) */
FC_ASPECT               :: "aspect"         /* Double */
FC_PIXEL_SIZE           :: "pixelsize"      /* Double */
FC_SPACING              :: "spacing"        /* Int */
FC_FOUNDRY              :: "foundry"        /* String */
FC_ANTIALIAS            :: "antialias"      /* Bool (depends) */
FC_HINTING              :: "hinting"        /* Bool (true) */
FC_HINT_STYLE           :: "hintstyle"      /* Int */
FC_VERTICAL_LAYOUT      :: "verticallayout" /* Bool (false) */
FC_AUTOHINT             :: "autohint"       /* Bool (false) */

/* FC_GLOBAL_ADVANCE is deprecated. this is simply ignored on freetype 2.4.5 or later */
FC_GLOBAL_ADVANCE       :: "globaladvance"  /* Bool (true) */
FC_WIDTH                :: "width"          /* Int */
FC_FILE                 :: "file"           /* String */
FC_INDEX                :: "index"          /* Int */
FC_FT_FACE              :: "ftface"         /* FT_Face */
FC_RASTERIZER           :: "rasterizer"     /* String (deprecated) */
FC_OUTLINE              :: "outline"        /* Bool */
FC_SCALABLE             :: "scalable"       /* Bool */
FC_COLOR                :: "color"          /* Bool */
FC_VARIABLE             :: "variable"       /* Bool */
FC_SCALE                :: "scale"          /* double (deprecated) */
FC_SYMBOL               :: "symbol"         /* Bool */
FC_DPI                  :: "dpi"            /* double */
FC_RGBA                 :: "rgba"           /* Int */
FC_MINSPACE             :: "minspace"       /* Bool use minimum line spacing */
FC_SOURCE               :: "source"         /* String (deprecated) */
FC_CHARSET              :: "charset"        /* CharSet */
FC_LANG                 :: "lang"           /* LangSet Set of RFC 3066 langs */
FC_FONTVERSION          :: "fontversion"    /* Int from 'head' table */
FC_FULLNAME             :: "fullname"       /* String */
FC_FAMILYLANG           :: "familylang"     /* String RFC 3066 langs */
FC_STYLELANG            :: "stylelang"      /* String RFC 3066 langs */
FC_FULLNAMELANG         :: "fullnamelang"   /* String RFC 3066 langs */
FC_CAPABILITY           :: "capability"     /* String */
FC_FONTFORMAT           :: "fontformat"     /* String */
FC_EMBOLDEN             :: "embolden"       /* Bool - true if emboldening needed*/
FC_EMBEDDED_BITMAP      :: "embeddedbitmap" /* Bool - true to enable embedded bitmaps */
FC_DECORATIVE           :: "decorative"     /* Bool - true if style is a decorative variant */
FC_LCD_FILTER           :: "lcdfilter"      /* Int */
FC_FONT_FEATURES        :: "fontfeatures"   /* String */
FC_FONT_VARIATIONS      :: "fontvariations" /* String */
FC_NAMELANG             :: "namelang"       /* String RFC 3866 langs */
FC_PRGNAME              :: "prgname"        /* String */
FC_HASH                 :: "hash"           /* String (deprecated) */
FC_POSTSCRIPT_NAME      :: "postscriptname" /* String */
FC_FONT_HAS_HINT        :: "fonthashint"    /* Bool - true if font has hinting */
FC_ORDER                :: "order"          /* Integer */
FC_DESKTOP_NAME         :: "desktop"        /* String */
FC_NAMED_INSTANCE       :: "namedinstance"  /* Bool - true if font is named instance */
FC_FONT_WRAPPER         :: "fontwrapper"    /* String */

/* Adjust outline rasterizer */
FC_CHARWIDTH            :: "charwidth"  /* Int */
FC_CHAR_WIDTH           :: FC_CHARWIDTH
FC_CHAR_HEIGHT          :: "charheight" /* Int */
FC_MATRIX               :: "matrix"     /* FcMatrix */
FC_WEIGHT_THIN          :: 0
FC_WEIGHT_EXTRALIGHT    :: 40
FC_WEIGHT_ULTRALIGHT    :: FC_WEIGHT_EXTRALIGHT
FC_WEIGHT_LIGHT         :: 50
FC_WEIGHT_DEMILIGHT     :: 55
FC_WEIGHT_SEMILIGHT     :: FC_WEIGHT_DEMILIGHT
FC_WEIGHT_BOOK          :: 75
FC_WEIGHT_REGULAR       :: 80
FC_WEIGHT_NORMAL        :: FC_WEIGHT_REGULAR
FC_WEIGHT_MEDIUM        :: 100
FC_WEIGHT_DEMIBOLD      :: 180
FC_WEIGHT_SEMIBOLD      :: FC_WEIGHT_DEMIBOLD
FC_WEIGHT_BOLD          :: 200
FC_WEIGHT_EXTRABOLD     :: 205
FC_WEIGHT_ULTRABOLD     :: FC_WEIGHT_EXTRABOLD
FC_WEIGHT_BLACK         :: 210
FC_WEIGHT_HEAVY         :: FC_WEIGHT_BLACK
FC_WEIGHT_EXTRABLACK    :: 215
FC_WEIGHT_ULTRABLACK    :: FC_WEIGHT_EXTRABLACK
FC_SLANT_ROMAN          :: 0
FC_SLANT_ITALIC         :: 100
FC_SLANT_OBLIQUE        :: 110
FC_WIDTH_ULTRACONDENSED :: 50
FC_WIDTH_EXTRACONDENSED :: 63
FC_WIDTH_CONDENSED      :: 75
FC_WIDTH_SEMICONDENSED  :: 87
FC_WIDTH_NORMAL         :: 100
FC_WIDTH_SEMIEXPANDED   :: 113
FC_WIDTH_EXPANDED       :: 125
FC_WIDTH_EXTRAEXPANDED  :: 150
FC_WIDTH_ULTRAEXPANDED  :: 200
FC_PROPORTIONAL         :: 0
FC_DUAL                 :: 90
FC_MONO                 :: 100
FC_CHARCELL             :: 110

/* sub-pixel order */
FC_RGBA_UNKNOWN         :: 0
FC_RGBA_RGB             :: 1
FC_RGBA_BGR             :: 2
FC_RGBA_VRGB            :: 3
FC_RGBA_VBGR            :: 4
FC_RGBA_NONE            :: 5

/* hinting style */
FC_HINT_NONE            :: 0
FC_HINT_SLIGHT          :: 1
FC_HINT_MEDIUM          :: 2
FC_HINT_FULL            :: 3

/* LCD filter */
FC_LCD_NONE             :: 0
FC_LCD_DEFAULT          :: 1
FC_LCD_LIGHT            :: 2
FC_LCD_LEGACY           :: 3

_Fc_Type :: enum i32 {
	Unknown = -1,
	Void    = 0,
	Integer = 1,
	Double  = 2,
	String  = 3,
	Bool    = 4,
	Matrix  = 5,
	CharSet = 6,
	FTFace  = 7,
	LangSet = 8,
	Range   = 9,
}

Fc_Type :: _Fc_Type

_Fc_Matrix :: struct {
	xx, xy, yx, yy: f64,
}

Fc_Matrix :: _Fc_Matrix

/*
* A data structure to represent the available glyphs in a font.
* This is represented as a sparse boolean btree.
*/
Fc_Char_Set  :: _Fc_Char_Set
_Fc_Char_Set :: struct {}

_Fc_Object_Type :: struct {
	object: cstring,
	type:   Fc_Type,
}

Fc_Object_Type :: _Fc_Object_Type

_Fc_Constant :: struct {
	name:   ^Fc_Char8,
	object: cstring,
	value:  i32,
}

Fc_Constant :: _Fc_Constant

_Fc_Result :: enum u32 {
	Match        = 0,
	NoMatch      = 1,
	TypeMismatch = 2,
	NoId         = 3,
	OutOfMemory  = 4,
}

Fc_Result :: _Fc_Result

_Fc_Value_Binding :: enum u32 {
	Weak   = 0,
	Strong = 1,
	Same   = 2,

	/* to make sure sizeof (FcValueBinding) == 4 even with -fshort-enums */
	End    = 3,
}

Fc_Value_Binding :: _Fc_Value_Binding
Fc_Pattern       :: _Fc_Pattern
_Fc_Pattern      :: struct {}

_Fc_Pattern_Iter :: struct {
	dummy1: rawptr,
	dummy2: rawptr,
}

Fc_Pattern_Iter :: _Fc_Pattern_Iter
_Fc_Lang_Set    :: struct {}
Fc_Lang_Set     :: _Fc_Lang_Set
Fc_Range        :: _Fc_Range
_Fc_Range       :: struct {}

_Fc_Value :: struct {
	type: Fc_Type,

	u: struct #raw_union {
		s:  ^Fc_Char8,
		i:  i32,
		b:  Fc_Bool,
		d:  f64,
		m:  ^Fc_Matrix,
		_c: ^Fc_Char_Set,
		f:  rawptr,
		l:  ^Fc_Lang_Set,
		r:  ^Fc_Range,
	},
}

Fc_Value :: _Fc_Value

_Fc_Font_Set :: struct {
	nfont: i32,
	sfont: i32,
	fonts: ^^Fc_Pattern,
}

Fc_Font_Set :: _Fc_Font_Set

_Fc_Object_Set :: struct {
	nobject: i32,
	sobject: i32,
	objects: ^cstring,
}

Fc_Object_Set :: _Fc_Object_Set

_Fc_Match_Kind :: enum u32 {
	Pattern   = 0,
	Font      = 1,
	Scan      = 2,
	KindEnd   = 3,
	KindBegin = 0,
}

Fc_Match_Kind :: _Fc_Match_Kind

_Fc_Lang_Result :: enum u32 {
	Equal              = 0,
	DifferentCountry   = 1,
	DifferentTerritory = 1,
	DifferentLang      = 2,
}

Fc_Lang_Result :: _Fc_Lang_Result

_Fc_Set_Name :: enum u32 {
	System      = 0,
	Application = 1,
}

Fc_Set_Name :: _Fc_Set_Name

_Fc_Config_File_Info_Iter :: struct {
	dummy1: rawptr,
	dummy2: rawptr,
	dummy3: rawptr,
}

Fc_Config_File_Info_Iter :: _Fc_Config_File_Info_Iter
Fc_Atomic                :: _Fc_Atomic
_Fc_Atomic               :: struct {}

Fc_Endian :: enum u32 {
	Big    = 0,
	Little = 1,
}

Fc_Config               :: _Fc_Config
_Fc_Config              :: struct {}
_Fc_Global_Cache        :: struct {}
Fc_File_Cache           :: _Fc_Global_Cache
Fc_Blanks               :: _Fc_Blanks
_Fc_Blanks              :: struct {}
_Fc_Str_List            :: struct {}
Fc_Str_List             :: _Fc_Str_List
_Fc_Str_Set             :: struct {}
Fc_Str_Set              :: _Fc_Str_Set
Fc_Cache                :: _Fc_Cache
_Fc_Cache               :: struct {}
Fc_Destroy_Func         :: proc "c" (data: rawptr)
Fc_Filter_Font_Set_Func :: proc "c" (font: ^Fc_Pattern, user_data: rawptr) -> Fc_Bool

@(default_calling_convention="c")
foreign lib {
	/* fcblanks.c */
	FcBlanksCreate   :: proc() -> ^Fc_Blanks ---
	FcBlanksDestroy  :: proc(b: ^Fc_Blanks) ---
	FcBlanksAdd      :: proc(b: ^Fc_Blanks, ucs4: Fc_Char32) -> Fc_Bool ---
	FcBlanksIsMember :: proc(b: ^Fc_Blanks, ucs4: Fc_Char32) -> Fc_Bool ---

	/* fccache.c */
	FcCacheDir           :: proc(_c: ^Fc_Cache) -> ^Fc_Char8 ---
	FcCacheCopySet       :: proc(_c: ^Fc_Cache) -> ^Fc_Font_Set ---
	FcCacheSubdir        :: proc(_c: ^Fc_Cache, i: i32) -> ^Fc_Char8 ---
	FcCacheNumSubdir     :: proc(_c: ^Fc_Cache) -> i32 ---
	FcCacheNumFont       :: proc(_c: ^Fc_Cache) -> i32 ---
	FcDirCacheUnlink     :: proc(dir: ^Fc_Char8, config: ^Fc_Config) -> Fc_Bool ---
	FcDirCacheValid      :: proc(cache_file: ^Fc_Char8) -> Fc_Bool ---
	FcDirCacheClean      :: proc(cache_dir: ^Fc_Char8, verbose: Fc_Bool) -> Fc_Bool ---
	FcCacheCreateTagFile :: proc(config: ^Fc_Config) ---
	FcDirCacheCreateUUID :: proc(dir: ^Fc_Char8, force: Fc_Bool, config: ^Fc_Config) -> Fc_Bool ---
	FcDirCacheDeleteUUID :: proc(dir: ^Fc_Char8, config: ^Fc_Config) -> Fc_Bool ---

	/* fccfg.c */
	FcConfigHome              :: proc() -> ^Fc_Char8 ---
	FcConfigEnableHome        :: proc(enable: Fc_Bool) -> Fc_Bool ---
	FcConfigGetFilename       :: proc(config: ^Fc_Config, url: ^Fc_Char8) -> ^Fc_Char8 ---
	FcConfigFilename          :: proc(url: ^Fc_Char8) -> ^Fc_Char8 ---
	FcConfigCreate            :: proc() -> ^Fc_Config ---
	FcConfigReference         :: proc(config: ^Fc_Config) -> ^Fc_Config ---
	FcConfigDestroy           :: proc(config: ^Fc_Config) ---
	FcConfigSetCurrent        :: proc(config: ^Fc_Config) -> Fc_Bool ---
	FcConfigGetCurrent        :: proc() -> ^Fc_Config ---
	FcConfigUptoDate          :: proc(config: ^Fc_Config) -> Fc_Bool ---
	FcConfigBuildFonts        :: proc(config: ^Fc_Config) -> Fc_Bool ---
	FcConfigGetFontDirs       :: proc(config: ^Fc_Config) -> ^Fc_Str_List ---
	FcConfigGetConfigDirs     :: proc(config: ^Fc_Config) -> ^Fc_Str_List ---
	FcConfigGetConfigFiles    :: proc(config: ^Fc_Config) -> ^Fc_Str_List ---
	FcConfigGetCache          :: proc(config: ^Fc_Config) -> ^Fc_Char8 ---
	FcConfigGetBlanks         :: proc(config: ^Fc_Config) -> ^Fc_Blanks ---
	FcConfigGetCacheDirs      :: proc(config: ^Fc_Config) -> ^Fc_Str_List ---
	FcConfigGetRescanInterval :: proc(config: ^Fc_Config) -> i32 ---
	FcConfigSetRescanInterval :: proc(config: ^Fc_Config, rescanInterval: i32) -> Fc_Bool ---
	FcConfigGetFonts          :: proc(config: ^Fc_Config, set: Fc_Set_Name) -> ^Fc_Font_Set ---
	FcConfigAcceptFont        :: proc(config: ^Fc_Config, font: ^Fc_Pattern) -> Fc_Bool ---
	FcConfigAcceptFilter      :: proc(config: ^Fc_Config, font: ^Fc_Pattern) -> Fc_Bool ---
	FcConfigAppFontAddFile    :: proc(config: ^Fc_Config, file: ^Fc_Char8) -> Fc_Bool ---
	FcConfigAppFontAddDir     :: proc(config: ^Fc_Config, dir: ^Fc_Char8) -> Fc_Bool ---
	FcConfigAppFontClear      :: proc(config: ^Fc_Config) ---
	FcConfigPreferAppFont     :: proc(config: ^Fc_Config, flag: Fc_Bool) ---
	FcConfigSubstituteWithPat :: proc(config: ^Fc_Config, p: ^Fc_Pattern, p_pat: ^Fc_Pattern, kind: Fc_Match_Kind) -> Fc_Bool ---
	FcConfigSubstitute        :: proc(config: ^Fc_Config, p: ^Fc_Pattern, kind: Fc_Match_Kind) -> Fc_Bool ---
	FcConfigGetSysRoot        :: proc(config: ^Fc_Config) -> ^Fc_Char8 ---
	FcConfigSetSysRoot        :: proc(config: ^Fc_Config, sysroot: ^Fc_Char8) ---
	FcConfigSetFontSetFilter  :: proc(config: ^Fc_Config, filter_func: Fc_Filter_Font_Set_Func, destroy_data_func: Fc_Destroy_Func, user_data: rawptr) -> ^Fc_Config ---
	FcConfigFileInfoIterInit  :: proc(config: ^Fc_Config, iter: ^Fc_Config_File_Info_Iter) ---
	FcConfigFileInfoIterNext  :: proc(config: ^Fc_Config, iter: ^Fc_Config_File_Info_Iter) -> Fc_Bool ---
	FcConfigFileInfoIterGet   :: proc(config: ^Fc_Config, iter: ^Fc_Config_File_Info_Iter, name: ^^Fc_Char8, description: ^^Fc_Char8, enabled: ^Fc_Bool) -> Fc_Bool ---

	/* fccharset.c */
	FcCharSetCreate :: proc() -> ^Fc_Char_Set ---

	/* deprecated alias for FcCharSetCreate */
	FcCharSetNew            :: proc() -> ^Fc_Char_Set ---
	FcCharSetDestroy        :: proc(fcs: ^Fc_Char_Set) ---
	FcCharSetAddChar        :: proc(fcs: ^Fc_Char_Set, ucs4: Fc_Char32) -> Fc_Bool ---
	FcCharSetDelChar        :: proc(fcs: ^Fc_Char_Set, ucs4: Fc_Char32) -> Fc_Bool ---
	FcCharSetCopy           :: proc(src: ^Fc_Char_Set) -> ^Fc_Char_Set ---
	FcCharSetEqual          :: proc(a: ^Fc_Char_Set, b: ^Fc_Char_Set) -> Fc_Bool ---
	FcCharSetIntersect      :: proc(a: ^Fc_Char_Set, b: ^Fc_Char_Set) -> ^Fc_Char_Set ---
	FcCharSetUnion          :: proc(a: ^Fc_Char_Set, b: ^Fc_Char_Set) -> ^Fc_Char_Set ---
	FcCharSetSubtract       :: proc(a: ^Fc_Char_Set, b: ^Fc_Char_Set) -> ^Fc_Char_Set ---
	FcCharSetMerge          :: proc(a: ^Fc_Char_Set, b: ^Fc_Char_Set, changed: ^Fc_Bool) -> Fc_Bool ---
	FcCharSetHasChar        :: proc(fcs: ^Fc_Char_Set, ucs4: Fc_Char32) -> Fc_Bool ---
	FcCharSetCount          :: proc(a: ^Fc_Char_Set) -> Fc_Char32 ---
	FcCharSetIntersectCount :: proc(a: ^Fc_Char_Set, b: ^Fc_Char_Set) -> Fc_Char32 ---
	FcCharSetSubtractCount  :: proc(a: ^Fc_Char_Set, b: ^Fc_Char_Set) -> Fc_Char32 ---
	FcCharSetIsSubset       :: proc(a: ^Fc_Char_Set, b: ^Fc_Char_Set) -> Fc_Bool ---
}

FC_CHARSET_MAP_SIZE :: (256/32)
FC_CHARSET_DONE     :: ((FcChar32)-1)

@(default_calling_convention="c")
foreign lib {
	FcCharSetFirstPage :: proc(a: ^Fc_Char_Set, _map: ^[8]Fc_Char32, next: ^Fc_Char32) -> Fc_Char32 ---
	FcCharSetNextPage  :: proc(a: ^Fc_Char_Set, _map: ^[8]Fc_Char32, next: ^Fc_Char32) -> Fc_Char32 ---

	/*
	* old coverage API, rather hard to use correctly
	*/
	FcCharSetCoverage :: proc(a: ^Fc_Char_Set, page: Fc_Char32, result: ^Fc_Char32) -> Fc_Char32 ---

	/* fcdbg.c */
	FcValuePrint   :: proc(v: Fc_Value) ---
	FcPatternPrint :: proc(p: ^Fc_Pattern) ---
	FcFontSetPrint :: proc(s: ^Fc_Font_Set) ---

	/* fcdefault.c */
	FcConfigGetDefaultLangs      :: proc(config: ^Fc_Config) -> ^Fc_Str_Set ---
	FcGetDefaultLangs            :: proc() -> ^Fc_Str_Set ---
	FcConfigSetDefaultSubstitute :: proc(config: ^Fc_Config, pattern: ^Fc_Pattern) ---
	FcDefaultSubstitute          :: proc(pattern: ^Fc_Pattern) ---

	/* fcdir.c */
	FcFileIsDir        :: proc(file: ^Fc_Char8) -> Fc_Bool ---
	FcFileScan         :: proc(set: ^Fc_Font_Set, dirs: ^Fc_Str_Set, cache: ^Fc_File_Cache, blanks: ^Fc_Blanks, file: ^Fc_Char8, force: Fc_Bool) -> Fc_Bool ---
	FcDirScan          :: proc(set: ^Fc_Font_Set, dirs: ^Fc_Str_Set, cache: ^Fc_File_Cache, blanks: ^Fc_Blanks, dir: ^Fc_Char8, force: Fc_Bool) -> Fc_Bool ---
	FcDirSave          :: proc(set: ^Fc_Font_Set, dirs: ^Fc_Str_Set, dir: ^Fc_Char8) -> Fc_Bool ---
	FcDirCacheLoad     :: proc(dir: ^Fc_Char8, config: ^Fc_Config, cache_file: ^^Fc_Char8) -> ^Fc_Cache ---
	FcDirCacheRescan   :: proc(dir: ^Fc_Char8, config: ^Fc_Config) -> ^Fc_Cache ---
	FcDirCacheRead     :: proc(dir: ^Fc_Char8, force: Fc_Bool, config: ^Fc_Config) -> ^Fc_Cache ---
	FcDirCacheLoadFile :: proc(cache_file: ^Fc_Char8, file_stat: ^Stat) -> ^Fc_Cache ---
	FcDirCacheUnload   :: proc(cache: ^Fc_Cache) ---

	/* fcfreetype.c */
	FcFreeTypeQuery    :: proc(file: ^Fc_Char8, id: u32, blanks: ^Fc_Blanks, count: ^i32) -> ^Fc_Pattern ---
	FcFreeTypeQueryAll :: proc(file: ^Fc_Char8, id: u32, blanks: ^Fc_Blanks, count: ^i32, set: ^Fc_Font_Set) -> u32 ---

	/* fcfs.c */
	FcFontSetCreate  :: proc() -> ^Fc_Font_Set ---
	FcFontSetDestroy :: proc(s: ^Fc_Font_Set) ---
	FcFontSetAdd     :: proc(s: ^Fc_Font_Set, font: ^Fc_Pattern) -> Fc_Bool ---

	/* fcinit.c */
	FcInitLoadConfig         :: proc() -> ^Fc_Config ---
	FcInitLoadConfigAndFonts :: proc() -> ^Fc_Config ---
	FcInit                   :: proc() -> Fc_Bool ---
	FcFini                   :: proc() ---
	FcGetVersion             :: proc() -> i32 ---
	FcInitReinitialize       :: proc() -> Fc_Bool ---
	FcInitBringUptoDate      :: proc() -> Fc_Bool ---

	/* fclang.c */
	FcGetLangs        :: proc() -> ^Fc_Str_Set ---
	FcLangNormalize   :: proc(lang: ^Fc_Char8) -> ^Fc_Char8 ---
	FcLangGetCharSet  :: proc(lang: ^Fc_Char8) -> ^Fc_Char_Set ---
	FcLangSetCreate   :: proc() -> ^Fc_Lang_Set ---
	FcLangSetDestroy  :: proc(ls: ^Fc_Lang_Set) ---
	FcLangSetCopy     :: proc(ls: ^Fc_Lang_Set) -> ^Fc_Lang_Set ---
	FcLangSetAdd      :: proc(ls: ^Fc_Lang_Set, lang: ^Fc_Char8) -> Fc_Bool ---
	FcLangSetDel      :: proc(ls: ^Fc_Lang_Set, lang: ^Fc_Char8) -> Fc_Bool ---
	FcLangSetHasLang  :: proc(ls: ^Fc_Lang_Set, lang: ^Fc_Char8) -> Fc_Lang_Result ---
	FcLangSetCompare  :: proc(lsa: ^Fc_Lang_Set, lsb: ^Fc_Lang_Set) -> Fc_Lang_Result ---
	FcLangSetContains :: proc(lsa: ^Fc_Lang_Set, lsb: ^Fc_Lang_Set) -> Fc_Bool ---
	FcLangSetEqual    :: proc(lsa: ^Fc_Lang_Set, lsb: ^Fc_Lang_Set) -> Fc_Bool ---
	FcLangSetHash     :: proc(ls: ^Fc_Lang_Set) -> Fc_Char32 ---
	FcLangSetGetLangs :: proc(ls: ^Fc_Lang_Set) -> ^Fc_Str_Set ---
	FcLangSetUnion    :: proc(a: ^Fc_Lang_Set, b: ^Fc_Lang_Set) -> ^Fc_Lang_Set ---
	FcLangSetSubtract :: proc(a: ^Fc_Lang_Set, b: ^Fc_Lang_Set) -> ^Fc_Lang_Set ---

	/* fclist.c */
	FcObjectSetCreate  :: proc() -> ^Fc_Object_Set ---
	FcObjectSetAdd     :: proc(os: ^Fc_Object_Set, object: cstring) -> Fc_Bool ---
	FcObjectSetDestroy :: proc(os: ^Fc_Object_Set) ---
	FcObjectSetVaBuild :: proc(first: cstring, va: i32) -> ^Fc_Object_Set ---
	FcObjectSetBuild   :: proc(first: cstring, #c_vararg _: ..any) -> ^Fc_Object_Set ---
	FcFontSetList      :: proc(config: ^Fc_Config, sets: ^^Fc_Font_Set, nsets: i32, p: ^Fc_Pattern, os: ^Fc_Object_Set) -> ^Fc_Font_Set ---
	FcFontList         :: proc(config: ^Fc_Config, p: ^Fc_Pattern, os: ^Fc_Object_Set) -> ^Fc_Font_Set ---

	/* fcatomic.c */
	FcAtomicCreate      :: proc(file: ^Fc_Char8) -> ^Fc_Atomic ---
	FcAtomicLock        :: proc(atomic: ^Fc_Atomic) -> Fc_Bool ---
	FcAtomicNewFile     :: proc(atomic: ^Fc_Atomic) -> ^Fc_Char8 ---
	FcAtomicOrigFile    :: proc(atomic: ^Fc_Atomic) -> ^Fc_Char8 ---
	FcAtomicReplaceOrig :: proc(atomic: ^Fc_Atomic) -> Fc_Bool ---
	FcAtomicDeleteNew   :: proc(atomic: ^Fc_Atomic) ---
	FcAtomicUnlock      :: proc(atomic: ^Fc_Atomic) ---
	FcAtomicDestroy     :: proc(atomic: ^Fc_Atomic) ---

	/* fcmatch.c */
	FcFontSetMatch       :: proc(config: ^Fc_Config, sets: ^^Fc_Font_Set, nsets: i32, p: ^Fc_Pattern, result: ^Fc_Result) -> ^Fc_Pattern ---
	FcFontMatch          :: proc(config: ^Fc_Config, p: ^Fc_Pattern, result: ^Fc_Result) -> ^Fc_Pattern ---
	FcFontRenderPrepare  :: proc(config: ^Fc_Config, pat: ^Fc_Pattern, font: ^Fc_Pattern) -> ^Fc_Pattern ---
	FcFontSetSort        :: proc(config: ^Fc_Config, sets: ^^Fc_Font_Set, nsets: i32, p: ^Fc_Pattern, trim: Fc_Bool, csp: ^^Fc_Char_Set, result: ^Fc_Result) -> ^Fc_Font_Set ---
	FcFontSort           :: proc(config: ^Fc_Config, p: ^Fc_Pattern, trim: Fc_Bool, csp: ^^Fc_Char_Set, result: ^Fc_Result) -> ^Fc_Font_Set ---
	FcFontSetSortDestroy :: proc(fs: ^Fc_Font_Set) ---

	/* fcmatrix.c */
	FcMatrixCopy     :: proc(mat: ^Fc_Matrix) -> ^Fc_Matrix ---
	FcMatrixEqual    :: proc(mat1: ^Fc_Matrix, mat2: ^Fc_Matrix) -> Fc_Bool ---
	FcMatrixMultiply :: proc(result: ^Fc_Matrix, a: ^Fc_Matrix, b: ^Fc_Matrix) ---
	FcMatrixRotate   :: proc(m: ^Fc_Matrix, _c: f64, s: f64) ---
	FcMatrixScale    :: proc(m: ^Fc_Matrix, sx: f64, sy: f64) ---
	FcMatrixShear    :: proc(m: ^Fc_Matrix, sh: f64, sv: f64) ---

	/* Deprecated.  Does nothing.  Returns FcFalse. */
	FcNameRegisterObjectTypes :: proc(types: ^Fc_Object_Type, ntype: i32) -> Fc_Bool ---

	/* Deprecated.  Does nothing.  Returns FcFalse. */
	FcNameUnregisterObjectTypes :: proc(types: ^Fc_Object_Type, ntype: i32) -> Fc_Bool ---
	FcNameGetObjectType         :: proc(object: cstring) -> ^Fc_Object_Type ---

	/* Deprecated.  Does nothing.  Returns FcFalse. */
	FcNameRegisterConstants :: proc(consts: ^Fc_Constant, nconsts: i32) -> Fc_Bool ---

	/* Deprecated.  Does nothing.  Returns FcFalse. */
	FcNameUnregisterConstants :: proc(consts: ^Fc_Constant, nconsts: i32) -> Fc_Bool ---
	FcNameGetConstant         :: proc(_string: ^Fc_Char8) -> ^Fc_Constant ---
	FcNameGetConstantFor      :: proc(_string: ^Fc_Char8, object: cstring) -> ^Fc_Constant ---
	FcNameConstant            :: proc(_string: ^Fc_Char8, result: ^i32) -> Fc_Bool ---
	FcNameParse               :: proc(name: ^Fc_Char8) -> ^Fc_Pattern ---
	FcNameUnparse             :: proc(pat: ^Fc_Pattern) -> ^Fc_Char8 ---

	/* fcpat.c */
	FcPatternCreate         :: proc() -> ^Fc_Pattern ---
	FcPatternDuplicate      :: proc(p: ^Fc_Pattern) -> ^Fc_Pattern ---
	FcPatternReference      :: proc(p: ^Fc_Pattern) ---
	FcPatternFilter         :: proc(p: ^Fc_Pattern, os: ^Fc_Object_Set) -> ^Fc_Pattern ---
	FcValueDestroy          :: proc(v: Fc_Value) ---
	FcValueEqual            :: proc(va: Fc_Value, vb: Fc_Value) -> Fc_Bool ---
	FcValueSave             :: proc(v: Fc_Value) -> Fc_Value ---
	FcPatternDestroy        :: proc(p: ^Fc_Pattern) ---
	FcPatternObjectCount    :: proc(pat: ^Fc_Pattern) -> i32 ---
	FcPatternEqual          :: proc(pa: ^Fc_Pattern, pb: ^Fc_Pattern) -> Fc_Bool ---
	FcPatternEqualSubset    :: proc(pa: ^Fc_Pattern, pb: ^Fc_Pattern, os: ^Fc_Object_Set) -> Fc_Bool ---
	FcPatternHash           :: proc(p: ^Fc_Pattern) -> Fc_Char32 ---
	FcPatternAdd            :: proc(p: ^Fc_Pattern, object: cstring, value: Fc_Value, append: Fc_Bool) -> Fc_Bool ---
	FcPatternAddWeak        :: proc(p: ^Fc_Pattern, object: cstring, value: Fc_Value, append: Fc_Bool) -> Fc_Bool ---
	FcPatternGet            :: proc(p: ^Fc_Pattern, object: cstring, id: i32, v: ^Fc_Value) -> Fc_Result ---
	FcPatternGetWithBinding :: proc(p: ^Fc_Pattern, object: cstring, id: i32, v: ^Fc_Value, b: ^Fc_Value_Binding) -> Fc_Result ---
	FcPatternDel            :: proc(p: ^Fc_Pattern, object: cstring) -> Fc_Bool ---
	FcPatternRemove         :: proc(p: ^Fc_Pattern, object: cstring, id: i32) -> Fc_Bool ---
	FcPatternAddInteger     :: proc(p: ^Fc_Pattern, object: cstring, i: i32) -> Fc_Bool ---
	FcPatternAddDouble      :: proc(p: ^Fc_Pattern, object: cstring, d: f64) -> Fc_Bool ---
	FcPatternAddString      :: proc(p: ^Fc_Pattern, object: cstring, s: ^Fc_Char8) -> Fc_Bool ---
	FcPatternAddMatrix      :: proc(p: ^Fc_Pattern, object: cstring, s: ^Fc_Matrix) -> Fc_Bool ---
	FcPatternAddCharSet     :: proc(p: ^Fc_Pattern, object: cstring, _c: ^Fc_Char_Set) -> Fc_Bool ---
	FcPatternAddBool        :: proc(p: ^Fc_Pattern, object: cstring, b: Fc_Bool) -> Fc_Bool ---
	FcPatternAddLangSet     :: proc(p: ^Fc_Pattern, object: cstring, ls: ^Fc_Lang_Set) -> Fc_Bool ---
	FcPatternAddRange       :: proc(p: ^Fc_Pattern, object: cstring, r: ^Fc_Range) -> Fc_Bool ---
	FcPatternGetInteger     :: proc(p: ^Fc_Pattern, object: cstring, n: i32, i: ^i32) -> Fc_Result ---
	FcPatternGetDouble      :: proc(p: ^Fc_Pattern, object: cstring, n: i32, d: ^f64) -> Fc_Result ---
	FcPatternGetString      :: proc(p: ^Fc_Pattern, object: cstring, n: i32, s: ^^Fc_Char8) -> Fc_Result ---
	FcPatternGetMatrix      :: proc(p: ^Fc_Pattern, object: cstring, n: i32, s: ^^Fc_Matrix) -> Fc_Result ---
	FcPatternGetCharSet     :: proc(p: ^Fc_Pattern, object: cstring, n: i32, _c: ^^Fc_Char_Set) -> Fc_Result ---
	FcPatternGetBool        :: proc(p: ^Fc_Pattern, object: cstring, n: i32, b: ^Fc_Bool) -> Fc_Result ---
	FcPatternGetLangSet     :: proc(p: ^Fc_Pattern, object: cstring, n: i32, ls: ^^Fc_Lang_Set) -> Fc_Result ---
	FcPatternGetRange       :: proc(p: ^Fc_Pattern, object: cstring, id: i32, r: ^^Fc_Range) -> Fc_Result ---
	FcPatternVaBuild        :: proc(p: ^Fc_Pattern, va: i32) -> ^Fc_Pattern ---
	FcPatternBuild          :: proc(p: ^Fc_Pattern, #c_vararg _: ..any) -> ^Fc_Pattern ---
	FcPatternFormat         :: proc(pat: ^Fc_Pattern, format: ^Fc_Char8) -> ^Fc_Char8 ---

	/* fcrange.c */
	FcRangeCreateDouble     :: proc(begin: f64, end: f64) -> ^Fc_Range ---
	FcRangeCreateInteger    :: proc(begin: Fc_Char32, end: Fc_Char32) -> ^Fc_Range ---
	FcRangeDestroy          :: proc(range: ^Fc_Range) ---
	FcRangeCopy             :: proc(r: ^Fc_Range) -> ^Fc_Range ---
	FcRangeGetDouble        :: proc(range: ^Fc_Range, begin: ^f64, end: ^f64) -> Fc_Bool ---
	FcPatternIterStart      :: proc(pat: ^Fc_Pattern, iter: ^Fc_Pattern_Iter) ---
	FcPatternIterNext       :: proc(pat: ^Fc_Pattern, iter: ^Fc_Pattern_Iter) -> Fc_Bool ---
	FcPatternIterEqual      :: proc(p1: ^Fc_Pattern, i1: ^Fc_Pattern_Iter, p2: ^Fc_Pattern, i2: ^Fc_Pattern_Iter) -> Fc_Bool ---
	FcPatternFindIter       :: proc(pat: ^Fc_Pattern, iter: ^Fc_Pattern_Iter, object: cstring) -> Fc_Bool ---
	FcPatternIterIsValid    :: proc(pat: ^Fc_Pattern, iter: ^Fc_Pattern_Iter) -> Fc_Bool ---
	FcPatternIterGetObject  :: proc(pat: ^Fc_Pattern, iter: ^Fc_Pattern_Iter) -> cstring ---
	FcPatternIterValueCount :: proc(pat: ^Fc_Pattern, iter: ^Fc_Pattern_Iter) -> i32 ---
	FcPatternIterGetValue   :: proc(pat: ^Fc_Pattern, iter: ^Fc_Pattern_Iter, id: i32, v: ^Fc_Value, b: ^Fc_Value_Binding) -> Fc_Result ---

	/* fcweight.c */
	FcWeightFromOpenType       :: proc(ot_weight: i32) -> i32 ---
	FcWeightFromOpenTypeDouble :: proc(ot_weight: f64) -> f64 ---
	FcWeightToOpenType         :: proc(fc_weight: i32) -> i32 ---
	FcWeightToOpenTypeDouble   :: proc(fc_weight: f64) -> f64 ---

	/* fcstr.c */
	FcStrCopy          :: proc(s: ^Fc_Char8) -> ^Fc_Char8 ---
	FcStrCopyFilename  :: proc(s: ^Fc_Char8) -> ^Fc_Char8 ---
	FcStrPlus          :: proc(s1: ^Fc_Char8, s2: ^Fc_Char8) -> ^Fc_Char8 ---
	FcStrFree          :: proc(s: ^Fc_Char8) ---
	FcStrDowncase      :: proc(s: ^Fc_Char8) -> ^Fc_Char8 ---
	FcStrCmpIgnoreCase :: proc(s1: ^Fc_Char8, s2: ^Fc_Char8) -> i32 ---
	FcStrCmp           :: proc(s1: ^Fc_Char8, s2: ^Fc_Char8) -> i32 ---
	FcStrStrIgnoreCase :: proc(s1: ^Fc_Char8, s2: ^Fc_Char8) -> ^Fc_Char8 ---
	FcStrStr           :: proc(s1: ^Fc_Char8, s2: ^Fc_Char8) -> ^Fc_Char8 ---
	FcUtf8ToUcs4       :: proc(src_orig: ^Fc_Char8, dst: ^Fc_Char32, len: i32) -> i32 ---
	FcUtf8Len          :: proc(_string: ^Fc_Char8, len: i32, nchar: ^i32, wchar: ^i32) -> Fc_Bool ---
}

FC_UTF8_MAX_LEN :: 6

@(default_calling_convention="c")
foreign lib {
	FcUcs4ToUtf8        :: proc(ucs4: Fc_Char32, dest: ^[6]Fc_Char8) -> i32 ---
	FcUtf16ToUcs4       :: proc(src_orig: ^Fc_Char8, endian: Fc_Endian, dst: ^Fc_Char32, len: i32) -> i32 ---
	FcUtf16Len          :: proc(_string: ^Fc_Char8, endian: Fc_Endian, len: i32, nchar: ^i32, wchar: ^i32) -> Fc_Bool ---
	FcStrBuildFilename  :: proc(path: ^Fc_Char8, #c_vararg _: ..any) -> ^Fc_Char8 ---
	FcStrDirname        :: proc(file: ^Fc_Char8) -> ^Fc_Char8 ---
	FcStrBasename       :: proc(file: ^Fc_Char8) -> ^Fc_Char8 ---
	FcStrSetCreate      :: proc() -> ^Fc_Str_Set ---
	FcStrSetMember      :: proc(set: ^Fc_Str_Set, s: ^Fc_Char8) -> Fc_Bool ---
	FcStrSetEqual       :: proc(sa: ^Fc_Str_Set, sb: ^Fc_Str_Set) -> Fc_Bool ---
	FcStrSetAdd         :: proc(set: ^Fc_Str_Set, s: ^Fc_Char8) -> Fc_Bool ---
	FcStrSetAddFilename :: proc(set: ^Fc_Str_Set, s: ^Fc_Char8) -> Fc_Bool ---
	FcStrSetDel         :: proc(set: ^Fc_Str_Set, s: ^Fc_Char8) -> Fc_Bool ---
	FcStrSetDestroy     :: proc(set: ^Fc_Str_Set) ---
	FcStrListCreate     :: proc(set: ^Fc_Str_Set) -> ^Fc_Str_List ---
	FcStrListFirst      :: proc(list: ^Fc_Str_List) ---
	FcStrListNext       :: proc(list: ^Fc_Str_List) -> ^Fc_Char8 ---
	FcStrListDone       :: proc(list: ^Fc_Str_List) ---

	/* fcxml.c */
	FcConfigParseAndLoad           :: proc(config: ^Fc_Config, file: ^Fc_Char8, complain: Fc_Bool) -> Fc_Bool ---
	FcConfigParseAndLoadFromMemory :: proc(config: ^Fc_Config, buffer: ^Fc_Char8, complain: Fc_Bool) -> Fc_Bool ---
}

