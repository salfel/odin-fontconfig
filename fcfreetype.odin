/*
 * fontconfig/fontconfig/fcfreetype.h
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

@(default_calling_convention="c", link_prefix="Fc")
foreign lib {
	FreeTypeCharSetAndSpacing :: proc(face: i32, blanks: ^i32, spacing: ^i32) -> ^i32 ---
	FreeTypeCharSet           :: proc(face: i32, blanks: ^i32) -> ^i32 ---
	PatternGetFTFace          :: proc(p: ^i32, object: cstring, n: i32, f: ^i32) -> i32 ---
	PatternAddFTFace          :: proc(p: ^i32, object: cstring, f: i32) -> i32 ---
	FreeTypeQueryFace         :: proc(face: i32, file: ^i32, id: u32, blanks: ^i32) -> ^i32 ---
}

