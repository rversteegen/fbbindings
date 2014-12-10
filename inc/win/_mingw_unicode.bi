#pragma once

#ifdef UNICODE
	#define _INC_CRT_UNICODE_MACROS 1
	#define __MINGW_NAME_AW(func) func##W
	#define __MINGW_NAME_AW_EXT(func, ext) func##W##ext
	#define __MINGW_NAME_UAW(func) func##_W
	#define __MINGW_NAME_UAW_EXT(func, ext) func##_W_##ext
	#define __MINGW_STRING_AW(str) L##str
	#define __MINGW_PROCNAMEEXT_AW "W"
#else
	#define _INC_CRT_UNICODE_MACROS 2
	#define __MINGW_NAME_AW(func) func##A
	#define __MINGW_NAME_AW_EXT(func, ext) func##A##ext
	#define __MINGW_NAME_UAW(func) func##_A
	#define __MINGW_NAME_UAW_EXT(func, ext) func##_A_##ext
	#define __MINGW_STRING_AW(str) str
	#define __MINGW_PROCNAMEEXT_AW "A"
#endif
