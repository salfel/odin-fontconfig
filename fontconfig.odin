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

import "core:os"

foreign import lib "system:fontconfig"
_ :: lib

Char8  :: u8
Char16 :: u16
Char32 :: u32
Bool   :: i32

/*
* Current Fontconfig version number.  This same number
* must appear in the fontconfig configure.in file. Yes,
* it'a a pain to synchronize version numbers like this.
*/
MAJOR                :: 2
MINOR                :: 17
REVISION             :: 1
VERSION              :: ((MAJOR*10000)+(MINOR*100)+(REVISION))

/*
* Current font cache file format version
* This is appended to the cache files so that multiple
* versions of the library will peacefully coexist
*
* Change this value whenever the disk format for the cache file
* changes in any non-compatible way.  Try to avoid such changes as
* it means multiple copies of the font information.
*/
CACHE_VERSION_NUMBER :: 9
FcFalse                 :: 0
FcTrue                  :: 1
FcDontCare              :: 2
FAMILY               :: "family"         /* String */
STYLE                :: "style"          /* String */
SLANT                :: "slant"          /* Int */
WEIGHT               :: "weight"         /* Int */
SIZE                 :: "size"           /* Range (double) */
ASPECT               :: "aspect"         /* Double */
PIXEL_SIZE           :: "pixelsize"      /* Double */
SPACING              :: "spacing"        /* Int */
FOUNDRY              :: "foundry"        /* String */
ANTIALIAS            :: "antialias"      /* Bool (depends) */
HINTING              :: "hinting"        /* Bool (true) */
HINT_STYLE           :: "hintstyle"      /* Int */
VERTICAL_LAYOUT      :: "verticallayout" /* Bool (false) */
AUTOHINT             :: "autohint"       /* Bool (false) */

/* FC_GLOBAL_ADVANCE is deprecated. this is simply ignored on freetype 2.4.5 or later */
GLOBAL_ADVANCE       :: "globaladvance"  /* Bool (true) */
WIDTH                :: "width"          /* Int */
FILE                 :: "file"           /* String */
INDEX                :: "index"          /* Int */
FT_FACE              :: "ftface"         /* FT_Face */
RASTERIZER           :: "rasterizer"     /* String (deprecated) */
OUTLINE              :: "outline"        /* Bool */
SCALABLE             :: "scalable"       /* Bool */
COLOR                :: "color"          /* Bool */
VARIABLE             :: "variable"       /* Bool */
SCALE                :: "scale"          /* double (deprecated) */
SYMBOL               :: "symbol"         /* Bool */
DPI                  :: "dpi"            /* double */
RGBA                 :: "rgba"           /* Int */
MINSPACE             :: "minspace"       /* Bool use minimum line spacing */
SOURCE               :: "source"         /* String (deprecated) */
CHARSET              :: "charset"        /* CharSet */
LANG                 :: "lang"           /* LangSet Set of RFC 3066 langs */
FONTVERSION          :: "fontversion"    /* Int from 'head' table */
FULLNAME             :: "fullname"       /* String */
FAMILYLANG           :: "familylang"     /* String RFC 3066 langs */
STYLELANG            :: "stylelang"      /* String RFC 3066 langs */
FULLNAMELANG         :: "fullnamelang"   /* String RFC 3066 langs */
CAPABILITY           :: "capability"     /* String */
FONTFORMAT           :: "fontformat"     /* String */
EMBOLDEN             :: "embolden"       /* Bool - true if emboldening needed*/
EMBEDDED_BITMAP      :: "embeddedbitmap" /* Bool - true to enable embedded bitmaps */
DECORATIVE           :: "decorative"     /* Bool - true if style is a decorative variant */
LCD_FILTER           :: "lcdfilter"      /* Int */
FONT_FEATURES        :: "fontfeatures"   /* String */
FONT_VARIATIONS      :: "fontvariations" /* String */
NAMELANG             :: "namelang"       /* String RFC 3866 langs */
PRGNAME              :: "prgname"        /* String */
HASH                 :: "hash"           /* String (deprecated) */
POSTSCRIPT_NAME      :: "postscriptname" /* String */
FONT_HAS_HINT        :: "fonthashint"    /* Bool - true if font has hinting */
ORDER                :: "order"          /* Integer */
DESKTOP_NAME         :: "desktop"        /* String */
NAMED_INSTANCE       :: "namedinstance"  /* Bool - true if font is named instance */
FONT_WRAPPER         :: "fontwrapper"    /* String */

/* Adjust outline rasterizer */
CHARWIDTH            :: "charwidth"  /* Int */
CHAR_WIDTH           :: CHARWIDTH
CHAR_HEIGHT          :: "charheight" /* Int */
MATRIX               :: "matrix"     /* FcMatrix */
WEIGHT_THIN          :: 0
WEIGHT_EXTRALIGHT    :: 40
WEIGHT_ULTRALIGHT    :: WEIGHT_EXTRALIGHT
WEIGHT_LIGHT         :: 50
WEIGHT_DEMILIGHT     :: 55
WEIGHT_SEMILIGHT     :: WEIGHT_DEMILIGHT
WEIGHT_BOOK          :: 75
WEIGHT_REGULAR       :: 80
WEIGHT_NORMAL        :: WEIGHT_REGULAR
WEIGHT_MEDIUM        :: 100
WEIGHT_DEMIBOLD      :: 180
WEIGHT_SEMIBOLD      :: WEIGHT_DEMIBOLD
WEIGHT_BOLD          :: 200
WEIGHT_EXTRABOLD     :: 205
WEIGHT_ULTRABOLD     :: WEIGHT_EXTRABOLD
WEIGHT_BLACK         :: 210
WEIGHT_HEAVY         :: WEIGHT_BLACK
WEIGHT_EXTRABLACK    :: 215
WEIGHT_ULTRABLACK    :: WEIGHT_EXTRABLACK
SLANT_ROMAN          :: 0
SLANT_ITALIC         :: 100
SLANT_OBLIQUE        :: 110
WIDTH_ULTRACONDENSED :: 50
WIDTH_EXTRACONDENSED :: 63
WIDTH_CONDENSED      :: 75
WIDTH_SEMICONDENSED  :: 87
WIDTH_NORMAL         :: 100
WIDTH_SEMIEXPANDED   :: 113
WIDTH_EXPANDED       :: 125
WIDTH_EXTRAEXPANDED  :: 150
WIDTH_ULTRAEXPANDED  :: 200
PROPORTIONAL         :: 0
DUAL                 :: 90
MONO                 :: 100
CHARCELL             :: 110

/* sub-pixel order */
RGBA_UNKNOWN         :: 0
RGBA_RGB             :: 1
RGBA_BGR             :: 2
RGBA_VRGB            :: 3
RGBA_VBGR            :: 4
RGBA_NONE            :: 5

/* hinting style */
HINT_NONE            :: 0
HINT_SLIGHT          :: 1
HINT_MEDIUM          :: 2
HINT_FULL            :: 3

/* LCD filter */
LCD_NONE             :: 0
LCD_DEFAULT          :: 1
LCD_LIGHT            :: 2
LCD_LEGACY           :: 3

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

Type :: _Fc_Type

_Fc_Matrix :: struct {
	xx, xy, yx, yy: f64,
}

Matrix :: _Fc_Matrix

/*
* A data structure to represent the available glyphs in a font.
* This is represented as a sparse boolean btree.
*/
Char_Set     :: _Fc_Char_Set
_Fc_Char_Set :: struct {}

_Fc_Object_Type :: struct {
	object: cstring,
	type:   Type,
}

Object_Type :: _Fc_Object_Type

_Fc_Constant :: struct {
	name:   ^Char8,
	object: cstring,
	value:  i32,
}

Constant :: _Fc_Constant

_Fc_Result :: enum u32 {
	Match        = 0,
	NoMatch      = 1,
	TypeMismatch = 2,
	NoId         = 3,
	OutOfMemory  = 4,
}

Result :: _Fc_Result

_Fc_Value_Binding :: enum u32 {
	Weak   = 0,
	Strong = 1,
	Same   = 2,

	/* to make sure sizeof (FcValueBinding) == 4 even with -fshort-enums */
	End    = 3,
}

Value_Binding :: _Fc_Value_Binding
Pattern       :: _Fc_Pattern
_Fc_Pattern   :: struct {}

_Fc_Pattern_Iter :: struct {
	dummy1: rawptr,
	dummy2: rawptr,
}

Pattern_Iter :: _Fc_Pattern_Iter
_Fc_Lang_Set :: struct {}
Lang_Set     :: _Fc_Lang_Set
Range        :: _Fc_Range
_Fc_Range    :: struct {}

_Fc_Value :: struct {
	type: Type,

	u: struct #raw_union {
		s:  ^Char8,
		i:  i32,
		b:  Bool,
		d:  f64,
		m:  ^Matrix,
		_c: ^Char_Set,
		f:  rawptr,
		l:  ^Lang_Set,
		r:  ^Range,
	},
}

Value :: _Fc_Value

_Fc_Font_Set :: struct {
	nfont: i32,
	sfont: i32,
	fonts: ^^Pattern,
}

Font_Set :: _Fc_Font_Set

_Fc_Object_Set :: struct {
	nobject: i32,
	sobject: i32,
	objects: ^cstring,
}

Object_Set :: _Fc_Object_Set

_Fc_Match_Kind :: enum u32 {
	Pattern   = 0,
	Font      = 1,
	Scan      = 2,
	KindEnd   = 3,
	KindBegin = 0,
}

Match_Kind :: _Fc_Match_Kind

_Fc_Lang_Result :: enum u32 {
	Equal              = 0,
	DifferentCountry   = 1,
	DifferentTerritory = 1,
	DifferentLang      = 2,
}

Lang_Result :: _Fc_Lang_Result

_Fc_Set_Name :: enum u32 {
	System      = 0,
	Application = 1,
}

Set_Name :: _Fc_Set_Name

_Fc_Config_File_Info_Iter :: struct {
	dummy1: rawptr,
	dummy2: rawptr,
	dummy3: rawptr,
}

Config_File_Info_Iter :: _Fc_Config_File_Info_Iter
Atomic                :: _Fc_Atomic
_Fc_Atomic            :: struct {}

Endian :: enum u32 {
	Big    = 0,
	Little = 1,
}

Config               :: _Fc_Config
_Fc_Config           :: struct {}
_Fc_Global_Cache     :: struct {}
File_Cache           :: _Fc_Global_Cache
Blanks               :: _Fc_Blanks
_Fc_Blanks           :: struct {}
_Fc_Str_List         :: struct {}
Str_List             :: _Fc_Str_List
_Fc_Str_Set          :: struct {}
Str_Set              :: _Fc_Str_Set
Cache                :: _Fc_Cache
_Fc_Cache            :: struct {}
Destroy_Func         :: proc "c" (data: rawptr)
Filter_Font_Set_Func :: proc "c" (font: ^Pattern, user_data: rawptr) -> Bool

@(default_calling_convention="c", link_prefix="Fc")
foreign lib {
	/* fcblanks.c */
	BlanksCreate   :: proc() -> ^Blanks ---
	BlanksDestroy  :: proc(b: ^Blanks) ---
	BlanksAdd      :: proc(b: ^Blanks, ucs4: Char32) -> Bool ---
	BlanksIsMember :: proc(b: ^Blanks, ucs4: Char32) -> Bool ---

	/* fccache.c */
	CacheDir           :: proc(_c: ^Cache) -> ^Char8 ---
	CacheCopySet       :: proc(_c: ^Cache) -> ^Font_Set ---
	CacheSubdir        :: proc(_c: ^Cache, i: i32) -> ^Char8 ---
	CacheNumSubdir     :: proc(_c: ^Cache) -> i32 ---
	CacheNumFont       :: proc(_c: ^Cache) -> i32 ---
	DirCacheUnlink     :: proc(dir: ^Char8, config: ^Config) -> Bool ---
	DirCacheValid      :: proc(cache_file: ^Char8) -> Bool ---
	DirCacheClean      :: proc(cache_dir: ^Char8, verbose: Bool) -> Bool ---
	CacheCreateTagFile :: proc(config: ^Config) ---
	DirCacheCreateUUID :: proc(dir: ^Char8, force: Bool, config: ^Config) -> Bool ---
	DirCacheDeleteUUID :: proc(dir: ^Char8, config: ^Config) -> Bool ---

	/* fccfg.c */
	ConfigHome              :: proc() -> ^Char8 ---
	ConfigEnableHome        :: proc(enable: Bool) -> Bool ---
	ConfigGetFilename       :: proc(config: ^Config, url: ^Char8) -> ^Char8 ---
	ConfigFilename          :: proc(url: ^Char8) -> ^Char8 ---
	ConfigCreate            :: proc() -> ^Config ---
	ConfigReference         :: proc(config: ^Config) -> ^Config ---
	ConfigDestroy           :: proc(config: ^Config) ---
	ConfigSetCurrent        :: proc(config: ^Config) -> Bool ---
	ConfigGetCurrent        :: proc() -> ^Config ---
	ConfigUptoDate          :: proc(config: ^Config) -> Bool ---
	ConfigBuildFonts        :: proc(config: ^Config) -> Bool ---
	ConfigGetFontDirs       :: proc(config: ^Config) -> ^Str_List ---
	ConfigGetConfigDirs     :: proc(config: ^Config) -> ^Str_List ---
	ConfigGetConfigFiles    :: proc(config: ^Config) -> ^Str_List ---
	ConfigGetCache          :: proc(config: ^Config) -> ^Char8 ---
	ConfigGetBlanks         :: proc(config: ^Config) -> ^Blanks ---
	ConfigGetCacheDirs      :: proc(config: ^Config) -> ^Str_List ---
	ConfigGetRescanInterval :: proc(config: ^Config) -> i32 ---
	ConfigSetRescanInterval :: proc(config: ^Config, rescanInterval: i32) -> Bool ---
	ConfigGetFonts          :: proc(config: ^Config, set: Set_Name) -> ^Font_Set ---
	ConfigAcceptFont        :: proc(config: ^Config, font: ^Pattern) -> Bool ---
	ConfigAcceptFilter      :: proc(config: ^Config, font: ^Pattern) -> Bool ---
	ConfigAppFontAddFile    :: proc(config: ^Config, file: ^Char8) -> Bool ---
	ConfigAppFontAddDir     :: proc(config: ^Config, dir: ^Char8) -> Bool ---
	ConfigAppFontClear      :: proc(config: ^Config) ---
	ConfigPreferAppFont     :: proc(config: ^Config, flag: Bool) ---
	ConfigSubstituteWithPat :: proc(config: ^Config, p: ^Pattern, p_pat: ^Pattern, kind: Match_Kind) -> Bool ---
	ConfigSubstitute        :: proc(config: ^Config, p: ^Pattern, kind: Match_Kind) -> Bool ---
	ConfigGetSysRoot        :: proc(config: ^Config) -> ^Char8 ---
	ConfigSetSysRoot        :: proc(config: ^Config, sysroot: ^Char8) ---
	ConfigSetFontSetFilter  :: proc(config: ^Config, filter_func: Filter_Font_Set_Func, destroy_data_func: Destroy_Func, user_data: rawptr) -> ^Config ---
	ConfigFileInfoIterInit  :: proc(config: ^Config, iter: ^Config_File_Info_Iter) ---
	ConfigFileInfoIterNext  :: proc(config: ^Config, iter: ^Config_File_Info_Iter) -> Bool ---
	ConfigFileInfoIterGet   :: proc(config: ^Config, iter: ^Config_File_Info_Iter, name: ^^Char8, description: ^^Char8, enabled: ^Bool) -> Bool ---

	/* fccharset.c */
	CharSetCreate :: proc() -> ^Char_Set ---

	/* deprecated alias for FcCharSetCreate */
	CharSetNew            :: proc() -> ^Char_Set ---
	CharSetDestroy        :: proc(fcs: ^Char_Set) ---
	CharSetAddChar        :: proc(fcs: ^Char_Set, ucs4: Char32) -> Bool ---
	CharSetDelChar        :: proc(fcs: ^Char_Set, ucs4: Char32) -> Bool ---
	CharSetCopy           :: proc(src: ^Char_Set) -> ^Char_Set ---
	CharSetEqual          :: proc(a: ^Char_Set, b: ^Char_Set) -> Bool ---
	CharSetIntersect      :: proc(a: ^Char_Set, b: ^Char_Set) -> ^Char_Set ---
	CharSetUnion          :: proc(a: ^Char_Set, b: ^Char_Set) -> ^Char_Set ---
	CharSetSubtract       :: proc(a: ^Char_Set, b: ^Char_Set) -> ^Char_Set ---
	CharSetMerge          :: proc(a: ^Char_Set, b: ^Char_Set, changed: ^Bool) -> Bool ---
	CharSetHasChar        :: proc(fcs: ^Char_Set, ucs4: Char32) -> Bool ---
	CharSetCount          :: proc(a: ^Char_Set) -> Char32 ---
	CharSetIntersectCount :: proc(a: ^Char_Set, b: ^Char_Set) -> Char32 ---
	CharSetSubtractCount  :: proc(a: ^Char_Set, b: ^Char_Set) -> Char32 ---
	CharSetIsSubset       :: proc(a: ^Char_Set, b: ^Char_Set) -> Bool ---
}

CHARSET_MAP_SIZE :: (256/32)
CHARSET_DONE     :: 4294967295 // ((FcChar32)-1)

@(default_calling_convention="c", link_prefix="Fc")
foreign lib {
	CharSetFirstPage :: proc(a: ^Char_Set, _map: ^[8]Char32, next: ^Char32) -> Char32 ---
	CharSetNextPage  :: proc(a: ^Char_Set, _map: ^[8]Char32, next: ^Char32) -> Char32 ---

	/*
	* old coverage API, rather hard to use correctly
	*/
	CharSetCoverage :: proc(a: ^Char_Set, page: Char32, result: ^Char32) -> Char32 ---

	/* fcdbg.c */
	ValuePrint   :: proc(v: Value) ---
	PatternPrint :: proc(p: ^Pattern) ---
	FontSetPrint :: proc(s: ^Font_Set) ---

	/* fcdefault.c */
	ConfigGetDefaultLangs      :: proc(config: ^Config) -> ^Str_Set ---
	GetDefaultLangs            :: proc() -> ^Str_Set ---
	ConfigSetDefaultSubstitute :: proc(config: ^Config, pattern: ^Pattern) ---
	DefaultSubstitute          :: proc(pattern: ^Pattern) ---

	/* fcdir.c */
	FileIsDir        :: proc(file: ^Char8) -> Bool ---
	FileScan         :: proc(set: ^Font_Set, dirs: ^Str_Set, cache: ^File_Cache, blanks: ^Blanks, file: ^Char8, force: Bool) -> Bool ---
	DirScan          :: proc(set: ^Font_Set, dirs: ^Str_Set, cache: ^File_Cache, blanks: ^Blanks, dir: ^Char8, force: Bool) -> Bool ---
	DirSave          :: proc(set: ^Font_Set, dirs: ^Str_Set, dir: ^Char8) -> Bool ---
	DirCacheLoad     :: proc(dir: ^Char8, config: ^Config, cache_file: ^^Char8) -> ^Cache ---
	DirCacheRescan   :: proc(dir: ^Char8, config: ^Config) -> ^Cache ---
	DirCacheRead     :: proc(dir: ^Char8, force: Bool, config: ^Config) -> ^Cache ---
	DirCacheLoadFile :: proc(cache_file: ^Char8, file_stat: ^os.OS_Stat) -> ^Cache ---
	DirCacheUnload   :: proc(cache: ^Cache) ---

	/* fcfreetype.c */
	FreeTypeQuery    :: proc(file: ^Char8, id: u32, blanks: ^Blanks, count: ^i32) -> ^Pattern ---
	FreeTypeQueryAll :: proc(file: ^Char8, id: u32, blanks: ^Blanks, count: ^i32, set: ^Font_Set) -> u32 ---

	/* fcfs.c */
	FontSetCreate  :: proc() -> ^Font_Set ---
	FontSetDestroy :: proc(s: ^Font_Set) ---
	FontSetAdd     :: proc(s: ^Font_Set, font: ^Pattern) -> Bool ---

	/* fcinit.c */
	InitLoadConfig         :: proc() -> ^Config ---
	InitLoadConfigAndFonts :: proc() -> ^Config ---
	Init                   :: proc() -> Bool ---
	Fini                   :: proc() ---
	GetVersion             :: proc() -> i32 ---
	InitReinitialize       :: proc() -> Bool ---
	InitBringUptoDate      :: proc() -> Bool ---

	/* fclang.c */
	GetLangs        :: proc() -> ^Str_Set ---
	LangNormalize   :: proc(lang: ^Char8) -> ^Char8 ---
	LangGetCharSet  :: proc(lang: ^Char8) -> ^Char_Set ---
	LangSetCreate   :: proc() -> ^Lang_Set ---
	LangSetDestroy  :: proc(ls: ^Lang_Set) ---
	LangSetCopy     :: proc(ls: ^Lang_Set) -> ^Lang_Set ---
	LangSetAdd      :: proc(ls: ^Lang_Set, lang: ^Char8) -> Bool ---
	LangSetDel      :: proc(ls: ^Lang_Set, lang: ^Char8) -> Bool ---
	LangSetHasLang  :: proc(ls: ^Lang_Set, lang: ^Char8) -> Lang_Result ---
	LangSetCompare  :: proc(lsa: ^Lang_Set, lsb: ^Lang_Set) -> Lang_Result ---
	LangSetContains :: proc(lsa: ^Lang_Set, lsb: ^Lang_Set) -> Bool ---
	LangSetEqual    :: proc(lsa: ^Lang_Set, lsb: ^Lang_Set) -> Bool ---
	LangSetHash     :: proc(ls: ^Lang_Set) -> Char32 ---
	LangSetGetLangs :: proc(ls: ^Lang_Set) -> ^Str_Set ---
	LangSetUnion    :: proc(a: ^Lang_Set, b: ^Lang_Set) -> ^Lang_Set ---
	LangSetSubtract :: proc(a: ^Lang_Set, b: ^Lang_Set) -> ^Lang_Set ---

	/* fclist.c */
	ObjectSetCreate  :: proc() -> ^Object_Set ---
	ObjectSetAdd     :: proc(os: ^Object_Set, object: cstring) -> Bool ---
	ObjectSetDestroy :: proc(os: ^Object_Set) ---
	ObjectSetVaBuild :: proc(first: cstring, va: i32) -> ^Object_Set ---
	ObjectSetBuild   :: proc(first: cstring, #c_vararg _: ..any) -> ^Object_Set ---
	FontSetList      :: proc(config: ^Config, sets: ^^Font_Set, nsets: i32, p: ^Pattern, os: ^Object_Set) -> ^Font_Set ---
	FontList         :: proc(config: ^Config, p: ^Pattern, os: ^Object_Set) -> ^Font_Set ---

	/* fcatomic.c */
	AtomicCreate      :: proc(file: ^Char8) -> ^Atomic ---
	AtomicLock        :: proc(atomic: ^Atomic) -> Bool ---
	AtomicNewFile     :: proc(atomic: ^Atomic) -> ^Char8 ---
	AtomicOrigFile    :: proc(atomic: ^Atomic) -> ^Char8 ---
	AtomicReplaceOrig :: proc(atomic: ^Atomic) -> Bool ---
	AtomicDeleteNew   :: proc(atomic: ^Atomic) ---
	AtomicUnlock      :: proc(atomic: ^Atomic) ---
	AtomicDestroy     :: proc(atomic: ^Atomic) ---

	/* fcmatch.c */
	FontSetMatch       :: proc(config: ^Config, sets: ^^Font_Set, nsets: i32, p: ^Pattern, result: ^Result) -> ^Pattern ---
	FontMatch          :: proc(config: ^Config, p: ^Pattern, result: ^Result) -> ^Pattern ---
	FontRenderPrepare  :: proc(config: ^Config, pat: ^Pattern, font: ^Pattern) -> ^Pattern ---
	FontSetSort        :: proc(config: ^Config, sets: ^^Font_Set, nsets: i32, p: ^Pattern, trim: Bool, csp: ^^Char_Set, result: ^Result) -> ^Font_Set ---
	FontSort           :: proc(config: ^Config, p: ^Pattern, trim: Bool, csp: ^^Char_Set, result: ^Result) -> ^Font_Set ---
	FontSetSortDestroy :: proc(fs: ^Font_Set) ---

	/* fcmatrix.c */
	MatrixCopy     :: proc(mat: ^Matrix) -> ^Matrix ---
	MatrixEqual    :: proc(mat1: ^Matrix, mat2: ^Matrix) -> Bool ---
	MatrixMultiply :: proc(result: ^Matrix, a: ^Matrix, b: ^Matrix) ---
	MatrixRotate   :: proc(m: ^Matrix, _c: f64, s: f64) ---
	MatrixScale    :: proc(m: ^Matrix, sx: f64, sy: f64) ---
	MatrixShear    :: proc(m: ^Matrix, sh: f64, sv: f64) ---

	/* Deprecated.  Does nothing.  Returns FcFalse. */
	NameRegisterObjectTypes :: proc(types: ^Object_Type, ntype: i32) -> Bool ---

	/* Deprecated.  Does nothing.  Returns FcFalse. */
	NameUnregisterObjectTypes :: proc(types: ^Object_Type, ntype: i32) -> Bool ---
	NameGetObjectType         :: proc(object: cstring) -> ^Object_Type ---

	/* Deprecated.  Does nothing.  Returns FcFalse. */
	NameRegisterConstants :: proc(consts: ^Constant, nconsts: i32) -> Bool ---

	/* Deprecated.  Does nothing.  Returns FcFalse. */
	NameUnregisterConstants :: proc(consts: ^Constant, nconsts: i32) -> Bool ---
	NameGetConstant         :: proc(_string: ^Char8) -> ^Constant ---
	NameGetConstantFor      :: proc(_string: ^Char8, object: cstring) -> ^Constant ---
	NameConstant            :: proc(_string: ^Char8, result: ^i32) -> Bool ---
	NameParse               :: proc(name: ^Char8) -> ^Pattern ---
	NameUnparse             :: proc(pat: ^Pattern) -> ^Char8 ---

	/* fcpat.c */
	PatternCreate         :: proc() -> ^Pattern ---
	PatternDuplicate      :: proc(p: ^Pattern) -> ^Pattern ---
	PatternReference      :: proc(p: ^Pattern) ---
	PatternFilter         :: proc(p: ^Pattern, os: ^Object_Set) -> ^Pattern ---
	ValueDestroy          :: proc(v: Value) ---
	ValueEqual            :: proc(va: Value, vb: Value) -> Bool ---
	ValueSave             :: proc(v: Value) -> Value ---
	PatternDestroy        :: proc(p: ^Pattern) ---
	PatternObjectCount    :: proc(pat: ^Pattern) -> i32 ---
	PatternEqual          :: proc(pa: ^Pattern, pb: ^Pattern) -> Bool ---
	PatternEqualSubset    :: proc(pa: ^Pattern, pb: ^Pattern, os: ^Object_Set) -> Bool ---
	PatternHash           :: proc(p: ^Pattern) -> Char32 ---
	PatternAdd            :: proc(p: ^Pattern, object: cstring, value: Value, append: Bool) -> Bool ---
	PatternAddWeak        :: proc(p: ^Pattern, object: cstring, value: Value, append: Bool) -> Bool ---
	PatternGet            :: proc(p: ^Pattern, object: cstring, id: i32, v: ^Value) -> Result ---
	PatternGetWithBinding :: proc(p: ^Pattern, object: cstring, id: i32, v: ^Value, b: ^Value_Binding) -> Result ---
	PatternDel            :: proc(p: ^Pattern, object: cstring) -> Bool ---
	PatternRemove         :: proc(p: ^Pattern, object: cstring, id: i32) -> Bool ---
	PatternAddInteger     :: proc(p: ^Pattern, object: cstring, i: i32) -> Bool ---
	PatternAddDouble      :: proc(p: ^Pattern, object: cstring, d: f64) -> Bool ---
	PatternAddString      :: proc(p: ^Pattern, object: cstring, s: ^Char8) -> Bool ---
	PatternAddMatrix      :: proc(p: ^Pattern, object: cstring, s: ^Matrix) -> Bool ---
	PatternAddCharSet     :: proc(p: ^Pattern, object: cstring, _c: ^Char_Set) -> Bool ---
	PatternAddBool        :: proc(p: ^Pattern, object: cstring, b: Bool) -> Bool ---
	PatternAddLangSet     :: proc(p: ^Pattern, object: cstring, ls: ^Lang_Set) -> Bool ---
	PatternAddRange       :: proc(p: ^Pattern, object: cstring, r: ^Range) -> Bool ---
	PatternGetInteger     :: proc(p: ^Pattern, object: cstring, n: i32, i: ^i32) -> Result ---
	PatternGetDouble      :: proc(p: ^Pattern, object: cstring, n: i32, d: ^f64) -> Result ---
	PatternGetString      :: proc(p: ^Pattern, object: cstring, n: i32, s: ^^Char8) -> Result ---
	PatternGetMatrix      :: proc(p: ^Pattern, object: cstring, n: i32, s: ^^Matrix) -> Result ---
	PatternGetCharSet     :: proc(p: ^Pattern, object: cstring, n: i32, _c: ^^Char_Set) -> Result ---
	PatternGetBool        :: proc(p: ^Pattern, object: cstring, n: i32, b: ^Bool) -> Result ---
	PatternGetLangSet     :: proc(p: ^Pattern, object: cstring, n: i32, ls: ^^Lang_Set) -> Result ---
	PatternGetRange       :: proc(p: ^Pattern, object: cstring, id: i32, r: ^^Range) -> Result ---
	PatternVaBuild        :: proc(p: ^Pattern, va: i32) -> ^Pattern ---
	PatternBuild          :: proc(p: ^Pattern, #c_vararg _: ..any) -> ^Pattern ---
	PatternFormat         :: proc(pat: ^Pattern, format: ^Char8) -> ^Char8 ---

	/* fcrange.c */
	RangeCreateDouble     :: proc(begin: f64, end: f64) -> ^Range ---
	RangeCreateInteger    :: proc(begin: Char32, end: Char32) -> ^Range ---
	RangeDestroy          :: proc(range: ^Range) ---
	RangeCopy             :: proc(r: ^Range) -> ^Range ---
	RangeGetDouble        :: proc(range: ^Range, begin: ^f64, end: ^f64) -> Bool ---
	PatternIterStart      :: proc(pat: ^Pattern, iter: ^Pattern_Iter) ---
	PatternIterNext       :: proc(pat: ^Pattern, iter: ^Pattern_Iter) -> Bool ---
	PatternIterEqual      :: proc(p1: ^Pattern, i1: ^Pattern_Iter, p2: ^Pattern, i2: ^Pattern_Iter) -> Bool ---
	PatternFindIter       :: proc(pat: ^Pattern, iter: ^Pattern_Iter, object: cstring) -> Bool ---
	PatternIterIsValid    :: proc(pat: ^Pattern, iter: ^Pattern_Iter) -> Bool ---
	PatternIterGetObject  :: proc(pat: ^Pattern, iter: ^Pattern_Iter) -> cstring ---
	PatternIterValueCount :: proc(pat: ^Pattern, iter: ^Pattern_Iter) -> i32 ---
	PatternIterGetValue   :: proc(pat: ^Pattern, iter: ^Pattern_Iter, id: i32, v: ^Value, b: ^Value_Binding) -> Result ---

	/* fcweight.c */
	WeightFromOpenType       :: proc(ot_weight: i32) -> i32 ---
	WeightFromOpenTypeDouble :: proc(ot_weight: f64) -> f64 ---
	WeightToOpenType         :: proc(fc_weight: i32) -> i32 ---
	WeightToOpenTypeDouble   :: proc(fc_weight: f64) -> f64 ---

	/* fcstr.c */
	StrCopy          :: proc(s: ^Char8) -> ^Char8 ---
	StrCopyFilename  :: proc(s: ^Char8) -> ^Char8 ---
	StrPlus          :: proc(s1: ^Char8, s2: ^Char8) -> ^Char8 ---
	StrFree          :: proc(s: ^Char8) ---
	StrDowncase      :: proc(s: ^Char8) -> ^Char8 ---
	StrCmpIgnoreCase :: proc(s1: ^Char8, s2: ^Char8) -> i32 ---
	StrCmp           :: proc(s1: ^Char8, s2: ^Char8) -> i32 ---
	StrStrIgnoreCase :: proc(s1: ^Char8, s2: ^Char8) -> ^Char8 ---
	StrStr           :: proc(s1: ^Char8, s2: ^Char8) -> ^Char8 ---
	Utf8ToUcs4       :: proc(src_orig: ^Char8, dst: ^Char32, len: i32) -> i32 ---
	Utf8Len          :: proc(_string: ^Char8, len: i32, nchar: ^i32, wchar: ^i32) -> Bool ---
}

UTF8_MAX_LEN :: 6

@(default_calling_convention="c", link_prefix="Fc")
foreign lib {
	Ucs4ToUtf8        :: proc(ucs4: Char32, dest: ^[6]Char8) -> i32 ---
	Utf16ToUcs4       :: proc(src_orig: ^Char8, endian: Endian, dst: ^Char32, len: i32) -> i32 ---
	Utf16Len          :: proc(_string: ^Char8, endian: Endian, len: i32, nchar: ^i32, wchar: ^i32) -> Bool ---
	StrBuildFilename  :: proc(path: ^Char8, #c_vararg _: ..any) -> ^Char8 ---
	StrDirname        :: proc(file: ^Char8) -> ^Char8 ---
	StrBasename       :: proc(file: ^Char8) -> ^Char8 ---
	StrSetCreate      :: proc() -> ^Str_Set ---
	StrSetMember      :: proc(set: ^Str_Set, s: ^Char8) -> Bool ---
	StrSetEqual       :: proc(sa: ^Str_Set, sb: ^Str_Set) -> Bool ---
	StrSetAdd         :: proc(set: ^Str_Set, s: ^Char8) -> Bool ---
	StrSetAddFilename :: proc(set: ^Str_Set, s: ^Char8) -> Bool ---
	StrSetDel         :: proc(set: ^Str_Set, s: ^Char8) -> Bool ---
	StrSetDestroy     :: proc(set: ^Str_Set) ---
	StrListCreate     :: proc(set: ^Str_Set) -> ^Str_List ---
	StrListFirst      :: proc(list: ^Str_List) ---
	StrListNext       :: proc(list: ^Str_List) -> ^Char8 ---
	StrListDone       :: proc(list: ^Str_List) ---

	/* fcxml.c */
	ConfigParseAndLoad           :: proc(config: ^Config, file: ^Char8, complain: Bool) -> Bool ---
	ConfigParseAndLoadFromMemory :: proc(config: ^Config, buffer: ^Char8, complain: Bool) -> Bool ---
}

