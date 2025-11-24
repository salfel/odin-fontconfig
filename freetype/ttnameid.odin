/****************************************************************************
 *
 * ttnameid.h
 *
 *   TrueType name ID definitions (specification only).
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
*   truetype_tables
*/


/**************************************************************************
*
* Possible values for the 'platform' identifier code in the name records
* of an SFNT 'name' table.
*
*/


/**************************************************************************
*
* @enum:
*   TT_PLATFORM_XXX
*
* @description:
*   A list of valid values for the `platform_id` identifier code in
*   @FT_CharMapRec and @FT_SfntName structures.
*
* @values:
*   TT_PLATFORM_APPLE_UNICODE ::
*     Used by Apple to indicate a Unicode character map and/or name entry.
*     See @TT_APPLE_ID_XXX for corresponding `encoding_id` values.  Note
*     that name entries in this format are coded as big-endian UCS-2
*     character codes _only_.
*
*   TT_PLATFORM_MACINTOSH ::
*     Used by Apple to indicate a MacOS-specific charmap and/or name
*     entry.  See @TT_MAC_ID_XXX for corresponding `encoding_id` values.
*     Note that most TrueType fonts contain an Apple roman charmap to be
*     usable on MacOS systems (even if they contain a Microsoft charmap as
*     well).
*
*   TT_PLATFORM_ISO ::
*     This value was used to specify ISO/IEC 10646 charmaps.  It is
*     however now deprecated.  See @TT_ISO_ID_XXX for a list of
*     corresponding `encoding_id` values.
*
*   TT_PLATFORM_MICROSOFT ::
*     Used by Microsoft to indicate Windows-specific charmaps.  See
*     @TT_MS_ID_XXX for a list of corresponding `encoding_id` values.
*     Note that most fonts contain a Unicode charmap using
*     (`TT_PLATFORM_MICROSOFT`, @TT_MS_ID_UNICODE_CS).
*
*   TT_PLATFORM_CUSTOM ::
*     Used to indicate application-specific charmaps.
*
*   TT_PLATFORM_ADOBE ::
*     This value isn't part of any font format specification, but is used
*     by FreeType to report Adobe-specific charmaps in an @FT_CharMapRec
*     structure.  See @TT_ADOBE_ID_XXX.
*/
TT_PLATFORM_APPLE_UNICODE  :: 0
TT_PLATFORM_MACINTOSH      :: 1
TT_PLATFORM_ISO            :: 2 /* deprecated */
TT_PLATFORM_MICROSOFT      :: 3
TT_PLATFORM_CUSTOM         :: 4
TT_PLATFORM_ADOBE          :: 7 /* artificial */

/**************************************************************************
*
* @enum:
*   TT_APPLE_ID_XXX
*
* @description:
*   A list of valid values for the `encoding_id` for
*   @TT_PLATFORM_APPLE_UNICODE charmaps and name entries.
*
* @values:
*   TT_APPLE_ID_DEFAULT ::
*     Unicode version 1.0.
*
*   TT_APPLE_ID_UNICODE_1_1 ::
*     Unicode 1.1; specifies Hangul characters starting at U+34xx.
*
*   TT_APPLE_ID_ISO_10646 ::
*     Deprecated (identical to preceding).
*
*   TT_APPLE_ID_UNICODE_2_0 ::
*     Unicode 2.0 and beyond (UTF-16 BMP only).
*
*   TT_APPLE_ID_UNICODE_32 ::
*     Unicode 3.1 and beyond, using UTF-32.
*
*   TT_APPLE_ID_VARIANT_SELECTOR ::
*     From Adobe, not Apple.  Not a normal cmap.  Specifies variations on
*     a real cmap.
*
*   TT_APPLE_ID_FULL_UNICODE ::
*     Used for fallback fonts that provide complete Unicode coverage with
*     a type~13 cmap.
*/
TT_APPLE_ID_DEFAULT           :: 0 /* Unicode 1.0                   */
TT_APPLE_ID_UNICODE_1_1       :: 1 /* specify Hangul at U+34xx      */
TT_APPLE_ID_ISO_10646         :: 2 /* deprecated                    */
TT_APPLE_ID_UNICODE_2_0       :: 3 /* or later                      */
TT_APPLE_ID_UNICODE_32        :: 4 /* 2.0 or later, full repertoire */
TT_APPLE_ID_VARIANT_SELECTOR  :: 5 /* variation selector data       */
TT_APPLE_ID_FULL_UNICODE      :: 6 /* used with type 13 cmaps       */

/**************************************************************************
*
* @enum:
*   TT_MAC_ID_XXX
*
* @description:
*   A list of valid values for the `encoding_id` for
*   @TT_PLATFORM_MACINTOSH charmaps and name entries.
*/
TT_MAC_ID_ROMAN                 :: 0
TT_MAC_ID_JAPANESE              :: 1
TT_MAC_ID_TRADITIONAL_CHINESE   :: 2
TT_MAC_ID_KOREAN                :: 3
TT_MAC_ID_ARABIC                :: 4
TT_MAC_ID_HEBREW                :: 5
TT_MAC_ID_GREEK                 :: 6
TT_MAC_ID_RUSSIAN               :: 7
TT_MAC_ID_RSYMBOL               :: 8
TT_MAC_ID_DEVANAGARI            :: 9
TT_MAC_ID_GURMUKHI             :: 10
TT_MAC_ID_GUJARATI             :: 11
TT_MAC_ID_ORIYA                :: 12
TT_MAC_ID_BENGALI              :: 13
TT_MAC_ID_TAMIL                :: 14
TT_MAC_ID_TELUGU               :: 15
TT_MAC_ID_KANNADA              :: 16
TT_MAC_ID_MALAYALAM            :: 17
TT_MAC_ID_SINHALESE            :: 18
TT_MAC_ID_BURMESE              :: 19
TT_MAC_ID_KHMER                :: 20
TT_MAC_ID_THAI                 :: 21
TT_MAC_ID_LAOTIAN              :: 22
TT_MAC_ID_GEORGIAN             :: 23
TT_MAC_ID_ARMENIAN             :: 24
TT_MAC_ID_MALDIVIAN            :: 25
TT_MAC_ID_SIMPLIFIED_CHINESE   :: 25
TT_MAC_ID_TIBETAN              :: 26
TT_MAC_ID_MONGOLIAN            :: 27
TT_MAC_ID_GEEZ                 :: 28
TT_MAC_ID_SLAVIC               :: 29
TT_MAC_ID_VIETNAMESE           :: 30
TT_MAC_ID_SINDHI               :: 31
TT_MAC_ID_UNINTERP             :: 32

/**************************************************************************
*
* @enum:
*   TT_ISO_ID_XXX
*
* @description:
*   A list of valid values for the `encoding_id` for @TT_PLATFORM_ISO
*   charmaps and name entries.
*
*   Their use is now deprecated.
*
* @values:
*   TT_ISO_ID_7BIT_ASCII ::
*     ASCII.
*   TT_ISO_ID_10646 ::
*     ISO/10646.
*   TT_ISO_ID_8859_1 ::
*     Also known as Latin-1.
*/
TT_ISO_ID_7BIT_ASCII  :: 0
TT_ISO_ID_10646       :: 1
TT_ISO_ID_8859_1      :: 2

/**************************************************************************
*
* @enum:
*   TT_MS_ID_XXX
*
* @description:
*   A list of valid values for the `encoding_id` for
*   @TT_PLATFORM_MICROSOFT charmaps and name entries.
*
* @values:
*   TT_MS_ID_SYMBOL_CS ::
*     Microsoft symbol encoding.  See @FT_ENCODING_MS_SYMBOL.
*
*   TT_MS_ID_UNICODE_CS ::
*     Microsoft WGL4 charmap, matching Unicode.  See @FT_ENCODING_UNICODE.
*
*   TT_MS_ID_SJIS ::
*     Shift JIS Japanese encoding.  See @FT_ENCODING_SJIS.
*
*   TT_MS_ID_PRC ::
*     Chinese encodings as used in the People's Republic of China (PRC).
*     This means the encodings GB~2312 and its supersets GBK and GB~18030.
*     See @FT_ENCODING_PRC.
*
*   TT_MS_ID_BIG_5 ::
*     Traditional Chinese as used in Taiwan and Hong Kong.  See
*     @FT_ENCODING_BIG5.
*
*   TT_MS_ID_WANSUNG ::
*     Korean Extended Wansung encoding.  See @FT_ENCODING_WANSUNG.
*
*   TT_MS_ID_JOHAB ::
*     Korean Johab encoding.  See @FT_ENCODING_JOHAB.
*
*   TT_MS_ID_UCS_4 ::
*     UCS-4 or UTF-32 charmaps.  This has been added to the OpenType
*     specification version 1.4 (mid-2001).
*/
TT_MS_ID_SYMBOL_CS    :: 0
TT_MS_ID_UNICODE_CS   :: 1
TT_MS_ID_SJIS         :: 2
TT_MS_ID_PRC          :: 3
TT_MS_ID_BIG_5        :: 4
TT_MS_ID_WANSUNG      :: 5
TT_MS_ID_JOHAB        :: 6
TT_MS_ID_UCS_4       :: 10

/* this value is deprecated */
TT_MS_ID_GB2312  :: TT_MS_ID_PRC

/**************************************************************************
*
* @enum:
*   TT_ADOBE_ID_XXX
*
* @description:
*   A list of valid values for the `encoding_id` for @TT_PLATFORM_ADOBE
*   charmaps.  This is a FreeType-specific extension!
*
* @values:
*   TT_ADOBE_ID_STANDARD ::
*     Adobe standard encoding.
*   TT_ADOBE_ID_EXPERT ::
*     Adobe expert encoding.
*   TT_ADOBE_ID_CUSTOM ::
*     Adobe custom encoding.
*   TT_ADOBE_ID_LATIN_1 ::
*     Adobe Latin~1 encoding.
*/
TT_ADOBE_ID_STANDARD  :: 0
TT_ADOBE_ID_EXPERT    :: 1
TT_ADOBE_ID_CUSTOM    :: 2
TT_ADOBE_ID_LATIN_1   :: 3

/**************************************************************************
*
* @enum:
*   TT_MAC_LANGID_XXX
*
* @description:
*   Possible values of the language identifier field in the name records
*   of the SFNT 'name' table if the 'platform' identifier code is
*   @TT_PLATFORM_MACINTOSH.  These values are also used as return values
*   for function @FT_Get_CMap_Language_ID.
*
*   The canonical source for Apple's IDs is
*
*     https://developer.apple.com/fonts/TrueType-Reference-Manual/RM06/Chap6name.html
*/
TT_MAC_LANGID_ENGLISH                       :: 0
TT_MAC_LANGID_FRENCH                        :: 1
TT_MAC_LANGID_GERMAN                        :: 2
TT_MAC_LANGID_ITALIAN                       :: 3
TT_MAC_LANGID_DUTCH                         :: 4
TT_MAC_LANGID_SWEDISH                       :: 5
TT_MAC_LANGID_SPANISH                       :: 6
TT_MAC_LANGID_DANISH                        :: 7
TT_MAC_LANGID_PORTUGUESE                    :: 8
TT_MAC_LANGID_NORWEGIAN                     :: 9
TT_MAC_LANGID_HEBREW                       :: 10
TT_MAC_LANGID_JAPANESE                     :: 11
TT_MAC_LANGID_ARABIC                       :: 12
TT_MAC_LANGID_FINNISH                      :: 13
TT_MAC_LANGID_GREEK                        :: 14
TT_MAC_LANGID_ICELANDIC                    :: 15
TT_MAC_LANGID_MALTESE                      :: 16
TT_MAC_LANGID_TURKISH                      :: 17
TT_MAC_LANGID_CROATIAN                     :: 18
TT_MAC_LANGID_CHINESE_TRADITIONAL          :: 19
TT_MAC_LANGID_URDU                         :: 20
TT_MAC_LANGID_HINDI                        :: 21
TT_MAC_LANGID_THAI                         :: 22
TT_MAC_LANGID_KOREAN                       :: 23
TT_MAC_LANGID_LITHUANIAN                   :: 24
TT_MAC_LANGID_POLISH                       :: 25
TT_MAC_LANGID_HUNGARIAN                    :: 26
TT_MAC_LANGID_ESTONIAN                     :: 27
TT_MAC_LANGID_LETTISH                      :: 28
TT_MAC_LANGID_SAAMISK                      :: 29
TT_MAC_LANGID_FAEROESE                     :: 30
TT_MAC_LANGID_FARSI                        :: 31
TT_MAC_LANGID_RUSSIAN                      :: 32
TT_MAC_LANGID_CHINESE_SIMPLIFIED           :: 33
TT_MAC_LANGID_FLEMISH                      :: 34
TT_MAC_LANGID_IRISH                        :: 35
TT_MAC_LANGID_ALBANIAN                     :: 36
TT_MAC_LANGID_ROMANIAN                     :: 37
TT_MAC_LANGID_CZECH                        :: 38
TT_MAC_LANGID_SLOVAK                       :: 39
TT_MAC_LANGID_SLOVENIAN                    :: 40
TT_MAC_LANGID_YIDDISH                      :: 41
TT_MAC_LANGID_SERBIAN                      :: 42
TT_MAC_LANGID_MACEDONIAN                   :: 43
TT_MAC_LANGID_BULGARIAN                    :: 44
TT_MAC_LANGID_UKRAINIAN                    :: 45
TT_MAC_LANGID_BYELORUSSIAN                 :: 46
TT_MAC_LANGID_UZBEK                        :: 47
TT_MAC_LANGID_KAZAKH                       :: 48
TT_MAC_LANGID_AZERBAIJANI                  :: 49
TT_MAC_LANGID_AZERBAIJANI_CYRILLIC_SCRIPT  :: 49
TT_MAC_LANGID_AZERBAIJANI_ARABIC_SCRIPT    :: 50
TT_MAC_LANGID_ARMENIAN                     :: 51
TT_MAC_LANGID_GEORGIAN                     :: 52
TT_MAC_LANGID_MOLDAVIAN                    :: 53
TT_MAC_LANGID_KIRGHIZ                      :: 54
TT_MAC_LANGID_TAJIKI                       :: 55
TT_MAC_LANGID_TURKMEN                      :: 56
TT_MAC_LANGID_MONGOLIAN                    :: 57
TT_MAC_LANGID_MONGOLIAN_MONGOLIAN_SCRIPT   :: 57
TT_MAC_LANGID_MONGOLIAN_CYRILLIC_SCRIPT    :: 58
TT_MAC_LANGID_PASHTO                       :: 59
TT_MAC_LANGID_KURDISH                      :: 60
TT_MAC_LANGID_KASHMIRI                     :: 61
TT_MAC_LANGID_SINDHI                       :: 62
TT_MAC_LANGID_TIBETAN                      :: 63
TT_MAC_LANGID_NEPALI                       :: 64
TT_MAC_LANGID_SANSKRIT                     :: 65
TT_MAC_LANGID_MARATHI                      :: 66
TT_MAC_LANGID_BENGALI                      :: 67
TT_MAC_LANGID_ASSAMESE                     :: 68
TT_MAC_LANGID_GUJARATI                     :: 69
TT_MAC_LANGID_PUNJABI                      :: 70
TT_MAC_LANGID_ORIYA                        :: 71
TT_MAC_LANGID_MALAYALAM                    :: 72
TT_MAC_LANGID_KANNADA                      :: 73
TT_MAC_LANGID_TAMIL                        :: 74
TT_MAC_LANGID_TELUGU                       :: 75
TT_MAC_LANGID_SINHALESE                    :: 76
TT_MAC_LANGID_BURMESE                      :: 77
TT_MAC_LANGID_KHMER                        :: 78
TT_MAC_LANGID_LAO                          :: 79
TT_MAC_LANGID_VIETNAMESE                   :: 80
TT_MAC_LANGID_INDONESIAN                   :: 81
TT_MAC_LANGID_TAGALOG                      :: 82
TT_MAC_LANGID_MALAY_ROMAN_SCRIPT           :: 83
TT_MAC_LANGID_MALAY_ARABIC_SCRIPT          :: 84
TT_MAC_LANGID_AMHARIC                      :: 85
TT_MAC_LANGID_TIGRINYA                     :: 86
TT_MAC_LANGID_GALLA                        :: 87
TT_MAC_LANGID_SOMALI                       :: 88
TT_MAC_LANGID_SWAHILI                      :: 89
TT_MAC_LANGID_RUANDA                       :: 90
TT_MAC_LANGID_RUNDI                        :: 91
TT_MAC_LANGID_CHEWA                        :: 92
TT_MAC_LANGID_MALAGASY                     :: 93
TT_MAC_LANGID_ESPERANTO                    :: 94
TT_MAC_LANGID_WELSH                       :: 128
TT_MAC_LANGID_BASQUE                      :: 129
TT_MAC_LANGID_CATALAN                     :: 130
TT_MAC_LANGID_LATIN                       :: 131
TT_MAC_LANGID_QUECHUA                     :: 132
TT_MAC_LANGID_GUARANI                     :: 133
TT_MAC_LANGID_AYMARA                      :: 134
TT_MAC_LANGID_TATAR                       :: 135
TT_MAC_LANGID_UIGHUR                      :: 136
TT_MAC_LANGID_DZONGKHA                    :: 137
TT_MAC_LANGID_JAVANESE                    :: 138
TT_MAC_LANGID_SUNDANESE                   :: 139

/* The following codes are new as of 2000-03-10 */
TT_MAC_LANGID_GALICIAN                    :: 140
TT_MAC_LANGID_AFRIKAANS                   :: 141
TT_MAC_LANGID_BRETON                      :: 142
TT_MAC_LANGID_INUKTITUT                   :: 143
TT_MAC_LANGID_SCOTTISH_GAELIC             :: 144
TT_MAC_LANGID_MANX_GAELIC                 :: 145
TT_MAC_LANGID_IRISH_GAELIC                :: 146
TT_MAC_LANGID_TONGAN                      :: 147
TT_MAC_LANGID_GREEK_POLYTONIC             :: 148
TT_MAC_LANGID_GREELANDIC                  :: 149
TT_MAC_LANGID_AZERBAIJANI_ROMAN_SCRIPT    :: 150

/**************************************************************************
*
* @enum:
*   TT_MS_LANGID_XXX
*
* @description:
*   Possible values of the language identifier field in the name records
*   of the SFNT 'name' table if the 'platform' identifier code is
*   @TT_PLATFORM_MICROSOFT.  These values are also used as return values
*   for function @FT_Get_CMap_Language_ID.
*
*   The canonical source for Microsoft's IDs is
*
*     https://learn.microsoft.com/windows/win32/intl/language-identifier-constants-and-strings ,
*
*   however, we only provide macros for language identifiers present in
*   the OpenType specification: Microsoft has abandoned the concept of
*   LCIDs (language code identifiers), and format~1 of the 'name' table
*   provides a better mechanism for languages not covered here.
*
*   More legacy values not listed in the reference can be found in the
*   @FT_TRUETYPE_IDS_H header file.
*/
TT_MS_LANGID_ARABIC_SAUDI_ARABIA               :: 0x0401
TT_MS_LANGID_ARABIC_IRAQ                       :: 0x0801
TT_MS_LANGID_ARABIC_EGYPT                      :: 0x0C01
TT_MS_LANGID_ARABIC_LIBYA                      :: 0x1001
TT_MS_LANGID_ARABIC_ALGERIA                    :: 0x1401
TT_MS_LANGID_ARABIC_MOROCCO                    :: 0x1801
TT_MS_LANGID_ARABIC_TUNISIA                    :: 0x1C01
TT_MS_LANGID_ARABIC_OMAN                       :: 0x2001
TT_MS_LANGID_ARABIC_YEMEN                      :: 0x2401
TT_MS_LANGID_ARABIC_SYRIA                      :: 0x2801
TT_MS_LANGID_ARABIC_JORDAN                     :: 0x2C01
TT_MS_LANGID_ARABIC_LEBANON                    :: 0x3001
TT_MS_LANGID_ARABIC_KUWAIT                     :: 0x3401
TT_MS_LANGID_ARABIC_UAE                        :: 0x3801
TT_MS_LANGID_ARABIC_BAHRAIN                    :: 0x3C01
TT_MS_LANGID_ARABIC_QATAR                      :: 0x4001
TT_MS_LANGID_BULGARIAN_BULGARIA                :: 0x0402
TT_MS_LANGID_CATALAN_CATALAN                   :: 0x0403
TT_MS_LANGID_CHINESE_TAIWAN                    :: 0x0404
TT_MS_LANGID_CHINESE_PRC                       :: 0x0804
TT_MS_LANGID_CHINESE_HONG_KONG                 :: 0x0C04
TT_MS_LANGID_CHINESE_SINGAPORE                 :: 0x1004
TT_MS_LANGID_CHINESE_MACAO                     :: 0x1404
TT_MS_LANGID_CZECH_CZECH_REPUBLIC              :: 0x0405
TT_MS_LANGID_DANISH_DENMARK                    :: 0x0406
TT_MS_LANGID_GERMAN_GERMANY                    :: 0x0407
TT_MS_LANGID_GERMAN_SWITZERLAND                :: 0x0807
TT_MS_LANGID_GERMAN_AUSTRIA                    :: 0x0C07
TT_MS_LANGID_GERMAN_LUXEMBOURG                 :: 0x1007
TT_MS_LANGID_GERMAN_LIECHTENSTEIN              :: 0x1407
TT_MS_LANGID_GREEK_GREECE                      :: 0x0408
TT_MS_LANGID_ENGLISH_UNITED_STATES             :: 0x0409
TT_MS_LANGID_ENGLISH_UNITED_KINGDOM            :: 0x0809
TT_MS_LANGID_ENGLISH_AUSTRALIA                 :: 0x0C09
TT_MS_LANGID_ENGLISH_CANADA                    :: 0x1009
TT_MS_LANGID_ENGLISH_NEW_ZEALAND               :: 0x1409
TT_MS_LANGID_ENGLISH_IRELAND                   :: 0x1809
TT_MS_LANGID_ENGLISH_SOUTH_AFRICA              :: 0x1C09
TT_MS_LANGID_ENGLISH_JAMAICA                   :: 0x2009
TT_MS_LANGID_ENGLISH_CARIBBEAN                 :: 0x2409
TT_MS_LANGID_ENGLISH_BELIZE                    :: 0x2809
TT_MS_LANGID_ENGLISH_TRINIDAD                  :: 0x2C09
TT_MS_LANGID_ENGLISH_ZIMBABWE                  :: 0x3009
TT_MS_LANGID_ENGLISH_PHILIPPINES               :: 0x3409
TT_MS_LANGID_ENGLISH_INDIA                     :: 0x4009
TT_MS_LANGID_ENGLISH_MALAYSIA                  :: 0x4409
TT_MS_LANGID_ENGLISH_SINGAPORE                 :: 0x4809
TT_MS_LANGID_SPANISH_SPAIN_TRADITIONAL_SORT    :: 0x040A
TT_MS_LANGID_SPANISH_MEXICO                    :: 0x080A
TT_MS_LANGID_SPANISH_SPAIN_MODERN_SORT         :: 0x0C0A
TT_MS_LANGID_SPANISH_GUATEMALA                 :: 0x100A
TT_MS_LANGID_SPANISH_COSTA_RICA                :: 0x140A
TT_MS_LANGID_SPANISH_PANAMA                    :: 0x180A
TT_MS_LANGID_SPANISH_DOMINICAN_REPUBLIC        :: 0x1C0A
TT_MS_LANGID_SPANISH_VENEZUELA                 :: 0x200A
TT_MS_LANGID_SPANISH_COLOMBIA                  :: 0x240A
TT_MS_LANGID_SPANISH_PERU                      :: 0x280A
TT_MS_LANGID_SPANISH_ARGENTINA                 :: 0x2C0A
TT_MS_LANGID_SPANISH_ECUADOR                   :: 0x300A
TT_MS_LANGID_SPANISH_CHILE                     :: 0x340A
TT_MS_LANGID_SPANISH_URUGUAY                   :: 0x380A
TT_MS_LANGID_SPANISH_PARAGUAY                  :: 0x3C0A
TT_MS_LANGID_SPANISH_BOLIVIA                   :: 0x400A
TT_MS_LANGID_SPANISH_EL_SALVADOR               :: 0x440A
TT_MS_LANGID_SPANISH_HONDURAS                  :: 0x480A
TT_MS_LANGID_SPANISH_NICARAGUA                 :: 0x4C0A
TT_MS_LANGID_SPANISH_PUERTO_RICO               :: 0x500A
TT_MS_LANGID_SPANISH_UNITED_STATES             :: 0x540A
TT_MS_LANGID_FINNISH_FINLAND                   :: 0x040B
TT_MS_LANGID_FRENCH_FRANCE                     :: 0x040C
TT_MS_LANGID_FRENCH_BELGIUM                    :: 0x080C
TT_MS_LANGID_FRENCH_CANADA                     :: 0x0C0C
TT_MS_LANGID_FRENCH_SWITZERLAND                :: 0x100C
TT_MS_LANGID_FRENCH_LUXEMBOURG                 :: 0x140C
TT_MS_LANGID_FRENCH_MONACO                     :: 0x180C
TT_MS_LANGID_HEBREW_ISRAEL                     :: 0x040D
TT_MS_LANGID_HUNGARIAN_HUNGARY                 :: 0x040E
TT_MS_LANGID_ICELANDIC_ICELAND                 :: 0x040F
TT_MS_LANGID_ITALIAN_ITALY                     :: 0x0410
TT_MS_LANGID_ITALIAN_SWITZERLAND               :: 0x0810
TT_MS_LANGID_JAPANESE_JAPAN                    :: 0x0411
TT_MS_LANGID_KOREAN_KOREA                      :: 0x0412
TT_MS_LANGID_DUTCH_NETHERLANDS                 :: 0x0413
TT_MS_LANGID_DUTCH_BELGIUM                     :: 0x0813
TT_MS_LANGID_NORWEGIAN_NORWAY_BOKMAL           :: 0x0414
TT_MS_LANGID_NORWEGIAN_NORWAY_NYNORSK          :: 0x0814
TT_MS_LANGID_POLISH_POLAND                     :: 0x0415
TT_MS_LANGID_PORTUGUESE_BRAZIL                 :: 0x0416
TT_MS_LANGID_PORTUGUESE_PORTUGAL               :: 0x0816
TT_MS_LANGID_ROMANSH_SWITZERLAND               :: 0x0417
TT_MS_LANGID_ROMANIAN_ROMANIA                  :: 0x0418
TT_MS_LANGID_RUSSIAN_RUSSIA                    :: 0x0419
TT_MS_LANGID_CROATIAN_CROATIA                  :: 0x041A
TT_MS_LANGID_SERBIAN_SERBIA_LATIN              :: 0x081A
TT_MS_LANGID_SERBIAN_SERBIA_CYRILLIC           :: 0x0C1A
TT_MS_LANGID_CROATIAN_BOSNIA_HERZEGOVINA       :: 0x101A
TT_MS_LANGID_BOSNIAN_BOSNIA_HERZEGOVINA        :: 0x141A
TT_MS_LANGID_SERBIAN_BOSNIA_HERZ_LATIN         :: 0x181A
TT_MS_LANGID_SERBIAN_BOSNIA_HERZ_CYRILLIC      :: 0x1C1A
TT_MS_LANGID_BOSNIAN_BOSNIA_HERZ_CYRILLIC      :: 0x201A
TT_MS_LANGID_SLOVAK_SLOVAKIA                   :: 0x041B
TT_MS_LANGID_ALBANIAN_ALBANIA                  :: 0x041C
TT_MS_LANGID_SWEDISH_SWEDEN                    :: 0x041D
TT_MS_LANGID_SWEDISH_FINLAND                   :: 0x081D
TT_MS_LANGID_THAI_THAILAND                     :: 0x041E
TT_MS_LANGID_TURKISH_TURKEY                    :: 0x041F
TT_MS_LANGID_URDU_PAKISTAN                     :: 0x0420
TT_MS_LANGID_INDONESIAN_INDONESIA              :: 0x0421
TT_MS_LANGID_UKRAINIAN_UKRAINE                 :: 0x0422
TT_MS_LANGID_BELARUSIAN_BELARUS                :: 0x0423
TT_MS_LANGID_SLOVENIAN_SLOVENIA                :: 0x0424
TT_MS_LANGID_ESTONIAN_ESTONIA                  :: 0x0425
TT_MS_LANGID_LATVIAN_LATVIA                    :: 0x0426
TT_MS_LANGID_LITHUANIAN_LITHUANIA              :: 0x0427
TT_MS_LANGID_TAJIK_TAJIKISTAN                  :: 0x0428
TT_MS_LANGID_VIETNAMESE_VIET_NAM               :: 0x042A
TT_MS_LANGID_ARMENIAN_ARMENIA                  :: 0x042B
TT_MS_LANGID_AZERI_AZERBAIJAN_LATIN            :: 0x042C
TT_MS_LANGID_AZERI_AZERBAIJAN_CYRILLIC         :: 0x082C
TT_MS_LANGID_BASQUE_BASQUE                     :: 0x042D
TT_MS_LANGID_UPPER_SORBIAN_GERMANY             :: 0x042E
TT_MS_LANGID_LOWER_SORBIAN_GERMANY             :: 0x082E
TT_MS_LANGID_MACEDONIAN_MACEDONIA              :: 0x042F
TT_MS_LANGID_SETSWANA_SOUTH_AFRICA             :: 0x0432
TT_MS_LANGID_ISIXHOSA_SOUTH_AFRICA             :: 0x0434
TT_MS_LANGID_ISIZULU_SOUTH_AFRICA              :: 0x0435
TT_MS_LANGID_AFRIKAANS_SOUTH_AFRICA            :: 0x0436
TT_MS_LANGID_GEORGIAN_GEORGIA                  :: 0x0437
TT_MS_LANGID_FAEROESE_FAEROE_ISLANDS           :: 0x0438
TT_MS_LANGID_HINDI_INDIA                       :: 0x0439
TT_MS_LANGID_MALTESE_MALTA                     :: 0x043A
TT_MS_LANGID_SAMI_NORTHERN_NORWAY              :: 0x043B
TT_MS_LANGID_SAMI_NORTHERN_SWEDEN              :: 0x083B
TT_MS_LANGID_SAMI_NORTHERN_FINLAND             :: 0x0C3B
TT_MS_LANGID_SAMI_LULE_NORWAY                  :: 0x103B
TT_MS_LANGID_SAMI_LULE_SWEDEN                  :: 0x143B
TT_MS_LANGID_SAMI_SOUTHERN_NORWAY              :: 0x183B
TT_MS_LANGID_SAMI_SOUTHERN_SWEDEN              :: 0x1C3B
TT_MS_LANGID_SAMI_SKOLT_FINLAND                :: 0x203B
TT_MS_LANGID_SAMI_INARI_FINLAND                :: 0x243B
TT_MS_LANGID_IRISH_IRELAND                     :: 0x083C
TT_MS_LANGID_MALAY_MALAYSIA                    :: 0x043E
TT_MS_LANGID_MALAY_BRUNEI_DARUSSALAM           :: 0x083E
TT_MS_LANGID_KAZAKH_KAZAKHSTAN                 :: 0x043F
TT_MS_LANGID_KYRGYZ_KYRGYZSTAN              :: 0x0440 /* Cyrillic */
TT_MS_LANGID_KISWAHILI_KENYA                   :: 0x0441
TT_MS_LANGID_TURKMEN_TURKMENISTAN              :: 0x0442
TT_MS_LANGID_UZBEK_UZBEKISTAN_LATIN            :: 0x0443
TT_MS_LANGID_UZBEK_UZBEKISTAN_CYRILLIC         :: 0x0843
TT_MS_LANGID_TATAR_RUSSIA                      :: 0x0444
TT_MS_LANGID_BENGALI_INDIA                     :: 0x0445
TT_MS_LANGID_BENGALI_BANGLADESH                :: 0x0845
TT_MS_LANGID_PUNJABI_INDIA                     :: 0x0446
TT_MS_LANGID_GUJARATI_INDIA                    :: 0x0447
TT_MS_LANGID_ODIA_INDIA                        :: 0x0448
TT_MS_LANGID_TAMIL_INDIA                       :: 0x0449
TT_MS_LANGID_TELUGU_INDIA                      :: 0x044A
TT_MS_LANGID_KANNADA_INDIA                     :: 0x044B
TT_MS_LANGID_MALAYALAM_INDIA                   :: 0x044C
TT_MS_LANGID_ASSAMESE_INDIA                    :: 0x044D
TT_MS_LANGID_MARATHI_INDIA                     :: 0x044E
TT_MS_LANGID_SANSKRIT_INDIA                    :: 0x044F
TT_MS_LANGID_MONGOLIAN_MONGOLIA             :: 0x0450 /* Cyrillic */
TT_MS_LANGID_MONGOLIAN_PRC                     :: 0x0850
TT_MS_LANGID_TIBETAN_PRC                       :: 0x0451
TT_MS_LANGID_WELSH_UNITED_KINGDOM              :: 0x0452
TT_MS_LANGID_KHMER_CAMBODIA                    :: 0x0453
TT_MS_LANGID_LAO_LAOS                          :: 0x0454
TT_MS_LANGID_GALICIAN_GALICIAN                 :: 0x0456
TT_MS_LANGID_KONKANI_INDIA                     :: 0x0457
TT_MS_LANGID_SYRIAC_SYRIA                      :: 0x045A
TT_MS_LANGID_SINHALA_SRI_LANKA                 :: 0x045B
TT_MS_LANGID_INUKTITUT_CANADA                  :: 0x045D
TT_MS_LANGID_INUKTITUT_CANADA_LATIN            :: 0x085D
TT_MS_LANGID_AMHARIC_ETHIOPIA                  :: 0x045E
TT_MS_LANGID_TAMAZIGHT_ALGERIA                 :: 0x085F
TT_MS_LANGID_NEPALI_NEPAL                      :: 0x0461
TT_MS_LANGID_FRISIAN_NETHERLANDS               :: 0x0462
TT_MS_LANGID_PASHTO_AFGHANISTAN                :: 0x0463
TT_MS_LANGID_FILIPINO_PHILIPPINES              :: 0x0464
TT_MS_LANGID_DHIVEHI_MALDIVES                  :: 0x0465
TT_MS_LANGID_HAUSA_NIGERIA                     :: 0x0468
TT_MS_LANGID_YORUBA_NIGERIA                    :: 0x046A
TT_MS_LANGID_QUECHUA_BOLIVIA                   :: 0x046B
TT_MS_LANGID_QUECHUA_ECUADOR                   :: 0x086B
TT_MS_LANGID_QUECHUA_PERU                      :: 0x0C6B
TT_MS_LANGID_SESOTHO_SA_LEBOA_SOUTH_AFRICA     :: 0x046C
TT_MS_LANGID_BASHKIR_RUSSIA                    :: 0x046D
TT_MS_LANGID_LUXEMBOURGISH_LUXEMBOURG          :: 0x046E
TT_MS_LANGID_GREENLANDIC_GREENLAND             :: 0x046F
TT_MS_LANGID_IGBO_NIGERIA                      :: 0x0470
TT_MS_LANGID_YI_PRC                            :: 0x0478
TT_MS_LANGID_MAPUDUNGUN_CHILE                  :: 0x047A
TT_MS_LANGID_MOHAWK_MOHAWK                     :: 0x047C
TT_MS_LANGID_BRETON_FRANCE                     :: 0x047E
TT_MS_LANGID_UIGHUR_PRC                        :: 0x0480
TT_MS_LANGID_MAORI_NEW_ZEALAND                 :: 0x0481
TT_MS_LANGID_OCCITAN_FRANCE                    :: 0x0482
TT_MS_LANGID_CORSICAN_FRANCE                   :: 0x0483
TT_MS_LANGID_ALSATIAN_FRANCE                   :: 0x0484
TT_MS_LANGID_YAKUT_RUSSIA                      :: 0x0485
TT_MS_LANGID_KICHE_GUATEMALA                   :: 0x0486
TT_MS_LANGID_KINYARWANDA_RWANDA                :: 0x0487
TT_MS_LANGID_WOLOF_SENEGAL                     :: 0x0488
TT_MS_LANGID_DARI_AFGHANISTAN                  :: 0x048C

/* */


/* legacy macro definitions not present in OpenType 1.8.1 */
TT_MS_LANGID_ARABIC_GENERAL                    :: 0x0001
TT_MS_LANGID_CATALAN_SPAIN                    :: TT_MS_LANGID_CATALAN_CATALAN
TT_MS_LANGID_CHINESE_GENERAL                   :: 0x0004
TT_MS_LANGID_CHINESE_MACAU                    :: TT_MS_LANGID_CHINESE_MACAO
TT_MS_LANGID_GERMAN_LIECHTENSTEI              :: TT_MS_LANGID_GERMAN_LIECHTENSTEIN
TT_MS_LANGID_ENGLISH_GENERAL                   :: 0x0009
TT_MS_LANGID_ENGLISH_INDONESIA                 :: 0x3809
TT_MS_LANGID_ENGLISH_HONG_KONG                 :: 0x3C09
TT_MS_LANGID_SPANISH_SPAIN_INTERNATIONAL_SORT :: TT_MS_LANGID_SPANISH_SPAIN_MODERN_SORT
TT_MS_LANGID_SPANISH_LATIN_AMERICA             :: 0xE40A
TT_MS_LANGID_FRENCH_WEST_INDIES                :: 0x1C0C
TT_MS_LANGID_FRENCH_REUNION                    :: 0x200C
TT_MS_LANGID_FRENCH_CONGO                      :: 0x240C

/* which was formerly: */
TT_MS_LANGID_FRENCH_ZAIRE                  :: TT_MS_LANGID_FRENCH_CONGO
TT_MS_LANGID_FRENCH_SENEGAL                    :: 0x280C
TT_MS_LANGID_FRENCH_CAMEROON                   :: 0x2C0C
TT_MS_LANGID_FRENCH_COTE_D_IVOIRE              :: 0x300C
TT_MS_LANGID_FRENCH_MALI                       :: 0x340C
TT_MS_LANGID_FRENCH_MOROCCO                    :: 0x380C
TT_MS_LANGID_FRENCH_HAITI                      :: 0x3C0C
TT_MS_LANGID_FRENCH_NORTH_AFRICA               :: 0xE40C
TT_MS_LANGID_KOREAN_EXTENDED_WANSUNG_KOREA :: TT_MS_LANGID_KOREAN_KOREA
TT_MS_LANGID_KOREAN_JOHAB_KOREA                :: 0x0812
TT_MS_LANGID_RHAETO_ROMANIC_SWITZERLAND    :: TT_MS_LANGID_ROMANSH_SWITZERLAND
TT_MS_LANGID_MOLDAVIAN_MOLDAVIA                :: 0x0818
TT_MS_LANGID_RUSSIAN_MOLDAVIA                  :: 0x0819
TT_MS_LANGID_URDU_INDIA                        :: 0x0820
TT_MS_LANGID_CLASSIC_LITHUANIAN_LITHUANIA      :: 0x0827
TT_MS_LANGID_SLOVENE_SLOVENIA              :: TT_MS_LANGID_SLOVENIAN_SLOVENIA
TT_MS_LANGID_FARSI_IRAN                        :: 0x0429
TT_MS_LANGID_BASQUE_SPAIN                  :: TT_MS_LANGID_BASQUE_BASQUE
TT_MS_LANGID_SORBIAN_GERMANY               :: TT_MS_LANGID_UPPER_SORBIAN_GERMANY
TT_MS_LANGID_SUTU_SOUTH_AFRICA                 :: 0x0430
TT_MS_LANGID_TSONGA_SOUTH_AFRICA               :: 0x0431
TT_MS_LANGID_TSWANA_SOUTH_AFRICA           :: TT_MS_LANGID_SETSWANA_SOUTH_AFRICA
TT_MS_LANGID_VENDA_SOUTH_AFRICA                :: 0x0433
TT_MS_LANGID_XHOSA_SOUTH_AFRICA            :: TT_MS_LANGID_ISIXHOSA_SOUTH_AFRICA
TT_MS_LANGID_ZULU_SOUTH_AFRICA             :: TT_MS_LANGID_ISIZULU_SOUTH_AFRICA
TT_MS_LANGID_SAAMI_LAPONIA                     :: 0x043B

/* the next two values are incorrectly inverted */
TT_MS_LANGID_IRISH_GAELIC_IRELAND              :: 0x043C
TT_MS_LANGID_SCOTTISH_GAELIC_UNITED_KINGDOM    :: 0x083C
TT_MS_LANGID_YIDDISH_GERMANY                   :: 0x043D
TT_MS_LANGID_KAZAK_KAZAKSTAN                 :: TT_MS_LANGID_KAZAKH_KAZAKHSTAN
TT_MS_LANGID_KIRGHIZ_KIRGHIZ_REPUBLIC        :: TT_MS_LANGID_KYRGYZ_KYRGYZSTAN
TT_MS_LANGID_KIRGHIZ_KIRGHIZSTAN             :: TT_MS_LANGID_KYRGYZ_KYRGYZSTAN
TT_MS_LANGID_SWAHILI_KENYA                   :: TT_MS_LANGID_KISWAHILI_KENYA
TT_MS_LANGID_TATAR_TATARSTAN                 :: TT_MS_LANGID_TATAR_RUSSIA
TT_MS_LANGID_PUNJABI_ARABIC_PAKISTAN           :: 0x0846
TT_MS_LANGID_ORIYA_INDIA                     :: TT_MS_LANGID_ODIA_INDIA
TT_MS_LANGID_MONGOLIAN_MONGOLIA_MONGOLIAN    :: TT_MS_LANGID_MONGOLIAN_PRC
TT_MS_LANGID_TIBETAN_CHINA                   :: TT_MS_LANGID_TIBETAN_PRC
TT_MS_LANGID_DZONGHKA_BHUTAN                   :: 0x0851
TT_MS_LANGID_TIBETAN_BHUTAN                  :: TT_MS_LANGID_DZONGHKA_BHUTAN
TT_MS_LANGID_WELSH_WALES                     :: TT_MS_LANGID_WELSH_UNITED_KINGDOM
TT_MS_LANGID_BURMESE_MYANMAR                   :: 0x0455
TT_MS_LANGID_GALICIAN_SPAIN                  :: TT_MS_LANGID_GALICIAN_GALICIAN
TT_MS_LANGID_MANIPURI_INDIA                  :: 0x0458  /* Bengali */
TT_MS_LANGID_SINDHI_INDIA                    :: 0x0459 /* Arabic */
TT_MS_LANGID_SINDHI_PAKISTAN                   :: 0x0859
TT_MS_LANGID_SINHALESE_SRI_LANKA             :: TT_MS_LANGID_SINHALA_SRI_LANKA
TT_MS_LANGID_CHEROKEE_UNITED_STATES            :: 0x045C
TT_MS_LANGID_TAMAZIGHT_MOROCCO               :: 0x045F /* Arabic */
TT_MS_LANGID_TAMAZIGHT_MOROCCO_LATIN         :: TT_MS_LANGID_TAMAZIGHT_ALGERIA
TT_MS_LANGID_KASHMIRI_PAKISTAN               :: 0x0460 /* Arabic */
TT_MS_LANGID_KASHMIRI_SASIA                    :: 0x0860
TT_MS_LANGID_KASHMIRI_INDIA                  :: TT_MS_LANGID_KASHMIRI_SASIA
TT_MS_LANGID_NEPALI_INDIA                      :: 0x0861
TT_MS_LANGID_DIVEHI_MALDIVES                 :: TT_MS_LANGID_DHIVEHI_MALDIVES
TT_MS_LANGID_EDO_NIGERIA                       :: 0x0466
TT_MS_LANGID_FULFULDE_NIGERIA                  :: 0x0467
TT_MS_LANGID_IBIBIO_NIGERIA                    :: 0x0469
TT_MS_LANGID_SEPEDI_SOUTH_AFRICA             :: TT_MS_LANGID_SESOTHO_SA_LEBOA_SOUTH_AFRICA
TT_MS_LANGID_SOTHO_SOUTHERN_SOUTH_AFRICA     :: TT_MS_LANGID_SESOTHO_SA_LEBOA_SOUTH_AFRICA
TT_MS_LANGID_KANURI_NIGERIA                    :: 0x0471
TT_MS_LANGID_OROMO_ETHIOPIA                    :: 0x0472
TT_MS_LANGID_TIGRIGNA_ETHIOPIA                 :: 0x0473
TT_MS_LANGID_TIGRIGNA_ERYTHREA                 :: 0x0873
TT_MS_LANGID_TIGRIGNA_ERYTREA                :: TT_MS_LANGID_TIGRIGNA_ERYTHREA
TT_MS_LANGID_GUARANI_PARAGUAY                  :: 0x0474
TT_MS_LANGID_HAWAIIAN_UNITED_STATES            :: 0x0475
TT_MS_LANGID_LATIN                             :: 0x0476
TT_MS_LANGID_SOMALI_SOMALIA                    :: 0x0477
TT_MS_LANGID_YI_CHINA                        :: TT_MS_LANGID_YI_PRC
TT_MS_LANGID_PAPIAMENTU_NETHERLANDS_ANTILLES   :: 0x0479
TT_MS_LANGID_UIGHUR_CHINA                    :: TT_MS_LANGID_UIGHUR_PRC

/**************************************************************************
*
* @enum:
*   TT_NAME_ID_XXX
*
* @description:
*   Possible values of the 'name' identifier field in the name records of
*   an SFNT 'name' table.  These values are platform independent.
*/
TT_NAME_ID_COPYRIGHT              :: 0
TT_NAME_ID_FONT_FAMILY            :: 1
TT_NAME_ID_FONT_SUBFAMILY         :: 2
TT_NAME_ID_UNIQUE_ID              :: 3
TT_NAME_ID_FULL_NAME              :: 4
TT_NAME_ID_VERSION_STRING         :: 5
TT_NAME_ID_PS_NAME                :: 6
TT_NAME_ID_TRADEMARK              :: 7

/* the following values are from the OpenType spec */
TT_NAME_ID_MANUFACTURER           :: 8
TT_NAME_ID_DESIGNER               :: 9
TT_NAME_ID_DESCRIPTION            :: 10
TT_NAME_ID_VENDOR_URL             :: 11
TT_NAME_ID_DESIGNER_URL           :: 12
TT_NAME_ID_LICENSE                :: 13
TT_NAME_ID_LICENSE_URL            :: 14

/* number 15 is reserved */
TT_NAME_ID_TYPOGRAPHIC_FAMILY     :: 16
TT_NAME_ID_TYPOGRAPHIC_SUBFAMILY  :: 17
TT_NAME_ID_MAC_FULL_NAME          :: 18

/* The following code is new as of 2000-01-21 */
TT_NAME_ID_SAMPLE_TEXT            :: 19

/* This is new in OpenType 1.3 */
TT_NAME_ID_CID_FINDFONT_NAME      :: 20

/* This is new in OpenType 1.5 */
TT_NAME_ID_WWS_FAMILY             :: 21
TT_NAME_ID_WWS_SUBFAMILY          :: 22

/* This is new in OpenType 1.7 */
TT_NAME_ID_LIGHT_BACKGROUND       :: 23
TT_NAME_ID_DARK_BACKGROUND        :: 24

/* This is new in OpenType 1.8 */
TT_NAME_ID_VARIATIONS_PREFIX      :: 25

/* these two values are deprecated */
TT_NAME_ID_PREFERRED_FAMILY     :: TT_NAME_ID_TYPOGRAPHIC_FAMILY
TT_NAME_ID_PREFERRED_SUBFAMILY  :: TT_NAME_ID_TYPOGRAPHIC_SUBFAMILY

/**************************************************************************
*
* @enum:
*   TT_UCR_XXX
*
* @description:
*   Possible bit mask values for the `ulUnicodeRangeX` fields in an SFNT
*   'OS/2' table.
*/

/* ulUnicodeRange1 */
/* --------------- */

/* Bit  0   Basic Latin */
TT_UCR_BASIC_LATIN                    :: (10) /* U+0020-U+007E */

/* Bit  1   C1 Controls and Latin-1 Supplement */
TT_UCR_LATIN1_SUPPLEMENT              :: (11) /* U+0080-U+00FF */

/* Bit  2   Latin Extended-A */
TT_UCR_LATIN_EXTENDED_A               :: (12) /* U+0100-U+017F */

/* Bit  3   Latin Extended-B */
TT_UCR_LATIN_EXTENDED_B               :: (13) /* U+0180-U+024F */

/* Bit  4   IPA Extensions                 */
/*          Phonetic Extensions            */
/*          Phonetic Extensions Supplement */
TT_UCR_IPA_EXTENSIONS                 :: (14) /* U+0250-U+02AF */

/* U+1D00-U+1D7F */
/* U+1D80-U+1DBF */
/* Bit  5   Spacing Modifier Letters */
/*          Modifier Tone Letters    */
TT_UCR_SPACING_MODIFIER               :: (15) /* U+02B0-U+02FF */

/* U+A700-U+A71F */
/* Bit  6   Combining Diacritical Marks            */
/*          Combining Diacritical Marks Supplement */
TT_UCR_COMBINING_DIACRITICAL_MARKS    :: (16) /* U+0300-U+036F */

/* U+1DC0-U+1DFF */
/* Bit  7   Greek and Coptic */
TT_UCR_GREEK                          :: (17) /* U+0370-U+03FF */

/* Bit  8   Coptic */
TT_UCR_COPTIC                         :: (18) /* U+2C80-U+2CFF */

/* Bit  9   Cyrillic            */
/*          Cyrillic Supplement */
/*          Cyrillic Extended-A */
/*          Cyrillic Extended-B */
TT_UCR_CYRILLIC                       :: (19) /* U+0400-U+04FF */

/* U+0500-U+052F */
/* U+2DE0-U+2DFF */
/* U+A640-U+A69F */
/* Bit 10   Armenian */
TT_UCR_ARMENIAN                       :: (110) /* U+0530-U+058F */

/* Bit 11   Hebrew */
TT_UCR_HEBREW                         :: (111) /* U+0590-U+05FF */

/* Bit 12   Vai */
TT_UCR_VAI                            :: (112) /* U+A500-U+A63F */

/* Bit 13   Arabic            */
/*          Arabic Supplement */
TT_UCR_ARABIC                         :: (113) /* U+0600-U+06FF */

/* U+0750-U+077F */
/* Bit 14   NKo */
TT_UCR_NKO                            :: (114) /* U+07C0-U+07FF */

/* Bit 15   Devanagari */
TT_UCR_DEVANAGARI                     :: (115) /* U+0900-U+097F */

/* Bit 16   Bangla (Bengali) */
TT_UCR_BENGALI                        :: (116) /* U+0980-U+09FF */

/* Bit 17   Gurmukhi */
TT_UCR_GURMUKHI                       :: (117) /* U+0A00-U+0A7F */

/* Bit 18   Gujarati */
TT_UCR_GUJARATI                       :: (118) /* U+0A80-U+0AFF */

/* Bit 19   Oriya (Odia) */
TT_UCR_ORIYA                          :: (119) /* U+0B00-U+0B7F */

/* Bit 20   Tamil */
TT_UCR_TAMIL                          :: (120) /* U+0B80-U+0BFF */

/* Bit 21   Telugu */
TT_UCR_TELUGU                         :: (121) /* U+0C00-U+0C7F */

/* Bit 22   Kannada */
TT_UCR_KANNADA                        :: (122) /* U+0C80-U+0CFF */

/* Bit 23   Malayalam */
TT_UCR_MALAYALAM                      :: (123) /* U+0D00-U+0D7F */

/* Bit 24   Thai */
TT_UCR_THAI                           :: (124) /* U+0E00-U+0E7F */

/* Bit 25   Lao */
TT_UCR_LAO                            :: (125) /* U+0E80-U+0EFF */

/* Bit 26   Georgian            */
/*          Georgian Supplement */
TT_UCR_GEORGIAN                       :: (126) /* U+10A0-U+10FF */

/* U+2D00-U+2D2F */
/* Bit 27   Balinese */
TT_UCR_BALINESE                       :: (127) /* U+1B00-U+1B7F */

/* Bit 28   Hangul Jamo */
TT_UCR_HANGUL_JAMO                    :: (128) /* U+1100-U+11FF */

/* Bit 29   Latin Extended Additional */
/*          Latin Extended-C          */
/*          Latin Extended-D          */
TT_UCR_LATIN_EXTENDED_ADDITIONAL      :: (129) /* U+1E00-U+1EFF */

/* U+2C60-U+2C7F */
/* U+A720-U+A7FF */
/* Bit 30   Greek Extended */
TT_UCR_GREEK_EXTENDED                 :: (130) /* U+1F00-U+1FFF */

/* Bit 31   General Punctuation      */
/*          Supplemental Punctuation */
TT_UCR_GENERAL_PUNCTUATION            :: (131) /* U+2000-U+206F */

/* U+2E00-U+2E7F */

/* ulUnicodeRange2 */
/* --------------- */

/* Bit 32   Superscripts And Subscripts */
TT_UCR_SUPERSCRIPTS_SUBSCRIPTS        :: (10) /* U+2070-U+209F */

/* Bit 33   Currency Symbols */
TT_UCR_CURRENCY_SYMBOLS               :: (11) /* U+20A0-U+20CF */

/* Bit 34   Combining Diacritical Marks For Symbols */
TT_UCR_COMBINING_DIACRITICAL_MARKS_SYMB :: (12)

/* Bit 35   Letterlike Symbols */
TT_UCR_LETTERLIKE_SYMBOLS             :: (13) /* U+2100-U+214F */

/* Bit 36   Number Forms */
TT_UCR_NUMBER_FORMS                   :: (14) /* U+2150-U+218F */

/* Bit 37   Arrows                           */
/*          Supplemental Arrows-A            */
/*          Supplemental Arrows-B            */
/*          Miscellaneous Symbols and Arrows */
TT_UCR_ARROWS                         :: (15) /* U+2190-U+21FF */

/* U+27F0-U+27FF */
/* U+2900-U+297F */
/* U+2B00-U+2BFF */
/* Bit 38   Mathematical Operators               */
/*          Supplemental Mathematical Operators  */
/*          Miscellaneous Mathematical Symbols-A */
/*          Miscellaneous Mathematical Symbols-B */
TT_UCR_MATHEMATICAL_OPERATORS         :: (16) /* U+2200-U+22FF */

/* U+2A00-U+2AFF */
/* U+27C0-U+27EF */
/* U+2980-U+29FF */
/* Bit 39 Miscellaneous Technical */
TT_UCR_MISCELLANEOUS_TECHNICAL        :: (17) /* U+2300-U+23FF */

/* Bit 40   Control Pictures */
TT_UCR_CONTROL_PICTURES               :: (18) /* U+2400-U+243F */

/* Bit 41   Optical Character Recognition */
TT_UCR_OCR                            :: (19) /* U+2440-U+245F */

/* Bit 42   Enclosed Alphanumerics */
TT_UCR_ENCLOSED_ALPHANUMERICS         :: (110) /* U+2460-U+24FF */

/* Bit 43   Box Drawing */
TT_UCR_BOX_DRAWING                    :: (111) /* U+2500-U+257F */

/* Bit 44   Block Elements */
TT_UCR_BLOCK_ELEMENTS                 :: (112) /* U+2580-U+259F */

/* Bit 45   Geometric Shapes */
TT_UCR_GEOMETRIC_SHAPES               :: (113) /* U+25A0-U+25FF */

/* Bit 46   Miscellaneous Symbols */
TT_UCR_MISCELLANEOUS_SYMBOLS          :: (114) /* U+2600-U+26FF */

/* Bit 47   Dingbats */
TT_UCR_DINGBATS                       :: (115) /* U+2700-U+27BF */

/* Bit 48   CJK Symbols and Punctuation */
TT_UCR_CJK_SYMBOLS                    :: (116) /* U+3000-U+303F */

/* Bit 49   Hiragana */
TT_UCR_HIRAGANA                       :: (117) /* U+3040-U+309F */

/* Bit 50   Katakana                     */
/*          Katakana Phonetic Extensions */
TT_UCR_KATAKANA                       :: (118) /* U+30A0-U+30FF */

/* U+31F0-U+31FF */
/* Bit 51   Bopomofo          */
/*          Bopomofo Extended */
TT_UCR_BOPOMOFO                       :: (119) /* U+3100-U+312F */

/* U+31A0-U+31BF */
/* Bit 52   Hangul Compatibility Jamo */
TT_UCR_HANGUL_COMPATIBILITY_JAMO      :: (120) /* U+3130-U+318F */

/* Bit 53   Phags-Pa */
TT_UCR_PHAGSPA                        :: (121) /* U+A840-U+A87F */
TT_UCR_KANBUN    :: TT_UCR_PHAGSPA             /* deprecated */
TT_UCR_CJK_MISC  :: TT_UCR_PHAGSPA             /* deprecated */

/* Bit 54   Enclosed CJK Letters and Months */
TT_UCR_ENCLOSED_CJK_LETTERS_MONTHS    :: (122) /* U+3200-U+32FF */

/* Bit 55   CJK Compatibility */
TT_UCR_CJK_COMPATIBILITY              :: (123) /* U+3300-U+33FF */

/* Bit 56   Hangul Syllables */
TT_UCR_HANGUL                         :: (124) /* U+AC00-U+D7A3 */

/* Bit 57   High Surrogates              */
/*          High Private Use Surrogates  */
/*          Low Surrogates               */

/* According to OpenType specs v.1.3+,   */
/* setting bit 57 implies that there is  */
/* at least one codepoint beyond the     */
/* Basic Multilingual Plane that is      */
/* supported by this font.  So it really */
/* means >= U+10000.                     */
TT_UCR_SURROGATES                     :: (125) /* U+D800-U+DB7F */

/* U+DB80-U+DBFF */
/* U+DC00-U+DFFF */
TT_UCR_NON_PLANE_0  :: TT_UCR_SURROGATES

/* Bit 58  Phoenician */
TT_UCR_PHOENICIAN                     :: (126) /*U+10900-U+1091F*/

/* Bit 59   CJK Unified Ideographs             */
/*          CJK Radicals Supplement            */
/*          Kangxi Radicals                    */
/*          Ideographic Description Characters */
/*          CJK Unified Ideographs Extension A */
/*          CJK Unified Ideographs Extension B */
/*          Kanbun                             */
TT_UCR_CJK_UNIFIED_IDEOGRAPHS         :: (127) /* U+4E00-U+9FFF */

/* U+2E80-U+2EFF */
/* U+2F00-U+2FDF */
/* U+2FF0-U+2FFF */
/* U+3400-U+4DB5 */
/*U+20000-U+2A6DF*/
/* U+3190-U+319F */
/* Bit 60   Private Use */
TT_UCR_PRIVATE_USE                    :: (128) /* U+E000-U+F8FF */

/* Bit 61   CJK Strokes                             */
/*          CJK Compatibility Ideographs            */
/*          CJK Compatibility Ideographs Supplement */
TT_UCR_CJK_COMPATIBILITY_IDEOGRAPHS   :: (129) /* U+31C0-U+31EF */

/* U+F900-U+FAFF */
/*U+2F800-U+2FA1F*/
/* Bit 62   Alphabetic Presentation Forms */
TT_UCR_ALPHABETIC_PRESENTATION_FORMS  :: (130) /* U+FB00-U+FB4F */

/* Bit 63   Arabic Presentation Forms-A */
TT_UCR_ARABIC_PRESENTATION_FORMS_A    :: (131) /* U+FB50-U+FDFF */

/* ulUnicodeRange3 */
/* --------------- */

/* Bit 64   Combining Half Marks */
TT_UCR_COMBINING_HALF_MARKS           :: (10) /* U+FE20-U+FE2F */

/* Bit 65   Vertical forms          */
/*          CJK Compatibility Forms */
TT_UCR_CJK_COMPATIBILITY_FORMS        :: (11) /* U+FE10-U+FE1F */

/* U+FE30-U+FE4F */
/* Bit 66   Small Form Variants */
TT_UCR_SMALL_FORM_VARIANTS            :: (12) /* U+FE50-U+FE6F */

/* Bit 67   Arabic Presentation Forms-B */
TT_UCR_ARABIC_PRESENTATION_FORMS_B    :: (13) /* U+FE70-U+FEFF */

/* Bit 68   Halfwidth and Fullwidth Forms */
TT_UCR_HALFWIDTH_FULLWIDTH_FORMS      :: (14) /* U+FF00-U+FFEF */

/* Bit 69   Specials */
TT_UCR_SPECIALS                       :: (15) /* U+FFF0-U+FFFF */

/* Bit 70   Tibetan */
TT_UCR_TIBETAN                        :: (16) /* U+0F00-U+0FFF */

/* Bit 71   Syriac */
TT_UCR_SYRIAC                         :: (17) /* U+0700-U+074F */

/* Bit 72   Thaana */
TT_UCR_THAANA                         :: (18) /* U+0780-U+07BF */

/* Bit 73   Sinhala */
TT_UCR_SINHALA                        :: (19) /* U+0D80-U+0DFF */

/* Bit 74   Myanmar */
TT_UCR_MYANMAR                        :: (110) /* U+1000-U+109F */

/* Bit 75   Ethiopic            */
/*          Ethiopic Supplement */
/*          Ethiopic Extended   */
TT_UCR_ETHIOPIC                       :: (111) /* U+1200-U+137F */

/* U+1380-U+139F */
/* U+2D80-U+2DDF */
/* Bit 76   Cherokee */
TT_UCR_CHEROKEE                       :: (112) /* U+13A0-U+13FF */

/* Bit 77   Unified Canadian Aboriginal Syllabics */
TT_UCR_CANADIAN_ABORIGINAL_SYLLABICS  :: (113) /* U+1400-U+167F */

/* Bit 78   Ogham */
TT_UCR_OGHAM                          :: (114) /* U+1680-U+169F */

/* Bit 79   Runic */
TT_UCR_RUNIC                          :: (115) /* U+16A0-U+16FF */

/* Bit 80   Khmer         */
/*          Khmer Symbols */
TT_UCR_KHMER                          :: (116) /* U+1780-U+17FF */

/* U+19E0-U+19FF */
/* Bit 81   Mongolian */
TT_UCR_MONGOLIAN                      :: (117) /* U+1800-U+18AF */

/* Bit 82   Braille Patterns */
TT_UCR_BRAILLE                        :: (118) /* U+2800-U+28FF */

/* Bit 83   Yi Syllables */
/*          Yi Radicals  */
TT_UCR_YI                             :: (119) /* U+A000-U+A48F */

/* U+A490-U+A4CF */
/* Bit 84   Tagalog  */
/*          Hanunoo  */
/*          Buhid    */
/*          Tagbanwa */
TT_UCR_PHILIPPINE                     :: (120) /* U+1700-U+171F */

/* U+1720-U+173F */
/* U+1740-U+175F */
/* U+1760-U+177F */
/* Bit 85   Old Italic */
TT_UCR_OLD_ITALIC                     :: (121) /*U+10300-U+1032F*/

/* Bit 86   Gothic */
TT_UCR_GOTHIC                         :: (122) /*U+10330-U+1034F*/

/* Bit 87   Deseret */
TT_UCR_DESERET                        :: (123) /*U+10400-U+1044F*/

/* Bit 88   Byzantine Musical Symbols      */
/*          Musical Symbols                */
/*          Ancient Greek Musical Notation */
TT_UCR_MUSICAL_SYMBOLS                :: (124) /*U+1D000-U+1D0FF*/

/*U+1D100-U+1D1FF*/
/*U+1D200-U+1D24F*/
/* Bit 89   Mathematical Alphanumeric Symbols */
TT_UCR_MATH_ALPHANUMERIC_SYMBOLS      :: (125) /*U+1D400-U+1D7FF*/

/* Bit 90   Private Use (plane 15) */
/*          Private Use (plane 16) */
TT_UCR_PRIVATE_USE_SUPPLEMENTARY      :: (126) /*U+F0000-U+FFFFD*/

/*U+100000-U+10FFFD*/
/* Bit 91   Variation Selectors            */
/*          Variation Selectors Supplement */
TT_UCR_VARIATION_SELECTORS            :: (127) /* U+FE00-U+FE0F */

/*U+E0100-U+E01EF*/
/* Bit 92   Tags */
TT_UCR_TAGS                           :: (128) /*U+E0000-U+E007F*/

/* Bit 93   Limbu */
TT_UCR_LIMBU                          :: (129) /* U+1900-U+194F */

/* Bit 94   Tai Le */
TT_UCR_TAI_LE                         :: (130) /* U+1950-U+197F */

/* Bit 95   New Tai Lue */
TT_UCR_NEW_TAI_LUE                    :: (131) /* U+1980-U+19DF */

/* ulUnicodeRange4 */
/* --------------- */

/* Bit 96   Buginese */
TT_UCR_BUGINESE                       :: (10) /* U+1A00-U+1A1F */

/* Bit 97   Glagolitic */
TT_UCR_GLAGOLITIC                     :: (11) /* U+2C00-U+2C5F */

/* Bit 98   Tifinagh */
TT_UCR_TIFINAGH                       :: (12) /* U+2D30-U+2D7F */

/* Bit 99   Yijing Hexagram Symbols */
TT_UCR_YIJING                         :: (13) /* U+4DC0-U+4DFF */

/* Bit 100  Syloti Nagri */
TT_UCR_SYLOTI_NAGRI                   :: (14) /* U+A800-U+A82F */

/* Bit 101  Linear B Syllabary */
/*          Linear B Ideograms */
/*          Aegean Numbers     */
TT_UCR_LINEAR_B                       :: (15) /*U+10000-U+1007F*/

/*U+10080-U+100FF*/
/*U+10100-U+1013F*/
/* Bit 102  Ancient Greek Numbers */
TT_UCR_ANCIENT_GREEK_NUMBERS          :: (16) /*U+10140-U+1018F*/

/* Bit 103  Ugaritic */
TT_UCR_UGARITIC                       :: (17) /*U+10380-U+1039F*/

/* Bit 104  Old Persian */
TT_UCR_OLD_PERSIAN                    :: (18) /*U+103A0-U+103DF*/

/* Bit 105  Shavian */
TT_UCR_SHAVIAN                        :: (19) /*U+10450-U+1047F*/

/* Bit 106  Osmanya */
TT_UCR_OSMANYA                        :: (110) /*U+10480-U+104AF*/

/* Bit 107  Cypriot Syllabary */
TT_UCR_CYPRIOT_SYLLABARY              :: (111) /*U+10800-U+1083F*/

/* Bit 108  Kharoshthi */
TT_UCR_KHAROSHTHI                     :: (112) /*U+10A00-U+10A5F*/

/* Bit 109  Tai Xuan Jing Symbols */
TT_UCR_TAI_XUAN_JING                  :: (113) /*U+1D300-U+1D35F*/

/* Bit 110  Cuneiform                         */
/*          Cuneiform Numbers and Punctuation */
TT_UCR_CUNEIFORM                      :: (114) /*U+12000-U+123FF*/

/*U+12400-U+1247F*/
/* Bit 111  Counting Rod Numerals */
TT_UCR_COUNTING_ROD_NUMERALS          :: (115) /*U+1D360-U+1D37F*/

/* Bit 112  Sundanese */
TT_UCR_SUNDANESE                      :: (116) /* U+1B80-U+1BBF */

/* Bit 113  Lepcha */
TT_UCR_LEPCHA                         :: (117) /* U+1C00-U+1C4F */

/* Bit 114  Ol Chiki */
TT_UCR_OL_CHIKI                       :: (118) /* U+1C50-U+1C7F */

/* Bit 115  Saurashtra */
TT_UCR_SAURASHTRA                     :: (119) /* U+A880-U+A8DF */

/* Bit 116  Kayah Li */
TT_UCR_KAYAH_LI                       :: (120) /* U+A900-U+A92F */

/* Bit 117  Rejang */
TT_UCR_REJANG                         :: (121) /* U+A930-U+A95F */

/* Bit 118  Cham */
TT_UCR_CHAM                           :: (122) /* U+AA00-U+AA5F */

/* Bit 119  Ancient Symbols */
TT_UCR_ANCIENT_SYMBOLS                :: (123) /*U+10190-U+101CF*/

/* Bit 120  Phaistos Disc */
TT_UCR_PHAISTOS_DISC                  :: (124) /*U+101D0-U+101FF*/

/* Bit 121  Carian */
/*          Lycian */
/*          Lydian */
TT_UCR_OLD_ANATOLIAN                  :: (125) /*U+102A0-U+102DF*/

/*U+10280-U+1029F*/
/*U+10920-U+1093F*/
/* Bit 122  Domino Tiles  */
/*          Mahjong Tiles */
TT_UCR_GAME_TILES                     :: (126) /*U+1F030-U+1F09F*/

/*U+1F000-U+1F02F*/
/* Bit 123-127 Reserved for process-internal usage */

/* */

/* for backward compatibility with older FreeType versions */
TT_UCR_ARABIC_PRESENTATION_A         :: TT_UCR_ARABIC_PRESENTATION_FORMS_A
TT_UCR_ARABIC_PRESENTATION_B         :: TT_UCR_ARABIC_PRESENTATION_FORMS_B
TT_UCR_COMBINING_DIACRITICS          :: TT_UCR_COMBINING_DIACRITICAL_MARKS
TT_UCR_COMBINING_DIACRITICS_SYMB          :: TT_UCR_COMBINING_DIACRITICAL_MARKS_SYMB

