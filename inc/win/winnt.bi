#pragma once

#include once "crt/wchar.bi"
#include once "crt/long.bi"
#include once "_mingw_unicode.bi"
#include once "_mingw.bi"
#include once "crt/ctype.bi"
#include once "excpt.bi"
#include once "winapifamily.bi"
#include once "apiset.bi"
#include once "specstrings.bi"
#include once "psdk_inc/intrin-impl.bi"
#include once "sdkddkver.bi"
#include once "basetsd.bi"
#include once "guiddef.bi"

#ifdef __FB_64BIT__
	#include once "x86intrin.bi"
#endif

#include once "ktmtypes.bi"

'' The following symbols have been renamed:
''     inside struct _EXCEPTION_REGISTRATION_RECORD:
''         field handler => handler_
''     typedef SHORT => SHORT_
''     typedef LONG => LONG_
''     typedef INT => INT_
''     #define TEXT => TEXT_
''     #define DELETE => DELETE_
''     union __Flags => __Flags_

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

type _RTL_CRITICAL_SECTION as _RTL_CRITICAL_SECTION_
type _ACTIVATION_CONTEXT as _ACTIVATION_CONTEXT_

#define _WINNT_
#define ANYSIZE_ARRAY 1

#ifdef __FB_64BIT__
	#define _AMD64_
#endif

#define RESTRICTED_POINTER

#ifdef __FB_64BIT__
	#define ALIGNMENT_MACHINE
	#define UNALIGNED __unaligned
	#define UNALIGNED64 __unaligned
	#define MAX_NATURAL_ALIGNMENT sizeof(ULONGLONG)
	#define MEMORY_ALLOCATION_ALIGNMENT 16
#else
	#define UNALIGNED
	#define UNALIGNED64
	#define MAX_NATURAL_ALIGNMENT sizeof(DWORD)
	#define MEMORY_ALLOCATION_ALIGNMENT 8
#endif

'' TODO: #define TYPE_ALIGNMENT(t) FIELD_OFFSET(struct { char x; t test; }, test)

#define PROBE_ALIGNMENT(_s) TYPE_ALIGNMENT(DWORD)

#ifdef __FB_64BIT__
	#define PROBE_ALIGNMENT32(_s) TYPE_ALIGNMENT(DWORD)
#endif

'' TODO: # define C_ASSERT(e) extern void __C_ASSERT__(int [(e)?1:-1])

#define DECLSPEC_IMPORT __declspec(dllimport)
#define DECLSPEC_NORETURN __declspec(noreturn)
#define DECLSPEC_NOTHROW __declspec(nothrow)
#define SYSTEM_CACHE_ALIGNMENT_SIZE 64
#define DECLSPEC_CACHEALIGN DECLSPEC_ALIGN(SYSTEM_CACHE_ALIGNMENT_SIZE)
#define DECLSPEC_UUID(x)
#define DECLSPEC_NOVTABLE
#define DECLSPEC_SELECTANY __declspec(selectany)
#define NOP_FUNCTION cast(any, 0)
#define FORCEINLINE __forceinline
#define DECLSPEC_DEPRECATED __declspec(deprecated)
#define DEPRECATE_SUPPORTED
#define DECLSPEC_DEPRECATED_DDK
#define PRAGMA_DEPRECATED_DDK 0

type PVOID as any ptr
type PVOID64 as any ptr

#ifdef __FB_64BIT__
	#define FASTCALL
#else
	#define FASTCALL __fastcall
#endif

#define NTAPI __stdcall
#define NTAPI_INLINE NTAPI
#define NTSYSAPI DECLSPEC_IMPORT
#define NTSYSCALLAPI DECLSPEC_IMPORT
#define VOID any

type CHAR as byte
type SHORT_ as short
type LONG_ as clong
type INT_ as long

#define __WCHAR_DEFINED

type WCHAR as wchar_t
type PWCHAR as WCHAR ptr
type LPWCH as WCHAR ptr
type PWCH as WCHAR ptr

'' TODO: typedef CONST WCHAR *LPCWCH,*PCWCH;

type NWPSTR as WCHAR ptr
type LPWSTR as WCHAR ptr
type PWSTR as WCHAR ptr
type PZPWSTR as PWSTR ptr

'' TODO: typedef CONST PWSTR *PCZPWSTR;

type LPUWSTR as WCHAR ptr
type PUWSTR as WCHAR ptr

'' TODO: typedef CONST WCHAR *LPCWSTR,*PCWSTR;

type PZPCWSTR as PCWSTR ptr

'' TODO: typedef CONST WCHAR *LPCUWSTR,*PCUWSTR;

type PZZWSTR as WCHAR ptr

'' TODO: typedef CONST WCHAR *PCZZWSTR;

type PUZZWSTR as WCHAR ptr

'' TODO: typedef CONST WCHAR *PCUZZWSTR;

type PNZWCH as WCHAR ptr

'' TODO: typedef CONST WCHAR *PCNZWCH;

type PUNZWCH as WCHAR ptr

'' TODO: typedef CONST WCHAR *PCUNZWCH;

type PCHAR as CHAR ptr
type LPCH as CHAR ptr
type PCH as CHAR ptr

'' TODO: typedef CONST CHAR *LPCCH,*PCCH;

type NPSTR as CHAR ptr
type LPSTR as CHAR ptr
type PSTR as CHAR ptr
type PZPSTR as PSTR ptr

'' TODO: typedef CONST PSTR *PCZPSTR;
'' TODO: typedef CONST CHAR *LPCSTR,*PCSTR;

type PZPCSTR as PCSTR ptr
type PZZSTR as CHAR ptr

'' TODO: typedef CONST CHAR *PCZZSTR;

type PNZCH as CHAR ptr

'' TODO: typedef CONST CHAR *PCNZCH;

#define _TCHAR_DEFINED

#ifdef UNICODE
	type TCHAR as WCHAR
	type PTCHAR as WCHAR ptr
	type TBYTE as WCHAR
	type PTBYTE as WCHAR ptr
	type LPTCH as LPWSTR
	type PTCH as LPWSTR
	type PTSTR as LPWSTR
	type LPTSTR as LPWSTR
	type PCTSTR as LPCWSTR
	type LPCTSTR as LPCWSTR
	type PUTSTR as LPUWSTR
	type LPUTSTR as LPUWSTR
	type PCUTSTR as LPCUWSTR
	type LPCUTSTR as LPCUWSTR
	type LP as LPWSTR
	type PZZTSTR as PZZWSTR
	type PCZZTSTR as PCZZWSTR
	type PUZZTSTR as PUZZWSTR
	type PCUZZTSTR as PCUZZWSTR
	type PZPTSTR as PZPWSTR
	type PNZTCH as PNZWCH
	type PCNZTCH as PCNZWCH
	type PUNZTCH as PUNZWCH
	type PCUNZTCH as PCUNZWCH

	#define __TEXT(quote) L##quote
#else
	type TCHAR as byte
	type PTCHAR as zstring ptr
	type TBYTE as ubyte
	type PTBYTE as ubyte ptr
	type LPTCH as LPSTR
	type PTCH as LPSTR
	type LPCTCH as LPCCH
	type PCTCH as LPCCH
	type PTSTR as LPSTR
	type LPTSTR as LPSTR
	type PUTSTR as LPSTR
	type LPUTSTR as LPSTR
	type PCTSTR as LPCSTR
	type LPCTSTR as LPCSTR
	type PCUTSTR as LPCSTR
	type LPCUTSTR as LPCSTR
	type PZZTSTR as PZZSTR
	type PUZZTSTR as PZZSTR
	type PCZZTSTR as PCZZSTR
	type PCUZZTSTR as PCZZSTR
	type PZPTSTR as PZPSTR
	type PNZTCH as PNZCH
	type PUNZTCH as PNZCH
	type PCNZTCH as PCNZCH
	type PCUNZTCH as PCNZCH

	#define __TEXT(quote) quote
#endif

#define TEXT_(quote) __TEXT(quote)

type PSHORT as SHORT_ ptr
type PLONG as LONG_ ptr

#define ___GROUP_AFFINITY_DEFINED

type _GROUP_AFFINITY
	Mask as KAFFINITY
	Group as WORD
	Reserved(0 to 2) as WORD
end type

type GROUP_AFFINITY as _GROUP_AFFINITY
type PGROUP_AFFINITY as _GROUP_AFFINITY ptr
type HANDLE as PVOID

'' TODO: #define DECLARE_HANDLE(name) typedef HANDLE name

type PHANDLE as HANDLE ptr
type FCHAR as BYTE
type FSHORT as WORD
type FLONG as DWORD

#define _HRESULT_DEFINED

type HRESULT as LONG_

#define IFACEMETHODIMP STDMETHODIMP
#define IFACEMETHODIMP_(type) STDMETHODIMP_(type)
#define IFACEMETHODIMPV STDMETHODIMPV
#define IFACEMETHODIMPV_(type) STDMETHODIMPV_(type)

type CCHAR as byte

#define _LCID_DEFINED

type LCID as DWORD
type PLCID as PDWORD

#define _LANGID_DEFINED

type LANGID as WORD

#define __COMPARTMENT_ID_DEFINED__

type COMPARTMENT_ID as long
enum
	UNSPECIFIED_COMPARTMENT_ID = 0
	DEFAULT_COMPARTMENT_ID
end enum

type PCOMPARTMENT_ID as COMPARTMENT_ID ptr

#define APPLICATION_ERROR_MASK &h20000000
#define ERROR_SEVERITY_SUCCESS &h00000000
#define ERROR_SEVERITY_INFORMATIONAL &h40000000
#define ERROR_SEVERITY_WARNING &h80000000
#define ERROR_SEVERITY_ERROR &hC0000000

type _FLOAT128
	LowPart as longint
	HighPart as longint
end type

type FLOAT128 as _FLOAT128
type PFLOAT128 as FLOAT128 ptr

#define _ULONGLONG_

type LONGLONG as longint
type ULONGLONG as ulongint

#define MAXLONGLONG &h7fffffffffffffffll

type PLONGLONG as LONGLONG ptr
type PULONGLONG as ULONGLONG ptr
type USN as LONGLONG

#define _LARGE_INTEGER_DEFINED

type ___LARGE_INTEGER_u
	LowPart as DWORD
	HighPart as LONG_
end type

union _LARGE_INTEGER
	type
		LowPart as DWORD
		HighPart as LONG_
	end type

	u as ___LARGE_INTEGER_u
	QuadPart as LONGLONG
end union

type LARGE_INTEGER as _LARGE_INTEGER
type PLARGE_INTEGER as LARGE_INTEGER ptr

type ___ULARGE_INTEGER_u
	LowPart as DWORD
	HighPart as DWORD
end type

union _ULARGE_INTEGER
	type
		LowPart as DWORD
		HighPart as DWORD
	end type

	u as ___ULARGE_INTEGER_u
	QuadPart as ULONGLONG
end union

type ULARGE_INTEGER as _ULARGE_INTEGER
type PULARGE_INTEGER as ULARGE_INTEGER ptr

type _LUID
	LowPart as DWORD
	HighPart as LONG_
end type

type LUID as _LUID
type PLUID as _LUID ptr

#define _DWORDLONG_

type DWORDLONG as ULONGLONG
type PDWORDLONG as DWORDLONG ptr

#define Int32x32To64(a, b) (cast(LONGLONG, cast(LONG_, (a))) * cast(LONGLONG, cast(LONG_, (b))))
#define UInt32x32To64(a, b) (cast(ULONGLONG, culng((a))) * cast(ULONGLONG, culng((b))))
#define Int64ShllMod32(a, b) (cast(ULONGLONG, (a)) shl (b))
#define Int64ShraMod32(a, b) (cast(LONGLONG, (a)) shr (b))
#define Int64ShrlMod32(a, b) (cast(ULONGLONG, (a)) shr (b))

#ifdef __FB_64BIT__
	#define RotateLeft8 _rotl8
	#define RotateLeft16 _rotl16
	#define RotateRight8 _rotr8
	#define RotateRight16 _rotr16

	declare function _rotl8(byval Value as ubyte, byval Shift as ubyte) as ubyte
	declare function _rotl16(byval Value as ushort, byval Shift as ubyte) as ushort
	declare function _rotr8(byval Value as ubyte, byval Shift as ubyte) as ubyte
	declare function _rotr16(byval Value as ushort, byval Shift as ubyte) as ushort
#endif

#define RotateLeft32 _rotl
#define RotateLeft64 _rotl64
#define RotateRight32 _rotr
#define RotateRight64 _rotr64

declare function _rotl cdecl(byval Value as ulong, byval Shift as long) as ulong
declare function _rotr cdecl(byval Value as ulong, byval Shift as long) as ulong
declare function _rotl64 cdecl(byval Value as ulongint, byval Shift as long) as ulongint
declare function _rotr64 cdecl(byval Value as ulongint, byval Shift as long) as ulongint

#define ANSI_NULL cast(CHAR, 0)
#define UNICODE_NULL cast(WCHAR, 0)

'' TODO: #define UNICODE_STRING_MAX_BYTES ((WORD) 65534)

#define UNICODE_STRING_MAX_CHARS 32767
#define _BOOLEAN_

type BOOLEAN as BYTE
type PBOOLEAN as BOOLEAN ptr

#define _LIST_ENTRY_DEFINED

type _LIST_ENTRY
	Flink as _LIST_ENTRY ptr
	Blink as _LIST_ENTRY ptr
end type

type LIST_ENTRY as _LIST_ENTRY
type PLIST_ENTRY as _LIST_ENTRY ptr
type PRLIST_ENTRY as _LIST_ENTRY ptr

type _SINGLE_LIST_ENTRY
	Next as _SINGLE_LIST_ENTRY ptr
end type

type SINGLE_LIST_ENTRY as _SINGLE_LIST_ENTRY
type PSINGLE_LIST_ENTRY as _SINGLE_LIST_ENTRY ptr

type LIST_ENTRY32
	Flink as DWORD
	Blink as DWORD
end type

type PLIST_ENTRY32 as LIST_ENTRY32 ptr

type LIST_ENTRY64
	Flink as ULONGLONG
	Blink as ULONGLONG
end type

type PLIST_ENTRY64 as LIST_ENTRY64 ptr

#define __OBJECTID_DEFINED

type _OBJECTID
	Lineage as GUID
	Uniquifier as DWORD
end type

type OBJECTID as _OBJECTID

#define MINCHAR &h80
#define MAXCHAR &h7f
#define MINSHORT &h8000
#define MAXSHORT &h7fff
#define MINLONG &h80000000
#define MAXLONG &h7fffffff
#define MAXBYTE &hff
#define MAXWORD &hffff
#define MAXDWORD &hffffffff
#define FIELD_OFFSET(type, field) cast(LONG_, cast(LONG_PTR, @cptr(type ptr, 0)->field))
#define RTL_FIELD_SIZE(type, field) sizeof(cptr(type ptr, 0)->field)
#define RTL_SIZEOF_THROUGH_FIELD(type, field) (FIELD_OFFSET(type, field) + RTL_FIELD_SIZE(type, field))
#define RTL_CONTAINS_FIELD(Struct, Size, Field) ((cast(PCHAR, @(Struct)->Field) + sizeof((Struct)->Field)) <= (cast(PCHAR, (Struct)) + (Size)))
#define RTL_NUMBER_OF_V1(A) (sizeof((A)) / sizeof((A)[0]))
#define RTL_NUMBER_OF_V2(A) RTL_NUMBER_OF_V1(A)
#define RTL_NUMBER_OF(A) RTL_NUMBER_OF_V1(A)
#define ARRAYSIZE(A) RTL_NUMBER_OF_V2(A)
#define _ARRAYSIZE(A) RTL_NUMBER_OF_V1(A)
#define RTL_FIELD_TYPE(type, field) cptr(type ptr, 0)->field
#define RTL_NUMBER_OF_FIELD(type, field) RTL_NUMBER_OF(RTL_FIELD_TYPE(type, field))
#define RTL_PADDING_BETWEEN_FIELDS(T, F1, F2) iif(FIELD_OFFSET(T, F2) > FIELD_OFFSET(T, F1), (FIELD_OFFSET(T, F2) - FIELD_OFFSET(T, F1)) - RTL_FIELD_SIZE(T, F1), (FIELD_OFFSET(T, F1) - FIELD_OFFSET(T, F2)) - RTL_FIELD_SIZE(T, F2))
#define RTL_CONST_CAST(type) (type)
#define DEFINE_ENUM_FLAG_OPERATORS(ENUMTYPE)

'' TODO: #define COMPILETIME_OR_2FLAGS(a, b) ((UINT) (a) | (UINT) (b))
'' TODO: #define COMPILETIME_OR_3FLAGS(a, b, c) ((UINT) (a) | (UINT) (b) | (UINT) (c))
'' TODO: #define COMPILETIME_OR_4FLAGS(a, b, c, d) ((UINT) (a) | (UINT) (b) | (UINT) (c) | (UINT) (d))
'' TODO: #define COMPILETIME_OR_5FLAGS(a, b, c, d, e) ((UINT) (a) | (UINT) (b) | (UINT) (c) | (UINT) (d) | (UINT) (e))

#define RTL_BITS_OF(sizeOfArg) (sizeof((sizeOfArg)) * 8)
#define RTL_BITS_OF_FIELD(type, field) RTL_BITS_OF(RTL_FIELD_TYPE(type, field))
#define CONTAINING_RECORD(address, type, field) cptr(type ptr, cast(PCHAR, (address) - cast(ULONG_PTR, @cptr(type ptr, 0)->field)))
#define __PEXCEPTION_ROUTINE_DEFINED

type PEXCEPTION_ROUTINE as function(byval ExceptionRecord as _EXCEPTION_RECORD ptr, byval EstablisherFrame as PVOID, byval ContextRecord as _CONTEXT ptr, byval DispatcherContext as PVOID) as long

#define VER_WORKSTATION_NT &h40000000
#define VER_SERVER_NT &h80000000
#define VER_SUITE_SMALLBUSINESS &h00000001
#define VER_SUITE_ENTERPRISE &h00000002
#define VER_SUITE_BACKOFFICE &h00000004
#define VER_SUITE_COMMUNICATIONS &h00000008
#define VER_SUITE_TERMINAL &h00000010
#define VER_SUITE_SMALLBUSINESS_RESTRICTED &h00000020
#define VER_SUITE_EMBEDDEDNT &h00000040
#define VER_SUITE_DATACENTER &h00000080
#define VER_SUITE_SINGLEUSERTS &h00000100
#define VER_SUITE_PERSONAL &h00000200
#define VER_SUITE_BLADE &h00000400
#define VER_SUITE_EMBEDDED_RESTRICTED &h00000800
#define VER_SUITE_SECURITY_APPLIANCE &h00001000
#define VER_SUITE_STORAGE_SERVER &h00002000
#define VER_SUITE_COMPUTE_SERVER &h00004000
#define VER_SUITE_WH_SERVER &h00008000
#define PRODUCT_UNDEFINED &h0
#define PRODUCT_ULTIMATE &h1
#define PRODUCT_HOME_BASIC &h2
#define PRODUCT_HOME_PREMIUM &h3
#define PRODUCT_ENTERPRISE &h4
#define PRODUCT_HOME_BASIC_N &h5
#define PRODUCT_BUSINESS &h6
#define PRODUCT_STANDARD_SERVER &h7
#define PRODUCT_DATACENTER_SERVER &h8
#define PRODUCT_SMALLBUSINESS_SERVER &h9
#define PRODUCT_ENTERPRISE_SERVER &ha
#define PRODUCT_STARTER &hb
#define PRODUCT_DATACENTER_SERVER_CORE &hc
#define PRODUCT_STANDARD_SERVER_CORE &hd
#define PRODUCT_ENTERPRISE_SERVER_CORE &he
#define PRODUCT_ENTERPRISE_SERVER_IA64 &hf
#define PRODUCT_BUSINESS_N &h10
#define PRODUCT_WEB_SERVER &h11
#define PRODUCT_CLUSTER_SERVER &h12
#define PRODUCT_HOME_SERVER &h13
#define PRODUCT_STORAGE_EXPRESS_SERVER &h14
#define PRODUCT_STORAGE_STANDARD_SERVER &h15
#define PRODUCT_STORAGE_WORKGROUP_SERVER &h16
#define PRODUCT_STORAGE_ENTERPRISE_SERVER &h17
#define PRODUCT_SERVER_FOR_SMALLBUSINESS &h18
#define PRODUCT_SMALLBUSINESS_SERVER_PREMIUM &h19
#define PRODUCT_HOME_PREMIUM_N &h1a
#define PRODUCT_ENTERPRISE_N &h1b
#define PRODUCT_ULTIMATE_N &h1c
#define PRODUCT_WEB_SERVER_CORE &h1d
#define PRODUCT_MEDIUMBUSINESS_SERVER_MANAGEMENT &h1e
#define PRODUCT_MEDIUMBUSINESS_SERVER_SECURITY &h1f
#define PRODUCT_MEDIUMBUSINESS_SERVER_MESSAGING &h20
#define PRODUCT_SERVER_FOUNDATION &h21
#define PRODUCT_HOME_PREMIUM_SERVER &h22
#define PRODUCT_SERVER_FOR_SMALLBUSINESS_V &h23
#define PRODUCT_STANDARD_SERVER_V &h24
#define PRODUCT_DATACENTER_SERVER_V &h25
#define PRODUCT_ENTERPRISE_SERVER_V &h26
#define PRODUCT_DATACENTER_SERVER_CORE_V &h27
#define PRODUCT_STANDARD_SERVER_CORE_V &h28
#define PRODUCT_ENTERPRISE_SERVER_CORE_V &h29
#define PRODUCT_HYPERV &h2a
#define PRODUCT_STORAGE_EXPRESS_SERVER_CORE &h2b
#define PRODUCT_STORAGE_STANDARD_SERVER_CORE &h2c
#define PRODUCT_STORAGE_WORKGROUP_SERVER_CORE &h2d
#define PRODUCT_STORAGE_ENTERPRISE_SERVER_CORE &h2e
#define PRODUCT_STARTER_N &h2f
#define PRODUCT_PROFESSIONAL &h30
#define PRODUCT_PROFESSIONAL_N &h31
#define PRODUCT_SB_SOLUTION_SERVER &h32
#define PRODUCT_SERVER_FOR_SB_SOLUTIONS &h33
#define PRODUCT_STANDARD_SERVER_SOLUTIONS &h34
#define PRODUCT_STANDARD_SERVER_SOLUTIONS_CORE &h35
#define PRODUCT_SB_SOLUTION_SERVER_EM &h36
#define PRODUCT_SERVER_FOR_SB_SOLUTIONS_EM &h37
#define PRODUCT_SOLUTION_EMBEDDEDSERVER &h38
#define PRODUCT_SOLUTION_EMBEDDEDSERVER_CORE &h39
#define PRODUCT_ESSENTIALBUSINESS_SERVER_MGMT &h3B
#define PRODUCT_ESSENTIALBUSINESS_SERVER_ADDL &h3C
#define PRODUCT_ESSENTIALBUSINESS_SERVER_MGMTSVC &h3D
#define PRODUCT_ESSENTIALBUSINESS_SERVER_ADDLSVC &h3E
#define PRODUCT_SMALLBUSINESS_SERVER_PREMIUM_CORE &h3f
#define PRODUCT_CLUSTER_SERVER_V &h40
#define PRODUCT_EMBEDDED &h41
#define PRODUCT_STARTER_E &h42
#define PRODUCT_HOME_BASIC_E &h43
#define PRODUCT_HOME_PREMIUM_E &h44
#define PRODUCT_PROFESSIONAL_E &h45
#define PRODUCT_ENTERPRISE_E &h46
#define PRODUCT_ULTIMATE_E &h47
#define PRODUCT_ENTERPRISE_EVALUATION &h48
#define PRODUCT_MULTIPOINT_STANDARD_SERVER &h4C
#define PRODUCT_MULTIPOINT_PREMIUM_SERVER &h4D
#define PRODUCT_STANDARD_EVALUATION_SERVER &h4F
#define PRODUCT_DATACENTER_EVALUATION_SERVER &h50
#define PRODUCT_ENTERPRISE_N_EVALUATION &h54
#define PRODUCT_EMBEDDED_AUTOMOTIVE &h55
#define PRODUCT_EMBEDDED_INDUSTRY_A &h56
#define PRODUCT_THINPC &h57
#define PRODUCT_EMBEDDED_A &h58
#define PRODUCT_EMBEDDED_INDUSTRY &h59
#define PRODUCT_EMBEDDED_E &h5A
#define PRODUCT_EMBEDDED_INDUSTRY_E &h5B
#define PRODUCT_EMBEDDED_INDUSTRY_A_E &h5C
#define PRODUCT_STORAGE_WORKGROUP_EVALUATION_SERVER &h5F
#define PRODUCT_STORAGE_STANDARD_EVALUATION_SERVER &h60
#define PRODUCT_CORE_ARM &h61
#define PRODUCT_CORE_N &h62
#define PRODUCT_CORE_COUNTRYSPECIFIC &h63
#define PRODUCT_CORE_SINGLELANGUAGE &h64
#define PRODUCT_CORE &h65
#define PRODUCT_PROFESSIONAL_WMC &h67
#define PRODUCT_MOBILE_CORE &h68
#define PRODUCT_UNLICENSED &habcdabcd
#define LANG_NEUTRAL &h00
#define LANG_INVARIANT &h7f
#define LANG_AFRIKAANS &h36
#define LANG_ALBANIAN &h1c
#define LANG_ALSATIAN &h84
#define LANG_AMHARIC &h5e
#define LANG_ARABIC &h01
#define LANG_ARMENIAN &h2b
#define LANG_ASSAMESE &h4d
#define LANG_AZERI &h2c
#define LANG_AZERBAIJANI &h2c
#define LANG_BANGLA &h45
#define LANG_BASHKIR &h6d
#define LANG_BASQUE &h2d
#define LANG_BELARUSIAN &h23
#define LANG_BENGALI &h45
#define LANG_BRETON &h7e
#define LANG_BOSNIAN &h1a
#define LANG_BOSNIAN_NEUTRAL &h781a
#define LANG_BULGARIAN &h02
#define LANG_CATALAN &h03
#define LANG_CENTRAL_KURDISH &h92
#define LANG_CHEROKEE &h5c
#define LANG_CHINESE &h04
#define LANG_CHINESE_SIMPLIFIED &h04
#define LANG_CHINESE_TRADITIONAL &h7c04
#define LANG_CORSICAN &h83
#define LANG_CROATIAN &h1a
#define LANG_CZECH &h05
#define LANG_DANISH &h06
#define LANG_DARI &h8c
#define LANG_DIVEHI &h65
#define LANG_DUTCH &h13
#define LANG_ENGLISH &h09
#define LANG_ESTONIAN &h25
#define LANG_FAEROESE &h38
#define LANG_FARSI &h29
#define LANG_FILIPINO &h64
#define LANG_FINNISH &h0b
#define LANG_FRENCH &h0c
#define LANG_FRISIAN &h62
#define LANG_FULAH &h67
#define LANG_GALICIAN &h56
#define LANG_GEORGIAN &h37
#define LANG_GERMAN &h07
#define LANG_GREEK &h08
#define LANG_GREENLANDIC &h6f
#define LANG_GUJARATI &h47
#define LANG_HAUSA &h68
#define LANG_HEBREW &h0d
#define LANG_HINDI &h39
#define LANG_HUNGARIAN &h0e
#define LANG_ICELANDIC &h0f
#define LANG_IGBO &h70
#define LANG_INDONESIAN &h21
#define LANG_INUKTITUT &h5d
#define LANG_IRISH &h3c
#define LANG_ITALIAN &h10
#define LANG_JAPANESE &h11
#define LANG_KANNADA &h4b
#define LANG_KASHMIRI &h60
#define LANG_KAZAK &h3f
#define LANG_KHMER &h53
#define LANG_KICHE &h86
#define LANG_KINYARWANDA &h87
#define LANG_KONKANI &h57
#define LANG_KOREAN &h12
#define LANG_KYRGYZ &h40
#define LANG_LAO &h54
#define LANG_LATVIAN &h26
#define LANG_LITHUANIAN &h27
#define LANG_LOWER_SORBIAN &h2e
#define LANG_LUXEMBOURGISH &h6e
#define LANG_MACEDONIAN &h2f
#define LANG_MALAY &h3e
#define LANG_MALAYALAM &h4c
#define LANG_MALTESE &h3a
#define LANG_MANIPURI &h58
#define LANG_MAORI &h81
#define LANG_MAPUDUNGUN &h7a
#define LANG_MARATHI &h4e
#define LANG_MOHAWK &h7c
#define LANG_MONGOLIAN &h50
#define LANG_NEPALI &h61
#define LANG_NORWEGIAN &h14
#define LANG_OCCITAN &h82
#define LANG_ODIA &h48
#define LANG_ORIYA &h48
#define LANG_PASHTO &h63
#define LANG_PERSIAN &h29
#define LANG_POLISH &h15
#define LANG_PORTUGUESE &h16
#define LANG_PULAR &h67
#define LANG_PUNJABI &h46
#define LANG_QUECHUA &h6b
#define LANG_ROMANIAN &h18
#define LANG_ROMANSH &h17
#define LANG_RUSSIAN &h19
#define LANG_SAKHA &h85
#define LANG_SAMI &h3b
#define LANG_SANSKRIT &h4f
#define LANG_SCOTTISH_GAELIC &h91
#define LANG_SERBIAN &h1a
#define LANG_SERBIAN_NEUTRAL &h7c1a
#define LANG_SINDHI &h59
#define LANG_SINHALESE &h5b
#define LANG_SLOVAK &h1b
#define LANG_SLOVENIAN &h24
#define LANG_SOTHO &h6c
#define LANG_SPANISH &h0a
#define LANG_SWAHILI &h41
#define LANG_SWEDISH &h1d
#define LANG_SYRIAC &h5a
#define LANG_TAJIK &h28
#define LANG_TAMAZIGHT &h5f
#define LANG_TAMIL &h49
#define LANG_TATAR &h44
#define LANG_TELUGU &h4a
#define LANG_THAI &h1e
#define LANG_TIBETAN &h51
#define LANG_TIGRIGNA &h73
#define LANG_TIGRINYA &h73
#define LANG_TSWANA &h32
#define LANG_TURKISH &h1f
#define LANG_TURKMEN &h42
#define LANG_UIGHUR &h80
#define LANG_UKRAINIAN &h22
#define LANG_UPPER_SORBIAN &h2e
#define LANG_URDU &h20
#define LANG_UZBEK &h43
#define LANG_VALENCIAN &h03
#define LANG_VIETNAMESE &h2a
#define LANG_WELSH &h52
#define LANG_WOLOF &h88
#define LANG_XHOSA &h34
#define LANG_YAKUT &h85
#define LANG_YI &h78
#define LANG_YORUBA &h6a
#define LANG_ZULU &h35
#define SUBLANG_NEUTRAL &h00
#define SUBLANG_DEFAULT &h01
#define SUBLANG_SYS_DEFAULT &h02
#define SUBLANG_CUSTOM_DEFAULT &h03
#define SUBLANG_CUSTOM_UNSPECIFIED &h04
#define SUBLANG_UI_CUSTOM_DEFAULT &h05
#define SUBLANG_AFRIKAANS_SOUTH_AFRICA &h01
#define SUBLANG_ALBANIAN_ALBANIA &h01
#define SUBLANG_ALSATIAN_FRANCE &h01
#define SUBLANG_AMHARIC_ETHIOPIA &h01
#define SUBLANG_ARABIC_SAUDI_ARABIA &h01
#define SUBLANG_ARABIC_IRAQ &h02
#define SUBLANG_ARABIC_EGYPT &h03
#define SUBLANG_ARABIC_LIBYA &h04
#define SUBLANG_ARABIC_ALGERIA &h05
#define SUBLANG_ARABIC_MOROCCO &h06
#define SUBLANG_ARABIC_TUNISIA &h07
#define SUBLANG_ARABIC_OMAN &h08
#define SUBLANG_ARABIC_YEMEN &h09
#define SUBLANG_ARABIC_SYRIA &h0a
#define SUBLANG_ARABIC_JORDAN &h0b
#define SUBLANG_ARABIC_LEBANON &h0c
#define SUBLANG_ARABIC_KUWAIT &h0d
#define SUBLANG_ARABIC_UAE &h0e
#define SUBLANG_ARABIC_BAHRAIN &h0f
#define SUBLANG_ARABIC_QATAR &h10
#define SUBLANG_ARMENIAN_ARMENIA &h01
#define SUBLANG_ASSAMESE_INDIA &h01
#define SUBLANG_AZERI_LATIN &h01
#define SUBLANG_AZERI_CYRILLIC &h02
#define SUBLANG_AZERBAIJANI_AZERBAIJAN_LATIN &h01
#define SUBLANG_AZERBAIJANI_AZERBAIJAN_CYRILLIC &h02
#define SUBLANG_BANGLA_INDIA &h01
#define SUBLANG_BANGLA_BANGLADESH &h02
#define SUBLANG_BASHKIR_RUSSIA &h01
#define SUBLANG_BASQUE_BASQUE &h01
#define SUBLANG_BELARUSIAN_BELARUS &h01
#define SUBLANG_BENGALI_INDIA &h01
#define SUBLANG_BENGALI_BANGLADESH &h02
#define SUBLANG_BOSNIAN_BOSNIA_HERZEGOVINA_LATIN &h05
#define SUBLANG_BOSNIAN_BOSNIA_HERZEGOVINA_CYRILLIC &h08
#define SUBLANG_BRETON_FRANCE &h01
#define SUBLANG_BULGARIAN_BULGARIA &h01
#define SUBLANG_CATALAN_CATALAN &h01
#define SUBLANG_CENTRAL_KURDISH_IRAQ &h01
#define SUBLANG_CHEROKEE_CHEROKEE &h01
#define SUBLANG_CHINESE_TRADITIONAL &h01
#define SUBLANG_CHINESE_SIMPLIFIED &h02
#define SUBLANG_CHINESE_HONGKONG &h03
#define SUBLANG_CHINESE_SINGAPORE &h04
#define SUBLANG_CHINESE_MACAU &h05
#define SUBLANG_CORSICAN_FRANCE &h01
#define SUBLANG_CZECH_CZECH_REPUBLIC &h01
#define SUBLANG_CROATIAN_CROATIA &h01
#define SUBLANG_CROATIAN_BOSNIA_HERZEGOVINA_LATIN &h04
#define SUBLANG_DANISH_DENMARK &h01
#define SUBLANG_DARI_AFGHANISTAN &h01
#define SUBLANG_DIVEHI_MALDIVES &h01
#define SUBLANG_DUTCH &h01
#define SUBLANG_DUTCH_BELGIAN &h02
#define SUBLANG_ENGLISH_US &h01
#define SUBLANG_ENGLISH_UK &h02
#define SUBLANG_ENGLISH_AUS &h03
#define SUBLANG_ENGLISH_CAN &h04
#define SUBLANG_ENGLISH_NZ &h05
#define SUBLANG_ENGLISH_IRELAND &h06
#define SUBLANG_ENGLISH_EIRE &h06
#define SUBLANG_ENGLISH_SOUTH_AFRICA &h07
#define SUBLANG_ENGLISH_JAMAICA &h08
#define SUBLANG_ENGLISH_CARIBBEAN &h09
#define SUBLANG_ENGLISH_BELIZE &h0a
#define SUBLANG_ENGLISH_TRINIDAD &h0b
#define SUBLANG_ENGLISH_ZIMBABWE &h0c
#define SUBLANG_ENGLISH_PHILIPPINES &h0d
#define SUBLANG_ENGLISH_INDIA &h10
#define SUBLANG_ENGLISH_MALAYSIA &h11
#define SUBLANG_ENGLISH_SINGAPORE &h12
#define SUBLANG_ESTONIAN_ESTONIA &h01
#define SUBLANG_FAEROESE_FAROE_ISLANDS &h01
#define SUBLANG_FILIPINO_PHILIPPINES &h01
#define SUBLANG_FINNISH_FINLAND &h01
#define SUBLANG_FRENCH &h01
#define SUBLANG_FRENCH_BELGIAN &h02
#define SUBLANG_FRENCH_CANADIAN &h03
#define SUBLANG_FRENCH_SWISS &h04
#define SUBLANG_FRENCH_LUXEMBOURG &h05
#define SUBLANG_FRENCH_MONACO &h06
#define SUBLANG_FRISIAN_NETHERLANDS &h01
#define SUBLANG_FULAH_SENEGAL &h02
#define SUBLANG_GALICIAN_GALICIAN &h01
#define SUBLANG_GEORGIAN_GEORGIA &h01
#define SUBLANG_GERMAN &h01
#define SUBLANG_GERMAN_SWISS &h02
#define SUBLANG_GERMAN_AUSTRIAN &h03
#define SUBLANG_GERMAN_LUXEMBOURG &h04
#define SUBLANG_GERMAN_LIECHTENSTEIN &h05
#define SUBLANG_GREEK_GREECE &h01
#define SUBLANG_GREENLANDIC_GREENLAND &h01
#define SUBLANG_GUJARATI_INDIA &h01
#define SUBLANG_HAUSA_NIGERIA_LATIN &h01
#define SUBLANG_HAUSA_NIGERIA SUBLANG_HAUSA_NIGERIA_LATIN
#define SUBLANG_HAWAIIAN_US &h01
#define SUBLANG_HEBREW_ISRAEL &h01
#define SUBLANG_HINDI_INDIA &h01
#define SUBLANG_HUNGARIAN_HUNGARY &h01
#define SUBLANG_ICELANDIC_ICELAND &h01
#define SUBLANG_IGBO_NIGERIA &h01
#define SUBLANG_INDONESIAN_INDONESIA &h01
#define SUBLANG_INUKTITUT_CANADA &h01
#define SUBLANG_INUKTITUT_CANADA_LATIN &h02
#define SUBLANG_IRISH_IRELAND &h02
#define SUBLANG_ITALIAN &h01
#define SUBLANG_ITALIAN_SWISS &h02
#define SUBLANG_JAPANESE_JAPAN &h01
#define SUBLANG_KANNADA_INDIA &h01
#define SUBLANG_KASHMIRI_INDIA &h02
#define SUBLANG_KASHMIRI_SASIA &h02
#define SUBLANG_KAZAK_KAZAKHSTAN &h01
#define SUBLANG_KHMER_CAMBODIA &h01
#define SUBLANG_KICHE_GUATEMALA &h01
#define SUBLANG_KINYARWANDA_RWANDA &h01
#define SUBLANG_KONKANI_INDIA &h01
#define SUBLANG_KOREAN &h01
#define SUBLANG_KYRGYZ_KYRGYZSTAN &h01
#define SUBLANG_LAO_LAO &h01
#define SUBLANG_LAO_LAO_PDR SUBLANG_LAO_LAO
#define SUBLANG_LATVIAN_LATVIA &h01
#define SUBLANG_LITHUANIAN &h01
#define SUBLANG_LOWER_SORBIAN_GERMANY &h02
#define SUBLANG_LUXEMBOURGISH_LUXEMBOURG &h01
#define SUBLANG_MACEDONIAN_MACEDONIA &h01
#define SUBLANG_MALAY_MALAYSIA &h01
#define SUBLANG_MALAY_BRUNEI_DARUSSALAM &h02
#define SUBLANG_MALAYALAM_INDIA &h01
#define SUBLANG_MALTESE_MALTA &h01
#define SUBLANG_MAORI_NEW_ZEALAND &h01
#define SUBLANG_MAPUDUNGUN_CHILE &h01
#define SUBLANG_MARATHI_INDIA &h01
#define SUBLANG_MOHAWK_MOHAWK &h01
#define SUBLANG_MONGOLIAN_CYRILLIC_MONGOLIA &h01
#define SUBLANG_MONGOLIAN_PRC &h02
#define SUBLANG_NEPALI_NEPAL &h01
#define SUBLANG_NEPALI_INDIA &h02
#define SUBLANG_NORWEGIAN_BOKMAL &h01
#define SUBLANG_NORWEGIAN_NYNORSK &h02
#define SUBLANG_OCCITAN_FRANCE &h01
#define SUBLANG_ORIYA_INDIA &h01
#define SUBLANG_PASHTO_AFGHANISTAN &h01
#define SUBLANG_PERSIAN_IRAN &h01
#define SUBLANG_POLISH_POLAND &h01
#define SUBLANG_PORTUGUESE_BRAZILIAN &h01
#define SUBLANG_PORTUGUESE &h02
#define SUBLANG_PULAR_SENEGAL &h02
#define SUBLANG_PUNJABI_INDIA &h01
#define SUBLANG_PUNJABI_PAKISTAN &h02
#define SUBLANG_QUECHUA_BOLIVIA &h01
#define SUBLANG_QUECHUA_ECUADOR &h02
#define SUBLANG_QUECHUA_PERU &h03
#define SUBLANG_ROMANIAN_ROMANIA &h01
#define SUBLANG_ROMANSH_SWITZERLAND &h01
#define SUBLANG_RUSSIAN_RUSSIA &h01
#define SUBLANG_SAKHA_RUSSIA &h01
#define SUBLANG_SAMI_NORTHERN_NORWAY &h01
#define SUBLANG_SAMI_NORTHERN_SWEDEN &h02
#define SUBLANG_SAMI_NORTHERN_FINLAND &h03
#define SUBLANG_SAMI_LULE_NORWAY &h04
#define SUBLANG_SAMI_LULE_SWEDEN &h05
#define SUBLANG_SAMI_SOUTHERN_NORWAY &h06
#define SUBLANG_SAMI_SOUTHERN_SWEDEN &h07
#define SUBLANG_SAMI_SKOLT_FINLAND &h08
#define SUBLANG_SAMI_INARI_FINLAND &h09
#define SUBLANG_SANSKRIT_INDIA &h01
#define SUBLANG_SCOTTISH_GAELIC &h01
#define SUBLANG_SERBIAN_LATIN &h02
#define SUBLANG_SERBIAN_CYRILLIC &h03
#define SUBLANG_SERBIAN_BOSNIA_HERZEGOVINA_LATIN &h06
#define SUBLANG_SERBIAN_BOSNIA_HERZEGOVINA_CYRILLIC &h07
#define SUBLANG_SERBIAN_MONTENEGRO_LATIN &h0b
#define SUBLANG_SERBIAN_MONTENEGRO_CYRILLIC &h0c
#define SUBLANG_SERBIAN_SERBIA_LATIN &h09
#define SUBLANG_SERBIAN_SERBIA_CYRILLIC &h0a
#define SUBLANG_SINDHI_INDIA &h01
#define SUBLANG_SINDHI_AFGHANISTAN &h02
#define SUBLANG_SINDHI_PAKISTAN &h02
#define SUBLANG_SINHALESE_SRI_LANKA &h01
#define SUBLANG_SOTHO_NORTHERN_SOUTH_AFRICA &h01
#define SUBLANG_SLOVAK_SLOVAKIA &h01
#define SUBLANG_SLOVENIAN_SLOVENIA &h01
#define SUBLANG_SPANISH &h01
#define SUBLANG_SPANISH_MEXICAN &h02
#define SUBLANG_SPANISH_MODERN &h03
#define SUBLANG_SPANISH_GUATEMALA &h04
#define SUBLANG_SPANISH_COSTA_RICA &h05
#define SUBLANG_SPANISH_PANAMA &h06
#define SUBLANG_SPANISH_DOMINICAN_REPUBLIC &h07
#define SUBLANG_SPANISH_VENEZUELA &h08
#define SUBLANG_SPANISH_COLOMBIA &h09
#define SUBLANG_SPANISH_PERU &h0a
#define SUBLANG_SPANISH_ARGENTINA &h0b
#define SUBLANG_SPANISH_ECUADOR &h0c
#define SUBLANG_SPANISH_CHILE &h0d
#define SUBLANG_SPANISH_URUGUAY &h0e
#define SUBLANG_SPANISH_PARAGUAY &h0f
#define SUBLANG_SPANISH_BOLIVIA &h10
#define SUBLANG_SPANISH_EL_SALVADOR &h11
#define SUBLANG_SPANISH_HONDURAS &h12
#define SUBLANG_SPANISH_NICARAGUA &h13
#define SUBLANG_SPANISH_PUERTO_RICO &h14
#define SUBLANG_SPANISH_US &h15
#define SUBLANG_SWAHILI_KENYA &h01
#define SUBLANG_SWEDISH &h01
#define SUBLANG_SWEDISH_FINLAND &h02
#define SUBLANG_SYRIAC &h01
#define SUBLANG_SYRIAC_SYRIA SUBLANG_SYRIAC
#define SUBLANG_TAJIK_TAJIKISTAN &h01
#define SUBLANG_TAMAZIGHT_ALGERIA_LATIN &h02
#define SUBLANG_TAMAZIGHT_MOROCCO_TIFINAGH &h04
#define SUBLANG_TAMIL_INDIA &h01
#define SUBLANG_TAMIL_SRI_LANKA &h02
#define SUBLANG_TATAR_RUSSIA &h01
#define SUBLANG_TELUGU_INDIA &h01
#define SUBLANG_THAI_THAILAND &h01
#define SUBLANG_TIBETAN_PRC &h01
#define SUBLANG_TIBETAN_BHUTAN &h02
#define SUBLANG_TIGRIGNA_ERITREA &h02
#define SUBLANG_TIGRINYA_ERITREA &h02
#define SUBLANG_TIGRINYA_ETHIOPIA &h01
#define SUBLANG_TSWANA_BOTSWANA &h02
#define SUBLANG_TSWANA_SOUTH_AFRICA &h01
#define SUBLANG_TURKISH_TURKEY &h01
#define SUBLANG_TURKMEN_TURKMENISTAN &h01
#define SUBLANG_UIGHUR_PRC &h01
#define SUBLANG_UKRAINIAN_UKRAINE &h01
#define SUBLANG_UPPER_SORBIAN_GERMANY &h01
#define SUBLANG_URDU_PAKISTAN &h01
#define SUBLANG_URDU_INDIA &h02
#define SUBLANG_UZBEK_LATIN &h01
#define SUBLANG_UZBEK_CYRILLIC &h02
#define SUBLANG_VALENCIAN_VALENCIA &h02
#define SUBLANG_VIETNAMESE_VIETNAM &h01
#define SUBLANG_WELSH_UNITED_KINGDOM &h01
#define SUBLANG_WOLOF_SENEGAL &h01
#define SUBLANG_YORUBA_NIGERIA &h01
#define SUBLANG_XHOSA_SOUTH_AFRICA &h01
#define SUBLANG_YAKUT_RUSSIA &h01
#define SUBLANG_YI_PRC &h01
#define SUBLANG_ZULU_SOUTH_AFRICA &h01
#define SORT_DEFAULT &h0
#define SORT_INVARIANT_MATH &h1
#define SORT_JAPANESE_XJIS &h0
#define SORT_JAPANESE_UNICODE &h1
#define SORT_JAPANESE_RADICALSTROKE &h4
#define SORT_CHINESE_BIG5 &h0
#define SORT_CHINESE_PRCP &h0
#define SORT_CHINESE_UNICODE &h1
#define SORT_CHINESE_PRC &h2
#define SORT_CHINESE_BOPOMOFO &h3
#define SORT_CHINESE_RADICALSTROKE &h4
#define SORT_KOREAN_KSC &h0
#define SORT_KOREAN_UNICODE &h1
#define SORT_GERMAN_PHONE_BOOK &h1
#define SORT_HUNGARIAN_DEFAULT &h0
#define SORT_HUNGARIAN_TECHNICAL &h1
#define SORT_GEORGIAN_TRADITIONAL &h0
#define SORT_GEORGIAN_MODERN &h1

'' TODO: #define MAKELANGID(p,s) ((((WORD)(s)) << 10) | (WORD)(p))
'' TODO: #define PRIMARYLANGID(lgid) ((WORD)(lgid) & 0x3ff)
'' TODO: #define SUBLANGID(lgid) ((WORD)(lgid) >> 10)

#define NLS_VALID_LOCALE_MASK &h000fffff

'' TODO: #define MAKELCID(lgid,srtid) ((DWORD)((((DWORD)((WORD)(srtid))) << 16) | ((DWORD)((WORD)(lgid)))))
'' TODO: #define MAKESORTLCID(lgid,srtid,ver) ((DWORD)((MAKELCID(lgid,srtid)) | (((DWORD)((WORD)(ver))) << 20)))
'' TODO: #define LANGIDFROMLCID(lcid) ((WORD)(lcid))
'' TODO: #define SORTIDFROMLCID(lcid) ((WORD)((((DWORD)(lcid)) >> 16) & 0xf))
'' TODO: #define SORTVERSIONFROMLCID(lcid) ((WORD)((((DWORD)(lcid)) >> 20) & 0xf))

#define LOCALE_NAME_MAX_LENGTH 85
#define LANG_SYSTEM_DEFAULT MAKELANGID(LANG_NEUTRAL, SUBLANG_SYS_DEFAULT)
#define LANG_USER_DEFAULT MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT)
#define LOCALE_SYSTEM_DEFAULT MAKELCID(LANG_SYSTEM_DEFAULT, SORT_DEFAULT)
#define LOCALE_USER_DEFAULT MAKELCID(LANG_USER_DEFAULT, SORT_DEFAULT)
#define LOCALE_NEUTRAL MAKELCID(MAKELANGID(LANG_NEUTRAL, SUBLANG_NEUTRAL), SORT_DEFAULT)
#define LOCALE_CUSTOM_DEFAULT MAKELCID(MAKELANGID(LANG_NEUTRAL, SUBLANG_CUSTOM_DEFAULT), SORT_DEFAULT)
#define LOCALE_CUSTOM_UNSPECIFIED MAKELCID(MAKELANGID(LANG_NEUTRAL, SUBLANG_CUSTOM_UNSPECIFIED), SORT_DEFAULT)
#define LOCALE_CUSTOM_UI_DEFAULT MAKELCID(MAKELANGID(LANG_NEUTRAL, SUBLANG_UI_CUSTOM_DEFAULT), SORT_DEFAULT)
#define LOCALE_INVARIANT MAKELCID(MAKELANGID(LANG_INVARIANT, SUBLANG_NEUTRAL), SORT_DEFAULT)
#macro UNREFERENCED_PARAMETER(P)
	scope
		(P)
		'' TODO: (P) = (P);
	end scope
#endmacro
#macro UNREFERENCED_LOCAL_VARIABLE(V)
	scope
		(V)
		'' TODO: (V) = (V);
	end scope
#endmacro
#define DBG_UNREFERENCED_PARAMETER(P) (P)
#define DBG_UNREFERENCED_LOCAL_VARIABLE(V) (V)
#define DEFAULT_UNREACHABLE

'' TODO: #define STATUS_WAIT_0 ((DWORD)0x00000000)
'' TODO: #define STATUS_ABANDONED_WAIT_0 ((DWORD)0x00000080)
'' TODO: #define STATUS_USER_APC ((DWORD)0x000000C0)
'' TODO: #define STATUS_TIMEOUT ((DWORD)0x00000102)
'' TODO: #define STATUS_PENDING ((DWORD)0x00000103)
'' TODO: #define DBG_EXCEPTION_HANDLED ((DWORD)0x00010001)
'' TODO: #define DBG_CONTINUE ((DWORD)0x00010002)
'' TODO: #define STATUS_SEGMENT_NOTIFICATION ((DWORD)0x40000005)
'' TODO: #define STATUS_FATAL_APP_EXIT ((DWORD)0x40000015)
'' TODO: #define DBG_TERMINATE_THREAD ((DWORD)0x40010003)
'' TODO: #define DBG_TERMINATE_PROCESS ((DWORD)0x40010004)
'' TODO: #define DBG_CONTROL_C ((DWORD)0x40010005)
'' TODO: #define DBG_PRINTEXCEPTION_C ((DWORD)0x40010006)
'' TODO: #define DBG_RIPEXCEPTION ((DWORD)0x40010007)
'' TODO: #define DBG_CONTROL_BREAK ((DWORD)0x40010008)
'' TODO: #define DBG_COMMAND_EXCEPTION ((DWORD)0x40010009)
'' TODO: #define STATUS_GUARD_PAGE_VIOLATION ((DWORD)0x80000001)
'' TODO: #define STATUS_DATATYPE_MISALIGNMENT ((DWORD)0x80000002)
'' TODO: #define STATUS_BREAKPOINT ((DWORD)0x80000003)
'' TODO: #define STATUS_SINGLE_STEP ((DWORD)0x80000004)
'' TODO: #define STATUS_LONGJUMP ((DWORD)0x80000026)
'' TODO: #define STATUS_UNWIND_CONSOLIDATE ((DWORD)0x80000029)
'' TODO: #define DBG_EXCEPTION_NOT_HANDLED ((DWORD)0x80010001)
'' TODO: #define STATUS_ACCESS_VIOLATION ((DWORD)0xC0000005)
'' TODO: #define STATUS_IN_PAGE_ERROR ((DWORD)0xC0000006)
'' TODO: #define STATUS_INVALID_HANDLE ((DWORD)0xC0000008)
'' TODO: #define STATUS_INVALID_PARAMETER ((DWORD)0xC000000D)
'' TODO: #define STATUS_NO_MEMORY ((DWORD)0xC0000017)
'' TODO: #define STATUS_ILLEGAL_INSTRUCTION ((DWORD)0xC000001D)
'' TODO: #define STATUS_NONCONTINUABLE_EXCEPTION ((DWORD)0xC0000025)
'' TODO: #define STATUS_INVALID_DISPOSITION ((DWORD)0xC0000026)
'' TODO: #define STATUS_ARRAY_BOUNDS_EXCEEDED ((DWORD)0xC000008C)
'' TODO: #define STATUS_FLOAT_DENORMAL_OPERAND ((DWORD)0xC000008D)
'' TODO: #define STATUS_FLOAT_DIVIDE_BY_ZERO ((DWORD)0xC000008E)
'' TODO: #define STATUS_FLOAT_INEXACT_RESULT ((DWORD)0xC000008F)
'' TODO: #define STATUS_FLOAT_INVALID_OPERATION ((DWORD)0xC0000090)
'' TODO: #define STATUS_FLOAT_OVERFLOW ((DWORD)0xC0000091)
'' TODO: #define STATUS_FLOAT_STACK_CHECK ((DWORD)0xC0000092)
'' TODO: #define STATUS_FLOAT_UNDERFLOW ((DWORD)0xC0000093)
'' TODO: #define STATUS_INTEGER_DIVIDE_BY_ZERO ((DWORD)0xC0000094)
'' TODO: #define STATUS_INTEGER_OVERFLOW ((DWORD)0xC0000095)
'' TODO: #define STATUS_PRIVILEGED_INSTRUCTION ((DWORD)0xC0000096)
'' TODO: #define STATUS_STACK_OVERFLOW ((DWORD)0xC00000FD)
'' TODO: #define STATUS_DLL_NOT_FOUND ((DWORD)0xC0000135)
'' TODO: #define STATUS_ORDINAL_NOT_FOUND ((DWORD)0xC0000138)
'' TODO: #define STATUS_ENTRYPOINT_NOT_FOUND ((DWORD)0xC0000139)
'' TODO: #define STATUS_CONTROL_C_EXIT ((DWORD)0xC000013A)
'' TODO: #define STATUS_DLL_INIT_FAILED ((DWORD)0xC0000142)
'' TODO: #define STATUS_FLOAT_MULTIPLE_FAULTS ((DWORD)0xC00002B4)
'' TODO: #define STATUS_FLOAT_MULTIPLE_TRAPS ((DWORD)0xC00002B5)
'' TODO: #define STATUS_REG_NAT_CONSUMPTION ((DWORD)0xC00002C9)
'' TODO: #define STATUS_STACK_BUFFER_OVERRUN ((DWORD)0xC0000409)
'' TODO: #define STATUS_INVALID_CRUNTIME_PARAMETER ((DWORD)0xC0000417)
'' TODO: #define STATUS_ASSERTION_FAILURE ((DWORD)0xC0000420)
'' TODO: #define STATUS_SXS_EARLY_DEACTIVATION ((DWORD)0xC015000F)
'' TODO: #define STATUS_SXS_INVALID_DEACTIVATION ((DWORD)0xC0150010)

#define MAXIMUM_WAIT_OBJECTS 64
#define MAXIMUM_SUSPEND_COUNT MAXCHAR

type KSPIN_LOCK as ULONG_PTR
type PKSPIN_LOCK as KSPIN_LOCK ptr

type _M128A
	Low as ULONGLONG
	High as LONGLONG
end type

type M128A as _M128A
type PM128A as _M128A ptr

type _XSAVE_FORMAT
	ControlWord as WORD
	StatusWord as WORD
	TagWord as BYTE
	Reserved1 as BYTE
	ErrorOpcode as WORD
	ErrorOffset as DWORD
	ErrorSelector as WORD
	Reserved2 as WORD
	DataOffset as DWORD
	DataSelector as WORD
	Reserved3 as WORD
	MxCsr as DWORD
	MxCsr_Mask as DWORD
	FloatRegisters(0 to 7) as M128A

	#ifdef __FB_64BIT__
		XmmRegisters(0 to 15) as M128A
		Reserved4(0 to 95) as BYTE
	#else
		XmmRegisters(0 to 7) as M128A
		Reserved4(0 to 219) as BYTE
		Cr0NpxState as DWORD
	#endif
end type

type XSAVE_FORMAT as _XSAVE_FORMAT
type PXSAVE_FORMAT as _XSAVE_FORMAT ptr

type _XSAVE_AREA_HEADER
	Mask as DWORD64
	Reserved(0 to 6) as DWORD64
end type

type XSAVE_AREA_HEADER as _XSAVE_AREA_HEADER
type PXSAVE_AREA_HEADER as _XSAVE_AREA_HEADER ptr

type _XSAVE_AREA
	LegacyState as XSAVE_FORMAT
	Header as XSAVE_AREA_HEADER
end type

type XSAVE_AREA as _XSAVE_AREA
type PXSAVE_AREA as _XSAVE_AREA ptr

type _XSTATE_CONTEXT
	Mask as DWORD64
	Length as DWORD
	Reserved1 as DWORD
	Area as PXSAVE_AREA

	#ifndef __FB_64BIT__
		Reserved2 as DWORD
	#endif

	Buffer as PVOID

	#ifndef __FB_64BIT__
		Reserved3 as DWORD
	#endif
end type

type XSTATE_CONTEXT as _XSTATE_CONTEXT
type PXSTATE_CONTEXT as _XSTATE_CONTEXT ptr

type ___SCOPE_TABLE_AMD64_ScopeRecord
	BeginAddress as DWORD
	EndAddress as DWORD
	HandlerAddress as DWORD
	JumpTarget as DWORD
end type

type _SCOPE_TABLE_AMD64
	Count as DWORD
	ScopeRecord(0 to 0) as ___SCOPE_TABLE_AMD64_ScopeRecord
end type

type SCOPE_TABLE_AMD64 as _SCOPE_TABLE_AMD64
type PSCOPE_TABLE_AMD64 as _SCOPE_TABLE_AMD64 ptr

#define BitTest _bittest
#define BitTestAndComplement _bittestandcomplement
#define BitTestAndSet _bittestandset
#define BitTestAndReset _bittestandreset

#ifdef __FB_64BIT__
	#define BitTest64 _bittest64
	#define BitTestAndComplement64 _bittestandcomplement64
	#define BitTestAndSet64 _bittestandset64
	#define BitTestAndReset64 _bittestandreset64
#endif

#define BitScanForward _BitScanForward
#define BitScanReverse _BitScanReverse

#ifdef __FB_64BIT__
	#define BitScanForward64 _BitScanForward64
	#define BitScanReverse64 _BitScanReverse64
	#define InterlockedIncrement16 _InterlockedIncrement16
	#define InterlockedDecrement16 _InterlockedDecrement16
#endif

#define InterlockedCompareExchange16 _InterlockedCompareExchange16

#ifdef __FB_64BIT__
	#define InterlockedAnd _InterlockedAnd
	#define InterlockedOr _InterlockedOr
	#define InterlockedXor _InterlockedXor
	#define InterlockedIncrement _InterlockedIncrement
	#define InterlockedIncrementAcquire InterlockedIncrement
	#define InterlockedIncrementRelease InterlockedIncrement
	#define InterlockedDecrement _InterlockedDecrement
	#define InterlockedDecrementAcquire InterlockedDecrement
	#define InterlockedDecrementRelease InterlockedDecrement
	#define InterlockedAdd _InterlockedAdd
	#define InterlockedExchange _InterlockedExchange
	#define InterlockedExchangeAdd _InterlockedExchangeAdd
	#define InterlockedCompareExchange _InterlockedCompareExchange
	#define InterlockedCompareExchangeAcquire InterlockedCompareExchange
	#define InterlockedCompareExchangeRelease InterlockedCompareExchange
	#define InterlockedAnd64 _InterlockedAnd64
	#define InterlockedAndAffinity InterlockedAnd64
	#define InterlockedOr64 _InterlockedOr64
	#define InterlockedOrAffinity InterlockedOr64
	#define InterlockedXor64 _InterlockedXor64
	#define InterlockedIncrement64 _InterlockedIncrement64
	#define InterlockedDecrement64 _InterlockedDecrement64
	#define InterlockedAdd64 _InterlockedAdd64
	#define InterlockedExchange64 _InterlockedExchange64
	#define InterlockedExchangeAcquire64 InterlockedExchange64
	#define InterlockedExchangeAdd64 _InterlockedExchangeAdd64
	#define InterlockedCompareExchange64 _InterlockedCompareExchange64
	#define InterlockedCompareExchangeAcquire64 InterlockedCompareExchange64
	#define InterlockedCompareExchangeRelease64 InterlockedCompareExchange64
	#define InterlockedExchangePointer _InterlockedExchangePointer
	#define InterlockedCompareExchangePointer _InterlockedCompareExchangePointer
	#define InterlockedCompareExchangePointerAcquire _InterlockedCompareExchangePointer
	#define InterlockedCompareExchangePointerRelease _InterlockedCompareExchangePointer
	#define InterlockedExchangeAddSizeT(a, b) InterlockedExchangeAdd64(cptr(LONG64 ptr, a), b)
	#define InterlockedIncrementSizeT(a) InterlockedIncrement64(cptr(LONG64 ptr, a))
	#define InterlockedDecrementSizeT(a) InterlockedDecrement64(cptr(LONG64 ptr, a))

	declare function _InterlockedAdd(byval Addend as LONG_ ptr, byval Value as LONG_) as LONG_

	'' TODO: extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) LONG _InterlockedAdd(LONG volatile *Addend,LONG Value) { return _InterlockedExchangeAdd(Addend,Value) + Value; } LONG64 _InterlockedAdd64(LONG64 volatile *Addend,LONG64 Value);
	'' TODO: extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) LONG64 _InterlockedAdd64(LONG64 volatile *Addend,LONG64 Value) { return _InterlockedExchangeAdd64(Addend,Value) + Value; } unsigned int __getcallerseflags(void);

	#define CacheLineFlush(Address) _mm_clflush(Address)
	#define FastFence __faststorefence
	#define LoadFence _mm_lfence
	#define MemoryFence _mm_mfence
	#define StoreFence _mm_sfence
	#define YieldProcessor _mm_pause
	#define MemoryBarrier _mm_mfence

	'' TODO: #define PreFetchCacheLine(l,a) _mm_prefetch((CHAR CONST *) a,l)

	#define PrefetchForWrite(p) _m_prefetchw(p)

	'' TODO: #define ReadForWriteAccess(p) (_m_prefetchw(p),*(p))

	#define PF_TEMPORAL_LEVEL_1 _MM_HINT_T0
	#define PF_TEMPORAL_LEVEL_2 _MM_HINT_T1
	#define PF_TEMPORAL_LEVEL_3 _MM_HINT_T2
	#define PF_NON_TEMPORAL_LEVEL_ALL _MM_HINT_NTA
	#define ReadMxCsr _mm_getcsr
	#define WriteMxCsr _mm_setcsr
#else
	#define YieldProcessor __buildpause

	declare sub MemoryBarrier cdecl()

	'' TODO: extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void MemoryBarrier(void){unsigned char Barrier;__asm__ __volatile__("xchg{b %%| }al, %0" :"=m" (Barrier) : : "eax", "memory");} struct _TEB *NtCurrentTeb(void);

	#define PreFetchCacheLine(l, a)
	#define ReadForWriteAccess(p) (*(p))
	#define PF_TEMPORAL_LEVEL_1
	#define PF_NON_TEMPORAL_LEVEL_ALL
	#define PcTeb &h18

	declare function GetCurrentFiber cdecl() as PVOID
	declare function GetFiberData cdecl() as PVOID
#endif

#define DbgRaiseAssertionFailure __int2c

#ifdef __FB_64BIT__
	#define GetCallersEflags() __getcallerseflags()
	#define GetSegmentLimit __segmentlimit

	declare function __segmentlimit(byval Selector as DWORD) as DWORD

	#define ReadTimeStampCounter() __rdtsc()
	#define MultiplyHigh __mulh
	#define UnsignedMultiplyHigh __umulh

	declare function __mulh(byval Multiplier as LONGLONG, byval Multiplicand as LONGLONG) as LONGLONG
	declare function __umulh(byval Multiplier as ULONGLONG, byval Multiplicand as ULONGLONG) as ULONGLONG

	#define ShiftLeft128 __shiftleft128
	#define ShiftRight128 __shiftright128

	declare function __shiftleft128(byval LowPart as DWORD64, byval HighPart as DWORD64, byval Shift as BYTE) as DWORD64
	declare function __shiftright128(byval LowPart as DWORD64, byval HighPart as DWORD64, byval Shift as BYTE) as DWORD64

	#define Multiply128 _mul128

	declare function _mul128(byval Multiplier as LONG64, byval Multiplicand as LONG64, byval HighProduct as LONG64 ptr) as LONG64

	#define UnsignedMultiply128 _umul128

	declare function _umul128(byval Multiplier as DWORD64, byval Multiplicand as DWORD64, byval HighProduct as DWORD64 ptr) as DWORD64
	declare function MultiplyExtract128(byval Multiplier as LONG64, byval Multiplicand as LONG64, byval Shift as BYTE) as LONG64
	declare function UnsignedMultiplyExtract128(byval Multiplier as DWORD64, byval Multiplicand as DWORD64, byval Shift as BYTE) as DWORD64
#else
	'' TODO: extern inline __attribute__((__gnu_inline__)) struct _TEB *NtCurrentTeb(void) { return (struct _TEB *)__readfsdword(0x18); } extern inline __attribute__((__gnu_inline__)) PVOID GetCurrentFiber(void) { return(PVOID)__readfsdword(0x10); } extern inline __attribute__((__gnu_inline__)) PVOID GetFiberData(void) { return *(PVOID *)GetCurrentFiber(); } typedef struct _FLOATING_SAVE_AREA { DWORD ControlWord; DWORD StatusWord; DWORD TagWord; DWORD ErrorOffset; DWORD ErrorSelector; DWORD DataOffset; DWORD DataSelector; BYTE RegisterArea[80]; DWORD Cr0NpxState; } FLOATING_SAVE_AREA;
#endif

#define EXCEPTION_READ_FAULT 0
#define EXCEPTION_WRITE_FAULT 1
#define EXCEPTION_EXECUTE_FAULT 8

#ifdef __FB_64BIT__
	#define CONTEXT_AMD64 &h100000
	#define CONTEXT_CONTROL (CONTEXT_AMD64 or __MSABI_LONG(&h1))
	#define CONTEXT_INTEGER (CONTEXT_AMD64 or __MSABI_LONG(&h2))
	#define CONTEXT_SEGMENTS (CONTEXT_AMD64 or __MSABI_LONG(&h4))
	#define CONTEXT_FLOATING_POINT (CONTEXT_AMD64 or __MSABI_LONG(&h8))
	#define CONTEXT_DEBUG_REGISTERS (CONTEXT_AMD64 or __MSABI_LONG(&h10))
	#define CONTEXT_FULL ((CONTEXT_CONTROL or CONTEXT_INTEGER) or CONTEXT_FLOATING_POINT)
	#define CONTEXT_ALL ((((CONTEXT_CONTROL or CONTEXT_INTEGER) or CONTEXT_SEGMENTS) or CONTEXT_FLOATING_POINT) or CONTEXT_DEBUG_REGISTERS)
	#define CONTEXT_EXCEPTION_ACTIVE &h8000000
	#define CONTEXT_SERVICE_ACTIVE &h10000000
	#define CONTEXT_EXCEPTION_REQUEST &h40000000
	#define CONTEXT_EXCEPTION_REPORTING &h80000000
	#define INITIAL_MXCSR &h1f80
	#define INITIAL_FPCSR &h027f

	type _XMM_SAVE_AREA32
		ControlWord as WORD
		StatusWord as WORD
		TagWord as BYTE
		Reserved1 as BYTE
		ErrorOpcode as WORD
		ErrorOffset as DWORD
		ErrorSelector as WORD
		Reserved2 as WORD
		DataOffset as DWORD
		DataSelector as WORD
		Reserved3 as WORD
		MxCsr as DWORD
		MxCsr_Mask as DWORD
		FloatRegisters(0 to 7) as M128A
		XmmRegisters(0 to 15) as M128A
		Reserved4(0 to 95) as BYTE
	end type

	type XMM_SAVE_AREA32 as _XMM_SAVE_AREA32
	type PXMM_SAVE_AREA32 as _XMM_SAVE_AREA32 ptr

	#define LEGACY_SAVE_AREA_LENGTH sizeof(XMM_SAVE_AREA32)
#else
	#define SIZE_OF_80387_REGISTERS 80
	#define CONTEXT_i386 &h00010000
	#define CONTEXT_i486 &h00010000
	#define CONTEXT_CONTROL (CONTEXT_i386 or __MSABI_LONG(&h00000001))
	#define CONTEXT_INTEGER (CONTEXT_i386 or __MSABI_LONG(&h00000002))
	#define CONTEXT_SEGMENTS (CONTEXT_i386 or __MSABI_LONG(&h00000004))
	#define CONTEXT_FLOATING_POINT (CONTEXT_i386 or __MSABI_LONG(&h00000008))
	#define CONTEXT_DEBUG_REGISTERS (CONTEXT_i386 or __MSABI_LONG(&h00000010))
	#define CONTEXT_EXTENDED_REGISTERS (CONTEXT_i386 or __MSABI_LONG(&h00000020))
	#define CONTEXT_FULL ((CONTEXT_CONTROL or CONTEXT_INTEGER) or CONTEXT_SEGMENTS)
	#define CONTEXT_ALL (((((CONTEXT_CONTROL or CONTEXT_INTEGER) or CONTEXT_SEGMENTS) or CONTEXT_FLOATING_POINT) or CONTEXT_DEBUG_REGISTERS) or CONTEXT_EXTENDED_REGISTERS)
	#define MAXIMUM_SUPPORTED_EXTENSION 512

	type PFLOATING_SAVE_AREA as FLOATING_SAVE_AREA ptr
#endif

type _CONTEXT
	#ifdef __FB_64BIT__
		P1Home as DWORD64
		P2Home as DWORD64
		P3Home as DWORD64
		P4Home as DWORD64
		P5Home as DWORD64
		P6Home as DWORD64
	#endif

	ContextFlags as DWORD

	#ifdef __FB_64BIT__
		MxCsr as DWORD
		SegCs as WORD
		SegDs as WORD
		SegEs as WORD
		SegFs as WORD
		SegGs as WORD
		SegSs as WORD
	#else
		Dr0 as DWORD
		Dr1 as DWORD
		Dr2 as DWORD
		Dr3 as DWORD
		Dr6 as DWORD
		Dr7 as DWORD
		FloatSave as FLOATING_SAVE_AREA
		SegGs as DWORD
		SegFs as DWORD
		SegEs as DWORD
		SegDs as DWORD
		Edi as DWORD
		Esi as DWORD
		Ebx as DWORD
		Edx as DWORD
		Ecx as DWORD
		Eax as DWORD
		Ebp as DWORD
		Eip as DWORD
		SegCs as DWORD
	#endif

	EFlags as DWORD

	#ifdef __FB_64BIT__
		Dr0 as DWORD64
		Dr1 as DWORD64
		Dr2 as DWORD64
		Dr3 as DWORD64
		Dr6 as DWORD64
		Dr7 as DWORD64
		Rax as DWORD64
		Rcx as DWORD64
		Rdx as DWORD64
		Rbx as DWORD64
		Rsp as DWORD64
		Rbp as DWORD64
		Rsi as DWORD64
		Rdi as DWORD64
		R8 as DWORD64
		R9 as DWORD64
		R10 as DWORD64
		R11 as DWORD64
		R12 as DWORD64
		R13 as DWORD64
		R14 as DWORD64
		R15 as DWORD64
		Rip as DWORD64

		union
			FltSave as XMM_SAVE_AREA32
			FloatSave as XMM_SAVE_AREA32

			type
				Header(0 to 1) as M128A
				Legacy(0 to 7) as M128A
				Xmm0 as M128A
				Xmm1 as M128A
				Xmm2 as M128A
				Xmm3 as M128A
				Xmm4 as M128A
				Xmm5 as M128A
				Xmm6 as M128A
				Xmm7 as M128A
				Xmm8 as M128A
				Xmm9 as M128A
				Xmm10 as M128A
				Xmm11 as M128A
				Xmm12 as M128A
				Xmm13 as M128A
				Xmm14 as M128A
				Xmm15 as M128A
			end type
		end union

		VectorRegister(0 to 25) as M128A
		VectorControl as DWORD64
		DebugControl as DWORD64
		LastBranchToRip as DWORD64
		LastBranchFromRip as DWORD64
		LastExceptionToRip as DWORD64
		LastExceptionFromRip as DWORD64
	#else
		Esp as DWORD
		SegSs as DWORD
		ExtendedRegisters(0 to 511) as BYTE
	#endif
end type

type CONTEXT as _CONTEXT

#ifdef __FB_64BIT__
	type PCONTEXT as _CONTEXT ptr

	#define RUNTIME_FUNCTION_INDIRECT &h1

	type _RUNTIME_FUNCTION
		BeginAddress as DWORD
		EndAddress as DWORD
		UnwindData as DWORD
	end type

	type RUNTIME_FUNCTION as _RUNTIME_FUNCTION
	type PRUNTIME_FUNCTION as _RUNTIME_FUNCTION ptr
	type PGET_RUNTIME_FUNCTION_CALLBACK as function(byval ControlPc as DWORD64, byval Context as PVOID) as PRUNTIME_FUNCTION
	type POUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK as function(byval Process as HANDLE, byval TableAddress as PVOID, byval Entries as PDWORD, byval Functions as PRUNTIME_FUNCTION ptr) as DWORD

	#define OUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK_EXPORT_NAME "OutOfProcessFunctionTableCallback"
#else
	type PCONTEXT as CONTEXT ptr
#endif

#define _LDT_ENTRY_DEFINED

type ___LDT_ENTRY_Bytes
	BaseMid as BYTE
	Flags1 as BYTE
	Flags2 as BYTE
	BaseHi as BYTE
end type

type ___LDT_ENTRY_Bits
	BaseMid : 8 as DWORD
	as DWORD Type : 5
	Dpl : 2 as DWORD
	Pres : 1 as DWORD
	LimitHi : 4 as DWORD
	Sys : 1 as DWORD
	Reserved_0 : 1 as DWORD
	Default_Big : 1 as DWORD
	Granularity : 1 as DWORD
	BaseHi : 8 as DWORD
end type

union ___LDT_ENTRY_HighWord
	Bytes as ___LDT_ENTRY_Bytes
	Bits as ___LDT_ENTRY_Bits
end union

type _LDT_ENTRY
	LimitLow as WORD
	BaseLow as WORD
	HighWord as ___LDT_ENTRY_HighWord
end type

type LDT_ENTRY as _LDT_ENTRY
type PLDT_ENTRY as _LDT_ENTRY ptr

#define EXCEPTION_NONCONTINUABLE &h1
#define EXCEPTION_UNWINDING &h2
#define EXCEPTION_EXIT_UNWIND &h4
#define EXCEPTION_STACK_INVALID &h8
#define EXCEPTION_NESTED_CALL &h10
#define EXCEPTION_TARGET_UNWIND &h20
#define EXCEPTION_COLLIDED_UNWIND &h40
#define EXCEPTION_UNWIND &h66
#define IS_UNWINDING(f) ((f and EXCEPTION_UNWIND) <> 0)
#define IS_DISPATCHING(f) ((f and EXCEPTION_UNWIND) = 0)
#define IS_TARGET_UNWIND(f) ((f and EXCEPTION_TARGET_UNWIND) <> 0)
#define EXCEPTION_MAXIMUM_PARAMETERS 15

type _EXCEPTION_RECORD
	ExceptionCode as DWORD
	ExceptionFlags as DWORD
	ExceptionRecord as _EXCEPTION_RECORD ptr
	ExceptionAddress as PVOID
	NumberParameters as DWORD
	ExceptionInformation(0 to 14) as ULONG_PTR
end type

type EXCEPTION_RECORD as _EXCEPTION_RECORD
type PEXCEPTION_RECORD as EXCEPTION_RECORD ptr

type _EXCEPTION_RECORD32
	ExceptionCode as DWORD
	ExceptionFlags as DWORD
	ExceptionRecord as DWORD
	ExceptionAddress as DWORD
	NumberParameters as DWORD
	ExceptionInformation(0 to 14) as DWORD
end type

type EXCEPTION_RECORD32 as _EXCEPTION_RECORD32
type PEXCEPTION_RECORD32 as _EXCEPTION_RECORD32 ptr

type _EXCEPTION_RECORD64
	ExceptionCode as DWORD
	ExceptionFlags as DWORD
	ExceptionRecord as DWORD64
	ExceptionAddress as DWORD64
	NumberParameters as DWORD
	__unusedAlignment as DWORD
	ExceptionInformation(0 to 14) as DWORD64
end type

type EXCEPTION_RECORD64 as _EXCEPTION_RECORD64
type PEXCEPTION_RECORD64 as _EXCEPTION_RECORD64 ptr

type _EXCEPTION_POINTERS
	ExceptionRecord as PEXCEPTION_RECORD
	ContextRecord as PCONTEXT
end type

type EXCEPTION_POINTERS as _EXCEPTION_POINTERS
type PEXCEPTION_POINTERS as _EXCEPTION_POINTERS ptr

#ifdef __FB_64BIT__
	#define UNWIND_HISTORY_TABLE_SIZE 12

	type _UNWIND_HISTORY_TABLE_ENTRY
		ImageBase as ULONG64
		FunctionEntry as PRUNTIME_FUNCTION
	end type

	type UNWIND_HISTORY_TABLE_ENTRY as _UNWIND_HISTORY_TABLE_ENTRY
	type PUNWIND_HISTORY_TABLE_ENTRY as _UNWIND_HISTORY_TABLE_ENTRY ptr

	#define UNWIND_HISTORY_TABLE_NONE 0
	#define UNWIND_HISTORY_TABLE_GLOBAL 1
	#define UNWIND_HISTORY_TABLE_LOCAL 2

	type _UNWIND_HISTORY_TABLE
		Count as ULONG
		Search as UCHAR
		LowAddress as ULONG64
		HighAddress as ULONG64
		Entry(0 to 11) as UNWIND_HISTORY_TABLE_ENTRY
	end type

	type UNWIND_HISTORY_TABLE as _UNWIND_HISTORY_TABLE
	type PUNWIND_HISTORY_TABLE as _UNWIND_HISTORY_TABLE ptr
	type DISPATCHER_CONTEXT as _DISPATCHER_CONTEXT
	type PDISPATCHER_CONTEXT as _DISPATCHER_CONTEXT ptr

	type _DISPATCHER_CONTEXT
		ControlPc as ULONG64
		ImageBase as ULONG64
		FunctionEntry as PRUNTIME_FUNCTION
		EstablisherFrame as ULONG64
		TargetIp as ULONG64
		ContextRecord as PCONTEXT
		LanguageHandler as PEXCEPTION_ROUTINE
		HandlerData as PVOID
		HistoryTable as PUNWIND_HISTORY_TABLE
		ScopeIndex as ULONG
		Fill0 as ULONG
	end type

	type _KNONVOLATILE_CONTEXT_POINTERS
		FloatingContext(0 to 15) as PM128A
		IntegerContext(0 to 15) as PULONG64
	end type

	type KNONVOLATILE_CONTEXT_POINTERS as _KNONVOLATILE_CONTEXT_POINTERS
	type PKNONVOLATILE_CONTEXT_POINTERS as _KNONVOLATILE_CONTEXT_POINTERS ptr
#endif

type PACCESS_TOKEN as PVOID
type PSECURITY_DESCRIPTOR as PVOID
type PSID as PVOID
type PCLAIMS_BLOB as PVOID
type ACCESS_MASK as DWORD
type PACCESS_MASK as ACCESS_MASK ptr

#define DELETE_ __MSABI_LONG(&h00010000)
#define READ_CONTROL __MSABI_LONG(&h00020000)
#define WRITE_DAC __MSABI_LONG(&h00040000)
#define WRITE_OWNER __MSABI_LONG(&h00080000)
#define SYNCHRONIZE __MSABI_LONG(&h00100000)
#define STANDARD_RIGHTS_REQUIRED __MSABI_LONG(&h000F0000)
#define STANDARD_RIGHTS_READ READ_CONTROL
#define STANDARD_RIGHTS_WRITE READ_CONTROL
#define STANDARD_RIGHTS_EXECUTE READ_CONTROL
#define STANDARD_RIGHTS_ALL __MSABI_LONG(&h001F0000)
#define SPECIFIC_RIGHTS_ALL __MSABI_LONG(&h0000FFFF)
#define ACCESS_SYSTEM_SECURITY __MSABI_LONG(&h01000000)
#define MAXIMUM_ALLOWED __MSABI_LONG(&h02000000)
#define GENERIC_READ __MSABI_LONG(&h80000000)
#define GENERIC_WRITE __MSABI_LONG(&h40000000)
#define GENERIC_EXECUTE __MSABI_LONG(&h20000000)
#define GENERIC_ALL __MSABI_LONG(&h10000000)

type _GENERIC_MAPPING
	GenericRead as ACCESS_MASK
	GenericWrite as ACCESS_MASK
	GenericExecute as ACCESS_MASK
	GenericAll as ACCESS_MASK
end type

type GENERIC_MAPPING as _GENERIC_MAPPING
type PGENERIC_MAPPING as GENERIC_MAPPING ptr

type _LUID_AND_ATTRIBUTES field = 4
	Luid as LUID
	Attributes as DWORD
end type

type LUID_AND_ATTRIBUTES as _LUID_AND_ATTRIBUTES
type PLUID_AND_ATTRIBUTES as _LUID_AND_ATTRIBUTES ptr

'' TODO: typedef LUID_AND_ATTRIBUTES_ARRAY *PLUID_AND_ATTRIBUTES_ARRAY;

type _SID_IDENTIFIER_AUTHORITY
	Value(0 to 5) as BYTE
end type

type SID_IDENTIFIER_AUTHORITY as _SID_IDENTIFIER_AUTHORITY
type PSID_IDENTIFIER_AUTHORITY as _SID_IDENTIFIER_AUTHORITY ptr

#define SID_IDENTIFIER_AUTHORITY_DEFINED
#define SID_DEFINED

type _SID
	Revision as BYTE
	SubAuthorityCount as BYTE
	IdentifierAuthority as SID_IDENTIFIER_AUTHORITY
	SubAuthority(0 to 0) as DWORD
end type

type SID as _SID
type PISID as _SID ptr

#define SID_REVISION 1
#define SID_MAX_SUB_AUTHORITIES 15
#define SID_RECOMMENDED_SUB_AUTHORITIES 1
#define SECURITY_MAX_SID_SIZE ((sizeof(SID) - sizeof(DWORD)) + (SID_MAX_SUB_AUTHORITIES * sizeof(DWORD)))
#define SID_HASH_SIZE 32

type _SID_NAME_USE as long
enum
	SidTypeUser = 1
	SidTypeGroup
	SidTypeDomain
	SidTypeAlias
	SidTypeWellKnownGroup
	SidTypeDeletedAccount
	SidTypeInvalid
	SidTypeUnknown
	SidTypeComputer
	SidTypeLabel
end enum

type SID_NAME_USE as _SID_NAME_USE
type PSID_NAME_USE as _SID_NAME_USE ptr

type _SID_AND_ATTRIBUTES
	Sid as PSID
	Attributes as DWORD
end type

type SID_AND_ATTRIBUTES as _SID_AND_ATTRIBUTES
type PSID_AND_ATTRIBUTES as _SID_AND_ATTRIBUTES ptr

'' TODO: typedef SID_AND_ATTRIBUTES_ARRAY *PSID_AND_ATTRIBUTES_ARRAY;

type SID_HASH_ENTRY as ULONG_PTR
type PSID_HASH_ENTRY as ULONG_PTR ptr

type _SID_AND_ATTRIBUTES_HASH
	SidCount as DWORD
	SidAttr as PSID_AND_ATTRIBUTES
	Hash(0 to 31) as SID_HASH_ENTRY
end type

type SID_AND_ATTRIBUTES_HASH as _SID_AND_ATTRIBUTES_HASH
type PSID_AND_ATTRIBUTES_HASH as _SID_AND_ATTRIBUTES_HASH ptr

#define SECURITY_NULL_SID_AUTHORITY (0, 0, 0, 0, 0, 0)
#define SECURITY_WORLD_SID_AUTHORITY (0, 0, 0, 0, 0, 1)
#define SECURITY_LOCAL_SID_AUTHORITY (0, 0, 0, 0, 0, 2)
#define SECURITY_CREATOR_SID_AUTHORITY (0, 0, 0, 0, 0, 3)
#define SECURITY_NON_UNIQUE_AUTHORITY (0, 0, 0, 0, 0, 4)
#define SECURITY_RESOURCE_MANAGER_AUTHORITY (0, 0, 0, 0, 0, 9)
#define SECURITY_NULL_RID __MSABI_LONG(&h00000000)
#define SECURITY_WORLD_RID __MSABI_LONG(&h00000000)
#define SECURITY_LOCAL_RID __MSABI_LONG(&h00000000)
#define SECURITY_LOCAL_LOGON_RID __MSABI_LONG(&h00000001)
#define SECURITY_CREATOR_OWNER_RID __MSABI_LONG(&h00000000)
#define SECURITY_CREATOR_GROUP_RID __MSABI_LONG(&h00000001)
#define SECURITY_CREATOR_OWNER_SERVER_RID __MSABI_LONG(&h00000002)
#define SECURITY_CREATOR_GROUP_SERVER_RID __MSABI_LONG(&h00000003)
#define SECURITY_CREATOR_OWNER_RIGHTS_RID __MSABI_LONG(&h00000004)
#define SECURITY_NT_AUTHORITY (0, 0, 0, 0, 0, 5)
#define SECURITY_DIALUP_RID __MSABI_LONG(&h00000001)
#define SECURITY_NETWORK_RID __MSABI_LONG(&h00000002)
#define SECURITY_BATCH_RID __MSABI_LONG(&h00000003)
#define SECURITY_INTERACTIVE_RID __MSABI_LONG(&h00000004)
#define SECURITY_LOGON_IDS_RID __MSABI_LONG(&h00000005)
#define SECURITY_LOGON_IDS_RID_COUNT __MSABI_LONG(3)
#define SECURITY_SERVICE_RID __MSABI_LONG(&h00000006)
#define SECURITY_ANONYMOUS_LOGON_RID __MSABI_LONG(&h00000007)
#define SECURITY_PROXY_RID __MSABI_LONG(&h00000008)
#define SECURITY_ENTERPRISE_CONTROLLERS_RID __MSABI_LONG(&h00000009)
#define SECURITY_SERVER_LOGON_RID SECURITY_ENTERPRISE_CONTROLLERS_RID
#define SECURITY_PRINCIPAL_SELF_RID __MSABI_LONG(&h0000000A)
#define SECURITY_AUTHENTICATED_USER_RID __MSABI_LONG(&h0000000B)
#define SECURITY_RESTRICTED_CODE_RID __MSABI_LONG(&h0000000C)
#define SECURITY_TERMINAL_SERVER_RID __MSABI_LONG(&h0000000D)
#define SECURITY_REMOTE_LOGON_RID __MSABI_LONG(&h0000000E)
#define SECURITY_THIS_ORGANIZATION_RID __MSABI_LONG(&h0000000F)
#define SECURITY_IUSER_RID __MSABI_LONG(&h00000011)
#define SECURITY_LOCAL_SYSTEM_RID __MSABI_LONG(&h00000012)
#define SECURITY_LOCAL_SERVICE_RID __MSABI_LONG(&h00000013)
#define SECURITY_NETWORK_SERVICE_RID __MSABI_LONG(&h00000014)
#define SECURITY_NT_NON_UNIQUE __MSABI_LONG(&h00000015)
#define SECURITY_NT_NON_UNIQUE_SUB_AUTH_COUNT __MSABI_LONG(3)
#define SECURITY_ENTERPRISE_READONLY_CONTROLLERS_RID __MSABI_LONG(&h00000016)
#define SECURITY_BUILTIN_DOMAIN_RID __MSABI_LONG(&h00000020)
#define SECURITY_WRITE_RESTRICTED_CODE_RID __MSABI_LONG(&h00000021)
#define SECURITY_PACKAGE_BASE_RID __MSABI_LONG(&h00000040)
#define SECURITY_PACKAGE_RID_COUNT __MSABI_LONG(2)
#define SECURITY_PACKAGE_NTLM_RID __MSABI_LONG(&h0000000A)
#define SECURITY_PACKAGE_SCHANNEL_RID __MSABI_LONG(&h0000000E)
#define SECURITY_PACKAGE_DIGEST_RID __MSABI_LONG(&h00000015)
#define SECURITY_CRED_TYPE_BASE_RID __MSABI_LONG(&h00000041)
#define SECURITY_CRED_TYPE_RID_COUNT __MSABI_LONG(2)
#define SECURITY_CRED_TYPE_THIS_ORG_CERT_RID __MSABI_LONG(&h00000001)
#define SECURITY_MIN_BASE_RID __MSABI_LONG(&h00000050)
#define SECURITY_SERVICE_ID_BASE_RID __MSABI_LONG(&h00000050)
#define SECURITY_SERVICE_ID_RID_COUNT __MSABI_LONG(6)
#define SECURITY_RESERVED_ID_BASE_RID __MSABI_LONG(&h00000051)
#define SECURITY_APPPOOL_ID_BASE_RID __MSABI_LONG(&h00000052)
#define SECURITY_APPPOOL_ID_RID_COUNT __MSABI_LONG(6)
#define SECURITY_VIRTUALSERVER_ID_BASE_RID __MSABI_LONG(&h00000053)
#define SECURITY_VIRTUALSERVER_ID_RID_COUNT __MSABI_LONG(6)
#define SECURITY_USERMODEDRIVERHOST_ID_BASE_RID __MSABI_LONG(&h00000054)
#define SECURITY_USERMODEDRIVERHOST_ID_RID_COUNT __MSABI_LONG(6)
#define SECURITY_CLOUD_INFRASTRUCTURE_SERVICES_ID_BASE_RID __MSABI_LONG(&h00000055)
#define SECURITY_CLOUD_INFRASTRUCTURE_SERVICES_ID_RID_COUNT __MSABI_LONG(6)
#define SECURITY_WMIHOST_ID_BASE_RID __MSABI_LONG(&h00000056)
#define SECURITY_WMIHOST_ID_RID_COUNT __MSABI_LONG(6)
#define SECURITY_TASK_ID_BASE_RID __MSABI_LONG(&h00000057)
#define SECURITY_NFS_ID_BASE_RID __MSABI_LONG(&h00000058)
#define SECURITY_COM_ID_BASE_RID __MSABI_LONG(&h00000059)
#define SECURITY_WINDOW_MANAGER_BASE_RID __MSABI_LONG(&h0000005a)
#define SECURITY_RDV_GFX_BASE_RID __MSABI_LONG(&h0000005b)
#define SECURITY_DASHOST_ID_BASE_RID __MSABI_LONG(&h0000005c)
#define SECURITY_DASHOST_ID_RID_COUNT __MSABI_LONG(6)
#define SECURITY_VIRTUALACCOUNT_ID_RID_COUNT __MSABI_LONG(6)
#define SECURITY_MAX_BASE_RID __MSABI_LONG(&h0000006f)
#define SECURITY_MAX_ALWAYS_FILTERED __MSABI_LONG(&h000003E7)
#define SECURITY_MIN_NEVER_FILTERED __MSABI_LONG(&h000003E8)
#define SECURITY_OTHER_ORGANIZATION_RID __MSABI_LONG(&h000003E8)
#define SECURITY_WINDOWSMOBILE_ID_BASE_RID __MSABI_LONG(&h00000070)
#define DOMAIN_GROUP_RID_AUTHORIZATION_DATA_IS_COMPOUNDED __MSABI_LONG(&h000001f0)
#define DOMAIN_GROUP_RID_AUTHORIZATION_DATA_CONTAINS_CLAIMS __MSABI_LONG(&h000001f1)
#define DOMAIN_GROUP_RID_ENTERPRISE_READONLY_DOMAIN_CONTROLLERS __MSABI_LONG(&h000001f2)
#define FOREST_USER_RID_MAX __MSABI_LONG(&h000001F3)
#define DOMAIN_USER_RID_ADMIN __MSABI_LONG(&h000001F4)
#define DOMAIN_USER_RID_GUEST __MSABI_LONG(&h000001F5)
#define DOMAIN_USER_RID_KRBTGT __MSABI_LONG(&h000001F6)
#define DOMAIN_USER_RID_MAX __MSABI_LONG(&h000003E7)
#define DOMAIN_GROUP_RID_ADMINS __MSABI_LONG(&h00000200)
#define DOMAIN_GROUP_RID_USERS __MSABI_LONG(&h00000201)
#define DOMAIN_GROUP_RID_GUESTS __MSABI_LONG(&h00000202)
#define DOMAIN_GROUP_RID_COMPUTERS __MSABI_LONG(&h00000203)
#define DOMAIN_GROUP_RID_CONTROLLERS __MSABI_LONG(&h00000204)
#define DOMAIN_GROUP_RID_CERT_ADMINS __MSABI_LONG(&h00000205)
#define DOMAIN_GROUP_RID_SCHEMA_ADMINS __MSABI_LONG(&h00000206)
#define DOMAIN_GROUP_RID_ENTERPRISE_ADMINS __MSABI_LONG(&h00000207)
#define DOMAIN_GROUP_RID_POLICY_ADMINS __MSABI_LONG(&h00000208)
#define DOMAIN_GROUP_RID_READONLY_CONTROLLERS __MSABI_LONG(&h00000209)
#define DOMAIN_GROUP_RID_CLONEABLE_CONTROLLERS __MSABI_LONG(&h0000020a)
#define DOMAIN_ALIAS_RID_ADMINS __MSABI_LONG(&h00000220)
#define DOMAIN_ALIAS_RID_USERS __MSABI_LONG(&h00000221)
#define DOMAIN_ALIAS_RID_GUESTS __MSABI_LONG(&h00000222)
#define DOMAIN_ALIAS_RID_POWER_USERS __MSABI_LONG(&h00000223)
#define DOMAIN_ALIAS_RID_ACCOUNT_OPS __MSABI_LONG(&h00000224)
#define DOMAIN_ALIAS_RID_SYSTEM_OPS __MSABI_LONG(&h00000225)
#define DOMAIN_ALIAS_RID_PRINT_OPS __MSABI_LONG(&h00000226)
#define DOMAIN_ALIAS_RID_BACKUP_OPS __MSABI_LONG(&h00000227)
#define DOMAIN_ALIAS_RID_REPLICATOR __MSABI_LONG(&h00000228)
#define DOMAIN_ALIAS_RID_RAS_SERVERS __MSABI_LONG(&h00000229)
#define DOMAIN_ALIAS_RID_PREW2KCOMPACCESS __MSABI_LONG(&h0000022A)
#define DOMAIN_ALIAS_RID_REMOTE_DESKTOP_USERS __MSABI_LONG(&h0000022B)
#define DOMAIN_ALIAS_RID_NETWORK_CONFIGURATION_OPS __MSABI_LONG(&h0000022C)
#define DOMAIN_ALIAS_RID_INCOMING_FOREST_TRUST_BUILDERS __MSABI_LONG(&h0000022D)
#define DOMAIN_ALIAS_RID_MONITORING_USERS __MSABI_LONG(&h0000022E)
#define DOMAIN_ALIAS_RID_LOGGING_USERS __MSABI_LONG(&h0000022F)
#define DOMAIN_ALIAS_RID_AUTHORIZATIONACCESS __MSABI_LONG(&h00000230)
#define DOMAIN_ALIAS_RID_TS_LICENSE_SERVERS __MSABI_LONG(&h00000231)
#define DOMAIN_ALIAS_RID_DCOM_USERS __MSABI_LONG(&h00000232)
#define DOMAIN_ALIAS_RID_IUSERS __MSABI_LONG(&h00000238)
#define DOMAIN_ALIAS_RID_CRYPTO_OPERATORS __MSABI_LONG(&h00000239)
#define DOMAIN_ALIAS_RID_CACHEABLE_PRINCIPALS_GROUP __MSABI_LONG(&h0000023B)
#define DOMAIN_ALIAS_RID_NON_CACHEABLE_PRINCIPALS_GROUP __MSABI_LONG(&h0000023C)
#define DOMAIN_ALIAS_RID_EVENT_LOG_READERS_GROUP __MSABI_LONG(&h0000023D)
#define DOMAIN_ALIAS_RID_CERTSVC_DCOM_ACCESS_GROUP __MSABI_LONG(&h0000023e)
#define DOMAIN_ALIAS_RID_RDS_REMOTE_ACCESS_SERVERS __MSABI_LONG(&h0000023f)
#define DOMAIN_ALIAS_RID_RDS_ENDPOINT_SERVERS __MSABI_LONG(&h00000240)
#define DOMAIN_ALIAS_RID_RDS_MANAGEMENT_SERVERS __MSABI_LONG(&h00000241)
#define DOMAIN_ALIAS_RID_HYPER_V_ADMINS __MSABI_LONG(&h00000242)
#define DOMAIN_ALIAS_RID_ACCESS_CONTROL_ASSISTANCE_OPS __MSABI_LONG(&h00000243)
#define DOMAIN_ALIAS_RID_REMOTE_MANAGEMENT_USERS __MSABI_LONG(&h00000244)
#define SECURITY_APP_PACKAGE_AUTHORITY (0, 0, 0, 0, 0, 15)
#define SECURITY_APP_PACKAGE_BASE_RID __MSABI_LONG(&h00000002)
#define SECURITY_BUILTIN_APP_PACKAGE_RID_COUNT __MSABI_LONG(2)
#define SECURITY_APP_PACKAGE_RID_COUNT __MSABI_LONG(8)
#define SECURITY_CAPABILITY_BASE_RID __MSABI_LONG(&h00000003)
#define SECURITY_BUILTIN_CAPABILITY_RID_COUNT __MSABI_LONG(2)
#define SECURITY_CAPABILITY_RID_COUNT __MSABI_LONG(5)
#define SECURITY_BUILTIN_PACKAGE_ANY_PACKAGE __MSABI_LONG(&h00000001)
#define SECURITY_CAPABILITY_INTERNET_CLIENT __MSABI_LONG(&h00000001)
#define SECURITY_CAPABILITY_INTERNET_CLIENT_SERVER __MSABI_LONG(&h00000002)
#define SECURITY_CAPABILITY_PRIVATE_NETWORK_CLIENT_SERVER __MSABI_LONG(&h00000003)
#define SECURITY_CAPABILITY_PICTURES_LIBRARY __MSABI_LONG(&h00000004)
#define SECURITY_CAPABILITY_VIDEOS_LIBRARY __MSABI_LONG(&h00000005)
#define SECURITY_CAPABILITY_MUSIC_LIBRARY __MSABI_LONG(&h00000006)
#define SECURITY_CAPABILITY_DOCUMENTS_LIBRARY __MSABI_LONG(&h00000007)
#define SECURITY_CAPABILITY_ENTERPRISE_AUTHENTICATION __MSABI_LONG(&h00000008)
#define SECURITY_CAPABILITY_SHARED_USER_CERTIFICATES __MSABI_LONG(&h00000009)
#define SECURITY_CAPABILITY_REMOVABLE_STORAGE __MSABI_LONG(&h0000000a)
#define SECURITY_CAPABILITY_INTERNET_EXPLORER __MSABI_LONG(&h00001000)
#define SECURITY_MANDATORY_LABEL_AUTHORITY (0, 0, 0, 0, 0, 16)
#define SECURITY_MANDATORY_UNTRUSTED_RID __MSABI_LONG(&h00000000)
#define SECURITY_MANDATORY_LOW_RID __MSABI_LONG(&h00001000)
#define SECURITY_MANDATORY_MEDIUM_RID __MSABI_LONG(&h00002000)
#define SECURITY_MANDATORY_HIGH_RID __MSABI_LONG(&h00003000)
#define SECURITY_MANDATORY_SYSTEM_RID __MSABI_LONG(&h00004000)
#define SECURITY_MANDATORY_PROTECTED_PROCESS_RID __MSABI_LONG(&h00005000)
#define SECURITY_MANDATORY_MAXIMUM_USER_RID SECURITY_MANDATORY_SYSTEM_RID
#define MANDATORY_LEVEL_TO_MANDATORY_RID(IL) (IL * &h1000)
#define SECURITY_SCOPED_POLICY_ID_AUTHORITY (0, 0, 0, 0, 0, 17)
#define SECURITY_AUTHENTICATION_AUTHORITY (0, 0, 0, 0, 0, 18)
#define SECURITY_AUTHENTICATION_AUTHORITY_RID_COUNT __MSABI_LONG(1)
#define SECURITY_AUTHENTICATION_AUTHORITY_ASSERTED_RID __MSABI_LONG(&h00000001)
#define SECURITY_AUTHENTICATION_SERVICE_ASSERTED_RID __MSABI_LONG(&h00000002)
#define SECURITY_TRUSTED_INSTALLER_RID1 956008885
#define SECURITY_TRUSTED_INSTALLER_RID2 3418522649
#define SECURITY_TRUSTED_INSTALLER_RID3 1831038044
#define SECURITY_TRUSTED_INSTALLER_RID4 1853292631
#define SECURITY_TRUSTED_INSTALLER_RID5 2271478464

type WELL_KNOWN_SID_TYPE as long
enum
	WinNullSid = 0
	WinWorldSid = 1
	WinLocalSid = 2
	WinCreatorOwnerSid = 3
	WinCreatorGroupSid = 4
	WinCreatorOwnerServerSid = 5
	WinCreatorGroupServerSid = 6
	WinNtAuthoritySid = 7
	WinDialupSid = 8
	WinNetworkSid = 9
	WinBatchSid = 10
	WinInteractiveSid = 11
	WinServiceSid = 12
	WinAnonymousSid = 13
	WinProxySid = 14
	WinEnterpriseControllersSid = 15
	WinSelfSid = 16
	WinAuthenticatedUserSid = 17
	WinRestrictedCodeSid = 18
	WinTerminalServerSid = 19
	WinRemoteLogonIdSid = 20
	WinLogonIdsSid = 21
	WinLocalSystemSid = 22
	WinLocalServiceSid = 23
	WinNetworkServiceSid = 24
	WinBuiltinDomainSid = 25
	WinBuiltinAdministratorsSid = 26
	WinBuiltinUsersSid = 27
	WinBuiltinGuestsSid = 28
	WinBuiltinPowerUsersSid = 29
	WinBuiltinAccountOperatorsSid = 30
	WinBuiltinSystemOperatorsSid = 31
	WinBuiltinPrintOperatorsSid = 32
	WinBuiltinBackupOperatorsSid = 33
	WinBuiltinReplicatorSid = 34
	WinBuiltinPreWindows2000CompatibleAccessSid = 35
	WinBuiltinRemoteDesktopUsersSid = 36
	WinBuiltinNetworkConfigurationOperatorsSid = 37
	WinAccountAdministratorSid = 38
	WinAccountGuestSid = 39
	WinAccountKrbtgtSid = 40
	WinAccountDomainAdminsSid = 41
	WinAccountDomainUsersSid = 42
	WinAccountDomainGuestsSid = 43
	WinAccountComputersSid = 44
	WinAccountControllersSid = 45
	WinAccountCertAdminsSid = 46
	WinAccountSchemaAdminsSid = 47
	WinAccountEnterpriseAdminsSid = 48
	WinAccountPolicyAdminsSid = 49
	WinAccountRasAndIasServersSid = 50
	WinNTLMAuthenticationSid = 51
	WinDigestAuthenticationSid = 52
	WinSChannelAuthenticationSid = 53
	WinThisOrganizationSid = 54
	WinOtherOrganizationSid = 55
	WinBuiltinIncomingForestTrustBuildersSid = 56
	WinBuiltinPerfMonitoringUsersSid = 57
	WinBuiltinPerfLoggingUsersSid = 58
	WinBuiltinAuthorizationAccessSid = 59
	WinBuiltinTerminalServerLicenseServersSid = 60
	WinBuiltinDCOMUsersSid = 61
	WinBuiltinIUsersSid = 62
	WinIUserSid = 63
	WinBuiltinCryptoOperatorsSid = 64
	WinUntrustedLabelSid = 65
	WinLowLabelSid = 66
	WinMediumLabelSid = 67
	WinHighLabelSid = 68
	WinSystemLabelSid = 69
	WinWriteRestrictedCodeSid = 70
	WinCreatorOwnerRightsSid = 71
	WinCacheablePrincipalsGroupSid = 72
	WinNonCacheablePrincipalsGroupSid = 73
	WinEnterpriseReadonlyControllersSid = 74
	WinAccountReadonlyControllersSid = 75
	WinBuiltinEventLogReadersGroup = 76
	WinNewEnterpriseReadonlyControllersSid = 77
	WinBuiltinCertSvcDComAccessGroup = 78
	WinMediumPlusLabelSid = 79
	WinLocalLogonSid = 80
	WinConsoleLogonSid = 81
	WinThisOrganizationCertificateSid = 82
	WinApplicationPackageAuthoritySid = 83
	WinBuiltinAnyPackageSid = 84
	WinCapabilityInternetClientSid = 85
	WinCapabilityInternetClientServerSid = 86
	WinCapabilityPrivateNetworkClientServerSid = 87
	WinCapabilityPicturesLibrarySid = 88
	WinCapabilityVideosLibrarySid = 89
	WinCapabilityMusicLibrarySid = 90
	WinCapabilityDocumentsLibrarySid = 91
	WinCapabilitySharedUserCertificatesSid = 92
	WinCapabilityEnterpriseAuthenticationSid = 93
	WinCapabilityRemovableStorageSid = 94
	WinBuiltinRDSRemoteAccessServersSid = 95
	WinBuiltinRDSEndpointServersSid = 96
	WinBuiltinRDSManagementServersSid = 97
	WinUserModeDriversSid = 98
	WinBuiltinHyperVAdminsSid = 99
	WinAccountCloneableControllersSid = 100
	WinBuiltinAccessControlAssistanceOperatorsSid = 101
	WinBuiltinRemoteManagementUsersSid = 102
	WinAuthenticationAuthorityAssertedSid = 103
	WinAuthenticationServiceAssertedSid = 104
end enum

#define SYSTEM_LUID (&h3e7, &h0)
#define ANONYMOUS_LOGON_LUID (&h3e6, &h0)
#define LOCALSERVICE_LUID (&h3e5, &h0)
#define NETWORKSERVICE_LUID (&h3e4, &h0)
#define IUSER_LUID (&h3e3, &h0)
#define SE_GROUP_MANDATORY __MSABI_LONG(&h00000001)
#define SE_GROUP_ENABLED_BY_DEFAULT __MSABI_LONG(&h00000002)
#define SE_GROUP_ENABLED __MSABI_LONG(&h00000004)
#define SE_GROUP_OWNER __MSABI_LONG(&h00000008)
#define SE_GROUP_USE_FOR_DENY_ONLY __MSABI_LONG(&h00000010)
#define SE_GROUP_INTEGRITY __MSABI_LONG(&h00000020)
#define SE_GROUP_INTEGRITY_ENABLED __MSABI_LONG(&h00000040)
#define SE_GROUP_LOGON_ID __MSABI_LONG(&hC0000000)
#define SE_GROUP_RESOURCE __MSABI_LONG(&h20000000)
#define SE_GROUP_VALID_ATTRIBUTES ((((((((SE_GROUP_MANDATORY or SE_GROUP_ENABLED_BY_DEFAULT) or SE_GROUP_ENABLED) or SE_GROUP_OWNER) or SE_GROUP_USE_FOR_DENY_ONLY) or SE_GROUP_LOGON_ID) or SE_GROUP_RESOURCE) or SE_GROUP_INTEGRITY) or SE_GROUP_INTEGRITY_ENABLED)
#define ACL_REVISION 2
#define ACL_REVISION_DS 4
#define ACL_REVISION1 1
#define MIN_ACL_REVISION ACL_REVISION2
#define ACL_REVISION2 2
#define ACL_REVISION3 3
#define ACL_REVISION4 4
#define MAX_ACL_REVISION ACL_REVISION4

type _ACL
	AclRevision as BYTE
	Sbz1 as BYTE
	AclSize as WORD
	AceCount as WORD
	Sbz2 as WORD
end type

type ACL as _ACL
type PACL as ACL ptr

type _ACE_HEADER
	AceType as BYTE
	AceFlags as BYTE
	AceSize as WORD
end type

type ACE_HEADER as _ACE_HEADER
type PACE_HEADER as ACE_HEADER ptr

#define ACCESS_MIN_MS_ACE_TYPE &h0
#define ACCESS_ALLOWED_ACE_TYPE &h0
#define ACCESS_DENIED_ACE_TYPE &h1
#define SYSTEM_AUDIT_ACE_TYPE &h2
#define SYSTEM_ALARM_ACE_TYPE &h3
#define ACCESS_MAX_MS_V2_ACE_TYPE &h3
#define ACCESS_ALLOWED_COMPOUND_ACE_TYPE &h4
#define ACCESS_MAX_MS_V3_ACE_TYPE &h4
#define ACCESS_MIN_MS_OBJECT_ACE_TYPE &h5
#define ACCESS_ALLOWED_OBJECT_ACE_TYPE &h5
#define ACCESS_DENIED_OBJECT_ACE_TYPE &h6
#define SYSTEM_AUDIT_OBJECT_ACE_TYPE &h7
#define SYSTEM_ALARM_OBJECT_ACE_TYPE &h8
#define ACCESS_MAX_MS_OBJECT_ACE_TYPE &h8
#define ACCESS_MAX_MS_V4_ACE_TYPE &h8
#define ACCESS_MAX_MS_ACE_TYPE &h8
#define ACCESS_ALLOWED_CALLBACK_ACE_TYPE &h9
#define ACCESS_DENIED_CALLBACK_ACE_TYPE &hA
#define ACCESS_ALLOWED_CALLBACK_OBJECT_ACE_TYPE &hB
#define ACCESS_DENIED_CALLBACK_OBJECT_ACE_TYPE &hC
#define SYSTEM_AUDIT_CALLBACK_ACE_TYPE &hD
#define SYSTEM_ALARM_CALLBACK_ACE_TYPE &hE
#define SYSTEM_AUDIT_CALLBACK_OBJECT_ACE_TYPE &hF
#define SYSTEM_ALARM_CALLBACK_OBJECT_ACE_TYPE &h10
#define SYSTEM_MANDATORY_LABEL_ACE_TYPE &h11
#define SYSTEM_RESOURCE_ATTRIBUTE_ACE_TYPE &h12
#define SYSTEM_SCOPED_POLICY_ID_ACE_TYPE &h13
#define ACCESS_MAX_MS_V5_ACE_TYPE &h13
#define OBJECT_INHERIT_ACE &h1
#define CONTAINER_INHERIT_ACE &h2
#define NO_PROPAGATE_INHERIT_ACE &h4
#define INHERIT_ONLY_ACE &h8
#define INHERITED_ACE &h10
#define VALID_INHERIT_FLAGS &h1F
#define SUCCESSFUL_ACCESS_ACE_FLAG &h40
#define FAILED_ACCESS_ACE_FLAG &h80

type _ACCESS_ALLOWED_ACE
	Header as ACE_HEADER
	Mask as ACCESS_MASK
	SidStart as DWORD
end type

type ACCESS_ALLOWED_ACE as _ACCESS_ALLOWED_ACE
type PACCESS_ALLOWED_ACE as ACCESS_ALLOWED_ACE ptr

type _ACCESS_DENIED_ACE
	Header as ACE_HEADER
	Mask as ACCESS_MASK
	SidStart as DWORD
end type

type ACCESS_DENIED_ACE as _ACCESS_DENIED_ACE
type PACCESS_DENIED_ACE as ACCESS_DENIED_ACE ptr

type _SYSTEM_AUDIT_ACE
	Header as ACE_HEADER
	Mask as ACCESS_MASK
	SidStart as DWORD
end type

type SYSTEM_AUDIT_ACE as _SYSTEM_AUDIT_ACE
type PSYSTEM_AUDIT_ACE as SYSTEM_AUDIT_ACE ptr

type _SYSTEM_ALARM_ACE
	Header as ACE_HEADER
	Mask as ACCESS_MASK
	SidStart as DWORD
end type

type SYSTEM_ALARM_ACE as _SYSTEM_ALARM_ACE
type PSYSTEM_ALARM_ACE as SYSTEM_ALARM_ACE ptr

type _SYSTEM_RESOURCE_ATTRIBUTE_ACE
	Header as ACE_HEADER
	Mask as ACCESS_MASK
	SidStart as DWORD
end type

type SYSTEM_RESOURCE_ATTRIBUTE_ACE as _SYSTEM_RESOURCE_ATTRIBUTE_ACE
type PSYSTEM_RESOURCE_ATTRIBUTE_ACE as _SYSTEM_RESOURCE_ATTRIBUTE_ACE ptr

type _SYSTEM_SCOPED_POLICY_ID_ACE
	Header as ACE_HEADER
	Mask as ACCESS_MASK
	SidStart as DWORD
end type

type SYSTEM_SCOPED_POLICY_ID_ACE as _SYSTEM_SCOPED_POLICY_ID_ACE
type PSYSTEM_SCOPED_POLICY_ID_ACE as _SYSTEM_SCOPED_POLICY_ID_ACE ptr

type _SYSTEM_MANDATORY_LABEL_ACE
	Header as ACE_HEADER
	Mask as ACCESS_MASK
	SidStart as DWORD
end type

type SYSTEM_MANDATORY_LABEL_ACE as _SYSTEM_MANDATORY_LABEL_ACE
type PSYSTEM_MANDATORY_LABEL_ACE as _SYSTEM_MANDATORY_LABEL_ACE ptr

#define SYSTEM_MANDATORY_LABEL_NO_WRITE_UP &h1
#define SYSTEM_MANDATORY_LABEL_NO_READ_UP &h2
#define SYSTEM_MANDATORY_LABEL_NO_EXECUTE_UP &h4
#define SYSTEM_MANDATORY_LABEL_VALID_MASK ((SYSTEM_MANDATORY_LABEL_NO_WRITE_UP or SYSTEM_MANDATORY_LABEL_NO_READ_UP) or SYSTEM_MANDATORY_LABEL_NO_EXECUTE_UP)

type _ACCESS_ALLOWED_OBJECT_ACE
	Header as ACE_HEADER
	Mask as ACCESS_MASK
	Flags as DWORD
	ObjectType as GUID
	InheritedObjectType as GUID
	SidStart as DWORD
end type

type ACCESS_ALLOWED_OBJECT_ACE as _ACCESS_ALLOWED_OBJECT_ACE
type PACCESS_ALLOWED_OBJECT_ACE as _ACCESS_ALLOWED_OBJECT_ACE ptr

type _ACCESS_DENIED_OBJECT_ACE
	Header as ACE_HEADER
	Mask as ACCESS_MASK
	Flags as DWORD
	ObjectType as GUID
	InheritedObjectType as GUID
	SidStart as DWORD
end type

type ACCESS_DENIED_OBJECT_ACE as _ACCESS_DENIED_OBJECT_ACE
type PACCESS_DENIED_OBJECT_ACE as _ACCESS_DENIED_OBJECT_ACE ptr

type _SYSTEM_AUDIT_OBJECT_ACE
	Header as ACE_HEADER
	Mask as ACCESS_MASK
	Flags as DWORD
	ObjectType as GUID
	InheritedObjectType as GUID
	SidStart as DWORD
end type

type SYSTEM_AUDIT_OBJECT_ACE as _SYSTEM_AUDIT_OBJECT_ACE
type PSYSTEM_AUDIT_OBJECT_ACE as _SYSTEM_AUDIT_OBJECT_ACE ptr

type _SYSTEM_ALARM_OBJECT_ACE
	Header as ACE_HEADER
	Mask as ACCESS_MASK
	Flags as DWORD
	ObjectType as GUID
	InheritedObjectType as GUID
	SidStart as DWORD
end type

type SYSTEM_ALARM_OBJECT_ACE as _SYSTEM_ALARM_OBJECT_ACE
type PSYSTEM_ALARM_OBJECT_ACE as _SYSTEM_ALARM_OBJECT_ACE ptr

type _ACCESS_ALLOWED_CALLBACK_ACE
	Header as ACE_HEADER
	Mask as ACCESS_MASK
	SidStart as DWORD
end type

type ACCESS_ALLOWED_CALLBACK_ACE as _ACCESS_ALLOWED_CALLBACK_ACE
type PACCESS_ALLOWED_CALLBACK_ACE as _ACCESS_ALLOWED_CALLBACK_ACE ptr

type _ACCESS_DENIED_CALLBACK_ACE
	Header as ACE_HEADER
	Mask as ACCESS_MASK
	SidStart as DWORD
end type

type ACCESS_DENIED_CALLBACK_ACE as _ACCESS_DENIED_CALLBACK_ACE
type PACCESS_DENIED_CALLBACK_ACE as _ACCESS_DENIED_CALLBACK_ACE ptr

type _SYSTEM_AUDIT_CALLBACK_ACE
	Header as ACE_HEADER
	Mask as ACCESS_MASK
	SidStart as DWORD
end type

type SYSTEM_AUDIT_CALLBACK_ACE as _SYSTEM_AUDIT_CALLBACK_ACE
type PSYSTEM_AUDIT_CALLBACK_ACE as _SYSTEM_AUDIT_CALLBACK_ACE ptr

type _SYSTEM_ALARM_CALLBACK_ACE
	Header as ACE_HEADER
	Mask as ACCESS_MASK
	SidStart as DWORD
end type

type SYSTEM_ALARM_CALLBACK_ACE as _SYSTEM_ALARM_CALLBACK_ACE
type PSYSTEM_ALARM_CALLBACK_ACE as _SYSTEM_ALARM_CALLBACK_ACE ptr

type _ACCESS_ALLOWED_CALLBACK_OBJECT_ACE
	Header as ACE_HEADER
	Mask as ACCESS_MASK
	Flags as DWORD
	ObjectType as GUID
	InheritedObjectType as GUID
	SidStart as DWORD
end type

type ACCESS_ALLOWED_CALLBACK_OBJECT_ACE as _ACCESS_ALLOWED_CALLBACK_OBJECT_ACE
type PACCESS_ALLOWED_CALLBACK_OBJECT_ACE as _ACCESS_ALLOWED_CALLBACK_OBJECT_ACE ptr

type _ACCESS_DENIED_CALLBACK_OBJECT_ACE
	Header as ACE_HEADER
	Mask as ACCESS_MASK
	Flags as DWORD
	ObjectType as GUID
	InheritedObjectType as GUID
	SidStart as DWORD
end type

type ACCESS_DENIED_CALLBACK_OBJECT_ACE as _ACCESS_DENIED_CALLBACK_OBJECT_ACE
type PACCESS_DENIED_CALLBACK_OBJECT_ACE as _ACCESS_DENIED_CALLBACK_OBJECT_ACE ptr

type _SYSTEM_AUDIT_CALLBACK_OBJECT_ACE
	Header as ACE_HEADER
	Mask as ACCESS_MASK
	Flags as DWORD
	ObjectType as GUID
	InheritedObjectType as GUID
	SidStart as DWORD
end type

type SYSTEM_AUDIT_CALLBACK_OBJECT_ACE as _SYSTEM_AUDIT_CALLBACK_OBJECT_ACE
type PSYSTEM_AUDIT_CALLBACK_OBJECT_ACE as _SYSTEM_AUDIT_CALLBACK_OBJECT_ACE ptr

type _SYSTEM_ALARM_CALLBACK_OBJECT_ACE
	Header as ACE_HEADER
	Mask as ACCESS_MASK
	Flags as DWORD
	ObjectType as GUID
	InheritedObjectType as GUID
	SidStart as DWORD
end type

type SYSTEM_ALARM_CALLBACK_OBJECT_ACE as _SYSTEM_ALARM_CALLBACK_OBJECT_ACE
type PSYSTEM_ALARM_CALLBACK_OBJECT_ACE as _SYSTEM_ALARM_CALLBACK_OBJECT_ACE ptr

#define ACE_OBJECT_TYPE_PRESENT &h1
#define ACE_INHERITED_OBJECT_TYPE_PRESENT &h2

type _ACL_INFORMATION_CLASS as long
enum
	AclRevisionInformation = 1
	AclSizeInformation
end enum

type ACL_INFORMATION_CLASS as _ACL_INFORMATION_CLASS

type _ACL_REVISION_INFORMATION
	AclRevision as DWORD
end type

type ACL_REVISION_INFORMATION as _ACL_REVISION_INFORMATION
type PACL_REVISION_INFORMATION as ACL_REVISION_INFORMATION ptr

type _ACL_SIZE_INFORMATION
	AceCount as DWORD
	AclBytesInUse as DWORD
	AclBytesFree as DWORD
end type

type ACL_SIZE_INFORMATION as _ACL_SIZE_INFORMATION
type PACL_SIZE_INFORMATION as ACL_SIZE_INFORMATION ptr

#define SECURITY_DESCRIPTOR_REVISION 1
#define SECURITY_DESCRIPTOR_REVISION1 1
#define SECURITY_DESCRIPTOR_MIN_LENGTH sizeof(SECURITY_DESCRIPTOR)

type SECURITY_DESCRIPTOR_CONTROL as WORD
type PSECURITY_DESCRIPTOR_CONTROL as WORD ptr

#define SE_OWNER_DEFAULTED &h0001
#define SE_GROUP_DEFAULTED &h0002
#define SE_DACL_PRESENT &h0004
#define SE_DACL_DEFAULTED &h0008
#define SE_SACL_PRESENT &h0010
#define SE_SACL_DEFAULTED &h0020
#define SE_DACL_AUTO_INHERIT_REQ &h0100
#define SE_SACL_AUTO_INHERIT_REQ &h0200
#define SE_DACL_AUTO_INHERITED &h0400
#define SE_SACL_AUTO_INHERITED &h0800
#define SE_DACL_PROTECTED &h1000
#define SE_SACL_PROTECTED &h2000
#define SE_RM_CONTROL_VALID &h4000
#define SE_SELF_RELATIVE &h8000

type _SECURITY_DESCRIPTOR_RELATIVE
	Revision as BYTE
	Sbz1 as BYTE
	Control as SECURITY_DESCRIPTOR_CONTROL
	Owner as DWORD
	Group as DWORD
	Sacl as DWORD
	Dacl as DWORD
end type

type SECURITY_DESCRIPTOR_RELATIVE as _SECURITY_DESCRIPTOR_RELATIVE
type PISECURITY_DESCRIPTOR_RELATIVE as _SECURITY_DESCRIPTOR_RELATIVE ptr

type _SECURITY_DESCRIPTOR
	Revision as BYTE
	Sbz1 as BYTE
	Control as SECURITY_DESCRIPTOR_CONTROL
	Owner as PSID
	Group as PSID
	Sacl as PACL
	Dacl as PACL
end type

type SECURITY_DESCRIPTOR as _SECURITY_DESCRIPTOR
type PISECURITY_DESCRIPTOR as _SECURITY_DESCRIPTOR ptr

type _OBJECT_TYPE_LIST
	Level as WORD
	Sbz as WORD
	ObjectType as GUID ptr
end type

type OBJECT_TYPE_LIST as _OBJECT_TYPE_LIST
type POBJECT_TYPE_LIST as _OBJECT_TYPE_LIST ptr

#define ACCESS_OBJECT_GUID 0
#define ACCESS_PROPERTY_SET_GUID 1
#define ACCESS_PROPERTY_GUID 2
#define ACCESS_MAX_LEVEL 4

type _AUDIT_EVENT_TYPE as long
enum
	AuditEventObjectAccess
	AuditEventDirectoryServiceAccess
end enum

type AUDIT_EVENT_TYPE as _AUDIT_EVENT_TYPE
type PAUDIT_EVENT_TYPE as _AUDIT_EVENT_TYPE ptr

#define AUDIT_ALLOW_NO_PRIVILEGE &h1
#define ACCESS_DS_SOURCE_A "DS"
#define ACCESS_DS_SOURCE_W wstr("DS")
#define ACCESS_DS_OBJECT_TYPE_NAME_A "Directory Service Object"
#define ACCESS_DS_OBJECT_TYPE_NAME_W wstr("Directory Service Object")
#define SE_PRIVILEGE_ENABLED_BY_DEFAULT __MSABI_LONG(&h00000001)
#define SE_PRIVILEGE_ENABLED __MSABI_LONG(&h00000002)
#define SE_PRIVILEGE_REMOVED cast(clong, &h00000004)
#define SE_PRIVILEGE_USED_FOR_ACCESS __MSABI_LONG(&h80000000)
#define SE_PRIVILEGE_VALID_ATTRIBUTES (((SE_PRIVILEGE_ENABLED_BY_DEFAULT or SE_PRIVILEGE_ENABLED) or SE_PRIVILEGE_REMOVED) or SE_PRIVILEGE_USED_FOR_ACCESS)
#define PRIVILEGE_SET_ALL_NECESSARY 1

type _PRIVILEGE_SET
	PrivilegeCount as DWORD
	Control as DWORD
	Privilege(0 to 0) as LUID_AND_ATTRIBUTES
end type

type PRIVILEGE_SET as _PRIVILEGE_SET
type PPRIVILEGE_SET as _PRIVILEGE_SET ptr

#define ACCESS_REASON_TYPE_MASK &h00ff0000
#define ACCESS_REASON_DATA_MASK &h0000ffff
#define ACCESS_REASON_STAGING_MASK &h80000000
#define ACCESS_REASON_EXDATA_MASK &h7f000000

type _ACCESS_REASON_TYPE as long
enum
	AccessReasonNone = &h00000000
	AccessReasonAllowedAce = &h00010000
	AccessReasonDeniedAce = &h00020000
	AccessReasonAllowedParentAce = &h00030000
	AccessReasonDeniedParentAce = &h00040000
	AccessReasonNotGrantedByCape = &h00050000
	AccessReasonNotGrantedByParentCape = &h00060000
	AccessReasonNotGrantedToAppContainer = &h00070000
	AccessReasonMissingPrivilege = &h00100000
	AccessReasonFromPrivilege = &h00200000
	AccessReasonIntegrityLevel = &h00300000
	AccessReasonOwnership = &h00400000
	AccessReasonNullDacl = &h00500000
	AccessReasonEmptyDacl = &h00600000
	AccessReasonNoSD = &h00700000
	AccessReasonNoGrant = &h00800000
end enum

type ACCESS_REASON_TYPE as _ACCESS_REASON_TYPE
type ACCESS_REASON as DWORD

type _ACCESS_REASONS
	Data(0 to 31) as ACCESS_REASON
end type

type ACCESS_REASONS as _ACCESS_REASONS
type PACCESS_REASONS as _ACCESS_REASONS ptr

#define SE_SECURITY_DESCRIPTOR_FLAG_NO_OWNER_ACE &h00000001
#define SE_SECURITY_DESCRIPTOR_FLAG_NO_LABEL_ACE &h00000002
#define SE_SECURITY_DESCRIPTOR_VALID_FLAGS &h00000003

type _SE_SECURITY_DESCRIPTOR
	Size as DWORD
	Flags as DWORD
	SecurityDescriptor as PSECURITY_DESCRIPTOR
end type

type SE_SECURITY_DESCRIPTOR as _SE_SECURITY_DESCRIPTOR
type PSE_SECURITY_DESCRIPTOR as _SE_SECURITY_DESCRIPTOR ptr

type _SE_ACCESS_REQUEST
	Size as DWORD
	SeSecurityDescriptor as PSE_SECURITY_DESCRIPTOR
	DesiredAccess as ACCESS_MASK
	PreviouslyGrantedAccess as ACCESS_MASK
	PrincipalSelfSid as PSID
	GenericMapping as PGENERIC_MAPPING
	ObjectTypeListCount as DWORD
	ObjectTypeList as POBJECT_TYPE_LIST
end type

type SE_ACCESS_REQUEST as _SE_ACCESS_REQUEST
type PSE_ACCESS_REQUEST as _SE_ACCESS_REQUEST ptr

type _SE_ACCESS_REPLY
	Size as DWORD
	ResultListCount as DWORD
	GrantedAccess as PACCESS_MASK
	AccessStatus as PDWORD
	AccessReason as PACCESS_REASONS
	Privileges as PPRIVILEGE_SET ptr
end type

type SE_ACCESS_REPLY as _SE_ACCESS_REPLY
type PSE_ACCESS_REPLY as _SE_ACCESS_REPLY ptr

#define SE_CREATE_TOKEN_NAME TEXT_("SeCreateTokenPrivilege")
#define SE_ASSIGNPRIMARYTOKEN_NAME TEXT_("SeAssignPrimaryTokenPrivilege")
#define SE_LOCK_MEMORY_NAME TEXT_("SeLockMemoryPrivilege")
#define SE_INCREASE_QUOTA_NAME TEXT_("SeIncreaseQuotaPrivilege")
#define SE_UNSOLICITED_INPUT_NAME TEXT_("SeUnsolicitedInputPrivilege")
#define SE_MACHINE_ACCOUNT_NAME TEXT_("SeMachineAccountPrivilege")
#define SE_TCB_NAME TEXT_("SeTcbPrivilege")
#define SE_SECURITY_NAME TEXT_("SeSecurityPrivilege")
#define SE_TAKE_OWNERSHIP_NAME TEXT_("SeTakeOwnershipPrivilege")
#define SE_LOAD_DRIVER_NAME TEXT_("SeLoadDriverPrivilege")
#define SE_SYSTEM_PROFILE_NAME TEXT_("SeSystemProfilePrivilege")
#define SE_SYSTEMTIME_NAME TEXT_("SeSystemtimePrivilege")
#define SE_PROF_SINGLE_PROCESS_NAME TEXT_("SeProfileSingleProcessPrivilege")
#define SE_INC_BASE_PRIORITY_NAME TEXT_("SeIncreaseBasePriorityPrivilege")
#define SE_CREATE_PAGEFILE_NAME TEXT_("SeCreatePagefilePrivilege")
#define SE_CREATE_PERMANENT_NAME TEXT_("SeCreatePermanentPrivilege")
#define SE_BACKUP_NAME TEXT_("SeBackupPrivilege")
#define SE_RESTORE_NAME TEXT_("SeRestorePrivilege")
#define SE_SHUTDOWN_NAME TEXT_("SeShutdownPrivilege")
#define SE_DEBUG_NAME TEXT_("SeDebugPrivilege")
#define SE_AUDIT_NAME TEXT_("SeAuditPrivilege")
#define SE_SYSTEM_ENVIRONMENT_NAME TEXT_("SeSystemEnvironmentPrivilege")
#define SE_CHANGE_NOTIFY_NAME TEXT_("SeChangeNotifyPrivilege")
#define SE_REMOTE_SHUTDOWN_NAME TEXT_("SeRemoteShutdownPrivilege")
#define SE_UNDOCK_NAME TEXT_("SeUndockPrivilege")
#define SE_SYNC_AGENT_NAME TEXT_("SeSyncAgentPrivilege")
#define SE_ENABLE_DELEGATION_NAME TEXT_("SeEnableDelegationPrivilege")
#define SE_MANAGE_VOLUME_NAME TEXT_("SeManageVolumePrivilege")
#define SE_IMPERSONATE_NAME TEXT_("SeImpersonatePrivilege")
#define SE_CREATE_GLOBAL_NAME TEXT_("SeCreateGlobalPrivilege")
#define SE_TRUSTED_CREDMAN_ACCESS_NAME TEXT_("SeTrustedCredManAccessPrivilege")
#define SE_RELABEL_NAME TEXT_("SeRelabelPrivilege")
#define SE_INC_WORKING_SET_NAME TEXT_("SeIncreaseWorkingSetPrivilege")
#define SE_TIME_ZONE_NAME TEXT_("SeTimeZonePrivilege")
#define SE_CREATE_SYMBOLIC_LINK_NAME TEXT_("SeCreateSymbolicLinkPrivilege")

type _SECURITY_IMPERSONATION_LEVEL as long
enum
	SecurityAnonymous
	SecurityIdentification
	SecurityImpersonation
	SecurityDelegation
end enum

type SECURITY_IMPERSONATION_LEVEL as _SECURITY_IMPERSONATION_LEVEL
type PSECURITY_IMPERSONATION_LEVEL as _SECURITY_IMPERSONATION_LEVEL ptr

#define SECURITY_MAX_IMPERSONATION_LEVEL SecurityDelegation
#define SECURITY_MIN_IMPERSONATION_LEVEL SecurityAnonymous
#define DEFAULT_IMPERSONATION_LEVEL SecurityImpersonation
#define VALID_IMPERSONATION_LEVEL(L) (((L) >= SECURITY_MIN_IMPERSONATION_LEVEL) andalso ((L) <= SECURITY_MAX_IMPERSONATION_LEVEL))
#define TOKEN_ASSIGN_PRIMARY &h0001
#define TOKEN_DUPLICATE &h0002
#define TOKEN_IMPERSONATE &h0004
#define TOKEN_QUERY &h0008
#define TOKEN_QUERY_SOURCE &h0010
#define TOKEN_ADJUST_PRIVILEGES &h0020
#define TOKEN_ADJUST_GROUPS &h0040
#define TOKEN_ADJUST_DEFAULT &h0080
#define TOKEN_ADJUST_SESSIONID &h0100
#define TOKEN_ALL_ACCESS_P ((((((((STANDARD_RIGHTS_REQUIRED or TOKEN_ASSIGN_PRIMARY) or TOKEN_DUPLICATE) or TOKEN_IMPERSONATE) or TOKEN_QUERY) or TOKEN_QUERY_SOURCE) or TOKEN_ADJUST_PRIVILEGES) or TOKEN_ADJUST_GROUPS) or TOKEN_ADJUST_DEFAULT)
#define TOKEN_ALL_ACCESS (TOKEN_ALL_ACCESS_P or TOKEN_ADJUST_SESSIONID)
#define TOKEN_READ (STANDARD_RIGHTS_READ or TOKEN_QUERY)
#define TOKEN_WRITE (((STANDARD_RIGHTS_WRITE or TOKEN_ADJUST_PRIVILEGES) or TOKEN_ADJUST_GROUPS) or TOKEN_ADJUST_DEFAULT)
#define TOKEN_EXECUTE STANDARD_RIGHTS_EXECUTE

type _TOKEN_TYPE as long
enum
	TokenPrimary = 1
	TokenImpersonation
end enum

type TOKEN_TYPE as _TOKEN_TYPE
type PTOKEN_TYPE as TOKEN_TYPE ptr

type _TOKEN_ELEVATION_TYPE as long
enum
	TokenElevationTypeDefault = 1
	TokenElevationTypeFull
	TokenElevationTypeLimited
end enum

type TOKEN_ELEVATION_TYPE as _TOKEN_ELEVATION_TYPE
type PTOKEN_ELEVATION_TYPE as _TOKEN_ELEVATION_TYPE ptr

type _TOKEN_INFORMATION_CLASS as long
enum
	TokenUser = 1
	TokenGroups
	TokenPrivileges
	TokenOwner
	TokenPrimaryGroup
	TokenDefaultDacl
	TokenSource
	TokenType
	TokenImpersonationLevel
	TokenStatistics
	TokenRestrictedSids
	TokenSessionId
	TokenGroupsAndPrivileges
	TokenSessionReference
	TokenSandBoxInert
	TokenAuditPolicy
	TokenOrigin
	TokenElevationType
	TokenLinkedToken
	TokenElevation
	TokenHasRestrictions
	TokenAccessInformation
	TokenVirtualizationAllowed
	TokenVirtualizationEnabled
	TokenIntegrityLevel
	TokenUIAccess
	TokenMandatoryPolicy
	TokenLogonSid
	TokenIsAppContainer
	TokenCapabilities
	TokenAppContainerSid
	TokenAppContainerNumber
	TokenUserClaimAttributes
	TokenDeviceClaimAttributes
	TokenRestrictedUserClaimAttributes
	TokenRestrictedDeviceClaimAttributes
	TokenDeviceGroups
	TokenRestrictedDeviceGroups
	TokenSecurityAttributes
	TokenIsRestricted
	MaxTokenInfoClass
end enum

type TOKEN_INFORMATION_CLASS as _TOKEN_INFORMATION_CLASS
type PTOKEN_INFORMATION_CLASS as _TOKEN_INFORMATION_CLASS ptr

type _TOKEN_USER
	User as SID_AND_ATTRIBUTES
end type

type TOKEN_USER as _TOKEN_USER
type PTOKEN_USER as _TOKEN_USER ptr

type _TOKEN_GROUPS
	GroupCount as DWORD
	Groups(0 to 0) as SID_AND_ATTRIBUTES
end type

type TOKEN_GROUPS as _TOKEN_GROUPS
type PTOKEN_GROUPS as _TOKEN_GROUPS ptr

type _TOKEN_PRIVILEGES
	PrivilegeCount as DWORD
	Privileges(0 to 0) as LUID_AND_ATTRIBUTES
end type

type TOKEN_PRIVILEGES as _TOKEN_PRIVILEGES
type PTOKEN_PRIVILEGES as _TOKEN_PRIVILEGES ptr

type _TOKEN_OWNER
	Owner as PSID
end type

type TOKEN_OWNER as _TOKEN_OWNER
type PTOKEN_OWNER as _TOKEN_OWNER ptr

type _TOKEN_PRIMARY_GROUP
	PrimaryGroup as PSID
end type

type TOKEN_PRIMARY_GROUP as _TOKEN_PRIMARY_GROUP
type PTOKEN_PRIMARY_GROUP as _TOKEN_PRIMARY_GROUP ptr

type _TOKEN_DEFAULT_DACL
	DefaultDacl as PACL
end type

type TOKEN_DEFAULT_DACL as _TOKEN_DEFAULT_DACL
type PTOKEN_DEFAULT_DACL as _TOKEN_DEFAULT_DACL ptr

type _TOKEN_USER_CLAIMS
	UserClaims as PCLAIMS_BLOB
end type

type TOKEN_USER_CLAIMS as _TOKEN_USER_CLAIMS
type PTOKEN_USER_CLAIMS as _TOKEN_USER_CLAIMS ptr

type _TOKEN_DEVICE_CLAIMS
	DeviceClaims as PCLAIMS_BLOB
end type

type TOKEN_DEVICE_CLAIMS as _TOKEN_DEVICE_CLAIMS
type PTOKEN_DEVICE_CLAIMS as _TOKEN_DEVICE_CLAIMS ptr

type _TOKEN_GROUPS_AND_PRIVILEGES
	SidCount as DWORD
	SidLength as DWORD
	Sids as PSID_AND_ATTRIBUTES
	RestrictedSidCount as DWORD
	RestrictedSidLength as DWORD
	RestrictedSids as PSID_AND_ATTRIBUTES
	PrivilegeCount as DWORD
	PrivilegeLength as DWORD
	Privileges as PLUID_AND_ATTRIBUTES
	AuthenticationId as LUID
end type

type TOKEN_GROUPS_AND_PRIVILEGES as _TOKEN_GROUPS_AND_PRIVILEGES
type PTOKEN_GROUPS_AND_PRIVILEGES as _TOKEN_GROUPS_AND_PRIVILEGES ptr

type _TOKEN_LINKED_TOKEN
	LinkedToken as HANDLE
end type

type TOKEN_LINKED_TOKEN as _TOKEN_LINKED_TOKEN
type PTOKEN_LINKED_TOKEN as _TOKEN_LINKED_TOKEN ptr

type _TOKEN_ELEVATION
	TokenIsElevated as DWORD
end type

type TOKEN_ELEVATION as _TOKEN_ELEVATION
type PTOKEN_ELEVATION as _TOKEN_ELEVATION ptr

type _TOKEN_MANDATORY_LABEL
	Label as SID_AND_ATTRIBUTES
end type

type TOKEN_MANDATORY_LABEL as _TOKEN_MANDATORY_LABEL
type PTOKEN_MANDATORY_LABEL as _TOKEN_MANDATORY_LABEL ptr

#define TOKEN_MANDATORY_POLICY_OFF &h0
#define TOKEN_MANDATORY_POLICY_NO_WRITE_UP &h1
#define TOKEN_MANDATORY_POLICY_NEW_PROCESS_MIN &h2
#define TOKEN_MANDATORY_POLICY_VALID_MASK (TOKEN_MANDATORY_POLICY_NO_WRITE_UP or TOKEN_MANDATORY_POLICY_NEW_PROCESS_MIN)

type _TOKEN_MANDATORY_POLICY
	Policy as DWORD
end type

type TOKEN_MANDATORY_POLICY as _TOKEN_MANDATORY_POLICY
type PTOKEN_MANDATORY_POLICY as _TOKEN_MANDATORY_POLICY ptr

type _TOKEN_ACCESS_INFORMATION
	SidHash as PSID_AND_ATTRIBUTES_HASH
	RestrictedSidHash as PSID_AND_ATTRIBUTES_HASH
	Privileges as PTOKEN_PRIVILEGES
	AuthenticationId as LUID
	TokenType as TOKEN_TYPE
	ImpersonationLevel as SECURITY_IMPERSONATION_LEVEL
	MandatoryPolicy as TOKEN_MANDATORY_POLICY
	Flags as DWORD
	AppContainerNumber as DWORD
	PackageSid as PSID
	CapabilitiesHash as PSID_AND_ATTRIBUTES_HASH
end type

type TOKEN_ACCESS_INFORMATION as _TOKEN_ACCESS_INFORMATION
type PTOKEN_ACCESS_INFORMATION as _TOKEN_ACCESS_INFORMATION ptr

#define POLICY_AUDIT_SUBCATEGORY_COUNT 56

type _TOKEN_AUDIT_POLICY
	PerUserPolicy(0 to ((56 shr 1) + 1) - 1) as UCHAR
end type

type TOKEN_AUDIT_POLICY as _TOKEN_AUDIT_POLICY
type PTOKEN_AUDIT_POLICY as _TOKEN_AUDIT_POLICY ptr

#define TOKEN_SOURCE_LENGTH 8

type _TOKEN_SOURCE
	SourceName(0 to 7) as CHAR
	SourceIdentifier as LUID
end type

type TOKEN_SOURCE as _TOKEN_SOURCE
type PTOKEN_SOURCE as _TOKEN_SOURCE ptr

type _TOKEN_STATISTICS
	TokenId as LUID
	AuthenticationId as LUID
	ExpirationTime as LARGE_INTEGER
	TokenType as TOKEN_TYPE
	ImpersonationLevel as SECURITY_IMPERSONATION_LEVEL
	DynamicCharged as DWORD
	DynamicAvailable as DWORD
	GroupCount as DWORD
	PrivilegeCount as DWORD
	ModifiedId as LUID
end type

type TOKEN_STATISTICS as _TOKEN_STATISTICS
type PTOKEN_STATISTICS as _TOKEN_STATISTICS ptr

type _TOKEN_CONTROL
	TokenId as LUID
	AuthenticationId as LUID
	ModifiedId as LUID
	TokenSource as TOKEN_SOURCE
end type

type TOKEN_CONTROL as _TOKEN_CONTROL
type PTOKEN_CONTROL as _TOKEN_CONTROL ptr

type _TOKEN_ORIGIN
	OriginatingLogonSession as LUID
end type

type TOKEN_ORIGIN as _TOKEN_ORIGIN
type PTOKEN_ORIGIN as _TOKEN_ORIGIN ptr

type _MANDATORY_LEVEL as long
enum
	MandatoryLevelUntrusted = 0
	MandatoryLevelLow
	MandatoryLevelMedium
	MandatoryLevelHigh
	MandatoryLevelSystem
	MandatoryLevelSecureProcess
	MandatoryLevelCount
end enum

type MANDATORY_LEVEL as _MANDATORY_LEVEL
type PMANDATORY_LEVEL as _MANDATORY_LEVEL ptr

type _TOKEN_APPCONTAINER_INFORMATION
	TokenAppContainer as PSID
end type

type TOKEN_APPCONTAINER_INFORMATION as _TOKEN_APPCONTAINER_INFORMATION
type PTOKEN_APPCONTAINER_INFORMATION as _TOKEN_APPCONTAINER_INFORMATION ptr

#define CLAIM_SECURITY_ATTRIBUTE_TYPE_INVALID &h00
#define CLAIM_SECURITY_ATTRIBUTE_TYPE_INT64 &h01
#define CLAIM_SECURITY_ATTRIBUTE_TYPE_UINT64 &h02
#define CLAIM_SECURITY_ATTRIBUTE_TYPE_STRING &h03
#define CLAIM_SECURITY_ATTRIBUTE_TYPE_FQBN &h04
#define CLAIM_SECURITY_ATTRIBUTE_TYPE_SID &h05
#define CLAIM_SECURITY_ATTRIBUTE_TYPE_BOOLEAN &h06

type _CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE
	Version as DWORD64
	Name as PWSTR
end type

type CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE as _CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE
type PCLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE as _CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE ptr

type _CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE
	pValue as PVOID
	ValueLength as DWORD
end type

type CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE as _CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE
type PCLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE as _CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE ptr

#define CLAIM_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING &h10
#define CLAIM_SECURITY_ATTRIBUTE_NON_INHERITABLE &h0001
#define CLAIM_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE &h0002
#define CLAIM_SECURITY_ATTRIBUTE_USE_FOR_DENY_ONLY &h0004
#define CLAIM_SECURITY_ATTRIBUTE_DISABLED_BY_DEFAULT &h0008
#define CLAIM_SECURITY_ATTRIBUTE_DISABLED &h0010
#define CLAIM_SECURITY_ATTRIBUTE_MANDATORY &h0020
#define CLAIM_SECURITY_ATTRIBUTE_VALID_FLAGS (((((CLAIM_SECURITY_ATTRIBUTE_NON_INHERITABLE or CLAIM_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE) or CLAIM_SECURITY_ATTRIBUTE_USE_FOR_DENY_ONLY) or CLAIM_SECURITY_ATTRIBUTE_DISABLED_BY_DEFAULT) or CLAIM_SECURITY_ATTRIBUTE_DISABLED) or CLAIM_SECURITY_ATTRIBUTE_MANDATORY)
#define CLAIM_SECURITY_ATTRIBUTE_CUSTOM_FLAGS &hffff0000

union ___CLAIM_SECURITY_ATTRIBUTE_V1_Values
	pInt64 as PLONG64
	pUint64 as PDWORD64
	ppString as PWSTR ptr
	pFqbn as PCLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE
	pOctetString as PCLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE
end union

type _CLAIM_SECURITY_ATTRIBUTE_V1
	Name as PWSTR
	ValueType as WORD
	Reserved as WORD
	Flags as DWORD
	ValueCount as DWORD
	Values as ___CLAIM_SECURITY_ATTRIBUTE_V1_Values
end type

type CLAIM_SECURITY_ATTRIBUTE_V1 as _CLAIM_SECURITY_ATTRIBUTE_V1
type PCLAIM_SECURITY_ATTRIBUTE_V1 as _CLAIM_SECURITY_ATTRIBUTE_V1 ptr

union ___CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1_Values
	pInt64(0 to 0) as DWORD
	pUint64(0 to 0) as DWORD
	ppString(0 to 0) as DWORD
	pFqbn(0 to 0) as DWORD
	pOctetString(0 to 0) as DWORD
end union

type _CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1
	Name as DWORD
	ValueType as WORD
	Reserved as WORD
	Flags as DWORD
	ValueCount as DWORD
	Values as ___CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1_Values
end type

type CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1 as _CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1
type PCLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1 as _CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1 ptr

#define CLAIM_SECURITY_ATTRIBUTES_INFORMATION_VERSION_V1 1
#define CLAIM_SECURITY_ATTRIBUTES_INFORMATION_VERSION CLAIM_SECURITY_ATTRIBUTES_INFORMATION_VERSION_V1

union ___CLAIM_SECURITY_ATTRIBUTES_INFORMATION_Attribute
	pAttributeV1 as PCLAIM_SECURITY_ATTRIBUTE_V1
end union

type _CLAIM_SECURITY_ATTRIBUTES_INFORMATION
	Version as WORD
	Reserved as WORD
	AttributeCount as DWORD
	Attribute as ___CLAIM_SECURITY_ATTRIBUTES_INFORMATION_Attribute
end type

type CLAIM_SECURITY_ATTRIBUTES_INFORMATION as _CLAIM_SECURITY_ATTRIBUTES_INFORMATION
type PCLAIM_SECURITY_ATTRIBUTES_INFORMATION as _CLAIM_SECURITY_ATTRIBUTES_INFORMATION ptr

#define SECURITY_DYNAMIC_TRACKING TRUE
#define SECURITY_STATIC_TRACKING FALSE

type SECURITY_CONTEXT_TRACKING_MODE as BOOLEAN
type PSECURITY_CONTEXT_TRACKING_MODE as BOOLEAN ptr

type _SECURITY_QUALITY_OF_SERVICE
	Length as DWORD
	ImpersonationLevel as SECURITY_IMPERSONATION_LEVEL
	ContextTrackingMode as SECURITY_CONTEXT_TRACKING_MODE
	EffectiveOnly as BOOLEAN
end type

type SECURITY_QUALITY_OF_SERVICE as _SECURITY_QUALITY_OF_SERVICE
type PSECURITY_QUALITY_OF_SERVICE as _SECURITY_QUALITY_OF_SERVICE ptr

type _SE_IMPERSONATION_STATE
	Token as PACCESS_TOKEN
	CopyOnOpen as BOOLEAN
	EffectiveOnly as BOOLEAN
	Level as SECURITY_IMPERSONATION_LEVEL
end type

type SE_IMPERSONATION_STATE as _SE_IMPERSONATION_STATE
type PSE_IMPERSONATION_STATE as _SE_IMPERSONATION_STATE ptr

#define DISABLE_MAX_PRIVILEGE &h1
#define SANDBOX_INERT &h2
#define LUA_TOKEN &h4
#define WRITE_RESTRICTED &h8

type SECURITY_INFORMATION as DWORD
type PSECURITY_INFORMATION as DWORD ptr

#define OWNER_SECURITY_INFORMATION __MSABI_LONG(&h00000001)
#define GROUP_SECURITY_INFORMATION __MSABI_LONG(&h00000002)
#define DACL_SECURITY_INFORMATION __MSABI_LONG(&h00000004)
#define SACL_SECURITY_INFORMATION __MSABI_LONG(&h00000008)
#define LABEL_SECURITY_INFORMATION __MSABI_LONG(&h00000010)
#define ATTRIBUTE_SECURITY_INFORMATION __MSABI_LONG(&h00000020)
#define SCOPE_SECURITY_INFORMATION __MSABI_LONG(&h00000040)
#define BACKUP_SECURITY_INFORMATION __MSABI_LONG(&h00010000)
#define PROTECTED_DACL_SECURITY_INFORMATION __MSABI_LONG(&h80000000)
#define PROTECTED_SACL_SECURITY_INFORMATION __MSABI_LONG(&h40000000)
#define UNPROTECTED_DACL_SECURITY_INFORMATION __MSABI_LONG(&h20000000)
#define UNPROTECTED_SACL_SECURITY_INFORMATION __MSABI_LONG(&h10000000)

type _SE_LEARNING_MODE_DATA_TYPE as long
enum
	SeLearningModeInvalidType = 0
	SeLearningModeSettings
	SeLearningModeMax
end enum

type SE_LEARNING_MODE_DATA_TYPE as _SE_LEARNING_MODE_DATA_TYPE

#define SE_LEARNING_MODE_FLAG_PERMISSIVE &h00000001

type _SECURITY_CAPABILITIES
	AppContainerSid as PSID
	Capabilities as PSID_AND_ATTRIBUTES
	CapabilityCount as DWORD
	Reserved as DWORD
end type

type SECURITY_CAPABILITIES as _SECURITY_CAPABILITIES
type PSECURITY_CAPABILITIES as _SECURITY_CAPABILITIES ptr
type LPSECURITY_CAPABILITIES as _SECURITY_CAPABILITIES ptr

#define PROCESS_TERMINATE &h0001
#define PROCESS_CREATE_THREAD &h0002
#define PROCESS_SET_SESSIONID &h0004
#define PROCESS_VM_OPERATION &h0008
#define PROCESS_VM_READ &h0010
#define PROCESS_VM_WRITE &h0020
#define PROCESS_DUP_HANDLE &h0040
#define PROCESS_CREATE_PROCESS &h0080
#define PROCESS_SET_QUOTA &h0100
#define PROCESS_SET_INFORMATION &h0200
#define PROCESS_QUERY_INFORMATION &h0400
#define PROCESS_SUSPEND_RESUME &h0800
#define PROCESS_QUERY_LIMITED_INFORMATION &h1000
#define PROCESS_ALL_ACCESS ((STANDARD_RIGHTS_REQUIRED or SYNCHRONIZE) or &hfff)

#ifdef __FB_64BIT__
	#define MAXIMUM_PROC_PER_GROUP 64
#else
	#define MAXIMUM_PROC_PER_GROUP 32
#endif

#define MAXIMUM_PROCESSORS MAXIMUM_PROC_PER_GROUP
#define THREAD_TERMINATE &h0001
#define THREAD_SUSPEND_RESUME &h0002
#define THREAD_GET_CONTEXT &h0008
#define THREAD_SET_CONTEXT &h0010
#define THREAD_SET_INFORMATION &h0020
#define THREAD_QUERY_INFORMATION &h0040
#define THREAD_SET_THREAD_TOKEN &h0080
#define THREAD_IMPERSONATE &h0100
#define THREAD_DIRECT_IMPERSONATION &h0200
#define THREAD_SET_LIMITED_INFORMATION &h0400
#define THREAD_QUERY_LIMITED_INFORMATION &h0800
#define THREAD_ALL_ACCESS ((STANDARD_RIGHTS_REQUIRED or SYNCHRONIZE) or &h3ff)
#define JOB_OBJECT_ASSIGN_PROCESS &h0001
#define JOB_OBJECT_SET_ATTRIBUTES &h0002
#define JOB_OBJECT_QUERY &h0004
#define JOB_OBJECT_TERMINATE &h0008
#define JOB_OBJECT_SET_SECURITY_ATTRIBUTES &h0010
#define JOB_OBJECT_ALL_ACCESS ((STANDARD_RIGHTS_REQUIRED or SYNCHRONIZE) or &h1F)

type _JOB_SET_ARRAY
	JobHandle as HANDLE
	MemberLevel as DWORD
	Flags as DWORD
end type

type JOB_SET_ARRAY as _JOB_SET_ARRAY
type PJOB_SET_ARRAY as _JOB_SET_ARRAY ptr

#define FLS_MAXIMUM_AVAILABLE 128
#define TLS_MINIMUM_AVAILABLE 64

type _EXCEPTION_REGISTRATION_RECORD
	union
		Next as _EXCEPTION_REGISTRATION_RECORD ptr
		prev as _EXCEPTION_REGISTRATION_RECORD ptr
	end union

	union
		Handler as PEXCEPTION_ROUTINE
		handler_ as PEXCEPTION_ROUTINE
	end union
end type

type EXCEPTION_REGISTRATION_RECORD as _EXCEPTION_REGISTRATION_RECORD
type PEXCEPTION_REGISTRATION_RECORD as EXCEPTION_REGISTRATION_RECORD ptr
type EXCEPTION_REGISTRATION as EXCEPTION_REGISTRATION_RECORD
type PEXCEPTION_REGISTRATION as PEXCEPTION_REGISTRATION_RECORD

#define _NT_TIB_DEFINED

type _NT_TIB
	ExceptionList as _EXCEPTION_REGISTRATION_RECORD ptr
	StackBase as PVOID
	StackLimit as PVOID
	SubSystemTib as PVOID

	union
		FiberData as PVOID
		Version as DWORD
	end union

	ArbitraryUserPointer as PVOID
	Self as _NT_TIB ptr
end type

type NT_TIB as _NT_TIB
type PNT_TIB as NT_TIB ptr

type _NT_TIB32
	ExceptionList as DWORD
	StackBase as DWORD
	StackLimit as DWORD
	SubSystemTib as DWORD

	union
		FiberData as DWORD
		Version as DWORD
	end union

	ArbitraryUserPointer as DWORD
	Self as DWORD
end type

type NT_TIB32 as _NT_TIB32
type PNT_TIB32 as _NT_TIB32 ptr

type _NT_TIB64
	ExceptionList as DWORD64
	StackBase as DWORD64
	StackLimit as DWORD64
	SubSystemTib as DWORD64

	union
		FiberData as DWORD64
		Version as DWORD
	end union

	ArbitraryUserPointer as DWORD64
	Self as DWORD64
end type

type NT_TIB64 as _NT_TIB64
type PNT_TIB64 as _NT_TIB64 ptr

#define THREAD_BASE_PRIORITY_LOWRT 15
#define THREAD_BASE_PRIORITY_MAX 2
#define THREAD_BASE_PRIORITY_MIN (-2)
#define THREAD_BASE_PRIORITY_IDLE (-15)

type _UMS_CREATE_THREAD_ATTRIBUTES
	UmsVersion as DWORD
	UmsContext as PVOID
	UmsCompletionList as PVOID
end type

type UMS_CREATE_THREAD_ATTRIBUTES as _UMS_CREATE_THREAD_ATTRIBUTES
type PUMS_CREATE_THREAD_ATTRIBUTES as _UMS_CREATE_THREAD_ATTRIBUTES ptr

type _QUOTA_LIMITS
	PagedPoolLimit as SIZE_T_
	NonPagedPoolLimit as SIZE_T_
	MinimumWorkingSetSize as SIZE_T_
	MaximumWorkingSetSize as SIZE_T_
	PagefileLimit as SIZE_T_
	TimeLimit as LARGE_INTEGER
end type

type QUOTA_LIMITS as _QUOTA_LIMITS
type PQUOTA_LIMITS as _QUOTA_LIMITS ptr

#define QUOTA_LIMITS_HARDWS_MIN_ENABLE &h00000001
#define QUOTA_LIMITS_HARDWS_MIN_DISABLE &h00000002
#define QUOTA_LIMITS_HARDWS_MAX_ENABLE &h00000004
#define QUOTA_LIMITS_HARDWS_MAX_DISABLE &h00000008
#define QUOTA_LIMITS_USE_DEFAULT_LIMITS &h00000010

union _RATE_QUOTA_LIMIT
	RateData as DWORD

	type
		RatePercent : 7 as DWORD
		Reserved0 : 25 as DWORD
	end type
end union

type RATE_QUOTA_LIMIT as _RATE_QUOTA_LIMIT
type PRATE_QUOTA_LIMIT as _RATE_QUOTA_LIMIT ptr

type _QUOTA_LIMITS_EX
	PagedPoolLimit as SIZE_T_
	NonPagedPoolLimit as SIZE_T_
	MinimumWorkingSetSize as SIZE_T_
	MaximumWorkingSetSize as SIZE_T_
	PagefileLimit as SIZE_T_
	TimeLimit as LARGE_INTEGER
	WorkingSetLimit as SIZE_T_
	Reserved2 as SIZE_T_
	Reserved3 as SIZE_T_
	Reserved4 as SIZE_T_
	Flags as DWORD
	CpuRateLimit as RATE_QUOTA_LIMIT
end type

type QUOTA_LIMITS_EX as _QUOTA_LIMITS_EX
type PQUOTA_LIMITS_EX as _QUOTA_LIMITS_EX ptr

type _IO_COUNTERS
	ReadOperationCount as ULONGLONG
	WriteOperationCount as ULONGLONG
	OtherOperationCount as ULONGLONG
	ReadTransferCount as ULONGLONG
	WriteTransferCount as ULONGLONG
	OtherTransferCount as ULONGLONG
end type

type IO_COUNTERS as _IO_COUNTERS
type PIO_COUNTERS as IO_COUNTERS ptr

#define MAX_HW_COUNTERS 16
#define THREAD_PROFILING_FLAG_DISPATCH &h1

type _HARDWARE_COUNTER_TYPE as long
enum
	PMCCounter
	MaxHardwareCounterType
end enum

type HARDWARE_COUNTER_TYPE as _HARDWARE_COUNTER_TYPE
type PHARDWARE_COUNTER_TYPE as _HARDWARE_COUNTER_TYPE ptr

type _PROCESS_MITIGATION_POLICY as long
enum
	ProcessDEPPolicy
	ProcessASLRPolicy
	ProcessReserved1MitigationPolicy
	ProcessStrictHandleCheckPolicy
	ProcessSystemCallDisablePolicy
	ProcessMitigationOptionsMask
	ProcessExtensionPointDisablePolicy
	MaxProcessMitigationPolicy
end enum

type PROCESS_MITIGATION_POLICY as _PROCESS_MITIGATION_POLICY
type PPROCESS_MITIGATION_POLICY as _PROCESS_MITIGATION_POLICY ptr

type _PROCESS_MITIGATION_ASLR_POLICY
	union
		Flags as DWORD

		type
			EnableBottomUpRandomization : 1 as DWORD
			EnableForceRelocateImages : 1 as DWORD
			EnableHighEntropy : 1 as DWORD
			DisallowStrippedImages : 1 as DWORD
			ReservedFlags : 28 as DWORD
		end type
	end union
end type

type PROCESS_MITIGATION_ASLR_POLICY as _PROCESS_MITIGATION_ASLR_POLICY
type PPROCESS_MITIGATION_ASLR_POLICY as _PROCESS_MITIGATION_ASLR_POLICY ptr

type _PROCESS_MITIGATION_DEP_POLICY
	union
		Flags as DWORD

		type
			Enable : 1 as DWORD
			DisableAtlThunkEmulation : 1 as DWORD
			ReservedFlags : 30 as DWORD
		end type
	end union

	Permanent as BOOLEAN
end type

type PROCESS_MITIGATION_DEP_POLICY as _PROCESS_MITIGATION_DEP_POLICY
type PPROCESS_MITIGATION_DEP_POLICY as _PROCESS_MITIGATION_DEP_POLICY ptr

type _PROCESS_MITIGATION_STRICT_HANDLE_CHECK_POLICY
	union
		Flags as DWORD

		type
			RaiseExceptionOnInvalidHandleReference : 1 as DWORD
			HandleExceptionsPermanentlyEnabled : 1 as DWORD
			ReservedFlags : 30 as DWORD
		end type
	end union
end type

type PROCESS_MITIGATION_STRICT_HANDLE_CHECK_POLICY as _PROCESS_MITIGATION_STRICT_HANDLE_CHECK_POLICY
type PPROCESS_MITIGATION_STRICT_HANDLE_CHECK_POLICY as _PROCESS_MITIGATION_STRICT_HANDLE_CHECK_POLICY ptr

type _PROCESS_MITIGATION_SYSTEM_CALL_DISABLE_POLICY
	union
		Flags as DWORD

		type
			DisallowWin32kSystemCalls : 1 as DWORD
			ReservedFlags : 31 as DWORD
		end type
	end union
end type

type PROCESS_MITIGATION_SYSTEM_CALL_DISABLE_POLICY as _PROCESS_MITIGATION_SYSTEM_CALL_DISABLE_POLICY
type PPROCESS_MITIGATION_SYSTEM_CALL_DISABLE_POLICY as _PROCESS_MITIGATION_SYSTEM_CALL_DISABLE_POLICY ptr

type _PROCESS_MITIGATION_EXTENSION_POINT_DISABLE_POLICY
	union
		Flags as DWORD

		type
			DisableExtensionPoints : 1 as DWORD
			ReservedFlags : 31 as DWORD
		end type
	end union
end type

type PROCESS_MITIGATION_EXTENSION_POINT_DISABLE_POLICY as _PROCESS_MITIGATION_EXTENSION_POINT_DISABLE_POLICY
type PPROCESS_MITIGATION_EXTENSION_POINT_DISABLE_POLICY as _PROCESS_MITIGATION_EXTENSION_POINT_DISABLE_POLICY ptr

type _JOBOBJECT_BASIC_ACCOUNTING_INFORMATION
	TotalUserTime as LARGE_INTEGER
	TotalKernelTime as LARGE_INTEGER
	ThisPeriodTotalUserTime as LARGE_INTEGER
	ThisPeriodTotalKernelTime as LARGE_INTEGER
	TotalPageFaultCount as DWORD
	TotalProcesses as DWORD
	ActiveProcesses as DWORD
	TotalTerminatedProcesses as DWORD
end type

type JOBOBJECT_BASIC_ACCOUNTING_INFORMATION as _JOBOBJECT_BASIC_ACCOUNTING_INFORMATION
type PJOBOBJECT_BASIC_ACCOUNTING_INFORMATION as _JOBOBJECT_BASIC_ACCOUNTING_INFORMATION ptr

type _JOBOBJECT_BASIC_LIMIT_INFORMATION
	PerProcessUserTimeLimit as LARGE_INTEGER
	PerJobUserTimeLimit as LARGE_INTEGER
	LimitFlags as DWORD
	MinimumWorkingSetSize as SIZE_T_
	MaximumWorkingSetSize as SIZE_T_
	ActiveProcessLimit as DWORD
	Affinity as ULONG_PTR
	PriorityClass as DWORD
	SchedulingClass as DWORD
end type

type JOBOBJECT_BASIC_LIMIT_INFORMATION as _JOBOBJECT_BASIC_LIMIT_INFORMATION
type PJOBOBJECT_BASIC_LIMIT_INFORMATION as _JOBOBJECT_BASIC_LIMIT_INFORMATION ptr

type _JOBOBJECT_EXTENDED_LIMIT_INFORMATION
	BasicLimitInformation as JOBOBJECT_BASIC_LIMIT_INFORMATION
	IoInfo as IO_COUNTERS
	ProcessMemoryLimit as SIZE_T_
	JobMemoryLimit as SIZE_T_
	PeakProcessMemoryUsed as SIZE_T_
	PeakJobMemoryUsed as SIZE_T_
end type

type JOBOBJECT_EXTENDED_LIMIT_INFORMATION as _JOBOBJECT_EXTENDED_LIMIT_INFORMATION
type PJOBOBJECT_EXTENDED_LIMIT_INFORMATION as _JOBOBJECT_EXTENDED_LIMIT_INFORMATION ptr

type _JOBOBJECT_BASIC_PROCESS_ID_LIST
	NumberOfAssignedProcesses as DWORD
	NumberOfProcessIdsInList as DWORD
	ProcessIdList(0 to 0) as ULONG_PTR
end type

type JOBOBJECT_BASIC_PROCESS_ID_LIST as _JOBOBJECT_BASIC_PROCESS_ID_LIST
type PJOBOBJECT_BASIC_PROCESS_ID_LIST as _JOBOBJECT_BASIC_PROCESS_ID_LIST ptr

type _JOBOBJECT_BASIC_UI_RESTRICTIONS
	UIRestrictionsClass as DWORD
end type

type JOBOBJECT_BASIC_UI_RESTRICTIONS as _JOBOBJECT_BASIC_UI_RESTRICTIONS
type PJOBOBJECT_BASIC_UI_RESTRICTIONS as _JOBOBJECT_BASIC_UI_RESTRICTIONS ptr

type _JOBOBJECT_SECURITY_LIMIT_INFORMATION
	SecurityLimitFlags as DWORD
	JobToken as HANDLE
	SidsToDisable as PTOKEN_GROUPS
	PrivilegesToDelete as PTOKEN_PRIVILEGES
	RestrictedSids as PTOKEN_GROUPS
end type

type JOBOBJECT_SECURITY_LIMIT_INFORMATION as _JOBOBJECT_SECURITY_LIMIT_INFORMATION
type PJOBOBJECT_SECURITY_LIMIT_INFORMATION as _JOBOBJECT_SECURITY_LIMIT_INFORMATION ptr

type _JOBOBJECT_END_OF_JOB_TIME_INFORMATION
	EndOfJobTimeAction as DWORD
end type

type JOBOBJECT_END_OF_JOB_TIME_INFORMATION as _JOBOBJECT_END_OF_JOB_TIME_INFORMATION
type PJOBOBJECT_END_OF_JOB_TIME_INFORMATION as _JOBOBJECT_END_OF_JOB_TIME_INFORMATION ptr

type _JOBOBJECT_ASSOCIATE_COMPLETION_PORT
	CompletionKey as PVOID
	CompletionPort as HANDLE
end type

type JOBOBJECT_ASSOCIATE_COMPLETION_PORT as _JOBOBJECT_ASSOCIATE_COMPLETION_PORT
type PJOBOBJECT_ASSOCIATE_COMPLETION_PORT as _JOBOBJECT_ASSOCIATE_COMPLETION_PORT ptr

type _JOBOBJECT_BASIC_AND_IO_ACCOUNTING_INFORMATION
	BasicInfo as JOBOBJECT_BASIC_ACCOUNTING_INFORMATION
	IoInfo as IO_COUNTERS
end type

type JOBOBJECT_BASIC_AND_IO_ACCOUNTING_INFORMATION as _JOBOBJECT_BASIC_AND_IO_ACCOUNTING_INFORMATION
type PJOBOBJECT_BASIC_AND_IO_ACCOUNTING_INFORMATION as _JOBOBJECT_BASIC_AND_IO_ACCOUNTING_INFORMATION ptr

type _JOBOBJECT_JOBSET_INFORMATION
	MemberLevel as DWORD
end type

type JOBOBJECT_JOBSET_INFORMATION as _JOBOBJECT_JOBSET_INFORMATION
type PJOBOBJECT_JOBSET_INFORMATION as _JOBOBJECT_JOBSET_INFORMATION ptr

type _JOBOBJECT_RATE_CONTROL_TOLERANCE as long
enum
	ToleranceLow = 1
	ToleranceMedium
	ToleranceHigh
end enum

type JOBOBJECT_RATE_CONTROL_TOLERANCE as _JOBOBJECT_RATE_CONTROL_TOLERANCE

type _JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL as long
enum
	ToleranceIntervalShort = 1
	ToleranceIntervalMedium
	ToleranceIntervalLong
end enum

type JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL as _JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL

type _JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION
	IoReadBytesLimit as DWORD64
	IoWriteBytesLimit as DWORD64
	PerJobUserTimeLimit as LARGE_INTEGER
	JobMemoryLimit as DWORD64
	RateControlTolerance as JOBOBJECT_RATE_CONTROL_TOLERANCE
	RateControlToleranceInterval as JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL
	LimitFlags as DWORD
end type

type JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION as _JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION
type PJOBOBJECT_NOTIFICATION_LIMIT_INFORMATION as _JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION ptr

type _JOBOBJECT_LIMIT_VIOLATION_INFORMATION
	LimitFlags as DWORD
	ViolationLimitFlags as DWORD
	IoReadBytes as DWORD64
	IoReadBytesLimit as DWORD64
	IoWriteBytes as DWORD64
	IoWriteBytesLimit as DWORD64
	PerJobUserTime as LARGE_INTEGER
	PerJobUserTimeLimit as LARGE_INTEGER
	JobMemory as DWORD64
	JobMemoryLimit as DWORD64
	RateControlTolerance as JOBOBJECT_RATE_CONTROL_TOLERANCE
	RateControlToleranceLimit as JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL
end type

type JOBOBJECT_LIMIT_VIOLATION_INFORMATION as _JOBOBJECT_LIMIT_VIOLATION_INFORMATION
type PJOBOBJECT_LIMIT_VIOLATION_INFORMATION as _JOBOBJECT_LIMIT_VIOLATION_INFORMATION ptr

type _JOBOBJECT_CPU_RATE_CONTROL_INFORMATION
	ControlFlags as DWORD

	union
		CpuRate as DWORD
		Weight as DWORD
	end union
end type

type JOBOBJECT_CPU_RATE_CONTROL_INFORMATION as _JOBOBJECT_CPU_RATE_CONTROL_INFORMATION
type PJOBOBJECT_CPU_RATE_CONTROL_INFORMATION as _JOBOBJECT_CPU_RATE_CONTROL_INFORMATION ptr

#define JOB_OBJECT_TERMINATE_AT_END_OF_JOB 0
#define JOB_OBJECT_POST_AT_END_OF_JOB 1
#define JOB_OBJECT_MSG_END_OF_JOB_TIME 1
#define JOB_OBJECT_MSG_END_OF_PROCESS_TIME 2
#define JOB_OBJECT_MSG_ACTIVE_PROCESS_LIMIT 3
#define JOB_OBJECT_MSG_ACTIVE_PROCESS_ZERO 4
#define JOB_OBJECT_MSG_NEW_PROCESS 6
#define JOB_OBJECT_MSG_EXIT_PROCESS 7
#define JOB_OBJECT_MSG_ABNORMAL_EXIT_PROCESS 8
#define JOB_OBJECT_MSG_PROCESS_MEMORY_LIMIT 9
#define JOB_OBJECT_MSG_JOB_MEMORY_LIMIT 10
#define JOB_OBJECT_MSG_NOTIFICATION_LIMIT 11
#define JOB_OBJECT_MSG_JOB_CYCLE_TIME_LIMIT 12
#define JOB_OBJECT_MSG_MINIMUM 1
#define JOB_OBJECT_MSG_MAXIMUM 12
#define JOB_OBJECT_LIMIT_WORKINGSET &h00000001
#define JOB_OBJECT_LIMIT_PROCESS_TIME &h00000002
#define JOB_OBJECT_LIMIT_JOB_TIME &h00000004
#define JOB_OBJECT_LIMIT_ACTIVE_PROCESS &h00000008
#define JOB_OBJECT_LIMIT_AFFINITY &h00000010
#define JOB_OBJECT_LIMIT_PRIORITY_CLASS &h00000020
#define JOB_OBJECT_LIMIT_PRESERVE_JOB_TIME &h00000040
#define JOB_OBJECT_LIMIT_SCHEDULING_CLASS &h00000080
#define JOB_OBJECT_LIMIT_PROCESS_MEMORY &h00000100
#define JOB_OBJECT_LIMIT_JOB_MEMORY &h00000200
#define JOB_OBJECT_LIMIT_DIE_ON_UNHANDLED_EXCEPTION &h00000400
#define JOB_OBJECT_LIMIT_BREAKAWAY_OK &h00000800
#define JOB_OBJECT_LIMIT_SILENT_BREAKAWAY_OK &h00001000
#define JOB_OBJECT_LIMIT_KILL_ON_JOB_CLOSE &h00002000
#define JOB_OBJECT_LIMIT_SUBSET_AFFINITY &h00004000
#define JOB_OBJECT_LIMIT_JOB_READ_BYTES &h00010000
#define JOB_OBJECT_LIMIT_JOB_WRITE_BYTES &h00020000
#define JOB_OBJECT_LIMIT_RATE_CONTROL &h00040000
#define JOB_OBJECT_LIMIT_RESERVED3 &h00008000
#define JOB_OBJECT_LIMIT_RESERVED4 &h00010000
#define JOB_OBJECT_LIMIT_RESERVED5 &h00020000
#define JOB_OBJECT_LIMIT_RESERVED6 &h00040000
#define JOB_OBJECT_LIMIT_VALID_FLAGS &h0007ffff
#define JOB_OBJECT_BASIC_LIMIT_VALID_FLAGS &h000000ff
#define JOB_OBJECT_EXTENDED_LIMIT_VALID_FLAGS &h00007fff
#define JOB_OBJECT_RESERVED_LIMIT_VALID_FLAGS &h0007ffff
#define JOB_OBJECT_NOTIFICATION_LIMIT_VALID_FLAGS &h00070204
#define JOB_OBJECT_UILIMIT_NONE &h00000000
#define JOB_OBJECT_UILIMIT_HANDLES &h00000001
#define JOB_OBJECT_UILIMIT_READCLIPBOARD &h00000002
#define JOB_OBJECT_UILIMIT_WRITECLIPBOARD &h00000004
#define JOB_OBJECT_UILIMIT_SYSTEMPARAMETERS &h00000008
#define JOB_OBJECT_UILIMIT_DISPLAYSETTINGS &h00000010
#define JOB_OBJECT_UILIMIT_GLOBALATOMS &h00000020
#define JOB_OBJECT_UILIMIT_DESKTOP &h00000040
#define JOB_OBJECT_UILIMIT_EXITWINDOWS &h00000080
#define JOB_OBJECT_UILIMIT_ALL &h000000FF
#define JOB_OBJECT_UI_VALID_FLAGS &h000000FF
#define JOB_OBJECT_SECURITY_NO_ADMIN &h00000001
#define JOB_OBJECT_SECURITY_RESTRICTED_TOKEN &h00000002
#define JOB_OBJECT_SECURITY_ONLY_TOKEN &h00000004
#define JOB_OBJECT_SECURITY_FILTER_TOKENS &h00000008
#define JOB_OBJECT_SECURITY_VALID_FLAGS &h0000000f
#define JOB_OBJECT_CPU_RATE_CONTROL_ENABLE &h1
#define JOB_OBJECT_CPU_RATE_CONTROL_WEIGHT_BASED &h2
#define JOB_OBJECT_CPU_RATE_CONTROL_HARD_CAP &h4
#define JOB_OBJECT_CPU_RATE_CONTROL_NOTIFY &h8
#define JOB_OBJECT_CPU_RATE_CONTROL_VALID_FLAGS &hf

type _JOBOBJECTINFOCLASS as long
enum
	JobObjectBasicAccountingInformation = 1
	JobObjectBasicLimitInformation
	JobObjectBasicProcessIdList
	JobObjectBasicUIRestrictions
	JobObjectSecurityLimitInformation
	JobObjectEndOfJobTimeInformation
	JobObjectAssociateCompletionPortInformation
	JobObjectBasicAndIoAccountingInformation
	JobObjectExtendedLimitInformation
	JobObjectJobSetInformation
	JobObjectGroupInformation
	JobObjectNotificationLimitInformation
	JobObjectLimitViolationInformation
	JobObjectGroupInformationEx
	JobObjectCpuRateControlInformation
	JobObjectCompletionFilter
	JobObjectCompletionCounter
	JobObjectReserved1Information = 18
	JobObjectReserved2Information
	JobObjectReserved3Information
	JobObjectReserved4Information
	JobObjectReserved5Information
	JobObjectReserved6Information
	JobObjectReserved7Information
	JobObjectReserved8Information
	MaxJobObjectInfoClass
end enum

type JOBOBJECTINFOCLASS as _JOBOBJECTINFOCLASS

type _FIRMWARE_TYPE as long
enum
	FirmwareTypeUnknown
	FirmwareTypeBios
	FirmwareTypeUefi
	FirmwareTypeMax
end enum

type FIRMWARE_TYPE as _FIRMWARE_TYPE
type PFIRMWARE_TYPE as _FIRMWARE_TYPE ptr

#define EVENT_MODIFY_STATE &h0002
#define EVENT_ALL_ACCESS ((STANDARD_RIGHTS_REQUIRED or SYNCHRONIZE) or &h3)
#define MUTANT_QUERY_STATE &h0001
#define MUTANT_ALL_ACCESS ((STANDARD_RIGHTS_REQUIRED or SYNCHRONIZE) or MUTANT_QUERY_STATE)
#define SEMAPHORE_MODIFY_STATE &h0002
#define SEMAPHORE_ALL_ACCESS ((STANDARD_RIGHTS_REQUIRED or SYNCHRONIZE) or &h3)
#define TIMER_QUERY_STATE &h0001
#define TIMER_MODIFY_STATE &h0002
#define TIMER_ALL_ACCESS (((STANDARD_RIGHTS_REQUIRED or SYNCHRONIZE) or TIMER_QUERY_STATE) or TIMER_MODIFY_STATE)
#define TIME_ZONE_ID_UNKNOWN 0
#define TIME_ZONE_ID_STANDARD 1
#define TIME_ZONE_ID_DAYLIGHT 2

type _LOGICAL_PROCESSOR_RELATIONSHIP as long
enum
	RelationProcessorCore
	RelationNumaNode
	RelationCache
	RelationProcessorPackage
	RelationGroup
	RelationAll = &hffff
end enum

type LOGICAL_PROCESSOR_RELATIONSHIP as _LOGICAL_PROCESSOR_RELATIONSHIP

#define LTP_PC_SMT &h1

type _PROCESSOR_CACHE_TYPE as long
enum
	CacheUnified
	CacheInstruction
	CacheData
	CacheTrace
end enum

type PROCESSOR_CACHE_TYPE as _PROCESSOR_CACHE_TYPE

#define CACHE_FULLY_ASSOCIATIVE &hFF

type _CACHE_DESCRIPTOR
	Level as BYTE
	Associativity as BYTE
	LineSize as WORD
	Size as DWORD
	as PROCESSOR_CACHE_TYPE Type
end type

type CACHE_DESCRIPTOR as _CACHE_DESCRIPTOR
type PCACHE_DESCRIPTOR as _CACHE_DESCRIPTOR ptr

type ___SYSTEM_LOGICAL_PROCESSOR_INFORMATION_ProcessorCore
	Flags as BYTE
end type

type ___SYSTEM_LOGICAL_PROCESSOR_INFORMATION_NumaNode
	NodeNumber as DWORD
end type

type _SYSTEM_LOGICAL_PROCESSOR_INFORMATION
	ProcessorMask as ULONG_PTR
	Relationship as LOGICAL_PROCESSOR_RELATIONSHIP

	union
		ProcessorCore as ___SYSTEM_LOGICAL_PROCESSOR_INFORMATION_ProcessorCore
		NumaNode as ___SYSTEM_LOGICAL_PROCESSOR_INFORMATION_NumaNode
		Cache as CACHE_DESCRIPTOR
		Reserved(0 to 1) as ULONGLONG
	end union
end type

type SYSTEM_LOGICAL_PROCESSOR_INFORMATION as _SYSTEM_LOGICAL_PROCESSOR_INFORMATION
type PSYSTEM_LOGICAL_PROCESSOR_INFORMATION as _SYSTEM_LOGICAL_PROCESSOR_INFORMATION ptr

type _PROCESSOR_RELATIONSHIP
	Flags as BYTE
	Reserved(0 to 20) as BYTE
	GroupCount as WORD
	GroupMask(0 to 0) as GROUP_AFFINITY
end type

type PROCESSOR_RELATIONSHIP as _PROCESSOR_RELATIONSHIP
type PPROCESSOR_RELATIONSHIP as _PROCESSOR_RELATIONSHIP ptr

type _NUMA_NODE_RELATIONSHIP
	NodeNumber as DWORD
	Reserved(0 to 19) as BYTE
	GroupMask as GROUP_AFFINITY
end type

type NUMA_NODE_RELATIONSHIP as _NUMA_NODE_RELATIONSHIP
type PNUMA_NODE_RELATIONSHIP as _NUMA_NODE_RELATIONSHIP ptr

type _CACHE_RELATIONSHIP
	Level as BYTE
	Associativity as BYTE
	LineSize as WORD
	CacheSize as DWORD
	as PROCESSOR_CACHE_TYPE Type
	Reserved(0 to 19) as BYTE
	GroupMask as GROUP_AFFINITY
end type

type CACHE_RELATIONSHIP as _CACHE_RELATIONSHIP
type PCACHE_RELATIONSHIP as _CACHE_RELATIONSHIP ptr

type _PROCESSOR_GROUP_INFO
	MaximumProcessorCount as BYTE
	ActiveProcessorCount as BYTE
	Reserved(0 to 37) as BYTE
	ActiveProcessorMask as KAFFINITY
end type

type PROCESSOR_GROUP_INFO as _PROCESSOR_GROUP_INFO
type PPROCESSOR_GROUP_INFO as _PROCESSOR_GROUP_INFO ptr

type _GROUP_RELATIONSHIP
	MaximumGroupCount as WORD
	ActiveGroupCount as WORD
	Reserved(0 to 19) as BYTE
	GroupInfo(0 to 0) as PROCESSOR_GROUP_INFO
end type

type GROUP_RELATIONSHIP as _GROUP_RELATIONSHIP
type PGROUP_RELATIONSHIP as _GROUP_RELATIONSHIP ptr

type _SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX
	Relationship as LOGICAL_PROCESSOR_RELATIONSHIP
	Size as DWORD

	union
		Processor as PROCESSOR_RELATIONSHIP
		NumaNode as NUMA_NODE_RELATIONSHIP
		Cache as CACHE_RELATIONSHIP
		Group as GROUP_RELATIONSHIP
	end union
end type

type SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX as _SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX
type PSYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX as _SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX ptr

type _SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION
	CycleTime as DWORD64
end type

type SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION as _SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION
type PSYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION as _SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION ptr

#define PROCESSOR_INTEL_386 386
#define PROCESSOR_INTEL_486 486
#define PROCESSOR_INTEL_PENTIUM 586
#define PROCESSOR_INTEL_IA64 2200
#define PROCESSOR_AMD_X8664 8664
#define PROCESSOR_MIPS_R4000 4000
#define PROCESSOR_ALPHA_21064 21064
#define PROCESSOR_PPC_601 601
#define PROCESSOR_PPC_603 603
#define PROCESSOR_PPC_604 604
#define PROCESSOR_PPC_620 620
#define PROCESSOR_HITACHI_SH3 10003
#define PROCESSOR_HITACHI_SH3E 10004
#define PROCESSOR_HITACHI_SH4 10005
#define PROCESSOR_MOTOROLA_821 821
#define PROCESSOR_SHx_SH3 103
#define PROCESSOR_SHx_SH4 104
#define PROCESSOR_STRONGARM 2577
#define PROCESSOR_ARM720 1824
#define PROCESSOR_ARM820 2080
#define PROCESSOR_ARM920 2336
#define PROCESSOR_ARM_7TDMI 70001
#define PROCESSOR_OPTIL &h494f
#define PROCESSOR_ARCHITECTURE_INTEL 0
#define PROCESSOR_ARCHITECTURE_MIPS 1
#define PROCESSOR_ARCHITECTURE_ALPHA 2
#define PROCESSOR_ARCHITECTURE_PPC 3
#define PROCESSOR_ARCHITECTURE_SHX 4
#define PROCESSOR_ARCHITECTURE_ARM 5
#define PROCESSOR_ARCHITECTURE_IA64 6
#define PROCESSOR_ARCHITECTURE_ALPHA64 7
#define PROCESSOR_ARCHITECTURE_MSIL 8
#define PROCESSOR_ARCHITECTURE_AMD64 9
#define PROCESSOR_ARCHITECTURE_IA32_ON_WIN64 10
#define PROCESSOR_ARCHITECTURE_NEUTRAL 11
#define PROCESSOR_ARCHITECTURE_UNKNOWN &hffff
#define PF_FLOATING_POINT_PRECISION_ERRATA 0
#define PF_FLOATING_POINT_EMULATED 1
#define PF_COMPARE_EXCHANGE_DOUBLE 2
#define PF_MMX_INSTRUCTIONS_AVAILABLE 3
#define PF_PPC_MOVEMEM_64BIT_OK 4
#define PF_ALPHA_BYTE_INSTRUCTIONS 5
#define PF_XMMI_INSTRUCTIONS_AVAILABLE 6
#define PF_3DNOW_INSTRUCTIONS_AVAILABLE 7
#define PF_RDTSC_INSTRUCTION_AVAILABLE 8
#define PF_PAE_ENABLED 9
#define PF_XMMI64_INSTRUCTIONS_AVAILABLE 10
#define PF_SSE_DAZ_MODE_AVAILABLE 11
#define PF_NX_ENABLED 12
#define PF_SSE3_INSTRUCTIONS_AVAILABLE 13
#define PF_COMPARE_EXCHANGE128 14
#define PF_COMPARE64_EXCHANGE128 15
#define PF_CHANNELS_ENABLED 16
#define PF_XSAVE_ENABLED 17
#define PF_ARM_VFP_32_REGISTERS_AVAILABLE 18
#define PF_ARM_NEON_INSTRUCTIONS_AVAILABLE 19
#define PF_SECOND_LEVEL_ADDRESS_TRANSLATION 20
#define PF_VIRT_FIRMWARE_ENABLED 21
#define PF_RDWRFSGSBASE_AVAILABLE 22
#define PF_FASTFAIL_AVAILABLE 23
#define PF_ARM_DIVIDE_INSTRUCTION_AVAILABLE 24
#define PF_ARM_64BIT_LOADSTORE_ATOMIC 25
#define PF_ARM_EXTERNAL_CACHE_AVAILABLE 26
#define PF_ARM_FMAC_INSTRUCTIONS_AVAILABLE 27
#define XSTATE_LEGACY_FLOATING_POINT 0
#define XSTATE_LEGACY_SSE 1
#define XSTATE_GSSE 2
#define XSTATE_AVX XSTATE_GSSE
#define XSTATE_MASK_LEGACY_FLOATING_POINT (1ull shl XSTATE_LEGACY_FLOATING_POINT)
#define XSTATE_MASK_LEGACY_SSE (1ull shl XSTATE_LEGACY_SSE)
#define XSTATE_MASK_LEGACY (XSTATE_MASK_LEGACY_FLOATING_POINT or XSTATE_MASK_LEGACY_SSE)
#define XSTATE_MASK_GSSE (1ull shl XSTATE_GSSE)
#define XSTATE_MASK_AVX XSTATE_MASK_GSSE
#define MAXIMUM_XSTATE_FEATURES 64

type _XSTATE_FEATURE
	Offset as DWORD
	Size as DWORD
end type

type XSTATE_FEATURE as _XSTATE_FEATURE
type PXSTATE_FEATURE as _XSTATE_FEATURE ptr

type _XSTATE_CONFIGURATION
	EnabledFeatures as DWORD64
	EnabledVolatileFeatures as DWORD64
	Size as DWORD
	OptimizedSave : 1 as DWORD
	Features(0 to 63) as XSTATE_FEATURE
end type

type XSTATE_CONFIGURATION as _XSTATE_CONFIGURATION
type PXSTATE_CONFIGURATION as _XSTATE_CONFIGURATION ptr

type _MEMORY_BASIC_INFORMATION
	BaseAddress as PVOID
	AllocationBase as PVOID
	AllocationProtect as DWORD
	RegionSize as SIZE_T_
	State as DWORD
	Protect as DWORD
	as DWORD Type
end type

type MEMORY_BASIC_INFORMATION as _MEMORY_BASIC_INFORMATION
type PMEMORY_BASIC_INFORMATION as _MEMORY_BASIC_INFORMATION ptr

type _MEMORY_BASIC_INFORMATION32
	BaseAddress as DWORD
	AllocationBase as DWORD
	AllocationProtect as DWORD
	RegionSize as DWORD
	State as DWORD
	Protect as DWORD
	as DWORD Type
end type

type MEMORY_BASIC_INFORMATION32 as _MEMORY_BASIC_INFORMATION32
type PMEMORY_BASIC_INFORMATION32 as _MEMORY_BASIC_INFORMATION32 ptr

type _MEMORY_BASIC_INFORMATION64
	BaseAddress as ULONGLONG
	AllocationBase as ULONGLONG
	AllocationProtect as DWORD
	__alignment1 as DWORD
	RegionSize as ULONGLONG
	State as DWORD
	Protect as DWORD
	as DWORD Type
	__alignment2 as DWORD
end type

type MEMORY_BASIC_INFORMATION64 as _MEMORY_BASIC_INFORMATION64
type PMEMORY_BASIC_INFORMATION64 as _MEMORY_BASIC_INFORMATION64 ptr

#define SECTION_QUERY &h0001
#define SECTION_MAP_WRITE &h0002
#define SECTION_MAP_READ &h0004
#define SECTION_MAP_EXECUTE &h0008
#define SECTION_EXTEND_SIZE &h0010
#define SECTION_MAP_EXECUTE_EXPLICIT &h0020
#define SECTION_ALL_ACCESS (((((STANDARD_RIGHTS_REQUIRED or SECTION_QUERY) or SECTION_MAP_WRITE) or SECTION_MAP_READ) or SECTION_MAP_EXECUTE) or SECTION_EXTEND_SIZE)
#define SESSION_QUERY_ACCESS &h1
#define SESSION_MODIFY_ACCESS &h2
#define SESSION_ALL_ACCESS ((STANDARD_RIGHTS_REQUIRED or SESSION_QUERY_ACCESS) or SESSION_MODIFY_ACCESS)
#define PAGE_NOACCESS &h01
#define PAGE_READONLY &h02
#define PAGE_READWRITE &h04
#define PAGE_WRITECOPY &h08
#define PAGE_EXECUTE &h10
#define PAGE_EXECUTE_READ &h20
#define PAGE_EXECUTE_READWRITE &h40
#define PAGE_EXECUTE_WRITECOPY &h80
#define PAGE_GUARD &h100
#define PAGE_NOCACHE &h200
#define PAGE_WRITECOMBINE &h400
#define MEM_COMMIT &h1000
#define MEM_RESERVE &h2000
#define MEM_DECOMMIT &h4000
#define MEM_RELEASE &h8000
#define MEM_FREE &h10000
#define MEM_PRIVATE &h20000
#define MEM_MAPPED &h40000
#define MEM_RESET &h80000
#define MEM_TOP_DOWN &h100000
#define MEM_WRITE_WATCH &h200000
#define MEM_PHYSICAL &h400000
#define MEM_ROTATE &h800000
#define MEM_LARGE_PAGES &h20000000
#define MEM_4MB_PAGES &h80000000
#define SEC_FILE &h800000
#define SEC_IMAGE &h1000000
#define SEC_PROTECTED_IMAGE &h2000000
#define SEC_RESERVE &h4000000
#define SEC_COMMIT &h8000000
#define SEC_NOCACHE &h10000000
#define SEC_WRITECOMBINE &h40000000
#define SEC_LARGE_PAGES &h80000000
#define SEC_IMAGE_NO_EXECUTE (SEC_IMAGE or SEC_NOCACHE)
#define MEM_IMAGE SEC_IMAGE
#define WRITE_WATCH_FLAG_RESET &h01
#define MEM_UNMAP_WITH_TRANSIENT_BOOST &h01
#define FILE_READ_DATA &h0001
#define FILE_LIST_DIRECTORY &h0001
#define FILE_WRITE_DATA &h0002
#define FILE_ADD_FILE &h0002
#define FILE_APPEND_DATA &h0004
#define FILE_ADD_SUBDIRECTORY &h0004
#define FILE_CREATE_PIPE_INSTANCE &h0004
#define FILE_READ_EA &h0008
#define FILE_WRITE_EA &h0010
#define FILE_EXECUTE &h0020
#define FILE_TRAVERSE &h0020
#define FILE_DELETE_CHILD &h0040
#define FILE_READ_ATTRIBUTES &h0080
#define FILE_WRITE_ATTRIBUTES &h0100
#define FILE_ALL_ACCESS ((STANDARD_RIGHTS_REQUIRED or SYNCHRONIZE) or &h1FF)
#define FILE_GENERIC_READ ((((STANDARD_RIGHTS_READ or FILE_READ_DATA) or FILE_READ_ATTRIBUTES) or FILE_READ_EA) or SYNCHRONIZE)
#define FILE_GENERIC_WRITE (((((STANDARD_RIGHTS_WRITE or FILE_WRITE_DATA) or FILE_WRITE_ATTRIBUTES) or FILE_WRITE_EA) or FILE_APPEND_DATA) or SYNCHRONIZE)
#define FILE_GENERIC_EXECUTE (((STANDARD_RIGHTS_EXECUTE or FILE_READ_ATTRIBUTES) or FILE_EXECUTE) or SYNCHRONIZE)
#define FILE_SUPERSEDE &h00000000
#define FILE_OPEN &h00000001
#define FILE_CREATE &h00000002
#define FILE_OPEN_IF &h00000003
#define FILE_OVERWRITE &h00000004
#define FILE_OVERWRITE_IF &h00000005
#define FILE_MAXIMUM_DISPOSITION &h00000005
#define FILE_DIRECTORY_FILE &h00000001
#define FILE_WRITE_THROUGH &h00000002
#define FILE_SEQUENTIAL_ONLY &h00000004
#define FILE_NO_INTERMEDIATE_BUFFERING &h00000008
#define FILE_SYNCHRONOUS_IO_ALERT &h00000010
#define FILE_SYNCHRONOUS_IO_NONALERT &h00000020
#define FILE_NON_DIRECTORY_FILE &h00000040
#define FILE_CREATE_TREE_CONNECTION &h00000080
#define FILE_COMPLETE_IF_OPLOCKED &h00000100
#define FILE_NO_EA_KNOWLEDGE &h00000200
#define FILE_OPEN_REMOTE_INSTANCE &h00000400
#define FILE_RANDOM_ACCESS &h00000800
#define FILE_DELETE_ON_CLOSE &h00001000
#define FILE_OPEN_BY_FILE_ID &h00002000
#define FILE_OPEN_FOR_BACKUP_INTENT &h00004000
#define FILE_NO_COMPRESSION &h00008000
#define FILE_RESERVE_OPFILTER &h00100000
#define FILE_OPEN_REPARSE_POINT &h00200000
#define FILE_OPEN_NO_RECALL &h00400000
#define FILE_OPEN_FOR_FREE_SPACE_QUERY &h00800000
#define FILE_SHARE_READ &h00000001
#define FILE_SHARE_WRITE &h00000002
#define FILE_SHARE_DELETE &h00000004
#define FILE_SHARE_VALID_FLAGS &h00000007
#define FILE_ATTRIBUTE_READONLY &h00000001
#define FILE_ATTRIBUTE_HIDDEN &h00000002
#define FILE_ATTRIBUTE_SYSTEM &h00000004
#define FILE_ATTRIBUTE_DIRECTORY &h00000010
#define FILE_ATTRIBUTE_ARCHIVE &h00000020
#define FILE_ATTRIBUTE_DEVICE &h00000040
#define FILE_ATTRIBUTE_NORMAL &h00000080
#define FILE_ATTRIBUTE_TEMPORARY &h00000100
#define FILE_ATTRIBUTE_SPARSE_FILE &h00000200
#define FILE_ATTRIBUTE_REPARSE_POINT &h00000400
#define FILE_ATTRIBUTE_COMPRESSED &h00000800
#define FILE_ATTRIBUTE_OFFLINE &h00001000
#define FILE_ATTRIBUTE_NOT_CONTENT_INDEXED &h00002000
#define FILE_ATTRIBUTE_ENCRYPTED &h00004000
#define FILE_ATTRIBUTE_VIRTUAL &h00010000
#define FILE_NOTIFY_CHANGE_FILE_NAME &h00000001
#define FILE_NOTIFY_CHANGE_DIR_NAME &h00000002
#define FILE_NOTIFY_CHANGE_ATTRIBUTES &h00000004
#define FILE_NOTIFY_CHANGE_SIZE &h00000008
#define FILE_NOTIFY_CHANGE_LAST_WRITE &h00000010
#define FILE_NOTIFY_CHANGE_LAST_ACCESS &h00000020
#define FILE_NOTIFY_CHANGE_CREATION &h00000040
#define FILE_NOTIFY_CHANGE_SECURITY &h00000100
#define FILE_ACTION_ADDED &h00000001
#define FILE_ACTION_REMOVED &h00000002
#define FILE_ACTION_MODIFIED &h00000003
#define FILE_ACTION_RENAMED_OLD_NAME &h00000004
#define FILE_ACTION_RENAMED_NEW_NAME &h00000005
#define MAILSLOT_NO_MESSAGE (DWORD - 1)
#define MAILSLOT_WAIT_FOREVER (DWORD - 1)
#define FILE_CASE_SENSITIVE_SEARCH &h00000001
#define FILE_CASE_PRESERVED_NAMES &h00000002
#define FILE_UNICODE_ON_DISK &h00000004
#define FILE_PERSISTENT_ACLS &h00000008
#define FILE_FILE_COMPRESSION &h00000010
#define FILE_VOLUME_QUOTAS &h00000020
#define FILE_SUPPORTS_SPARSE_FILES &h00000040
#define FILE_SUPPORTS_REPARSE_POINTS &h00000080
#define FILE_SUPPORTS_REMOTE_STORAGE &h00000100
#define FILE_VOLUME_IS_COMPRESSED &h00008000
#define FILE_SUPPORTS_OBJECT_IDS &h00010000
#define FILE_SUPPORTS_ENCRYPTION &h00020000
#define FILE_NAMED_STREAMS &h00040000
#define FILE_READ_ONLY_VOLUME &h00080000
#define FILE_SEQUENTIAL_WRITE_ONCE &h00100000
#define FILE_SUPPORTS_TRANSACTIONS &h00200000
#define FILE_SUPPORTS_HARD_LINKS &h00400000
#define FILE_SUPPORTS_EXTENDED_ATTRIBUTES &h00800000
#define FILE_SUPPORTS_OPEN_BY_FILE_ID &h01000000
#define FILE_SUPPORTS_USN_JOURNAL &h02000000
#define FILE_SUPPORTS_INTEGRITY_STREAMS &h04000000

type FILE_ID_128
	LowPart as ULONGLONG
	HighPart as ULONGLONG
end type

type PFILE_ID_128 as FILE_ID_128 ptr

type _FILE_NOTIFY_INFORMATION
	NextEntryOffset as DWORD
	Action as DWORD
	FileNameLength as DWORD
	FileName(0 to 0) as WCHAR
end type

type FILE_NOTIFY_INFORMATION as _FILE_NOTIFY_INFORMATION
type PFILE_NOTIFY_INFORMATION as _FILE_NOTIFY_INFORMATION ptr

union _FILE_SEGMENT_ELEMENT
	Buffer as PVOID64
	Alignment as ULONGLONG
end union

type FILE_SEGMENT_ELEMENT as _FILE_SEGMENT_ELEMENT
type PFILE_SEGMENT_ELEMENT as _FILE_SEGMENT_ELEMENT ptr

type ___REPARSE_GUID_DATA_BUFFER_GenericReparseBuffer
	DataBuffer(0 to 0) as BYTE
end type

type _REPARSE_GUID_DATA_BUFFER
	ReparseTag as DWORD
	ReparseDataLength as WORD
	Reserved as WORD
	ReparseGuid as GUID
	GenericReparseBuffer as ___REPARSE_GUID_DATA_BUFFER_GenericReparseBuffer
end type

type REPARSE_GUID_DATA_BUFFER as _REPARSE_GUID_DATA_BUFFER
type PREPARSE_GUID_DATA_BUFFER as _REPARSE_GUID_DATA_BUFFER ptr

#define REPARSE_GUID_DATA_BUFFER_HEADER_SIZE FIELD_OFFSET(REPARSE_GUID_DATA_BUFFER, GenericReparseBuffer)
#define MAXIMUM_REPARSE_DATA_BUFFER_SIZE (16 * 1024)
#define SYMLINK_FLAG_RELATIVE 1
#define IO_REPARSE_TAG_RESERVED_ZERO 0
#define IO_REPARSE_TAG_RESERVED_ONE 1
#define IO_REPARSE_TAG_RESERVED_RANGE IO_REPARSE_TAG_RESERVED_ONE
#define IsReparseTagMicrosoft(_tag) ((_tag) and &h80000000)
#define IsReparseTagNameSurrogate(_tag) ((_tag) and &h20000000)
#define IO_REPARSE_TAG_MOUNT_POINT __MSABI_LONG(&hA0000003)
#define IO_REPARSE_TAG_HSM __MSABI_LONG(&hC0000004)
#define IO_REPARSE_TAG_HSM2 __MSABI_LONG(&h80000006)
#define IO_REPARSE_TAG_SIS __MSABI_LONG(&h80000007)
#define IO_REPARSE_TAG_WIM __MSABI_LONG(&h80000008)
#define IO_REPARSE_TAG_CSV __MSABI_LONG(&h80000009)
#define IO_REPARSE_TAG_DFS __MSABI_LONG(&h8000000A)
#define IO_REPARSE_TAG_FILTER_MANAGER __MSABI_LONG(&h8000000B)
#define IO_REPARSE_TAG_DFSR __MSABI_LONG(&h80000012)
#define IO_REPARSE_TAG_SYMLINK __MSABI_LONG(&hA000000C)
#define IO_REPARSE_TAG_IIS_CACHE __MSABI_LONG(&hA0000010)
#define IO_REPARSE_TAG_DRIVE_EXTENDER __MSABI_LONG(&h80000005)
#define IO_REPARSE_TAG_DEDUP __MSABI_LONG(&h80000013)
#define IO_REPARSE_TAG_NFS __MSABI_LONG(&h80000014)
#define IO_COMPLETION_MODIFY_STATE &h0002
#define IO_COMPLETION_ALL_ACCESS ((STANDARD_RIGHTS_REQUIRED or SYNCHRONIZE) or &h3)
#define DUPLICATE_CLOSE_SOURCE &h00000001
#define DUPLICATE_SAME_ACCESS &h00000002
#define POWERBUTTON_ACTION_INDEX_NOTHING 0
#define POWERBUTTON_ACTION_INDEX_SLEEP 1
#define POWERBUTTON_ACTION_INDEX_HIBERNATE 2
#define POWERBUTTON_ACTION_INDEX_SHUTDOWN 3
#define POWERBUTTON_ACTION_VALUE_NOTHING 0
#define POWERBUTTON_ACTION_VALUE_SLEEP 2
#define POWERBUTTON_ACTION_VALUE_HIBERNATE 3
#define POWERBUTTON_ACTION_VALUE_SHUTDOWN 6
#define PERFSTATE_POLICY_CHANGE_IDEAL 0
#define PERFSTATE_POLICY_CHANGE_SINGLE 1
#define PERFSTATE_POLICY_CHANGE_ROCKET 2
#define PERFSTATE_POLICY_CHANGE_MAX PERFSTATE_POLICY_CHANGE_ROCKET
#define PROCESSOR_PERF_BOOST_POLICY_DISABLED 0
#define PROCESSOR_PERF_BOOST_POLICY_MAX 100
#define PROCESSOR_PERF_BOOST_MODE_DISABLED 0
#define PROCESSOR_PERF_BOOST_MODE_ENABLED 1
#define PROCESSOR_PERF_BOOST_MODE_AGGRESSIVE 2
#define PROCESSOR_PERF_BOOST_MODE_EFFICIENT_ENABLED 3
#define PROCESSOR_PERF_BOOST_MODE_EFFICIENT_AGGRESSIVE 4
#define PROCESSOR_PERF_BOOST_MODE_MAX PROCESSOR_PERF_BOOST_MODE_EFFICIENT_AGGRESSIVE
#define CORE_PARKING_POLICY_CHANGE_IDEAL 0
#define CORE_PARKING_POLICY_CHANGE_SINGLE 1
#define CORE_PARKING_POLICY_CHANGE_ROCKET 2
#define CORE_PARKING_POLICY_CHANGE_MULTISTEP 3
#define CORE_PARKING_POLICY_CHANGE_MAX CORE_PARKING_POLICY_CHANGE_MULTISTEP
#define POWER_DEVICE_IDLE_POLICY_PERFORMANCE 0
#define POWER_DEVICE_IDLE_POLICY_CONSERVATIVE 1

extern GUID_MAX_POWER_SAVINGS as const GUID
extern GUID_MIN_POWER_SAVINGS as const GUID
extern GUID_TYPICAL_POWER_SAVINGS as const GUID
extern NO_SUBGROUP_GUID as const GUID
extern ALL_POWERSCHEMES_GUID as const GUID
extern GUID_POWERSCHEME_PERSONALITY as const GUID
extern GUID_ACTIVE_POWERSCHEME as const GUID
extern GUID_IDLE_RESILIENCY_SUBGROUP as const GUID
extern GUID_IDLE_RESILIENCY_PERIOD as const GUID
extern GUID_DISK_COALESCING_POWERDOWN_TIMEOUT as const GUID
extern GUID_EXECUTION_REQUIRED_REQUEST_TIMEOUT as const GUID
extern GUID_VIDEO_SUBGROUP as const GUID
extern GUID_VIDEO_POWERDOWN_TIMEOUT as const GUID
extern GUID_VIDEO_ANNOYANCE_TIMEOUT as const GUID
extern GUID_VIDEO_ADAPTIVE_PERCENT_INCREASE as const GUID
extern GUID_VIDEO_DIM_TIMEOUT as const GUID
extern GUID_VIDEO_ADAPTIVE_POWERDOWN as const GUID
extern GUID_MONITOR_POWER_ON as const GUID
extern GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS as const GUID
extern GUID_DEVICE_POWER_POLICY_VIDEO_DIM_BRIGHTNESS as const GUID
extern GUID_VIDEO_CURRENT_MONITOR_BRIGHTNESS as const GUID
extern GUID_VIDEO_ADAPTIVE_DISPLAY_BRIGHTNESS as const GUID
extern GUID_CONSOLE_DISPLAY_STATE as const GUID
extern GUID_ALLOW_DISPLAY_REQUIRED as const GUID
extern GUID_VIDEO_CONSOLE_LOCK_TIMEOUT as const GUID
extern GUID_ADAPTIVE_POWER_BEHAVIOR_SUBGROUP as const GUID
extern GUID_NON_ADAPTIVE_INPUT_TIMEOUT as const GUID
extern GUID_DISK_SUBGROUP as const GUID
extern GUID_DISK_POWERDOWN_TIMEOUT as const GUID
extern GUID_DISK_IDLE_TIMEOUT as const GUID
extern GUID_DISK_BURST_IGNORE_THRESHOLD as const GUID
extern GUID_DISK_ADAPTIVE_POWERDOWN as const GUID
extern GUID_SLEEP_SUBGROUP as const GUID
extern GUID_SLEEP_IDLE_THRESHOLD as const GUID
extern GUID_STANDBY_TIMEOUT as const GUID
extern GUID_UNATTEND_SLEEP_TIMEOUT as const GUID
extern GUID_HIBERNATE_TIMEOUT as const GUID
extern GUID_HIBERNATE_FASTS4_POLICY as const GUID
extern GUID_CRITICAL_POWER_TRANSITION as const GUID
extern GUID_SYSTEM_AWAYMODE as const GUID
extern GUID_ALLOW_AWAYMODE as const GUID
extern GUID_ALLOW_STANDBY_STATES as const GUID
extern GUID_ALLOW_RTC_WAKE as const GUID
extern GUID_ALLOW_SYSTEM_REQUIRED as const GUID
extern GUID_SYSTEM_BUTTON_SUBGROUP as const GUID
extern GUID_POWERBUTTON_ACTION as const GUID
extern GUID_SLEEPBUTTON_ACTION as const GUID
extern GUID_USERINTERFACEBUTTON_ACTION as const GUID
extern GUID_LIDCLOSE_ACTION as const GUID
extern GUID_LIDOPEN_POWERSTATE as const GUID
extern GUID_BATTERY_SUBGROUP as const GUID
extern GUID_BATTERY_DISCHARGE_ACTION_0 as const GUID
extern GUID_BATTERY_DISCHARGE_LEVEL_0 as const GUID
extern GUID_BATTERY_DISCHARGE_FLAGS_0 as const GUID
extern GUID_BATTERY_DISCHARGE_ACTION_1 as const GUID
extern GUID_BATTERY_DISCHARGE_LEVEL_1 as const GUID
extern GUID_BATTERY_DISCHARGE_FLAGS_1 as const GUID
extern GUID_BATTERY_DISCHARGE_ACTION_2 as const GUID
extern GUID_BATTERY_DISCHARGE_LEVEL_2 as const GUID
extern GUID_BATTERY_DISCHARGE_FLAGS_2 as const GUID
extern GUID_BATTERY_DISCHARGE_ACTION_3 as const GUID
extern GUID_BATTERY_DISCHARGE_LEVEL_3 as const GUID
extern GUID_BATTERY_DISCHARGE_FLAGS_3 as const GUID
extern GUID_PROCESSOR_SETTINGS_SUBGROUP as const GUID
extern GUID_PROCESSOR_THROTTLE_POLICY as const GUID
extern GUID_PROCESSOR_THROTTLE_MAXIMUM as const GUID
extern GUID_PROCESSOR_THROTTLE_MINIMUM as const GUID
extern GUID_PROCESSOR_ALLOW_THROTTLING as const GUID
extern GUID_PROCESSOR_IDLESTATE_POLICY as const GUID
extern GUID_PROCESSOR_PERFSTATE_POLICY as const GUID
extern GUID_PROCESSOR_PERF_INCREASE_THRESHOLD as const GUID
extern GUID_PROCESSOR_PERF_DECREASE_THRESHOLD as const GUID
extern GUID_PROCESSOR_PERF_INCREASE_POLICY as const GUID
extern GUID_PROCESSOR_PERF_DECREASE_POLICY as const GUID
extern GUID_PROCESSOR_PERF_INCREASE_TIME as const GUID
extern GUID_PROCESSOR_PERF_DECREASE_TIME as const GUID
extern GUID_PROCESSOR_PERF_TIME_CHECK as const GUID
extern GUID_PROCESSOR_PERF_BOOST_POLICY as const GUID
extern GUID_PROCESSOR_PERF_BOOST_MODE as const GUID
extern GUID_PROCESSOR_IDLE_ALLOW_SCALING as const GUID
extern GUID_PROCESSOR_IDLE_DISABLE as const GUID
extern GUID_PROCESSOR_IDLE_STATE_MAXIMUM as const GUID
extern GUID_PROCESSOR_IDLE_TIME_CHECK as const GUID
extern GUID_PROCESSOR_IDLE_DEMOTE_THRESHOLD as const GUID
extern GUID_PROCESSOR_IDLE_PROMOTE_THRESHOLD as const GUID
extern GUID_PROCESSOR_CORE_PARKING_INCREASE_THRESHOLD as const GUID
extern GUID_PROCESSOR_CORE_PARKING_DECREASE_THRESHOLD as const GUID
extern GUID_PROCESSOR_CORE_PARKING_INCREASE_POLICY as const GUID
extern GUID_PROCESSOR_CORE_PARKING_DECREASE_POLICY as const GUID
extern GUID_PROCESSOR_CORE_PARKING_MAX_CORES as const GUID
extern GUID_PROCESSOR_CORE_PARKING_MIN_CORES as const GUID
extern GUID_PROCESSOR_CORE_PARKING_INCREASE_TIME as const GUID
extern GUID_PROCESSOR_CORE_PARKING_DECREASE_TIME as const GUID
extern GUID_PROCESSOR_CORE_PARKING_AFFINITY_HISTORY_DECREASE_FACTOR as const GUID
extern GUID_PROCESSOR_CORE_PARKING_AFFINITY_HISTORY_THRESHOLD as const GUID
extern GUID_PROCESSOR_CORE_PARKING_AFFINITY_WEIGHTING as const GUID
extern GUID_PROCESSOR_CORE_PARKING_OVER_UTILIZATION_HISTORY_DECREASE_FACTOR as const GUID
extern GUID_PROCESSOR_CORE_PARKING_OVER_UTILIZATION_HISTORY_THRESHOLD as const GUID
extern GUID_PROCESSOR_CORE_PARKING_OVER_UTILIZATION_WEIGHTING as const GUID
extern GUID_PROCESSOR_CORE_PARKING_OVER_UTILIZATION_THRESHOLD as const GUID
extern GUID_PROCESSOR_PARKING_CORE_OVERRIDE as const GUID
extern GUID_PROCESSOR_PARKING_PERF_STATE as const GUID
extern GUID_PROCESSOR_PARKING_CONCURRENCY_THRESHOLD as const GUID
extern GUID_PROCESSOR_PARKING_HEADROOM_THRESHOLD as const GUID
extern GUID_PROCESSOR_PERF_HISTORY as const GUID
extern GUID_PROCESSOR_PERF_LATENCY_HINT as const GUID
extern GUID_PROCESSOR_DISTRIBUTE_UTILITY as const GUID
extern GUID_SYSTEM_COOLING_POLICY as const GUID
extern GUID_LOCK_CONSOLE_ON_WAKE as const GUID
extern GUID_DEVICE_IDLE_POLICY as const GUID
extern GUID_ACDC_POWER_SOURCE as const GUID
extern GUID_LIDSWITCH_STATE_CHANGE as const GUID
extern GUID_BATTERY_PERCENTAGE_REMAINING as const GUID
extern GUID_GLOBAL_USER_PRESENCE as const GUID
extern GUID_SESSION_DISPLAY_STATUS as const GUID
extern GUID_SESSION_USER_PRESENCE as const GUID
extern GUID_IDLE_BACKGROUND_TASK as const GUID
extern GUID_BACKGROUND_TASK_NOTIFICATION as const GUID
extern GUID_APPLAUNCH_BUTTON as const GUID
extern GUID_PCIEXPRESS_SETTINGS_SUBGROUP as const GUID
extern GUID_PCIEXPRESS_ASPM_POLICY as const GUID
extern GUID_ENABLE_SWITCH_FORCED_SHUTDOWN as const GUID

type _SYSTEM_POWER_STATE as long
enum
	PowerSystemUnspecified = 0
	PowerSystemWorking = 1
	PowerSystemSleeping1 = 2
	PowerSystemSleeping2 = 3
	PowerSystemSleeping3 = 4
	PowerSystemHibernate = 5
	PowerSystemShutdown = 6
	PowerSystemMaximum = 7
end enum

type SYSTEM_POWER_STATE as _SYSTEM_POWER_STATE
type PSYSTEM_POWER_STATE as _SYSTEM_POWER_STATE ptr

#define POWER_SYSTEM_MAXIMUM 7

type POWER_ACTION as long
enum
	PowerActionNone = 0
	PowerActionReserved
	PowerActionSleep
	PowerActionHibernate
	PowerActionShutdown
	PowerActionShutdownReset
	PowerActionShutdownOff
	PowerActionWarmEject
end enum

type PPOWER_ACTION as POWER_ACTION ptr

type _DEVICE_POWER_STATE as long
enum
	PowerDeviceUnspecified = 0
	PowerDeviceD0
	PowerDeviceD1
	PowerDeviceD2
	PowerDeviceD3
	PowerDeviceMaximum
end enum

type DEVICE_POWER_STATE as _DEVICE_POWER_STATE
type PDEVICE_POWER_STATE as _DEVICE_POWER_STATE ptr

type _MONITOR_DISPLAY_STATE as long
enum
	PowerMonitorOff = 0
	PowerMonitorOn
	PowerMonitorDim
end enum

type MONITOR_DISPLAY_STATE as _MONITOR_DISPLAY_STATE
type PMONITOR_DISPLAY_STATE as _MONITOR_DISPLAY_STATE ptr

type _USER_ACTIVITY_PRESENCE as long
enum
	PowerUserPresent = 0
	PowerUserNotPresent
	PowerUserInactive
	PowerUserMaximum
	PowerUserInvalid = PowerUserMaximum
end enum

type USER_ACTIVITY_PRESENCE as _USER_ACTIVITY_PRESENCE
type PUSER_ACTIVITY_PRESENCE as _USER_ACTIVITY_PRESENCE ptr

'' TODO: #define ES_SYSTEM_REQUIRED ((DWORD)0x00000001)
'' TODO: #define ES_DISPLAY_REQUIRED ((DWORD)0x00000002)
'' TODO: #define ES_USER_PRESENT ((DWORD)0x00000004)
'' TODO: #define ES_AWAYMODE_REQUIRED ((DWORD)0x00000040)
'' TODO: #define ES_CONTINUOUS ((DWORD)0x80000000)

type EXECUTION_STATE as DWORD
type PEXECUTION_STATE as DWORD ptr

type LATENCY_TIME as long
enum
	LT_DONT_CARE
	LT_LOWEST_LATENCY
end enum

#define DIAGNOSTIC_REASON_VERSION 0
#define POWER_REQUEST_CONTEXT_VERSION 0
#define DIAGNOSTIC_REASON_SIMPLE_STRING &h00000001
#define DIAGNOSTIC_REASON_DETAILED_STRING &h00000002
#define DIAGNOSTIC_REASON_NOT_SPECIFIED &h80000000
#define DIAGNOSTIC_REASON_INVALID_FLAGS (not &h80000003)
#define POWER_REQUEST_CONTEXT_SIMPLE_STRING &h00000001
#define POWER_REQUEST_CONTEXT_DETAILED_STRING &h00000002

type _POWER_REQUEST_TYPE as long
enum
	PowerRequestDisplayRequired
	PowerRequestSystemRequired
	PowerRequestAwayModeRequired
	PowerRequestExecutionRequired
end enum

type POWER_REQUEST_TYPE as _POWER_REQUEST_TYPE
type PPOWER_REQUEST_TYPE as _POWER_REQUEST_TYPE ptr

#define PDCAP_D0_SUPPORTED &h00000001
#define PDCAP_D1_SUPPORTED &h00000002
#define PDCAP_D2_SUPPORTED &h00000004
#define PDCAP_D3_SUPPORTED &h00000008
#define PDCAP_WAKE_FROM_D0_SUPPORTED &h00000010
#define PDCAP_WAKE_FROM_D1_SUPPORTED &h00000020
#define PDCAP_WAKE_FROM_D2_SUPPORTED &h00000040
#define PDCAP_WAKE_FROM_D3_SUPPORTED &h00000080
#define PDCAP_WARM_EJECT_SUPPORTED &h00000100

type CM_Power_Data_s
	PD_Size as DWORD
	PD_MostRecentPowerState as DEVICE_POWER_STATE
	PD_Capabilities as DWORD
	PD_D1Latency as DWORD
	PD_D2Latency as DWORD
	PD_D3Latency as DWORD
	PD_PowerStateMapping(0 to 6) as DEVICE_POWER_STATE
	PD_DeepestSystemWake as SYSTEM_POWER_STATE
end type

type CM_POWER_DATA as CM_Power_Data_s
type PCM_POWER_DATA as CM_Power_Data_s ptr

type POWER_INFORMATION_LEVEL as long
enum
	SystemPowerPolicyAc
	SystemPowerPolicyDc
	VerifySystemPolicyAc
	VerifySystemPolicyDc
	SystemPowerCapabilities
	SystemBatteryState
	SystemPowerStateHandler
	ProcessorStateHandler
	SystemPowerPolicyCurrent
	AdministratorPowerPolicy
	SystemReserveHiberFile
	ProcessorInformation
	SystemPowerInformation
	ProcessorStateHandler2
	LastWakeTime
	LastSleepTime
	SystemExecutionState
	SystemPowerStateNotifyHandler
	ProcessorPowerPolicyAc
	ProcessorPowerPolicyDc
	VerifyProcessorPowerPolicyAc
	VerifyProcessorPowerPolicyDc
	ProcessorPowerPolicyCurrent
	SystemPowerStateLogging
	SystemPowerLoggingEntry
	SetPowerSettingValue
	NotifyUserPowerSetting
	PowerInformationLevelUnused0
	SystemMonitorHiberBootPowerOff
	SystemVideoState
	TraceApplicationPowerMessage
	TraceApplicationPowerMessageEnd
	ProcessorPerfStates
	ProcessorIdleStates
	ProcessorCap
	SystemWakeSource
	SystemHiberFileInformation
	TraceServicePowerMessage
	ProcessorLoad
	PowerShutdownNotification
	MonitorCapabilities
	SessionPowerInit
	SessionDisplayState
	PowerRequestCreate
	PowerRequestAction
	GetPowerRequestList
	ProcessorInformationEx
	NotifyUserModeLegacyPowerEvent
	GroupPark
	ProcessorIdleDomains
	WakeTimerList
	SystemHiberFileSize
	ProcessorIdleStatesHv
	ProcessorPerfStatesHv
	ProcessorPerfCapHv
	ProcessorSetIdle
	LogicalProcessorIdling
	UserPresence
	PowerSettingNotificationName
	GetPowerSettingValue
	IdleResiliency
	SessionRITState
	SessionConnectNotification
	SessionPowerCleanup
	SessionLockState
	SystemHiberbootState
	PlatformInformation
	PdcInvocation
	MonitorInvocation
	FirmwareTableInformationRegistered
	SetShutdownSelectedTime
	SuspendResumeInvocation
	PlmPowerRequestCreate
	ScreenOff
	CsDeviceNotification
	PlatformRole
	LastResumePerformance
	DisplayBurst
	ExitLatencySamplingPercentage
	ApplyLowPowerScenarioSettings
	PowerInformationLevelMaximum
end enum

type POWER_USER_PRESENCE_TYPE as long
enum
	UserNotPresent = 0
	UserPresent = 1
	UserUnknown = &hff
end enum

type PPOWER_USER_PRESENCE_TYPE as POWER_USER_PRESENCE_TYPE ptr

type _POWER_USER_PRESENCE
	UserPresence as POWER_USER_PRESENCE_TYPE
end type

type POWER_USER_PRESENCE as _POWER_USER_PRESENCE
type PPOWER_USER_PRESENCE as _POWER_USER_PRESENCE ptr

type _POWER_SESSION_CONNECT
	Connected as BOOLEAN
	Console as BOOLEAN
end type

type POWER_SESSION_CONNECT as _POWER_SESSION_CONNECT
type PPOWER_SESSION_CONNECT as _POWER_SESSION_CONNECT ptr

type _POWER_SESSION_TIMEOUTS
	InputTimeout as DWORD
	DisplayTimeout as DWORD
end type

type POWER_SESSION_TIMEOUTS as _POWER_SESSION_TIMEOUTS
type PPOWER_SESSION_TIMEOUTS as _POWER_SESSION_TIMEOUTS ptr

type _POWER_SESSION_RIT_STATE
	Active as BOOLEAN
	LastInputTime as DWORD
end type

type POWER_SESSION_RIT_STATE as _POWER_SESSION_RIT_STATE
type PPOWER_SESSION_RIT_STATE as _POWER_SESSION_RIT_STATE ptr

type _POWER_SESSION_WINLOGON
	SessionId as DWORD
	Console as BOOLEAN
	Locked as BOOLEAN
end type

type POWER_SESSION_WINLOGON as _POWER_SESSION_WINLOGON
type PPOWER_SESSION_WINLOGON as _POWER_SESSION_WINLOGON ptr

type _POWER_IDLE_RESILIENCY
	CoalescingTimeout as DWORD
	IdleResiliencyPeriod as DWORD
end type

type POWER_IDLE_RESILIENCY as _POWER_IDLE_RESILIENCY
type PPOWER_IDLE_RESILIENCY as _POWER_IDLE_RESILIENCY ptr

type POWER_MONITOR_REQUEST_REASON as long
enum
	MonitorRequestReasonUnknown
	MonitorRequestReasonPowerButton
	MonitorRequestReasonRemoteConnection
	MonitorRequestReasonScMonitorpower
	MonitorRequestReasonUserInput
	MonitorRequestReasonAcDcDisplayBurst
	MonitorRequestReasonUserDisplayBurst
	MonitorRequestReasonPoSetSystemState
	MonitorRequestReasonSetThreadExecutionState
	MonitorRequestReasonFullWake
	MonitorRequestReasonSessionUnlock
	MonitorRequestReasonScreenOffRequest
	MonitorRequestReasonIdleTimeout
	MonitorRequestReasonPolicyChange
	MonitorRequestReasonMax
end enum

type _POWER_MONITOR_INVOCATION
	On as BOOLEAN
	Console as BOOLEAN
	RequestReason as POWER_MONITOR_REQUEST_REASON
end type

type POWER_MONITOR_INVOCATION as _POWER_MONITOR_INVOCATION
type PPOWER_MONITOR_INVOCATION as _POWER_MONITOR_INVOCATION ptr

type _RESUME_PERFORMANCE
	PostTimeMs as DWORD
	TotalResumeTimeMs as ULONGLONG
	ResumeCompleteTimestamp as ULONGLONG
end type

type RESUME_PERFORMANCE as _RESUME_PERFORMANCE
type PRESUME_PERFORMANCE as _RESUME_PERFORMANCE ptr

type SYSTEM_POWER_CONDITION as long
enum
	PoAc
	PoDc
	PoHot
	PoConditionMaximum
end enum

type SET_POWER_SETTING_VALUE
	Version as DWORD
	Guid as GUID
	PowerCondition as SYSTEM_POWER_CONDITION
	DataLength as DWORD
	Data(0 to 0) as BYTE
end type

type PSET_POWER_SETTING_VALUE as SET_POWER_SETTING_VALUE ptr

#define POWER_SETTING_VALUE_VERSION &h1

type NOTIFY_USER_POWER_SETTING
	Guid as GUID
end type

type PNOTIFY_USER_POWER_SETTING as NOTIFY_USER_POWER_SETTING ptr

type _APPLICATIONLAUNCH_SETTING_VALUE
	ActivationTime as LARGE_INTEGER
	Flags as DWORD
	ButtonInstanceID as DWORD
end type

type APPLICATIONLAUNCH_SETTING_VALUE as _APPLICATIONLAUNCH_SETTING_VALUE
type PAPPLICATIONLAUNCH_SETTING_VALUE as _APPLICATIONLAUNCH_SETTING_VALUE ptr

type _POWER_PLATFORM_ROLE as long
enum
	PlatformRoleUnspecified = 0
	PlatformRoleDesktop
	PlatformRoleMobile
	PlatformRoleWorkstation
	PlatformRoleEnterpriseServer
	PlatformRoleSOHOServer
	PlatformRoleAppliancePC
	PlatformRolePerformanceServer
	PlatformRoleSlate
	PlatformRoleMaximum
end enum

type POWER_PLATFORM_ROLE as _POWER_PLATFORM_ROLE
type PPOWER_PLATFORM_ROLE as _POWER_PLATFORM_ROLE ptr

type _POWER_PLATFORM_INFORMATION
	AoAc as BOOLEAN
end type

type POWER_PLATFORM_INFORMATION as _POWER_PLATFORM_INFORMATION
type PPOWER_PLATFORM_INFORMATION as _POWER_PLATFORM_INFORMATION ptr

#define POWER_PLATFORM_ROLE_V1 &h00000001
#define POWER_PLATFORM_ROLE_V1_MAX (PlatformRolePerformanceServer + 1)
#define POWER_PLATFORM_ROLE_V2 &h00000002
#define POWER_PLATFORM_ROLE_V2_MAX (PlatformRoleSlate + 1)
#define POWER_PLATFORM_ROLE_VERSION POWER_PLATFORM_ROLE_V1
#define POWER_PLATFORM_ROLE_VERSION_MAX POWER_PLATFORM_ROLE_V1_MAX

type BATTERY_REPORTING_SCALE
	Granularity as DWORD
	Capacity as DWORD
end type

type PBATTERY_REPORTING_SCALE as BATTERY_REPORTING_SCALE ptr

type PPM_WMI_LEGACY_PERFSTATE
	Frequency as DWORD
	Flags as DWORD
	PercentFrequency as DWORD
end type

type PPPM_WMI_LEGACY_PERFSTATE as PPM_WMI_LEGACY_PERFSTATE ptr

type PPM_WMI_IDLE_STATE
	Latency as DWORD
	Power as DWORD
	TimeCheck as DWORD
	PromotePercent as BYTE
	DemotePercent as BYTE
	StateType as BYTE
	Reserved as BYTE
	StateFlags as DWORD
	Context as DWORD
	IdleHandler as DWORD
	Reserved1 as DWORD
end type

type PPPM_WMI_IDLE_STATE as PPM_WMI_IDLE_STATE ptr

type PPM_WMI_IDLE_STATES
	as DWORD Type
	Count as DWORD
	TargetState as DWORD
	OldState as DWORD
	TargetProcessors as DWORD64
	State(0 to 0) as PPM_WMI_IDLE_STATE
end type

type PPPM_WMI_IDLE_STATES as PPM_WMI_IDLE_STATES ptr

type PPM_WMI_IDLE_STATES_EX
	as DWORD Type
	Count as DWORD
	TargetState as DWORD
	OldState as DWORD
	TargetProcessors as PVOID
	State(0 to 0) as PPM_WMI_IDLE_STATE
end type

type PPPM_WMI_IDLE_STATES_EX as PPM_WMI_IDLE_STATES_EX ptr

type PPM_WMI_PERF_STATE
	Frequency as DWORD
	Power as DWORD
	PercentFrequency as BYTE
	IncreaseLevel as BYTE
	DecreaseLevel as BYTE
	as BYTE Type
	IncreaseTime as DWORD
	DecreaseTime as DWORD
	Control as DWORD64
	Status as DWORD64
	HitCount as DWORD
	Reserved1 as DWORD
	Reserved2 as DWORD64
	Reserved3 as DWORD64
end type

type PPPM_WMI_PERF_STATE as PPM_WMI_PERF_STATE ptr

type PPM_WMI_PERF_STATES
	Count as DWORD
	MaxFrequency as DWORD
	CurrentState as DWORD
	MaxPerfState as DWORD
	MinPerfState as DWORD
	LowestPerfState as DWORD
	ThermalConstraint as DWORD
	BusyAdjThreshold as BYTE
	PolicyType as BYTE
	as BYTE Type
	Reserved as BYTE
	TimerInterval as DWORD
	TargetProcessors as DWORD64
	PStateHandler as DWORD
	PStateContext as DWORD
	TStateHandler as DWORD
	TStateContext as DWORD
	FeedbackHandler as DWORD
	Reserved1 as DWORD
	Reserved2 as DWORD64
	State(0 to 0) as PPM_WMI_PERF_STATE
end type

type PPPM_WMI_PERF_STATES as PPM_WMI_PERF_STATES ptr

type PPM_WMI_PERF_STATES_EX
	Count as DWORD
	MaxFrequency as DWORD
	CurrentState as DWORD
	MaxPerfState as DWORD
	MinPerfState as DWORD
	LowestPerfState as DWORD
	ThermalConstraint as DWORD
	BusyAdjThreshold as BYTE
	PolicyType as BYTE
	as BYTE Type
	Reserved as BYTE
	TimerInterval as DWORD
	TargetProcessors as PVOID
	PStateHandler as DWORD
	PStateContext as DWORD
	TStateHandler as DWORD
	TStateContext as DWORD
	FeedbackHandler as DWORD
	Reserved1 as DWORD
	Reserved2 as DWORD64
	State(0 to 0) as PPM_WMI_PERF_STATE
end type

type PPPM_WMI_PERF_STATES_EX as PPM_WMI_PERF_STATES_EX ptr

#define PROC_IDLE_BUCKET_COUNT 6
#define PROC_IDLE_BUCKET_COUNT_EX 16

type PPM_IDLE_STATE_ACCOUNTING
	IdleTransitions as DWORD
	FailedTransitions as DWORD
	InvalidBucketIndex as DWORD
	TotalTime as DWORD64
	IdleTimeBuckets(0 to 5) as DWORD
end type

type PPPM_IDLE_STATE_ACCOUNTING as PPM_IDLE_STATE_ACCOUNTING ptr

type PPM_IDLE_ACCOUNTING
	StateCount as DWORD
	TotalTransitions as DWORD
	ResetCount as DWORD
	StartTime as DWORD64
	State(0 to 0) as PPM_IDLE_STATE_ACCOUNTING
end type

type PPPM_IDLE_ACCOUNTING as PPM_IDLE_ACCOUNTING ptr

type PPM_IDLE_STATE_BUCKET_EX
	TotalTimeUs as DWORD64
	MinTimeUs as DWORD
	MaxTimeUs as DWORD
	Count as DWORD
end type

type PPPM_IDLE_STATE_BUCKET_EX as PPM_IDLE_STATE_BUCKET_EX ptr

type PPM_IDLE_STATE_ACCOUNTING_EX
	TotalTime as DWORD64
	IdleTransitions as DWORD
	FailedTransitions as DWORD
	InvalidBucketIndex as DWORD
	MinTimeUs as DWORD
	MaxTimeUs as DWORD
	CancelledTransitions as DWORD
	IdleTimeBuckets(0 to 15) as PPM_IDLE_STATE_BUCKET_EX
end type

type PPPM_IDLE_STATE_ACCOUNTING_EX as PPM_IDLE_STATE_ACCOUNTING_EX ptr

type PPM_IDLE_ACCOUNTING_EX
	StateCount as DWORD
	TotalTransitions as DWORD
	ResetCount as DWORD
	AbortCount as DWORD
	StartTime as DWORD64
	State(0 to 0) as PPM_IDLE_STATE_ACCOUNTING_EX
end type

type PPPM_IDLE_ACCOUNTING_EX as PPM_IDLE_ACCOUNTING_EX ptr

#define ACPI_PPM_SOFTWARE_ALL &hfc
#define ACPI_PPM_SOFTWARE_ANY &hfd
#define ACPI_PPM_HARDWARE_ALL &hfe
#define MS_PPM_SOFTWARE_ALL &h1
#define PPM_FIRMWARE_ACPI1C2 &h1
#define PPM_FIRMWARE_ACPI1C3 &h2
#define PPM_FIRMWARE_ACPI1TSTATES &h4
#define PPM_FIRMWARE_CST &h8
#define PPM_FIRMWARE_CSD &h10
#define PPM_FIRMWARE_PCT &h20
#define PPM_FIRMWARE_PSS &h40
#define PPM_FIRMWARE_XPSS &h80
#define PPM_FIRMWARE_PPC &h100
#define PPM_FIRMWARE_PSD &h200
#define PPM_FIRMWARE_PTC &h400
#define PPM_FIRMWARE_TSS &h800
#define PPM_FIRMWARE_TPC &h1000
#define PPM_FIRMWARE_TSD &h2000
#define PPM_FIRMWARE_PCCH &h4000
#define PPM_FIRMWARE_PCCP &h8000
#define PPM_FIRMWARE_OSC &h10000
#define PPM_FIRMWARE_PDC &h20000
#define PPM_FIRMWARE_CPC &h40000
#define PPM_PERFORMANCE_IMPLEMENTATION_NONE 0
#define PPM_PERFORMANCE_IMPLEMENTATION_PSTATES 1
#define PPM_PERFORMANCE_IMPLEMENTATION_PCCV1 2
#define PPM_PERFORMANCE_IMPLEMENTATION_CPPC 3
#define PPM_PERFORMANCE_IMPLEMENTATION_PEP 4
#define PPM_IDLE_IMPLEMENTATION_NONE &h0
#define PPM_IDLE_IMPLEMENTATION_CSTATES &h1
#define PPM_IDLE_IMPLEMENTATION_PEP &h2

type PPM_PERFSTATE_EVENT
	State as DWORD
	Status as DWORD
	Latency as DWORD
	Speed as DWORD
	Processor as DWORD
end type

type PPPM_PERFSTATE_EVENT as PPM_PERFSTATE_EVENT ptr

type PPM_PERFSTATE_DOMAIN_EVENT
	State as DWORD
	Latency as DWORD
	Speed as DWORD
	Processors as DWORD64
end type

type PPPM_PERFSTATE_DOMAIN_EVENT as PPM_PERFSTATE_DOMAIN_EVENT ptr

type PPM_IDLESTATE_EVENT
	NewState as DWORD
	OldState as DWORD
	Processors as DWORD64
end type

type PPPM_IDLESTATE_EVENT as PPM_IDLESTATE_EVENT ptr

type PPM_THERMALCHANGE_EVENT
	ThermalConstraint as DWORD
	Processors as DWORD64
end type

type PPPM_THERMALCHANGE_EVENT as PPM_THERMALCHANGE_EVENT ptr

type PPM_THERMAL_POLICY_EVENT
	Mode as BYTE
	Processors as DWORD64
end type

type PPPM_THERMAL_POLICY_EVENT as PPM_THERMAL_POLICY_EVENT ptr

extern PPM_PERFSTATE_CHANGE_GUID as const GUID
extern PPM_PERFSTATE_DOMAIN_CHANGE_GUID as const GUID
extern PPM_IDLESTATE_CHANGE_GUID as const GUID
extern PPM_PERFSTATES_DATA_GUID as const GUID
extern PPM_IDLESTATES_DATA_GUID as const GUID
extern PPM_IDLE_ACCOUNTING_GUID as const GUID
extern PPM_IDLE_ACCOUNTING_EX_GUID as const GUID
extern PPM_THERMALCONSTRAINT_GUID as const GUID
extern PPM_PERFMON_PERFSTATE_GUID as const GUID
extern PPM_THERMAL_POLICY_CHANGE_GUID as const GUID

type POWER_ACTION_POLICY
	Action as POWER_ACTION
	Flags as DWORD
	EventCode as DWORD
end type

type PPOWER_ACTION_POLICY as POWER_ACTION_POLICY ptr

#define POWER_ACTION_QUERY_ALLOWED &h00000001
#define POWER_ACTION_UI_ALLOWED &h00000002
#define POWER_ACTION_OVERRIDE_APPS &h00000004
#define POWER_ACTION_HIBERBOOT &h00000008
#define POWER_ACTION_PSEUDO_TRANSITION &h08000000
#define POWER_ACTION_LIGHTEST_FIRST &h10000000
#define POWER_ACTION_LOCK_CONSOLE &h20000000
#define POWER_ACTION_DISABLE_WAKES &h40000000
#define POWER_ACTION_CRITICAL &h80000000
#define POWER_LEVEL_USER_NOTIFY_TEXT &h00000001
#define POWER_LEVEL_USER_NOTIFY_SOUND &h00000002
#define POWER_LEVEL_USER_NOTIFY_EXEC &h00000004
#define POWER_USER_NOTIFY_BUTTON &h00000008
#define POWER_USER_NOTIFY_SHUTDOWN &h00000010
#define POWER_USER_NOTIFY_FORCED_SHUTDOWN &h00000020
#define POWER_FORCE_TRIGGER_RESET &h80000000
#define BATTERY_DISCHARGE_FLAGS_EVENTCODE_MASK &h00000007
#define BATTERY_DISCHARGE_FLAGS_ENABLE &h80000000
#define DISCHARGE_POLICY_CRITICAL 0
#define DISCHARGE_POLICY_LOW 1
#define NUM_DISCHARGE_POLICIES 4
#define PROCESSOR_IDLESTATE_POLICY_COUNT &h3

type PROCESSOR_IDLESTATE_INFO
	TimeCheck as DWORD
	DemotePercent as BYTE
	PromotePercent as BYTE
	Spare(0 to 1) as BYTE
end type

type PPROCESSOR_IDLESTATE_INFO as PROCESSOR_IDLESTATE_INFO ptr

type SYSTEM_POWER_LEVEL
	Enable as BOOLEAN
	Spare(0 to 2) as BYTE
	BatteryLevel as DWORD
	PowerPolicy as POWER_ACTION_POLICY
	MinSystemState as SYSTEM_POWER_STATE
end type

type PSYSTEM_POWER_LEVEL as SYSTEM_POWER_LEVEL ptr

type _SYSTEM_POWER_POLICY
	Revision as DWORD
	PowerButton as POWER_ACTION_POLICY
	SleepButton as POWER_ACTION_POLICY
	LidClose as POWER_ACTION_POLICY
	LidOpenWake as SYSTEM_POWER_STATE
	Reserved as DWORD
	Idle as POWER_ACTION_POLICY
	IdleTimeout as DWORD
	IdleSensitivity as BYTE
	DynamicThrottle as BYTE
	Spare2(0 to 1) as BYTE
	MinSleep as SYSTEM_POWER_STATE
	MaxSleep as SYSTEM_POWER_STATE
	ReducedLatencySleep as SYSTEM_POWER_STATE
	WinLogonFlags as DWORD
	Spare3 as DWORD
	DozeS4Timeout as DWORD
	BroadcastCapacityResolution as DWORD
	DischargePolicy(0 to 3) as SYSTEM_POWER_LEVEL
	VideoTimeout as DWORD
	VideoDimDisplay as BOOLEAN
	VideoReserved(0 to 2) as DWORD
	SpindownTimeout as DWORD
	OptimizeForPower as BOOLEAN
	FanThrottleTolerance as BYTE
	ForcedThrottle as BYTE
	MinThrottle as BYTE
	OverThrottled as POWER_ACTION_POLICY
end type

type SYSTEM_POWER_POLICY as _SYSTEM_POWER_POLICY
type PSYSTEM_POWER_POLICY as _SYSTEM_POWER_POLICY ptr

#define PO_THROTTLE_NONE 0
#define PO_THROTTLE_CONSTANT 1
#define PO_THROTTLE_DEGRADE 2
#define PO_THROTTLE_ADAPTIVE 3
#define PO_THROTTLE_MAXIMUM 4

union __Flags
	AsWORD as WORD

	type
		AllowScaling : 1 as WORD
		Disabled : 1 as WORD
		Reserved : 14 as WORD
	end type
end union

type PROCESSOR_IDLESTATE_POLICY
	Revision as WORD
	Flags as __Flags
	PolicyCount as DWORD
	Policy(0 to 2) as PROCESSOR_IDLESTATE_INFO
end type

type PPROCESSOR_IDLESTATE_POLICY as PROCESSOR_IDLESTATE_POLICY ptr

type _PROCESSOR_POWER_POLICY_INFO
	TimeCheck as DWORD
	DemoteLimit as DWORD
	PromoteLimit as DWORD
	DemotePercent as BYTE
	PromotePercent as BYTE
	Spare(0 to 1) as BYTE
	AllowDemotion : 1 as DWORD
	AllowPromotion : 1 as DWORD
	Reserved : 30 as DWORD
end type

type PROCESSOR_POWER_POLICY_INFO as _PROCESSOR_POWER_POLICY_INFO
type PPROCESSOR_POWER_POLICY_INFO as _PROCESSOR_POWER_POLICY_INFO ptr

type _PROCESSOR_POWER_POLICY
	Revision as DWORD
	DynamicThrottle as BYTE
	Spare(0 to 2) as BYTE
	DisableCStates : 1 as DWORD
	Reserved : 31 as DWORD
	PolicyCount as DWORD
	Policy(0 to 2) as PROCESSOR_POWER_POLICY_INFO
end type

type PROCESSOR_POWER_POLICY as _PROCESSOR_POWER_POLICY
type PPROCESSOR_POWER_POLICY as _PROCESSOR_POWER_POLICY ptr

union __Flags_
	AsBYTE as BYTE

	type
		NoDomainAccounting : 1 as BYTE
		IncreasePolicy : 2 as BYTE
		DecreasePolicy : 2 as BYTE
		Reserved : 3 as BYTE
	end type
end union

type PROCESSOR_PERFSTATE_POLICY
	Revision as DWORD
	MaxThrottle as BYTE
	MinThrottle as BYTE
	BusyAdjThreshold as BYTE

	union
		Spare as BYTE
		Flags as __Flags_
	end union

	TimeCheck as DWORD
	IncreaseTime as DWORD
	DecreaseTime as DWORD
	IncreasePercent as DWORD
	DecreasePercent as DWORD
end type

type PPROCESSOR_PERFSTATE_POLICY as PROCESSOR_PERFSTATE_POLICY ptr

type _ADMINISTRATOR_POWER_POLICY
	MinSleep as SYSTEM_POWER_STATE
	MaxSleep as SYSTEM_POWER_STATE
	MinVideoTimeout as DWORD
	MaxVideoTimeout as DWORD
	MinSpindownTimeout as DWORD
	MaxSpindownTimeout as DWORD
end type

type ADMINISTRATOR_POWER_POLICY as _ADMINISTRATOR_POWER_POLICY
type PADMINISTRATOR_POWER_POLICY as _ADMINISTRATOR_POWER_POLICY ptr

type SYSTEM_POWER_CAPABILITIES
	PowerButtonPresent as BOOLEAN
	SleepButtonPresent as BOOLEAN
	LidPresent as BOOLEAN
	SystemS1 as BOOLEAN
	SystemS2 as BOOLEAN
	SystemS3 as BOOLEAN
	SystemS4 as BOOLEAN
	SystemS5 as BOOLEAN
	HiberFilePresent as BOOLEAN
	FullWake as BOOLEAN
	VideoDimPresent as BOOLEAN
	ApmPresent as BOOLEAN
	UpsPresent as BOOLEAN
	ThermalControl as BOOLEAN
	ProcessorThrottle as BOOLEAN
	ProcessorMinThrottle as BYTE
	ProcessorMaxThrottle as BYTE
	FastSystemS4 as BOOLEAN
	spare2(0 to 2) as BYTE
	DiskSpinDown as BOOLEAN
	spare3(0 to 7) as BYTE
	SystemBatteriesPresent as BOOLEAN
	BatteriesAreShortTerm as BOOLEAN
	BatteryScale(0 to 2) as BATTERY_REPORTING_SCALE
	AcOnLineWake as SYSTEM_POWER_STATE
	SoftLidWake as SYSTEM_POWER_STATE
	RtcWake as SYSTEM_POWER_STATE
	MinDeviceWakeState as SYSTEM_POWER_STATE
	DefaultLowLatencyWake as SYSTEM_POWER_STATE
end type

type PSYSTEM_POWER_CAPABILITIES as SYSTEM_POWER_CAPABILITIES ptr

type SYSTEM_BATTERY_STATE
	AcOnLine as BOOLEAN
	BatteryPresent as BOOLEAN
	Charging as BOOLEAN
	Discharging as BOOLEAN
	Spare1(0 to 3) as BOOLEAN
	MaxCapacity as DWORD
	RemainingCapacity as DWORD
	Rate as DWORD
	EstimatedTime as DWORD
	DefaultAlert1 as DWORD
	DefaultAlert2 as DWORD
end type

type PSYSTEM_BATTERY_STATE as SYSTEM_BATTERY_STATE ptr

type _IMAGE_DOS_HEADER field = 2
	e_magic as WORD
	e_cblp as WORD
	e_cp as WORD
	e_crlc as WORD
	e_cparhdr as WORD
	e_minalloc as WORD
	e_maxalloc as WORD
	e_ss as WORD
	e_sp as WORD
	e_csum as WORD
	e_ip as WORD
	e_cs as WORD
	e_lfarlc as WORD
	e_ovno as WORD
	e_res(0 to 3) as WORD
	e_oemid as WORD
	e_oeminfo as WORD
	e_res2(0 to 9) as WORD
	e_lfanew as LONG_
end type

type IMAGE_DOS_HEADER as _IMAGE_DOS_HEADER
type PIMAGE_DOS_HEADER as _IMAGE_DOS_HEADER ptr

#define IMAGE_DOS_SIGNATURE &h5A4D
#define IMAGE_OS2_SIGNATURE &h454E
#define IMAGE_OS2_SIGNATURE_LE &h454C
#define IMAGE_VXD_SIGNATURE &h454C
#define IMAGE_NT_SIGNATURE &h00004550

type _IMAGE_OS2_HEADER field = 2
	ne_magic as WORD
	ne_ver as CHAR
	ne_rev as CHAR
	ne_enttab as WORD
	ne_cbenttab as WORD
	ne_crc as LONG_
	ne_flags as WORD
	ne_autodata as WORD
	ne_heap as WORD
	ne_stack as WORD
	ne_csip as LONG_
	ne_sssp as LONG_
	ne_cseg as WORD
	ne_cmod as WORD
	ne_cbnrestab as WORD
	ne_segtab as WORD
	ne_rsrctab as WORD
	ne_restab as WORD
	ne_modtab as WORD
	ne_imptab as WORD
	ne_nrestab as LONG_
	ne_cmovent as WORD
	ne_align as WORD
	ne_cres as WORD
	ne_exetyp as BYTE
	ne_flagsothers as BYTE
	ne_pretthunks as WORD
	ne_psegrefbytes as WORD
	ne_swaparea as WORD
	ne_expver as WORD
end type

type IMAGE_OS2_HEADER as _IMAGE_OS2_HEADER
type PIMAGE_OS2_HEADER as _IMAGE_OS2_HEADER ptr

type _IMAGE_VXD_HEADER field = 2
	e32_magic as WORD
	e32_border as BYTE
	e32_worder as BYTE
	e32_level as DWORD
	e32_cpu as WORD
	e32_os as WORD
	e32_ver as DWORD
	e32_mflags as DWORD
	e32_mpages as DWORD
	e32_startobj as DWORD
	e32_eip as DWORD
	e32_stackobj as DWORD
	e32_esp as DWORD
	e32_pagesize as DWORD
	e32_lastpagesize as DWORD
	e32_fixupsize as DWORD
	e32_fixupsum as DWORD
	e32_ldrsize as DWORD
	e32_ldrsum as DWORD
	e32_objtab as DWORD
	e32_objcnt as DWORD
	e32_objmap as DWORD
	e32_itermap as DWORD
	e32_rsrctab as DWORD
	e32_rsrccnt as DWORD
	e32_restab as DWORD
	e32_enttab as DWORD
	e32_dirtab as DWORD
	e32_dircnt as DWORD
	e32_fpagetab as DWORD
	e32_frectab as DWORD
	e32_impmod as DWORD
	e32_impmodcnt as DWORD
	e32_impproc as DWORD
	e32_pagesum as DWORD
	e32_datapage as DWORD
	e32_preload as DWORD
	e32_nrestab as DWORD
	e32_cbnrestab as DWORD
	e32_nressum as DWORD
	e32_autodata as DWORD
	e32_debuginfo as DWORD
	e32_debuglen as DWORD
	e32_instpreload as DWORD
	e32_instdemand as DWORD
	e32_heapsize as DWORD
	e32_res3(0 to 11) as BYTE
	e32_winresoff as DWORD
	e32_winreslen as DWORD
	e32_devid as WORD
	e32_ddkver as WORD
end type

type IMAGE_VXD_HEADER as _IMAGE_VXD_HEADER
type PIMAGE_VXD_HEADER as _IMAGE_VXD_HEADER ptr

type _IMAGE_FILE_HEADER field = 4
	Machine as WORD
	NumberOfSections as WORD
	TimeDateStamp as DWORD
	PointerToSymbolTable as DWORD
	NumberOfSymbols as DWORD
	SizeOfOptionalHeader as WORD
	Characteristics as WORD
end type

type IMAGE_FILE_HEADER as _IMAGE_FILE_HEADER
type PIMAGE_FILE_HEADER as _IMAGE_FILE_HEADER ptr

#define IMAGE_SIZEOF_FILE_HEADER 20
#define IMAGE_FILE_RELOCS_STRIPPED &h0001
#define IMAGE_FILE_EXECUTABLE_IMAGE &h0002
#define IMAGE_FILE_LINE_NUMS_STRIPPED &h0004
#define IMAGE_FILE_LOCAL_SYMS_STRIPPED &h0008
#define IMAGE_FILE_AGGRESIVE_WS_TRIM &h0010
#define IMAGE_FILE_LARGE_ADDRESS_AWARE &h0020
#define IMAGE_FILE_BYTES_REVERSED_LO &h0080
#define IMAGE_FILE_32BIT_MACHINE &h0100
#define IMAGE_FILE_DEBUG_STRIPPED &h0200
#define IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP &h0400
#define IMAGE_FILE_NET_RUN_FROM_SWAP &h0800
#define IMAGE_FILE_SYSTEM &h1000
#define IMAGE_FILE_DLL &h2000
#define IMAGE_FILE_UP_SYSTEM_ONLY &h4000
#define IMAGE_FILE_BYTES_REVERSED_HI &h8000
#define IMAGE_FILE_MACHINE_UNKNOWN 0
#define IMAGE_FILE_MACHINE_I386 &h014c
#define IMAGE_FILE_MACHINE_R3000 &h0162
#define IMAGE_FILE_MACHINE_R4000 &h0166
#define IMAGE_FILE_MACHINE_R10000 &h0168
#define IMAGE_FILE_MACHINE_WCEMIPSV2 &h0169
#define IMAGE_FILE_MACHINE_ALPHA &h0184
#define IMAGE_FILE_MACHINE_SH3 &h01a2
#define IMAGE_FILE_MACHINE_SH3DSP &h01a3
#define IMAGE_FILE_MACHINE_SH3E &h01a4
#define IMAGE_FILE_MACHINE_SH4 &h01a6
#define IMAGE_FILE_MACHINE_SH5 &h01a8
#define IMAGE_FILE_MACHINE_ARM &h01c0
#define IMAGE_FILE_MACHINE_ARMV7 &h01c4
#define IMAGE_FILE_MACHINE_ARMNT &h01c4
#define IMAGE_FILE_MACHINE_THUMB &h01c2
#define IMAGE_FILE_MACHINE_AM33 &h01d3
#define IMAGE_FILE_MACHINE_POWERPC &h01F0
#define IMAGE_FILE_MACHINE_POWERPCFP &h01f1
#define IMAGE_FILE_MACHINE_IA64 &h0200
#define IMAGE_FILE_MACHINE_MIPS16 &h0266
#define IMAGE_FILE_MACHINE_ALPHA64 &h0284
#define IMAGE_FILE_MACHINE_MIPSFPU &h0366
#define IMAGE_FILE_MACHINE_MIPSFPU16 &h0466
#define IMAGE_FILE_MACHINE_AXP64 IMAGE_FILE_MACHINE_ALPHA64
#define IMAGE_FILE_MACHINE_TRICORE &h0520
#define IMAGE_FILE_MACHINE_CEF &h0CEF
#define IMAGE_FILE_MACHINE_EBC &h0EBC
#define IMAGE_FILE_MACHINE_AMD64 &h8664
#define IMAGE_FILE_MACHINE_M32R &h9041
#define IMAGE_FILE_MACHINE_CEE &hc0ee

type _IMAGE_DATA_DIRECTORY field = 4
	VirtualAddress as DWORD
	Size as DWORD
end type

type IMAGE_DATA_DIRECTORY as _IMAGE_DATA_DIRECTORY
type PIMAGE_DATA_DIRECTORY as _IMAGE_DATA_DIRECTORY ptr

#define IMAGE_NUMBEROF_DIRECTORY_ENTRIES 16

type _IMAGE_OPTIONAL_HEADER field = 4
	Magic as WORD
	MajorLinkerVersion as BYTE
	MinorLinkerVersion as BYTE
	SizeOfCode as DWORD
	SizeOfInitializedData as DWORD
	SizeOfUninitializedData as DWORD
	AddressOfEntryPoint as DWORD
	BaseOfCode as DWORD
	BaseOfData as DWORD
	ImageBase as DWORD
	SectionAlignment as DWORD
	FileAlignment as DWORD
	MajorOperatingSystemVersion as WORD
	MinorOperatingSystemVersion as WORD
	MajorImageVersion as WORD
	MinorImageVersion as WORD
	MajorSubsystemVersion as WORD
	MinorSubsystemVersion as WORD
	Win32VersionValue as DWORD
	SizeOfImage as DWORD
	SizeOfHeaders as DWORD
	CheckSum as DWORD
	Subsystem as WORD
	DllCharacteristics as WORD
	SizeOfStackReserve as DWORD
	SizeOfStackCommit as DWORD
	SizeOfHeapReserve as DWORD
	SizeOfHeapCommit as DWORD
	LoaderFlags as DWORD
	NumberOfRvaAndSizes as DWORD
	DataDirectory(0 to 15) as IMAGE_DATA_DIRECTORY
end type

type IMAGE_OPTIONAL_HEADER32 as _IMAGE_OPTIONAL_HEADER
type PIMAGE_OPTIONAL_HEADER32 as _IMAGE_OPTIONAL_HEADER ptr

type _IMAGE_ROM_OPTIONAL_HEADER field = 4
	Magic as WORD
	MajorLinkerVersion as BYTE
	MinorLinkerVersion as BYTE
	SizeOfCode as DWORD
	SizeOfInitializedData as DWORD
	SizeOfUninitializedData as DWORD
	AddressOfEntryPoint as DWORD
	BaseOfCode as DWORD
	BaseOfData as DWORD
	BaseOfBss as DWORD
	GprMask as DWORD
	CprMask(0 to 3) as DWORD
	GpValue as DWORD
end type

type IMAGE_ROM_OPTIONAL_HEADER as _IMAGE_ROM_OPTIONAL_HEADER
type PIMAGE_ROM_OPTIONAL_HEADER as _IMAGE_ROM_OPTIONAL_HEADER ptr

type _IMAGE_OPTIONAL_HEADER64 field = 4
	Magic as WORD
	MajorLinkerVersion as BYTE
	MinorLinkerVersion as BYTE
	SizeOfCode as DWORD
	SizeOfInitializedData as DWORD
	SizeOfUninitializedData as DWORD
	AddressOfEntryPoint as DWORD
	BaseOfCode as DWORD
	ImageBase as ULONGLONG
	SectionAlignment as DWORD
	FileAlignment as DWORD
	MajorOperatingSystemVersion as WORD
	MinorOperatingSystemVersion as WORD
	MajorImageVersion as WORD
	MinorImageVersion as WORD
	MajorSubsystemVersion as WORD
	MinorSubsystemVersion as WORD
	Win32VersionValue as DWORD
	SizeOfImage as DWORD
	SizeOfHeaders as DWORD
	CheckSum as DWORD
	Subsystem as WORD
	DllCharacteristics as WORD
	SizeOfStackReserve as ULONGLONG
	SizeOfStackCommit as ULONGLONG
	SizeOfHeapReserve as ULONGLONG
	SizeOfHeapCommit as ULONGLONG
	LoaderFlags as DWORD
	NumberOfRvaAndSizes as DWORD
	DataDirectory(0 to 15) as IMAGE_DATA_DIRECTORY
end type

type IMAGE_OPTIONAL_HEADER64 as _IMAGE_OPTIONAL_HEADER64
type PIMAGE_OPTIONAL_HEADER64 as _IMAGE_OPTIONAL_HEADER64 ptr

#define IMAGE_SIZEOF_ROM_OPTIONAL_HEADER 56
#define IMAGE_SIZEOF_STD_OPTIONAL_HEADER 28
#define IMAGE_SIZEOF_NT_OPTIONAL32_HEADER 224
#define IMAGE_SIZEOF_NT_OPTIONAL64_HEADER 240
#define IMAGE_NT_OPTIONAL_HDR32_MAGIC &h10b
#define IMAGE_NT_OPTIONAL_HDR64_MAGIC &h20b
#define IMAGE_ROM_OPTIONAL_HDR_MAGIC &h107

#ifdef __FB_64BIT__
	type IMAGE_OPTIONAL_HEADER as IMAGE_OPTIONAL_HEADER64
	type PIMAGE_OPTIONAL_HEADER as PIMAGE_OPTIONAL_HEADER64

	#define IMAGE_SIZEOF_NT_OPTIONAL_HEADER IMAGE_SIZEOF_NT_OPTIONAL64_HEADER
	#define IMAGE_NT_OPTIONAL_HDR_MAGIC IMAGE_NT_OPTIONAL_HDR64_MAGIC
#else
	type IMAGE_OPTIONAL_HEADER as IMAGE_OPTIONAL_HEADER32
	type PIMAGE_OPTIONAL_HEADER as PIMAGE_OPTIONAL_HEADER32

	#define IMAGE_SIZEOF_NT_OPTIONAL_HEADER IMAGE_SIZEOF_NT_OPTIONAL32_HEADER
	#define IMAGE_NT_OPTIONAL_HDR_MAGIC IMAGE_NT_OPTIONAL_HDR32_MAGIC
#endif

type _IMAGE_NT_HEADERS64 field = 4
	Signature as DWORD
	FileHeader as IMAGE_FILE_HEADER
	OptionalHeader as IMAGE_OPTIONAL_HEADER64
end type

type IMAGE_NT_HEADERS64 as _IMAGE_NT_HEADERS64
type PIMAGE_NT_HEADERS64 as _IMAGE_NT_HEADERS64 ptr

type _IMAGE_NT_HEADERS field = 4
	Signature as DWORD
	FileHeader as IMAGE_FILE_HEADER
	OptionalHeader as IMAGE_OPTIONAL_HEADER32
end type

type IMAGE_NT_HEADERS32 as _IMAGE_NT_HEADERS
type PIMAGE_NT_HEADERS32 as _IMAGE_NT_HEADERS ptr

type _IMAGE_ROM_HEADERS field = 4
	FileHeader as IMAGE_FILE_HEADER
	OptionalHeader as IMAGE_ROM_OPTIONAL_HEADER
end type

type IMAGE_ROM_HEADERS as _IMAGE_ROM_HEADERS
type PIMAGE_ROM_HEADERS as _IMAGE_ROM_HEADERS ptr

#ifdef __FB_64BIT__
	type IMAGE_NT_HEADERS as IMAGE_NT_HEADERS64
	type PIMAGE_NT_HEADERS as PIMAGE_NT_HEADERS64
#else
	type IMAGE_NT_HEADERS as IMAGE_NT_HEADERS32
	type PIMAGE_NT_HEADERS as PIMAGE_NT_HEADERS32
#endif

#define IMAGE_FIRST_SECTION(ntheader) cast(PIMAGE_SECTION_HEADER, cast(ULONG_PTR, (ntheader + FIELD_OFFSET(IMAGE_NT_HEADERS, OptionalHeader)) + cast(PIMAGE_NT_HEADERS, (ntheader))->FileHeader.SizeOfOptionalHeader))
#define IMAGE_SUBSYSTEM_UNKNOWN 0
#define IMAGE_SUBSYSTEM_NATIVE 1
#define IMAGE_SUBSYSTEM_WINDOWS_GUI 2
#define IMAGE_SUBSYSTEM_WINDOWS_CUI 3
#define IMAGE_SUBSYSTEM_OS2_CUI 5
#define IMAGE_SUBSYSTEM_POSIX_CUI 7
#define IMAGE_SUBSYSTEM_NATIVE_WINDOWS 8
#define IMAGE_SUBSYSTEM_WINDOWS_CE_GUI 9
#define IMAGE_SUBSYSTEM_EFI_APPLICATION 10
#define IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER 11
#define IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER 12
#define IMAGE_SUBSYSTEM_EFI_ROM 13
#define IMAGE_SUBSYSTEM_XBOX 14
#define IMAGE_SUBSYSTEM_WINDOWS_BOOT_APPLICATION 16
#define IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE &h0040
#define IMAGE_DLLCHARACTERISTICS_FORCE_INTEGRITY &h0080
#define IMAGE_DLLCHARACTERISTICS_NX_COMPAT &h0100
#define IMAGE_DLLCHARACTERISTICS_NO_ISOLATION &h0200
#define IMAGE_DLLCHARACTERISTICS_NO_SEH &h0400
#define IMAGE_DLLCHARACTERISTICS_NO_BIND &h0800
#define IMAGE_DLLCHARACTERISTICS_APPCONTAINER &h1000
#define IMAGE_DLLCHARACTERISTICS_WDM_DRIVER &h2000
#define IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE &h8000
#define IMAGE_DIRECTORY_ENTRY_EXPORT 0
#define IMAGE_DIRECTORY_ENTRY_IMPORT 1
#define IMAGE_DIRECTORY_ENTRY_RESOURCE 2
#define IMAGE_DIRECTORY_ENTRY_EXCEPTION 3
#define IMAGE_DIRECTORY_ENTRY_SECURITY 4
#define IMAGE_DIRECTORY_ENTRY_BASERELOC 5
#define IMAGE_DIRECTORY_ENTRY_DEBUG 6
#define IMAGE_DIRECTORY_ENTRY_ARCHITECTURE 7
#define IMAGE_DIRECTORY_ENTRY_GLOBALPTR 8
#define IMAGE_DIRECTORY_ENTRY_TLS 9
#define IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG 10
#define IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT 11
#define IMAGE_DIRECTORY_ENTRY_IAT 12
#define IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT 13
#define IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR 14

type ANON_OBJECT_HEADER field = 4
	Sig1 as WORD
	Sig2 as WORD
	Version as WORD
	Machine as WORD
	TimeDateStamp as DWORD
	ClassID as CLSID
	SizeOfData as DWORD
end type

type ANON_OBJECT_HEADER_V2 field = 4
	Sig1 as WORD
	Sig2 as WORD
	Version as WORD
	Machine as WORD
	TimeDateStamp as DWORD
	ClassID as CLSID
	SizeOfData as DWORD
	Flags as DWORD
	MetaDataSize as DWORD
	MetaDataOffset as DWORD
end type

type ANON_OBJECT_HEADER_BIGOBJ field = 4
	Sig1 as WORD
	Sig2 as WORD
	Version as WORD
	Machine as WORD
	TimeDateStamp as DWORD
	ClassID as CLSID
	SizeOfData as DWORD
	Flags as DWORD
	MetaDataSize as DWORD
	MetaDataOffset as DWORD
	NumberOfSections as DWORD
	PointerToSymbolTable as DWORD
	NumberOfSymbols as DWORD
end type

#define IMAGE_SIZEOF_SHORT_NAME 8

union ___IMAGE_SECTION_HEADER_Misc field = 4
	PhysicalAddress as DWORD
	VirtualSize as DWORD
end union

type _IMAGE_SECTION_HEADER field = 4
	Name(0 to 7) as BYTE
	Misc as ___IMAGE_SECTION_HEADER_Misc
	VirtualAddress as DWORD
	SizeOfRawData as DWORD
	PointerToRawData as DWORD
	PointerToRelocations as DWORD
	PointerToLinenumbers as DWORD
	NumberOfRelocations as WORD
	NumberOfLinenumbers as WORD
	Characteristics as DWORD
end type

type IMAGE_SECTION_HEADER as _IMAGE_SECTION_HEADER
type PIMAGE_SECTION_HEADER as _IMAGE_SECTION_HEADER ptr

#define IMAGE_SIZEOF_SECTION_HEADER 40
#define IMAGE_SCN_TYPE_NO_PAD &h00000008
#define IMAGE_SCN_CNT_CODE &h00000020
#define IMAGE_SCN_CNT_INITIALIZED_DATA &h00000040
#define IMAGE_SCN_CNT_UNINITIALIZED_DATA &h00000080
#define IMAGE_SCN_LNK_OTHER &h00000100
#define IMAGE_SCN_LNK_INFO &h00000200
#define IMAGE_SCN_LNK_REMOVE &h00000800
#define IMAGE_SCN_LNK_COMDAT &h00001000
#define IMAGE_SCN_NO_DEFER_SPEC_EXC &h00004000
#define IMAGE_SCN_GPREL &h00008000
#define IMAGE_SCN_MEM_FARDATA &h00008000
#define IMAGE_SCN_MEM_PURGEABLE &h00020000
#define IMAGE_SCN_MEM_16BIT &h00020000
#define IMAGE_SCN_MEM_LOCKED &h00040000
#define IMAGE_SCN_MEM_PRELOAD &h00080000
#define IMAGE_SCN_ALIGN_1BYTES &h00100000
#define IMAGE_SCN_ALIGN_2BYTES &h00200000
#define IMAGE_SCN_ALIGN_4BYTES &h00300000
#define IMAGE_SCN_ALIGN_8BYTES &h00400000
#define IMAGE_SCN_ALIGN_16BYTES &h00500000
#define IMAGE_SCN_ALIGN_32BYTES &h00600000
#define IMAGE_SCN_ALIGN_64BYTES &h00700000
#define IMAGE_SCN_ALIGN_128BYTES &h00800000
#define IMAGE_SCN_ALIGN_256BYTES &h00900000
#define IMAGE_SCN_ALIGN_512BYTES &h00A00000
#define IMAGE_SCN_ALIGN_1024BYTES &h00B00000
#define IMAGE_SCN_ALIGN_2048BYTES &h00C00000
#define IMAGE_SCN_ALIGN_4096BYTES &h00D00000
#define IMAGE_SCN_ALIGN_8192BYTES &h00E00000
#define IMAGE_SCN_ALIGN_MASK &h00F00000
#define IMAGE_SCN_LNK_NRELOC_OVFL &h01000000
#define IMAGE_SCN_MEM_DISCARDABLE &h02000000
#define IMAGE_SCN_MEM_NOT_CACHED &h04000000
#define IMAGE_SCN_MEM_NOT_PAGED &h08000000
#define IMAGE_SCN_MEM_SHARED &h10000000
#define IMAGE_SCN_MEM_EXECUTE &h20000000
#define IMAGE_SCN_MEM_READ &h40000000
#define IMAGE_SCN_MEM_WRITE &h80000000
#define IMAGE_SCN_SCALE_INDEX &h00000001

type ___IMAGE_SYMBOL_Name field = 2
	Short as DWORD
	Long as DWORD
end type

union ___IMAGE_SYMBOL_N field = 2
	ShortName(0 to 7) as BYTE
	Name as ___IMAGE_SYMBOL_Name
	LongName(0 to 1) as DWORD
end union

type _IMAGE_SYMBOL field = 2
	N as ___IMAGE_SYMBOL_N
	Value as DWORD
	SectionNumber as SHORT_
	as WORD Type
	StorageClass as BYTE
	NumberOfAuxSymbols as BYTE
end type

type IMAGE_SYMBOL as _IMAGE_SYMBOL
type PIMAGE_SYMBOL as IMAGE_SYMBOL ptr

#define IMAGE_SIZEOF_SYMBOL 18

type ___IMAGE_SYMBOL_EX_Name field = 2
	Short as DWORD
	Long as DWORD
end type

union ___IMAGE_SYMBOL_EX_N field = 2
	ShortName(0 to 7) as BYTE
	Name as ___IMAGE_SYMBOL_EX_Name
	LongName(0 to 1) as DWORD
end union

type _IMAGE_SYMBOL_EX field = 2
	N as ___IMAGE_SYMBOL_EX_N
	Value as DWORD
	SectionNumber as LONG_
	as WORD Type
	StorageClass as BYTE
	NumberOfAuxSymbols as BYTE
end type

type IMAGE_SYMBOL_EX as _IMAGE_SYMBOL_EX
type PIMAGE_SYMBOL_EX as _IMAGE_SYMBOL_EX ptr

#define IMAGE_SYM_UNDEFINED cast(SHORT_, 0)
#define IMAGE_SYM_ABSOLUTE cast(SHORT_, -1)
#define IMAGE_SYM_DEBUG cast(SHORT_, -2)
#define IMAGE_SYM_SECTION_MAX &hFEFF
#define IMAGE_SYM_SECTION_MAX_EX MAXLONG
#define IMAGE_SYM_TYPE_NULL &h0000
#define IMAGE_SYM_TYPE_VOID &h0001
#define IMAGE_SYM_TYPE_CHAR &h0002
#define IMAGE_SYM_TYPE_SHORT &h0003
#define IMAGE_SYM_TYPE_INT &h0004
#define IMAGE_SYM_TYPE_LONG &h0005
#define IMAGE_SYM_TYPE_FLOAT &h0006
#define IMAGE_SYM_TYPE_DOUBLE &h0007
#define IMAGE_SYM_TYPE_STRUCT &h0008
#define IMAGE_SYM_TYPE_UNION &h0009
#define IMAGE_SYM_TYPE_ENUM &h000A
#define IMAGE_SYM_TYPE_MOE &h000B
#define IMAGE_SYM_TYPE_BYTE &h000C
#define IMAGE_SYM_TYPE_WORD &h000D
#define IMAGE_SYM_TYPE_UINT &h000E
#define IMAGE_SYM_TYPE_DWORD &h000F
#define IMAGE_SYM_TYPE_PCODE &h8000
#define IMAGE_SYM_DTYPE_NULL 0
#define IMAGE_SYM_DTYPE_POINTER 1
#define IMAGE_SYM_DTYPE_FUNCTION 2
#define IMAGE_SYM_DTYPE_ARRAY 3
#define IMAGE_SYM_CLASS_END_OF_FUNCTION (BYTE - 1)
#define IMAGE_SYM_CLASS_NULL &h0000
#define IMAGE_SYM_CLASS_AUTOMATIC &h0001
#define IMAGE_SYM_CLASS_EXTERNAL &h0002
#define IMAGE_SYM_CLASS_STATIC &h0003
#define IMAGE_SYM_CLASS_REGISTER &h0004
#define IMAGE_SYM_CLASS_EXTERNAL_DEF &h0005
#define IMAGE_SYM_CLASS_LABEL &h0006
#define IMAGE_SYM_CLASS_UNDEFINED_LABEL &h0007
#define IMAGE_SYM_CLASS_MEMBER_OF_STRUCT &h0008
#define IMAGE_SYM_CLASS_ARGUMENT &h0009
#define IMAGE_SYM_CLASS_STRUCT_TAG &h000A
#define IMAGE_SYM_CLASS_MEMBER_OF_UNION &h000B
#define IMAGE_SYM_CLASS_UNION_TAG &h000C
#define IMAGE_SYM_CLASS_TYPE_DEFINITION &h000D
#define IMAGE_SYM_CLASS_UNDEFINED_STATIC &h000E
#define IMAGE_SYM_CLASS_ENUM_TAG &h000F
#define IMAGE_SYM_CLASS_MEMBER_OF_ENUM &h0010
#define IMAGE_SYM_CLASS_REGISTER_PARAM &h0011
#define IMAGE_SYM_CLASS_BIT_FIELD &h0012
#define IMAGE_SYM_CLASS_FAR_EXTERNAL &h0044
#define IMAGE_SYM_CLASS_BLOCK &h0064
#define IMAGE_SYM_CLASS_FUNCTION &h0065
#define IMAGE_SYM_CLASS_END_OF_STRUCT &h0066
#define IMAGE_SYM_CLASS_FILE &h0067
#define IMAGE_SYM_CLASS_SECTION &h0068
#define IMAGE_SYM_CLASS_WEAK_EXTERNAL &h0069
#define IMAGE_SYM_CLASS_CLR_TOKEN &h006B
#define N_BTMASK &h000F
#define N_TMASK &h0030
#define N_TMASK1 &h00C0
#define N_TMASK2 &h00F0
#define N_BTSHFT 4
#define N_TSHIFT 2
#define BTYPE(x) ((x) and N_BTMASK)
#define ISPTR(x) (((x) and N_TMASK) = (IMAGE_SYM_DTYPE_POINTER shl N_BTSHFT))
#define ISFCN(x) (((x) and N_TMASK) = (IMAGE_SYM_DTYPE_FUNCTION shl N_BTSHFT))
#define ISARY(x) (((x) and N_TMASK) = (IMAGE_SYM_DTYPE_ARRAY shl N_BTSHFT))
#define ISTAG(x) ((((x) = IMAGE_SYM_CLASS_STRUCT_TAG) orelse ((x) = IMAGE_SYM_CLASS_UNION_TAG)) orelse ((x) = IMAGE_SYM_CLASS_ENUM_TAG))
#define INCREF(x) (((((x) and (not N_BTMASK)) shl N_TSHIFT) or (IMAGE_SYM_DTYPE_POINTER shl N_BTSHFT)) or ((x) and N_BTMASK))
#define DECREF(x) ((((x) shr N_TSHIFT) and (not N_BTMASK)) or ((x) and N_BTMASK))

type IMAGE_AUX_SYMBOL_TOKEN_DEF field = 2
	bAuxType as BYTE
	bReserved as BYTE
	SymbolTableIndex as DWORD
	rgbReserved(0 to 11) as BYTE
end type

type PIMAGE_AUX_SYMBOL_TOKEN_DEF as IMAGE_AUX_SYMBOL_TOKEN_DEF ptr

type ___IMAGE_AUX_SYMBOL_LnSz field = 2
	Linenumber as WORD
	Size as WORD
end type

union ___IMAGE_AUX_SYMBOL_Misc field = 2
	LnSz as ___IMAGE_AUX_SYMBOL_LnSz
	TotalSize as DWORD
end union

type ___IMAGE_AUX_SYMBOL_Function field = 2
	PointerToLinenumber as DWORD
	PointerToNextFunction as DWORD
end type

type ___IMAGE_AUX_SYMBOL_Array field = 2
	Dimension(0 to 3) as WORD
end type

union ___IMAGE_AUX_SYMBOL_FcnAry field = 2
	Function as ___IMAGE_AUX_SYMBOL_Function
	Array as ___IMAGE_AUX_SYMBOL_Array
end union

type ___IMAGE_AUX_SYMBOL_Sym field = 2
	TagIndex as DWORD
	Misc as ___IMAGE_AUX_SYMBOL_Misc
	FcnAry as ___IMAGE_AUX_SYMBOL_FcnAry
	TvIndex as WORD
end type

type ___IMAGE_AUX_SYMBOL_File field = 2
	Name(0 to 17) as BYTE
end type

type ___IMAGE_AUX_SYMBOL_Section field = 2
	Length as DWORD
	NumberOfRelocations as WORD
	NumberOfLinenumbers as WORD
	CheckSum as DWORD
	Number as SHORT_
	Selection as BYTE
end type

type ___IMAGE_AUX_SYMBOL_CRC field = 2
	crc as DWORD
	rgbReserved(0 to 13) as BYTE
end type

union _IMAGE_AUX_SYMBOL field = 2
	Sym as ___IMAGE_AUX_SYMBOL_Sym
	File as ___IMAGE_AUX_SYMBOL_File
	Section as ___IMAGE_AUX_SYMBOL_Section
	TokenDef as IMAGE_AUX_SYMBOL_TOKEN_DEF
	CRC as ___IMAGE_AUX_SYMBOL_CRC
end union

type IMAGE_AUX_SYMBOL as _IMAGE_AUX_SYMBOL
type PIMAGE_AUX_SYMBOL as _IMAGE_AUX_SYMBOL ptr

type ___IMAGE_AUX_SYMBOL_EX_Sym field = 2
	WeakDefaultSymIndex as DWORD
	WeakSearchType as DWORD
	rgbReserved(0 to 11) as BYTE
end type

type ___IMAGE_AUX_SYMBOL_EX_File field = 2
	Name(0 to sizeof(IMAGE_SYMBOL_EX) - 1) as BYTE
end type

type ___IMAGE_AUX_SYMBOL_EX_Section field = 2
	Length as DWORD
	NumberOfRelocations as WORD
	NumberOfLinenumbers as WORD
	CheckSum as DWORD
	Number as SHORT_
	Selection as BYTE
	bReserved as BYTE
	HighNumber as SHORT_
	rgbReserved(0 to 1) as BYTE
end type

type ___IMAGE_AUX_SYMBOL_EX_CRC field = 2
	crc as DWORD
	rgbReserved(0 to 15) as BYTE
end type

union _IMAGE_AUX_SYMBOL_EX field = 2
	Sym as ___IMAGE_AUX_SYMBOL_EX_Sym
	File as ___IMAGE_AUX_SYMBOL_EX_File
	Section as ___IMAGE_AUX_SYMBOL_EX_Section

	type field = 2
		TokenDef as IMAGE_AUX_SYMBOL_TOKEN_DEF
		rgbReserved(0 to 1) as BYTE
	end type

	CRC as ___IMAGE_AUX_SYMBOL_EX_CRC
end union

type IMAGE_AUX_SYMBOL_EX as _IMAGE_AUX_SYMBOL_EX
type PIMAGE_AUX_SYMBOL_EX as _IMAGE_AUX_SYMBOL_EX ptr

#define IMAGE_SIZEOF_AUX_SYMBOL 18

type IMAGE_AUX_SYMBOL_TYPE as long
enum
	IMAGE_AUX_SYMBOL_TYPE_TOKEN_DEF = 1
end enum

#define IMAGE_COMDAT_SELECT_NODUPLICATES 1
#define IMAGE_COMDAT_SELECT_ANY 2
#define IMAGE_COMDAT_SELECT_SAME_SIZE 3
#define IMAGE_COMDAT_SELECT_EXACT_MATCH 4
#define IMAGE_COMDAT_SELECT_ASSOCIATIVE 5
#define IMAGE_COMDAT_SELECT_LARGEST 6
#define IMAGE_COMDAT_SELECT_NEWEST 7
#define IMAGE_WEAK_EXTERN_SEARCH_NOLIBRARY 1
#define IMAGE_WEAK_EXTERN_SEARCH_LIBRARY 2
#define IMAGE_WEAK_EXTERN_SEARCH_ALIAS 3

type _IMAGE_RELOCATION field = 2
	union field = 2
		VirtualAddress as DWORD
		RelocCount as DWORD
	end union

	SymbolTableIndex as DWORD
	as WORD Type
end type

type IMAGE_RELOCATION as _IMAGE_RELOCATION
type PIMAGE_RELOCATION as IMAGE_RELOCATION ptr

#define IMAGE_SIZEOF_RELOCATION 10
#define IMAGE_REL_I386_ABSOLUTE &h0000
#define IMAGE_REL_I386_DIR16 &h0001
#define IMAGE_REL_I386_REL16 &h0002
#define IMAGE_REL_I386_DIR32 &h0006
#define IMAGE_REL_I386_DIR32NB &h0007
#define IMAGE_REL_I386_SEG12 &h0009
#define IMAGE_REL_I386_SECTION &h000A
#define IMAGE_REL_I386_SECREL &h000B
#define IMAGE_REL_I386_TOKEN &h000C
#define IMAGE_REL_I386_SECREL7 &h000D
#define IMAGE_REL_I386_REL32 &h0014
#define IMAGE_REL_MIPS_ABSOLUTE &h0000
#define IMAGE_REL_MIPS_REFHALF &h0001
#define IMAGE_REL_MIPS_REFWORD &h0002
#define IMAGE_REL_MIPS_JMPADDR &h0003
#define IMAGE_REL_MIPS_REFHI &h0004
#define IMAGE_REL_MIPS_REFLO &h0005
#define IMAGE_REL_MIPS_GPREL &h0006
#define IMAGE_REL_MIPS_LITERAL &h0007
#define IMAGE_REL_MIPS_SECTION &h000A
#define IMAGE_REL_MIPS_SECREL &h000B
#define IMAGE_REL_MIPS_SECRELLO &h000C
#define IMAGE_REL_MIPS_SECRELHI &h000D
#define IMAGE_REL_MIPS_TOKEN &h000E
#define IMAGE_REL_MIPS_JMPADDR16 &h0010
#define IMAGE_REL_MIPS_REFWORDNB &h0022
#define IMAGE_REL_MIPS_PAIR &h0025
#define IMAGE_REL_ALPHA_ABSOLUTE &h0000
#define IMAGE_REL_ALPHA_REFLONG &h0001
#define IMAGE_REL_ALPHA_REFQUAD &h0002
#define IMAGE_REL_ALPHA_GPREL32 &h0003
#define IMAGE_REL_ALPHA_LITERAL &h0004
#define IMAGE_REL_ALPHA_LITUSE &h0005
#define IMAGE_REL_ALPHA_GPDISP &h0006
#define IMAGE_REL_ALPHA_BRADDR &h0007
#define IMAGE_REL_ALPHA_HINT &h0008
#define IMAGE_REL_ALPHA_INLINE_REFLONG &h0009
#define IMAGE_REL_ALPHA_REFHI &h000A
#define IMAGE_REL_ALPHA_REFLO &h000B
#define IMAGE_REL_ALPHA_PAIR &h000C
#define IMAGE_REL_ALPHA_MATCH &h000D
#define IMAGE_REL_ALPHA_SECTION &h000E
#define IMAGE_REL_ALPHA_SECREL &h000F
#define IMAGE_REL_ALPHA_REFLONGNB &h0010
#define IMAGE_REL_ALPHA_SECRELLO &h0011
#define IMAGE_REL_ALPHA_SECRELHI &h0012
#define IMAGE_REL_ALPHA_REFQ3 &h0013
#define IMAGE_REL_ALPHA_REFQ2 &h0014
#define IMAGE_REL_ALPHA_REFQ1 &h0015
#define IMAGE_REL_ALPHA_GPRELLO &h0016
#define IMAGE_REL_ALPHA_GPRELHI &h0017
#define IMAGE_REL_PPC_ABSOLUTE &h0000
#define IMAGE_REL_PPC_ADDR64 &h0001
#define IMAGE_REL_PPC_ADDR32 &h0002
#define IMAGE_REL_PPC_ADDR24 &h0003
#define IMAGE_REL_PPC_ADDR16 &h0004
#define IMAGE_REL_PPC_ADDR14 &h0005
#define IMAGE_REL_PPC_REL24 &h0006
#define IMAGE_REL_PPC_REL14 &h0007
#define IMAGE_REL_PPC_TOCREL16 &h0008
#define IMAGE_REL_PPC_TOCREL14 &h0009
#define IMAGE_REL_PPC_ADDR32NB &h000A
#define IMAGE_REL_PPC_SECREL &h000B
#define IMAGE_REL_PPC_SECTION &h000C
#define IMAGE_REL_PPC_IFGLUE &h000D
#define IMAGE_REL_PPC_IMGLUE &h000E
#define IMAGE_REL_PPC_SECREL16 &h000F
#define IMAGE_REL_PPC_REFHI &h0010
#define IMAGE_REL_PPC_REFLO &h0011
#define IMAGE_REL_PPC_PAIR &h0012
#define IMAGE_REL_PPC_SECRELLO &h0013
#define IMAGE_REL_PPC_SECRELHI &h0014
#define IMAGE_REL_PPC_GPREL &h0015
#define IMAGE_REL_PPC_TOKEN &h0016
#define IMAGE_REL_PPC_TYPEMASK &h00FF
#define IMAGE_REL_PPC_NEG &h0100
#define IMAGE_REL_PPC_BRTAKEN &h0200
#define IMAGE_REL_PPC_BRNTAKEN &h0400
#define IMAGE_REL_PPC_TOCDEFN &h0800
#define IMAGE_REL_SH3_ABSOLUTE &h0000
#define IMAGE_REL_SH3_DIRECT16 &h0001
#define IMAGE_REL_SH3_DIRECT32 &h0002
#define IMAGE_REL_SH3_DIRECT8 &h0003
#define IMAGE_REL_SH3_DIRECT8_WORD &h0004
#define IMAGE_REL_SH3_DIRECT8_LONG &h0005
#define IMAGE_REL_SH3_DIRECT4 &h0006
#define IMAGE_REL_SH3_DIRECT4_WORD &h0007
#define IMAGE_REL_SH3_DIRECT4_LONG &h0008
#define IMAGE_REL_SH3_PCREL8_WORD &h0009
#define IMAGE_REL_SH3_PCREL8_LONG &h000A
#define IMAGE_REL_SH3_PCREL12_WORD &h000B
#define IMAGE_REL_SH3_STARTOF_SECTION &h000C
#define IMAGE_REL_SH3_SIZEOF_SECTION &h000D
#define IMAGE_REL_SH3_SECTION &h000E
#define IMAGE_REL_SH3_SECREL &h000F
#define IMAGE_REL_SH3_DIRECT32_NB &h0010
#define IMAGE_REL_SH3_GPREL4_LONG &h0011
#define IMAGE_REL_SH3_TOKEN &h0012
#define IMAGE_REL_SHM_PCRELPT &h0013
#define IMAGE_REL_SHM_REFLO &h0014
#define IMAGE_REL_SHM_REFHALF &h0015
#define IMAGE_REL_SHM_RELLO &h0016
#define IMAGE_REL_SHM_RELHALF &h0017
#define IMAGE_REL_SHM_PAIR &h0018
#define IMAGE_REL_SH_NOMODE &h8000
#define IMAGE_REL_ARM_ABSOLUTE &h0000
#define IMAGE_REL_ARM_ADDR32 &h0001
#define IMAGE_REL_ARM_ADDR32NB &h0002
#define IMAGE_REL_ARM_BRANCH24 &h0003
#define IMAGE_REL_ARM_BRANCH11 &h0004
#define IMAGE_REL_ARM_TOKEN &h0005
#define IMAGE_REL_ARM_GPREL12 &h0006
#define IMAGE_REL_ARM_GPREL7 &h0007
#define IMAGE_REL_ARM_BLX24 &h0008
#define IMAGE_REL_ARM_BLX11 &h0009
#define IMAGE_REL_ARM_SECTION &h000E
#define IMAGE_REL_ARM_SECREL &h000F
#define IMAGE_REL_ARM_MOV32A &h0010
#define IMAGE_REL_ARM_MOV32 &h0010
#define IMAGE_REL_ARM_MOV32T &h0011
#define IMAGE_REL_THUMB_MOV32 &h0011
#define IMAGE_REL_ARM_BRANCH20T &h0012
#define IMAGE_REL_THUMB_BRANCH20 &h0012
#define IMAGE_REL_ARM_BRANCH24T &h0014
#define IMAGE_REL_THUMB_BRANCH24 &h0014
#define IMAGE_REL_ARM_BLX23T &h0015
#define IMAGE_REL_THUMB_BLX23 &h0015
#define IMAGE_REL_AM_ABSOLUTE &h0000
#define IMAGE_REL_AM_ADDR32 &h0001
#define IMAGE_REL_AM_ADDR32NB &h0002
#define IMAGE_REL_AM_CALL32 &h0003
#define IMAGE_REL_AM_FUNCINFO &h0004
#define IMAGE_REL_AM_REL32_1 &h0005
#define IMAGE_REL_AM_REL32_2 &h0006
#define IMAGE_REL_AM_SECREL &h0007
#define IMAGE_REL_AM_SECTION &h0008
#define IMAGE_REL_AM_TOKEN &h0009
#define IMAGE_REL_AMD64_ABSOLUTE &h0000
#define IMAGE_REL_AMD64_ADDR64 &h0001
#define IMAGE_REL_AMD64_ADDR32 &h0002
#define IMAGE_REL_AMD64_ADDR32NB &h0003
#define IMAGE_REL_AMD64_REL32 &h0004
#define IMAGE_REL_AMD64_REL32_1 &h0005
#define IMAGE_REL_AMD64_REL32_2 &h0006
#define IMAGE_REL_AMD64_REL32_3 &h0007
#define IMAGE_REL_AMD64_REL32_4 &h0008
#define IMAGE_REL_AMD64_REL32_5 &h0009
#define IMAGE_REL_AMD64_SECTION &h000A
#define IMAGE_REL_AMD64_SECREL &h000B
#define IMAGE_REL_AMD64_SECREL7 &h000C
#define IMAGE_REL_AMD64_TOKEN &h000D
#define IMAGE_REL_AMD64_SREL32 &h000E
#define IMAGE_REL_AMD64_PAIR &h000F
#define IMAGE_REL_AMD64_SSPAN32 &h0010
#define IMAGE_REL_IA64_ABSOLUTE &h0000
#define IMAGE_REL_IA64_IMM14 &h0001
#define IMAGE_REL_IA64_IMM22 &h0002
#define IMAGE_REL_IA64_IMM64 &h0003
#define IMAGE_REL_IA64_DIR32 &h0004
#define IMAGE_REL_IA64_DIR64 &h0005
#define IMAGE_REL_IA64_PCREL21B &h0006
#define IMAGE_REL_IA64_PCREL21M &h0007
#define IMAGE_REL_IA64_PCREL21F &h0008
#define IMAGE_REL_IA64_GPREL22 &h0009
#define IMAGE_REL_IA64_LTOFF22 &h000A
#define IMAGE_REL_IA64_SECTION &h000B
#define IMAGE_REL_IA64_SECREL22 &h000C
#define IMAGE_REL_IA64_SECREL64I &h000D
#define IMAGE_REL_IA64_SECREL32 &h000E
#define IMAGE_REL_IA64_DIR32NB &h0010
#define IMAGE_REL_IA64_SREL14 &h0011
#define IMAGE_REL_IA64_SREL22 &h0012
#define IMAGE_REL_IA64_SREL32 &h0013
#define IMAGE_REL_IA64_UREL32 &h0014
#define IMAGE_REL_IA64_PCREL60X &h0015
#define IMAGE_REL_IA64_PCREL60B &h0016
#define IMAGE_REL_IA64_PCREL60F &h0017
#define IMAGE_REL_IA64_PCREL60I &h0018
#define IMAGE_REL_IA64_PCREL60M &h0019
#define IMAGE_REL_IA64_IMMGPREL64 &h001A
#define IMAGE_REL_IA64_TOKEN &h001B
#define IMAGE_REL_IA64_GPREL32 &h001C
#define IMAGE_REL_IA64_ADDEND &h001F
#define IMAGE_REL_CEF_ABSOLUTE &h0000
#define IMAGE_REL_CEF_ADDR32 &h0001
#define IMAGE_REL_CEF_ADDR64 &h0002
#define IMAGE_REL_CEF_ADDR32NB &h0003
#define IMAGE_REL_CEF_SECTION &h0004
#define IMAGE_REL_CEF_SECREL &h0005
#define IMAGE_REL_CEF_TOKEN &h0006
#define IMAGE_REL_CEE_ABSOLUTE &h0000
#define IMAGE_REL_CEE_ADDR32 &h0001
#define IMAGE_REL_CEE_ADDR64 &h0002
#define IMAGE_REL_CEE_ADDR32NB &h0003
#define IMAGE_REL_CEE_SECTION &h0004
#define IMAGE_REL_CEE_SECREL &h0005
#define IMAGE_REL_CEE_TOKEN &h0006
#define IMAGE_REL_M32R_ABSOLUTE &h0000
#define IMAGE_REL_M32R_ADDR32 &h0001
#define IMAGE_REL_M32R_ADDR32NB &h0002
#define IMAGE_REL_M32R_ADDR24 &h0003
#define IMAGE_REL_M32R_GPREL16 &h0004
#define IMAGE_REL_M32R_PCREL24 &h0005
#define IMAGE_REL_M32R_PCREL16 &h0006
#define IMAGE_REL_M32R_PCREL8 &h0007
#define IMAGE_REL_M32R_REFHALF &h0008
#define IMAGE_REL_M32R_REFHI &h0009
#define IMAGE_REL_M32R_REFLO &h000A
#define IMAGE_REL_M32R_PAIR &h000B
#define IMAGE_REL_M32R_SECTION &h000C
#define IMAGE_REL_M32R_SECREL32 &h000D
#define IMAGE_REL_M32R_TOKEN &h000E
#define IMAGE_REL_EBC_ABSOLUTE &h0000
#define IMAGE_REL_EBC_ADDR32NB &h0001
#define IMAGE_REL_EBC_REL32 &h0002
#define IMAGE_REL_EBC_SECTION &h0003
#define IMAGE_REL_EBC_SECREL &h0004

'' TODO: #define EXT_IMM64(Value,Address,Size,InstPos,ValPos) Value |= (((ULONGLONG)((*(Address) >> InstPos) & (((ULONGLONG)1 << Size) - 1))) << ValPos)
'' TODO: #define INS_IMM64(Value,Address,Size,InstPos,ValPos) *(PDWORD)Address = (*(PDWORD)Address & ~(((1 << Size) - 1) << InstPos)) | ((DWORD)((((ULONGLONG)Value >> ValPos) & (((ULONGLONG)1 << Size) - 1))) << InstPos)

#define EMARCH_ENC_I17_IMM7B_INST_WORD_X 3
#define EMARCH_ENC_I17_IMM7B_SIZE_X 7
#define EMARCH_ENC_I17_IMM7B_INST_WORD_POS_X 4
#define EMARCH_ENC_I17_IMM7B_VAL_POS_X 0
#define EMARCH_ENC_I17_IMM9D_INST_WORD_X 3
#define EMARCH_ENC_I17_IMM9D_SIZE_X 9
#define EMARCH_ENC_I17_IMM9D_INST_WORD_POS_X 18
#define EMARCH_ENC_I17_IMM9D_VAL_POS_X 7
#define EMARCH_ENC_I17_IMM5C_INST_WORD_X 3
#define EMARCH_ENC_I17_IMM5C_SIZE_X 5
#define EMARCH_ENC_I17_IMM5C_INST_WORD_POS_X 13
#define EMARCH_ENC_I17_IMM5C_VAL_POS_X 16
#define EMARCH_ENC_I17_IC_INST_WORD_X 3
#define EMARCH_ENC_I17_IC_SIZE_X 1
#define EMARCH_ENC_I17_IC_INST_WORD_POS_X 12
#define EMARCH_ENC_I17_IC_VAL_POS_X 21
#define EMARCH_ENC_I17_IMM41a_INST_WORD_X 1
#define EMARCH_ENC_I17_IMM41a_SIZE_X 10
#define EMARCH_ENC_I17_IMM41a_INST_WORD_POS_X 14
#define EMARCH_ENC_I17_IMM41a_VAL_POS_X 22
#define EMARCH_ENC_I17_IMM41b_INST_WORD_X 1
#define EMARCH_ENC_I17_IMM41b_SIZE_X 8
#define EMARCH_ENC_I17_IMM41b_INST_WORD_POS_X 24
#define EMARCH_ENC_I17_IMM41b_VAL_POS_X 32
#define EMARCH_ENC_I17_IMM41c_INST_WORD_X 2
#define EMARCH_ENC_I17_IMM41c_SIZE_X 23
#define EMARCH_ENC_I17_IMM41c_INST_WORD_POS_X 0
#define EMARCH_ENC_I17_IMM41c_VAL_POS_X 40
#define EMARCH_ENC_I17_SIGN_INST_WORD_X 3
#define EMARCH_ENC_I17_SIGN_SIZE_X 1
#define EMARCH_ENC_I17_SIGN_INST_WORD_POS_X 27
#define EMARCH_ENC_I17_SIGN_VAL_POS_X 63
#define X3_OPCODE_INST_WORD_X 3
#define X3_OPCODE_SIZE_X 4
#define X3_OPCODE_INST_WORD_POS_X 28
#define X3_OPCODE_SIGN_VAL_POS_X 0
#define X3_I_INST_WORD_X 3
#define X3_I_SIZE_X 1
#define X3_I_INST_WORD_POS_X 27
#define X3_I_SIGN_VAL_POS_X 59
#define X3_D_WH_INST_WORD_X 3
#define X3_D_WH_SIZE_X 3
#define X3_D_WH_INST_WORD_POS_X 24
#define X3_D_WH_SIGN_VAL_POS_X 0
#define X3_IMM20_INST_WORD_X 3
#define X3_IMM20_SIZE_X 20
#define X3_IMM20_INST_WORD_POS_X 4
#define X3_IMM20_SIGN_VAL_POS_X 0
#define X3_IMM39_1_INST_WORD_X 2
#define X3_IMM39_1_SIZE_X 23
#define X3_IMM39_1_INST_WORD_POS_X 0
#define X3_IMM39_1_SIGN_VAL_POS_X 36
#define X3_IMM39_2_INST_WORD_X 1
#define X3_IMM39_2_SIZE_X 16
#define X3_IMM39_2_INST_WORD_POS_X 16
#define X3_IMM39_2_SIGN_VAL_POS_X 20
#define X3_P_INST_WORD_X 3
#define X3_P_SIZE_X 4
#define X3_P_INST_WORD_POS_X 0
#define X3_P_SIGN_VAL_POS_X 0
#define X3_TMPLT_INST_WORD_X 0
#define X3_TMPLT_SIZE_X 4
#define X3_TMPLT_INST_WORD_POS_X 0
#define X3_TMPLT_SIGN_VAL_POS_X 0
#define X3_BTYPE_QP_INST_WORD_X 2
#define X3_BTYPE_QP_SIZE_X 9
#define X3_BTYPE_QP_INST_WORD_POS_X 23
#define X3_BTYPE_QP_INST_VAL_POS_X 0
#define X3_EMPTY_INST_WORD_X 1
#define X3_EMPTY_SIZE_X 2
#define X3_EMPTY_INST_WORD_POS_X 14
#define X3_EMPTY_INST_VAL_POS_X 0

union ___IMAGE_LINENUMBER_Type field = 2
	SymbolTableIndex as DWORD
	VirtualAddress as DWORD
end union

type _IMAGE_LINENUMBER field = 2
	as ___IMAGE_LINENUMBER_Type Type
	Linenumber as WORD
end type

type IMAGE_LINENUMBER as _IMAGE_LINENUMBER
type PIMAGE_LINENUMBER as IMAGE_LINENUMBER ptr

#define IMAGE_SIZEOF_LINENUMBER 6

type _IMAGE_BASE_RELOCATION field = 4
	VirtualAddress as DWORD
	SizeOfBlock as DWORD
end type

type IMAGE_BASE_RELOCATION as _IMAGE_BASE_RELOCATION
type PIMAGE_BASE_RELOCATION as IMAGE_BASE_RELOCATION ptr

#define IMAGE_SIZEOF_BASE_RELOCATION 8
#define IMAGE_REL_BASED_ABSOLUTE 0
#define IMAGE_REL_BASED_HIGH 1
#define IMAGE_REL_BASED_LOW 2
#define IMAGE_REL_BASED_HIGHLOW 3
#define IMAGE_REL_BASED_HIGHADJ 4
#define IMAGE_REL_BASED_MIPS_JMPADDR 5
#define IMAGE_REL_BASED_ARM_MOV32 5
#define IMAGE_REL_BASED_THUMB_MOV32 7
#define IMAGE_REL_BASED_MIPS_JMPADDR16 9
#define IMAGE_REL_BASED_IA64_IMM64 9
#define IMAGE_REL_BASED_DIR64 10
#define IMAGE_ARCHIVE_START_SIZE 8
#define IMAGE_ARCHIVE_START !"!<arch>\n"
#define IMAGE_ARCHIVE_END !"`\n"
#define IMAGE_ARCHIVE_PAD !"\n"
#define IMAGE_ARCHIVE_LINKER_MEMBER "/               "
#define IMAGE_ARCHIVE_LONGNAMES_MEMBER "//              "

type _IMAGE_ARCHIVE_MEMBER_HEADER field = 4
	Name(0 to 15) as BYTE
	Date(0 to 11) as BYTE
	UserID(0 to 5) as BYTE
	GroupID(0 to 5) as BYTE
	Mode(0 to 7) as BYTE
	Size(0 to 9) as BYTE
	EndHeader(0 to 1) as BYTE
end type

type IMAGE_ARCHIVE_MEMBER_HEADER as _IMAGE_ARCHIVE_MEMBER_HEADER
type PIMAGE_ARCHIVE_MEMBER_HEADER as _IMAGE_ARCHIVE_MEMBER_HEADER ptr

#define IMAGE_SIZEOF_ARCHIVE_MEMBER_HDR 60

type _IMAGE_EXPORT_DIRECTORY field = 4
	Characteristics as DWORD
	TimeDateStamp as DWORD
	MajorVersion as WORD
	MinorVersion as WORD
	Name as DWORD
	Base as DWORD
	NumberOfFunctions as DWORD
	NumberOfNames as DWORD
	AddressOfFunctions as DWORD
	AddressOfNames as DWORD
	AddressOfNameOrdinals as DWORD
end type

type IMAGE_EXPORT_DIRECTORY as _IMAGE_EXPORT_DIRECTORY
type PIMAGE_EXPORT_DIRECTORY as _IMAGE_EXPORT_DIRECTORY ptr

type _IMAGE_IMPORT_BY_NAME field = 4
	Hint as WORD
	Name(0 to 0) as BYTE
end type

type IMAGE_IMPORT_BY_NAME as _IMAGE_IMPORT_BY_NAME
type PIMAGE_IMPORT_BY_NAME as _IMAGE_IMPORT_BY_NAME ptr

union ___IMAGE_THUNK_DATA64_u1 field = 8
	ForwarderString as ULONGLONG
	Function as ULONGLONG
	Ordinal as ULONGLONG
	AddressOfData as ULONGLONG
end union

type _IMAGE_THUNK_DATA64 field = 8
	u1 as ___IMAGE_THUNK_DATA64_u1
end type

type IMAGE_THUNK_DATA64 as _IMAGE_THUNK_DATA64
type PIMAGE_THUNK_DATA64 as IMAGE_THUNK_DATA64 ptr

union ___IMAGE_THUNK_DATA32_u1 field = 4
	ForwarderString as DWORD
	Function as DWORD
	Ordinal as DWORD
	AddressOfData as DWORD
end union

type _IMAGE_THUNK_DATA32 field = 4
	u1 as ___IMAGE_THUNK_DATA32_u1
end type

type IMAGE_THUNK_DATA32 as _IMAGE_THUNK_DATA32
type PIMAGE_THUNK_DATA32 as IMAGE_THUNK_DATA32 ptr

#define IMAGE_ORDINAL_FLAG64 &h8000000000000000ull
#define IMAGE_ORDINAL_FLAG32 &h80000000
#define IMAGE_ORDINAL64(Ordinal) (Ordinal and &hffffull)
#define IMAGE_ORDINAL32(Ordinal) (Ordinal and &hffff)
#define IMAGE_SNAP_BY_ORDINAL64(Ordinal) ((Ordinal and IMAGE_ORDINAL_FLAG64) <> 0)
#define IMAGE_SNAP_BY_ORDINAL32(Ordinal) ((Ordinal and IMAGE_ORDINAL_FLAG32) <> 0)

type PIMAGE_TLS_CALLBACK as sub(byval DllHandle as PVOID, byval Reason as DWORD, byval Reserved as PVOID)

type _IMAGE_TLS_DIRECTORY64 field = 4
	StartAddressOfRawData as ULONGLONG
	EndAddressOfRawData as ULONGLONG
	AddressOfIndex as ULONGLONG
	AddressOfCallBacks as ULONGLONG
	SizeOfZeroFill as DWORD
	Characteristics as DWORD
end type

type IMAGE_TLS_DIRECTORY64 as _IMAGE_TLS_DIRECTORY64
type PIMAGE_TLS_DIRECTORY64 as IMAGE_TLS_DIRECTORY64 ptr

type _IMAGE_TLS_DIRECTORY32 field = 4
	StartAddressOfRawData as DWORD
	EndAddressOfRawData as DWORD
	AddressOfIndex as DWORD
	AddressOfCallBacks as DWORD
	SizeOfZeroFill as DWORD
	Characteristics as DWORD
end type

type IMAGE_TLS_DIRECTORY32 as _IMAGE_TLS_DIRECTORY32
type PIMAGE_TLS_DIRECTORY32 as IMAGE_TLS_DIRECTORY32 ptr

#ifdef __FB_64BIT__
	#define IMAGE_ORDINAL_FLAG IMAGE_ORDINAL_FLAG64
	#define IMAGE_ORDINAL(Ordinal) IMAGE_ORDINAL64(Ordinal)

	type IMAGE_THUNK_DATA as IMAGE_THUNK_DATA64
	type PIMAGE_THUNK_DATA as PIMAGE_THUNK_DATA64

	#define IMAGE_SNAP_BY_ORDINAL(Ordinal) IMAGE_SNAP_BY_ORDINAL64(Ordinal)

	type IMAGE_TLS_DIRECTORY as IMAGE_TLS_DIRECTORY64
	type PIMAGE_TLS_DIRECTORY as PIMAGE_TLS_DIRECTORY64
#else
	#define IMAGE_ORDINAL_FLAG IMAGE_ORDINAL_FLAG32
	#define IMAGE_ORDINAL(Ordinal) IMAGE_ORDINAL32(Ordinal)

	type IMAGE_THUNK_DATA as IMAGE_THUNK_DATA32
	type PIMAGE_THUNK_DATA as PIMAGE_THUNK_DATA32

	#define IMAGE_SNAP_BY_ORDINAL(Ordinal) IMAGE_SNAP_BY_ORDINAL32(Ordinal)

	type IMAGE_TLS_DIRECTORY as IMAGE_TLS_DIRECTORY32
	type PIMAGE_TLS_DIRECTORY as PIMAGE_TLS_DIRECTORY32
#endif

type _IMAGE_IMPORT_DESCRIPTOR field = 4
	union field = 4
		Characteristics as DWORD
		OriginalFirstThunk as DWORD
	end union

	TimeDateStamp as DWORD
	ForwarderChain as DWORD
	Name as DWORD
	FirstThunk as DWORD
end type

type IMAGE_IMPORT_DESCRIPTOR as _IMAGE_IMPORT_DESCRIPTOR
type PIMAGE_IMPORT_DESCRIPTOR as IMAGE_IMPORT_DESCRIPTOR ptr

type _IMAGE_BOUND_IMPORT_DESCRIPTOR field = 4
	TimeDateStamp as DWORD
	OffsetModuleName as WORD
	NumberOfModuleForwarderRefs as WORD
end type

type IMAGE_BOUND_IMPORT_DESCRIPTOR as _IMAGE_BOUND_IMPORT_DESCRIPTOR
type PIMAGE_BOUND_IMPORT_DESCRIPTOR as _IMAGE_BOUND_IMPORT_DESCRIPTOR ptr

type _IMAGE_BOUND_FORWARDER_REF field = 4
	TimeDateStamp as DWORD
	OffsetModuleName as WORD
	Reserved as WORD
end type

type IMAGE_BOUND_FORWARDER_REF as _IMAGE_BOUND_FORWARDER_REF
type PIMAGE_BOUND_FORWARDER_REF as _IMAGE_BOUND_FORWARDER_REF ptr

union ___IMAGE_DELAYLOAD_DESCRIPTOR_Attributes field = 4
	AllAttributes as DWORD

	type field = 4
		RvaBased : 1 as DWORD
		ReservedAttributes : 31 as DWORD
	end type
end union

type _IMAGE_DELAYLOAD_DESCRIPTOR field = 4
	Attributes as ___IMAGE_DELAYLOAD_DESCRIPTOR_Attributes
	DllNameRVA as DWORD
	ModuleHandleRVA as DWORD
	ImportAddressTableRVA as DWORD
	ImportNameTableRVA as DWORD
	BoundImportAddressTableRVA as DWORD
	UnloadInformationTableRVA as DWORD
	TimeDateStamp as DWORD
end type

type IMAGE_DELAYLOAD_DESCRIPTOR as _IMAGE_DELAYLOAD_DESCRIPTOR
type PIMAGE_DELAYLOAD_DESCRIPTOR as _IMAGE_DELAYLOAD_DESCRIPTOR ptr
type PCIMAGE_DELAYLOAD_DESCRIPTOR as const IMAGE_DELAYLOAD_DESCRIPTOR ptr

type _IMAGE_RESOURCE_DIRECTORY field = 4
	Characteristics as DWORD
	TimeDateStamp as DWORD
	MajorVersion as WORD
	MinorVersion as WORD
	NumberOfNamedEntries as WORD
	NumberOfIdEntries as WORD
end type

type IMAGE_RESOURCE_DIRECTORY as _IMAGE_RESOURCE_DIRECTORY
type PIMAGE_RESOURCE_DIRECTORY as _IMAGE_RESOURCE_DIRECTORY ptr

#define IMAGE_RESOURCE_NAME_IS_STRING &h80000000
#define IMAGE_RESOURCE_DATA_IS_DIRECTORY &h80000000

type _IMAGE_RESOURCE_DIRECTORY_ENTRY field = 4
	union field = 4
		type field = 4
			NameOffset : 31 as DWORD
			NameIsString : 1 as DWORD
		end type

		Name as DWORD
		Id as WORD
	end union

	union field = 4
		OffsetToData as DWORD

		type field = 4
			OffsetToDirectory : 31 as DWORD
			DataIsDirectory : 1 as DWORD
		end type
	end union
end type

type IMAGE_RESOURCE_DIRECTORY_ENTRY as _IMAGE_RESOURCE_DIRECTORY_ENTRY
type PIMAGE_RESOURCE_DIRECTORY_ENTRY as _IMAGE_RESOURCE_DIRECTORY_ENTRY ptr

type _IMAGE_RESOURCE_DIRECTORY_STRING field = 4
	Length as WORD
	NameString(0 to 0) as CHAR
end type

type IMAGE_RESOURCE_DIRECTORY_STRING as _IMAGE_RESOURCE_DIRECTORY_STRING
type PIMAGE_RESOURCE_DIRECTORY_STRING as _IMAGE_RESOURCE_DIRECTORY_STRING ptr

type _IMAGE_RESOURCE_DIR_STRING_U field = 4
	Length as WORD
	NameString(0 to 0) as WCHAR
end type

type IMAGE_RESOURCE_DIR_STRING_U as _IMAGE_RESOURCE_DIR_STRING_U
type PIMAGE_RESOURCE_DIR_STRING_U as _IMAGE_RESOURCE_DIR_STRING_U ptr

type _IMAGE_RESOURCE_DATA_ENTRY field = 4
	OffsetToData as DWORD
	Size as DWORD
	CodePage as DWORD
	Reserved as DWORD
end type

type IMAGE_RESOURCE_DATA_ENTRY as _IMAGE_RESOURCE_DATA_ENTRY
type PIMAGE_RESOURCE_DATA_ENTRY as _IMAGE_RESOURCE_DATA_ENTRY ptr

type IMAGE_LOAD_CONFIG_DIRECTORY32 field = 4
	Size as DWORD
	TimeDateStamp as DWORD
	MajorVersion as WORD
	MinorVersion as WORD
	GlobalFlagsClear as DWORD
	GlobalFlagsSet as DWORD
	CriticalSectionDefaultTimeout as DWORD
	DeCommitFreeBlockThreshold as DWORD
	DeCommitTotalFreeThreshold as DWORD
	LockPrefixTable as DWORD
	MaximumAllocationSize as DWORD
	VirtualMemoryThreshold as DWORD
	ProcessHeapFlags as DWORD
	ProcessAffinityMask as DWORD
	CSDVersion as WORD
	Reserved1 as WORD
	EditList as DWORD
	SecurityCookie as DWORD
	SEHandlerTable as DWORD
	SEHandlerCount as DWORD
end type

type PIMAGE_LOAD_CONFIG_DIRECTORY32 as IMAGE_LOAD_CONFIG_DIRECTORY32 ptr

type IMAGE_LOAD_CONFIG_DIRECTORY64 field = 4
	Size as DWORD
	TimeDateStamp as DWORD
	MajorVersion as WORD
	MinorVersion as WORD
	GlobalFlagsClear as DWORD
	GlobalFlagsSet as DWORD
	CriticalSectionDefaultTimeout as DWORD
	DeCommitFreeBlockThreshold as ULONGLONG
	DeCommitTotalFreeThreshold as ULONGLONG
	LockPrefixTable as ULONGLONG
	MaximumAllocationSize as ULONGLONG
	VirtualMemoryThreshold as ULONGLONG
	ProcessAffinityMask as ULONGLONG
	ProcessHeapFlags as DWORD
	CSDVersion as WORD
	Reserved1 as WORD
	EditList as ULONGLONG
	SecurityCookie as ULONGLONG
	SEHandlerTable as ULONGLONG
	SEHandlerCount as ULONGLONG
end type

type PIMAGE_LOAD_CONFIG_DIRECTORY64 as IMAGE_LOAD_CONFIG_DIRECTORY64 ptr

#ifdef __FB_64BIT__
	type IMAGE_LOAD_CONFIG_DIRECTORY as IMAGE_LOAD_CONFIG_DIRECTORY64
	type PIMAGE_LOAD_CONFIG_DIRECTORY as PIMAGE_LOAD_CONFIG_DIRECTORY64
#else
	type IMAGE_LOAD_CONFIG_DIRECTORY as IMAGE_LOAD_CONFIG_DIRECTORY32
	type PIMAGE_LOAD_CONFIG_DIRECTORY as PIMAGE_LOAD_CONFIG_DIRECTORY32
#endif

type _IMAGE_CE_RUNTIME_FUNCTION_ENTRY field = 4
	FuncStart as DWORD
	PrologLen : 8 as DWORD
	FuncLen : 22 as DWORD
	ThirtyTwoBit : 1 as DWORD
	ExceptionFlag : 1 as DWORD
end type

type IMAGE_CE_RUNTIME_FUNCTION_ENTRY as _IMAGE_CE_RUNTIME_FUNCTION_ENTRY
type PIMAGE_CE_RUNTIME_FUNCTION_ENTRY as _IMAGE_CE_RUNTIME_FUNCTION_ENTRY ptr

type _IMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY field = 4
	BeginAddress as ULONGLONG
	EndAddress as ULONGLONG
	ExceptionHandler as ULONGLONG
	HandlerData as ULONGLONG
	PrologEndAddress as ULONGLONG
end type

type IMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY as _IMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY
type PIMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY as _IMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY ptr

type _IMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY field = 4
	BeginAddress as DWORD
	EndAddress as DWORD
	ExceptionHandler as DWORD
	HandlerData as DWORD
	PrologEndAddress as DWORD
end type

type IMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY as _IMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY
type PIMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY as _IMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY ptr

type _IMAGE_ARM_RUNTIME_FUNCTION_ENTRY field = 4
	BeginAddress as DWORD

	union field = 4
		UnwindData as DWORD

		type field = 4
			Flag : 2 as DWORD
			FunctionLength : 11 as DWORD
			Ret : 2 as DWORD
			H : 1 as DWORD
			Reg : 3 as DWORD
			R : 1 as DWORD
			L : 1 as DWORD
			C : 1 as DWORD
			StackAdjust : 10 as DWORD
		end type
	end union
end type

type IMAGE_ARM_RUNTIME_FUNCTION_ENTRY as _IMAGE_ARM_RUNTIME_FUNCTION_ENTRY
type PIMAGE_ARM_RUNTIME_FUNCTION_ENTRY as _IMAGE_ARM_RUNTIME_FUNCTION_ENTRY ptr

type _IMAGE_RUNTIME_FUNCTION_ENTRY field = 4
	BeginAddress as DWORD
	EndAddress as DWORD

	union field = 4
		UnwindInfoAddress as DWORD
		UnwindData as DWORD
	end union
end type

type _PIMAGE_RUNTIME_FUNCTION_ENTRY as _IMAGE_RUNTIME_FUNCTION_ENTRY ptr
type IMAGE_IA64_RUNTIME_FUNCTION_ENTRY as _IMAGE_RUNTIME_FUNCTION_ENTRY
type PIMAGE_IA64_RUNTIME_FUNCTION_ENTRY as _PIMAGE_RUNTIME_FUNCTION_ENTRY
type IMAGE_RUNTIME_FUNCTION_ENTRY as _IMAGE_RUNTIME_FUNCTION_ENTRY
type PIMAGE_RUNTIME_FUNCTION_ENTRY as _PIMAGE_RUNTIME_FUNCTION_ENTRY

type _IMAGE_DEBUG_DIRECTORY field = 4
	Characteristics as DWORD
	TimeDateStamp as DWORD
	MajorVersion as WORD
	MinorVersion as WORD
	as DWORD Type
	SizeOfData as DWORD
	AddressOfRawData as DWORD
	PointerToRawData as DWORD
end type

type IMAGE_DEBUG_DIRECTORY as _IMAGE_DEBUG_DIRECTORY
type PIMAGE_DEBUG_DIRECTORY as _IMAGE_DEBUG_DIRECTORY ptr

#define IMAGE_DEBUG_TYPE_UNKNOWN 0
#define IMAGE_DEBUG_TYPE_COFF 1
#define IMAGE_DEBUG_TYPE_CODEVIEW 2
#define IMAGE_DEBUG_TYPE_FPO 3
#define IMAGE_DEBUG_TYPE_MISC 4
#define IMAGE_DEBUG_TYPE_EXCEPTION 5
#define IMAGE_DEBUG_TYPE_FIXUP 6
#define IMAGE_DEBUG_TYPE_OMAP_TO_SRC 7
#define IMAGE_DEBUG_TYPE_OMAP_FROM_SRC 8
#define IMAGE_DEBUG_TYPE_BORLAND 9
#define IMAGE_DEBUG_TYPE_RESERVED10 10
#define IMAGE_DEBUG_TYPE_CLSID 11

type _IMAGE_COFF_SYMBOLS_HEADER field = 4
	NumberOfSymbols as DWORD
	LvaToFirstSymbol as DWORD
	NumberOfLinenumbers as DWORD
	LvaToFirstLinenumber as DWORD
	RvaToFirstByteOfCode as DWORD
	RvaToLastByteOfCode as DWORD
	RvaToFirstByteOfData as DWORD
	RvaToLastByteOfData as DWORD
end type

type IMAGE_COFF_SYMBOLS_HEADER as _IMAGE_COFF_SYMBOLS_HEADER
type PIMAGE_COFF_SYMBOLS_HEADER as _IMAGE_COFF_SYMBOLS_HEADER ptr

#define FRAME_FPO 0
#define FRAME_TRAP 1
#define FRAME_TSS 2
#define FRAME_NONFPO 3

type _FPO_DATA field = 4
	ulOffStart as DWORD
	cbProcSize as DWORD
	cdwLocals as DWORD
	cdwParams as WORD
	cbProlog : 8 as WORD
	cbRegs : 3 as WORD
	fHasSEH : 1 as WORD
	fUseBP : 1 as WORD
	reserved : 1 as WORD
	cbFrame : 2 as WORD
end type

type FPO_DATA as _FPO_DATA
type PFPO_DATA as _FPO_DATA ptr

#define SIZEOF_RFPO_DATA 16
#define IMAGE_DEBUG_MISC_EXENAME 1

type _IMAGE_DEBUG_MISC field = 4
	DataType as DWORD
	Length as DWORD
	Unicode as BOOLEAN
	Reserved(0 to 2) as BYTE
	Data(0 to 0) as BYTE
end type

type IMAGE_DEBUG_MISC as _IMAGE_DEBUG_MISC
type PIMAGE_DEBUG_MISC as _IMAGE_DEBUG_MISC ptr

type _IMAGE_FUNCTION_ENTRY field = 4
	StartingAddress as DWORD
	EndingAddress as DWORD
	EndOfPrologue as DWORD
end type

type IMAGE_FUNCTION_ENTRY as _IMAGE_FUNCTION_ENTRY
type PIMAGE_FUNCTION_ENTRY as _IMAGE_FUNCTION_ENTRY ptr

type _IMAGE_FUNCTION_ENTRY64 field = 4
	StartingAddress as ULONGLONG
	EndingAddress as ULONGLONG

	union field = 4
		EndOfPrologue as ULONGLONG
		UnwindInfoAddress as ULONGLONG
	end union
end type

type IMAGE_FUNCTION_ENTRY64 as _IMAGE_FUNCTION_ENTRY64
type PIMAGE_FUNCTION_ENTRY64 as _IMAGE_FUNCTION_ENTRY64 ptr

type _IMAGE_SEPARATE_DEBUG_HEADER field = 4
	Signature as WORD
	Flags as WORD
	Machine as WORD
	Characteristics as WORD
	TimeDateStamp as DWORD
	CheckSum as DWORD
	ImageBase as DWORD
	SizeOfImage as DWORD
	NumberOfSections as DWORD
	ExportedNamesSize as DWORD
	DebugDirectorySize as DWORD
	SectionAlignment as DWORD
	Reserved(0 to 1) as DWORD
end type

type IMAGE_SEPARATE_DEBUG_HEADER as _IMAGE_SEPARATE_DEBUG_HEADER
type PIMAGE_SEPARATE_DEBUG_HEADER as _IMAGE_SEPARATE_DEBUG_HEADER ptr

type _NON_PAGED_DEBUG_INFO field = 4
	Signature as WORD
	Flags as WORD
	Size as DWORD
	Machine as WORD
	Characteristics as WORD
	TimeDateStamp as DWORD
	CheckSum as DWORD
	SizeOfImage as DWORD
	ImageBase as ULONGLONG
end type

type NON_PAGED_DEBUG_INFO as _NON_PAGED_DEBUG_INFO
type PNON_PAGED_DEBUG_INFO as _NON_PAGED_DEBUG_INFO ptr

#define IMAGE_SEPARATE_DEBUG_SIGNATURE &h4944
#define NON_PAGED_DEBUG_SIGNATURE &h494E
#define IMAGE_SEPARATE_DEBUG_FLAGS_MASK &h8000
#define IMAGE_SEPARATE_DEBUG_MISMATCH &h8000

type _ImageArchitectureHeader field = 4
	AmaskValue : 1 as ulong
	Adummy1 : 7 as long
	AmaskShift : 8 as ulong
	Adummy2 : 16 as long
	FirstEntryRVA as DWORD
end type

type IMAGE_ARCHITECTURE_HEADER as _ImageArchitectureHeader
type PIMAGE_ARCHITECTURE_HEADER as _ImageArchitectureHeader ptr

type _ImageArchitectureEntry field = 4
	FixupInstRVA as DWORD
	NewInst as DWORD
end type

type IMAGE_ARCHITECTURE_ENTRY as _ImageArchitectureEntry
type PIMAGE_ARCHITECTURE_ENTRY as _ImageArchitectureEntry ptr

type IMPORT_OBJECT_HEADER
	Sig1 as WORD
	Sig2 as WORD
	Version as WORD
	Machine as WORD
	TimeDateStamp as DWORD
	SizeOfData as DWORD

	union
		Ordinal as WORD
		Hint as WORD
	end union

	as WORD Type : 2
	NameType : 3 as WORD
	Reserved : 11 as WORD
end type

#define IMPORT_OBJECT_HDR_SIG2 &hffff

type IMPORT_OBJECT_TYPE as long
enum
	IMPORT_OBJECT_CODE = 0
	IMPORT_OBJECT_DATA = 1
	IMPORT_OBJECT_CONST = 2
end enum

type IMPORT_OBJECT_NAME_TYPE as long
enum
	IMPORT_OBJECT_ORDINAL = 0
	IMPORT_OBJECT_NAME = 1
	IMPORT_OBJECT_NAME_NO_PREFIX = 2
	IMPORT_OBJECT_NAME_UNDECORATE = 3
end enum

#define __IMAGE_COR20_HEADER_DEFINED__

type ReplacesCorHdrNumericDefines as long
enum
	COMIMAGE_FLAGS_ILONLY = &h00000001
	COMIMAGE_FLAGS_32BITREQUIRED = &h00000002
	COMIMAGE_FLAGS_IL_LIBRARY = &h00000004
	COMIMAGE_FLAGS_STRONGNAMESIGNED = &h00000008
	COMIMAGE_FLAGS_TRACKDEBUGDATA = &h00010000
	COR_VERSION_MAJOR_V2 = 2
	COR_VERSION_MAJOR = COR_VERSION_MAJOR_V2
	COR_VERSION_MINOR = 0
	COR_DELETED_NAME_LENGTH = 8
	COR_VTABLEGAP_NAME_LENGTH = 8
	NATIVE_TYPE_MAX_CB = 1
	COR_ILMETHOD_SECT_SMALL_MAX_DATASIZE = &hFF
	IMAGE_COR_MIH_METHODRVA = &h01
	IMAGE_COR_MIH_EHRVA = &h02
	IMAGE_COR_MIH_BASICBLOCK = &h08
	COR_VTABLE_32BIT = &h01
	COR_VTABLE_64BIT = &h02
	COR_VTABLE_FROM_UNMANAGED = &h04
	COR_VTABLE_CALL_MOST_DERIVED = &h10
	IMAGE_COR_EATJ_THUNK_SIZE = 32
	MAX_CLASS_NAME = 1024
	MAX_PACKAGE_NAME = 1024
end enum

type IMAGE_COR20_HEADER
	cb as DWORD
	MajorRuntimeVersion as WORD
	MinorRuntimeVersion as WORD
	MetaData as IMAGE_DATA_DIRECTORY
	Flags as DWORD

	union
		EntryPointToken as DWORD
		EntryPointRVA as DWORD
	end union

	Resources as IMAGE_DATA_DIRECTORY
	StrongNameSignature as IMAGE_DATA_DIRECTORY
	CodeManagerTable as IMAGE_DATA_DIRECTORY
	VTableFixups as IMAGE_DATA_DIRECTORY
	ExportAddressTableJumps as IMAGE_DATA_DIRECTORY
	ManagedNativeHeader as IMAGE_DATA_DIRECTORY
end type

type PIMAGE_COR20_HEADER as IMAGE_COR20_HEADER ptr

declare function RtlCaptureStackBackTrace(byval FramesToSkip as DWORD, byval FramesToCapture as DWORD, byval BackTrace as PVOID ptr, byval BackTraceHash as PDWORD) as WORD
declare sub RtlCaptureContext(byval ContextRecord as PCONTEXT)
declare function RtlCompareMemory(byval Source1 as const any ptr, byval Source2 as const any ptr, byval Length as SIZE_T_) as SIZE_T_

#ifdef __FB_64BIT__
	declare function RtlAddFunctionTable(byval FunctionTable as PRUNTIME_FUNCTION, byval EntryCount as DWORD, byval BaseAddress as DWORD64) as BOOLEAN
	declare function RtlDeleteFunctionTable(byval FunctionTable as PRUNTIME_FUNCTION) as BOOLEAN
	declare function RtlInstallFunctionTableCallback(byval TableIdentifier as DWORD64, byval BaseAddress as DWORD64, byval Length as DWORD, byval Callback as PGET_RUNTIME_FUNCTION_CALLBACK, byval Context as PVOID, byval OutOfProcessCallbackDll as PCWSTR) as BOOLEAN
	declare sub RtlRestoreContext(byval ContextRecord as PCONTEXT, byval ExceptionRecord as _EXCEPTION_RECORD ptr)
	declare function RtlVirtualUnwind(byval HandlerType as DWORD, byval ImageBase as DWORD64, byval ControlPc as DWORD64, byval FunctionEntry as PRUNTIME_FUNCTION, byval ContextRecord as PCONTEXT, byval HandlerData as PVOID ptr, byval EstablisherFrame as PDWORD64, byval ContextPointers as PKNONVOLATILE_CONTEXT_POINTERS) as PEXCEPTION_ROUTINE
#endif

declare sub RtlUnwind(byval TargetFrame as PVOID, byval TargetIp as PVOID, byval ExceptionRecord as PEXCEPTION_RECORD, byval ReturnValue as PVOID)
declare function RtlPcToFileHeader(byval PcValue as PVOID, byval BaseOfImage as PVOID ptr) as PVOID

#ifdef __FB_64BIT__
	declare function RtlLookupFunctionEntry(byval ControlPc as DWORD64, byval ImageBase as PDWORD64, byval HistoryTable as PUNWIND_HISTORY_TABLE) as PRUNTIME_FUNCTION
	declare sub RtlUnwindEx(byval TargetFrame as PVOID, byval TargetIp as PVOID, byval ExceptionRecord as PEXCEPTION_RECORD, byval ReturnValue as PVOID, byval ContextRecord as PCONTEXT, byval HistoryTable as PUNWIND_HISTORY_TABLE)
#endif

#define _SLIST_HEADER_

#ifdef __FB_64BIT__
	type _SLIST_ENTRY
		Next as _SLIST_ENTRY ptr
	end type

	type SLIST_ENTRY as _SLIST_ENTRY
	type PSLIST_ENTRY as _SLIST_ENTRY ptr

	type ___SLIST_HEADER_Header8
		Depth : 16 as ULONGLONG
		Sequence : 9 as ULONGLONG
		NextEntry : 39 as ULONGLONG
		HeaderType : 1 as ULONGLONG
		Init : 1 as ULONGLONG
		Reserved : 59 as ULONGLONG
		Region : 3 as ULONGLONG
	end type

	type ___SLIST_HEADER_HeaderX64
		Depth : 16 as ULONGLONG
		Sequence : 48 as ULONGLONG
		HeaderType : 1 as ULONGLONG
		Reserved : 3 as ULONGLONG
		NextEntry : 60 as ULONGLONG
	end type
#else
	type SLIST_ENTRY as _SINGLE_LIST_ENTRY
	type PSLIST_ENTRY as _SINGLE_LIST_ENTRY ptr
#endif

union _SLIST_HEADER
	#ifndef __FB_64BIT__
		Alignment as ULONGLONG
	#endif

	type
		#ifdef __FB_64BIT__
			Alignment as ULONGLONG
			Region as ULONGLONG
		#else
			Next as SLIST_ENTRY
			Depth as WORD
			Sequence as WORD
		#endif
	end type

	#ifdef __FB_64BIT__
		Header8 as ___SLIST_HEADER_Header8
		HeaderX64 as ___SLIST_HEADER_HeaderX64
	#endif
end union

type SLIST_HEADER as _SLIST_HEADER
type PSLIST_HEADER as _SLIST_HEADER ptr

declare sub RtlInitializeSListHead(byval ListHead as PSLIST_HEADER)
declare function RtlFirstEntrySList(byval ListHead as const SLIST_HEADER ptr) as PSLIST_ENTRY
declare function RtlInterlockedPopEntrySList(byval ListHead as PSLIST_HEADER) as PSLIST_ENTRY
declare function RtlInterlockedPushEntrySList(byval ListHead as PSLIST_HEADER, byval ListEntry as PSLIST_ENTRY) as PSLIST_ENTRY
declare function RtlInterlockedPushListSListEx(byval ListHead as PSLIST_HEADER, byval List as PSLIST_ENTRY, byval ListEnd as PSLIST_ENTRY, byval Count as DWORD) as PSLIST_ENTRY
declare function RtlInterlockedFlushSList(byval ListHead as PSLIST_HEADER) as PSLIST_ENTRY
declare function RtlQueryDepthSList(byval ListHead as PSLIST_HEADER) as WORD

#define _RTL_RUN_ONCE_DEF 1

type _RTL_RUN_ONCE
	Ptr as PVOID
end type

type RTL_RUN_ONCE as _RTL_RUN_ONCE
type PRTL_RUN_ONCE as _RTL_RUN_ONCE ptr

'' TODO: typedef DWORD (WINAPI *PRTL_RUN_ONCE_INIT_FN)(PRTL_RUN_ONCE, PVOID, PVOID *);

#define RTL_RUN_ONCE_INIT (0)
#define RTL_RUN_ONCE_CHECK_ONLY __MSABI_LONG(1)
#define RTL_RUN_ONCE_ASYNC __MSABI_LONG(2)
#define RTL_RUN_ONCE_INIT_FAILED __MSABI_LONG(4)
#define RTL_RUN_ONCE_CTX_RESERVED_BITS 2

type _RTL_BARRIER
	Reserved1 as DWORD
	Reserved2 as DWORD
	Reserved3(0 to 1) as ULONG_PTR
	Reserved4 as DWORD
	Reserved5 as DWORD
end type

type RTL_BARRIER as _RTL_BARRIER
type PRTL_BARRIER as _RTL_BARRIER ptr

#define FAST_FAIL_LEGACY_GS_VIOLATION 0
#define FAST_FAIL_VTGUARD_CHECK_FAILURE 1
#define FAST_FAIL_STACK_COOKIE_CHECK_FAILURE 2
#define FAST_FAIL_CORRUPT_LIST_ENTRY 3
#define FAST_FAIL_INCORRECT_STACK 4
#define FAST_FAIL_INVALID_ARG 5
#define FAST_FAIL_GS_COOKIE_INIT 6
#define FAST_FAIL_FATAL_APP_EXIT 7
#define FAST_FAIL_RANGE_CHECK_FAILURE 8
#define FAST_FAIL_UNSAFE_REGISTRY_ACCESS 9
#define FAST_FAIL_INVALID_FAST_FAIL_CODE &hffffffff
#define HEAP_NO_SERIALIZE &h00000001
#define HEAP_GROWABLE &h00000002
#define HEAP_GENERATE_EXCEPTIONS &h00000004
#define HEAP_ZERO_MEMORY &h00000008
#define HEAP_REALLOC_IN_PLACE_ONLY &h00000010
#define HEAP_TAIL_CHECKING_ENABLED &h00000020
#define HEAP_FREE_CHECKING_ENABLED &h00000040
#define HEAP_DISABLE_COALESCE_ON_FREE &h00000080
#define HEAP_CREATE_ALIGN_16 &h00010000
#define HEAP_CREATE_ENABLE_TRACING &h00020000
#define HEAP_CREATE_ENABLE_EXECUTE &h00040000
#define HEAP_MAXIMUM_TAG &h0FFF
#define HEAP_PSEUDO_TAG_FLAG &h8000
#define HEAP_TAG_SHIFT 18

'' TODO: #define HEAP_MAKE_TAG_FLAGS(b,o) ((DWORD)((b) + ((o) << 18)))

#define IS_TEXT_UNICODE_ASCII16 &h0001
#define IS_TEXT_UNICODE_REVERSE_ASCII16 &h0010
#define IS_TEXT_UNICODE_STATISTICS &h0002
#define IS_TEXT_UNICODE_REVERSE_STATISTICS &h0020
#define IS_TEXT_UNICODE_CONTROLS &h0004
#define IS_TEXT_UNICODE_REVERSE_CONTROLS &h0040
#define IS_TEXT_UNICODE_SIGNATURE &h0008
#define IS_TEXT_UNICODE_REVERSE_SIGNATURE &h0080
#define IS_TEXT_UNICODE_ILLEGAL_CHARS &h0100
#define IS_TEXT_UNICODE_ODD_LENGTH &h0200
#define IS_TEXT_UNICODE_DBCS_LEADBYTE &h0400
#define IS_TEXT_UNICODE_NULL_BYTES &h1000
#define IS_TEXT_UNICODE_UNICODE_MASK &h000F
#define IS_TEXT_UNICODE_REVERSE_MASK &h00F0
#define IS_TEXT_UNICODE_NOT_UNICODE_MASK &h0F00
#define IS_TEXT_UNICODE_NOT_ASCII_MASK &hF000
#define COMPRESSION_FORMAT_NONE &h0000
#define COMPRESSION_FORMAT_DEFAULT &h0001
#define COMPRESSION_FORMAT_LZNT1 &h0002
#define COMPRESSION_FORMAT_XPRESS &h0003
#define COMPRESSION_FORMAT_XPRESS_HUFF &h0004
#define COMPRESSION_ENGINE_STANDARD &h0000
#define COMPRESSION_ENGINE_MAXIMUM &h0100
#define COMPRESSION_ENGINE_HIBER &h0200
#define RtlEqualMemory(Destination, Source, Length) (memcmp((Destination), (Source), (Length)) = 0)
#define RtlMoveMemory(Destination, Source, Length) memmove((Destination), (Source), (Length))
#define RtlCopyMemory(Destination, Source, Length) memcpy((Destination), (Source), (Length))
#define RtlFillMemory(Destination, Length, Fill) memset((Destination), (Fill), (Length))
#define RtlZeroMemory(Destination, Length) memset((Destination), 0, (Length))

extern     WINAPI as PVOID
dim shared WINAPI as PVOID

'' TODO: PVOID WINAPI RtlSecureZeroMemory(PVOID ptr,SIZE_T cnt);

type _MESSAGE_RESOURCE_ENTRY
	Length as WORD
	Flags as WORD
	Text(0 to 0) as BYTE
end type

type MESSAGE_RESOURCE_ENTRY as _MESSAGE_RESOURCE_ENTRY
type PMESSAGE_RESOURCE_ENTRY as _MESSAGE_RESOURCE_ENTRY ptr

#define SEF_DACL_AUTO_INHERIT &h01
#define SEF_SACL_AUTO_INHERIT &h02
#define SEF_DEFAULT_DESCRIPTOR_FOR_OBJECT &h04
#define SEF_AVOID_PRIVILEGE_CHECK &h08
#define SEF_AVOID_OWNER_CHECK &h10
#define SEF_DEFAULT_OWNER_FROM_PARENT &h20
#define SEF_DEFAULT_GROUP_FROM_PARENT &h40
#define SEF_MACL_NO_WRITE_UP &h100
#define SEF_MACL_NO_READ_UP &h200
#define SEF_MACL_NO_EXECUTE_UP &h400
#define SEF_AVOID_OWNER_RESTRICTION &h1000
#define SEF_MACL_VALID_FLAGS ((SEF_MACL_NO_WRITE_UP or SEF_MACL_NO_READ_UP) or SEF_MACL_NO_EXECUTE_UP)
#define MESSAGE_RESOURCE_UNICODE &h0001

type _MESSAGE_RESOURCE_BLOCK
	LowId as DWORD
	HighId as DWORD
	OffsetToEntries as DWORD
end type

type MESSAGE_RESOURCE_BLOCK as _MESSAGE_RESOURCE_BLOCK
type PMESSAGE_RESOURCE_BLOCK as _MESSAGE_RESOURCE_BLOCK ptr

type _MESSAGE_RESOURCE_DATA
	NumberOfBlocks as DWORD
	Blocks(0 to 0) as MESSAGE_RESOURCE_BLOCK
end type

type MESSAGE_RESOURCE_DATA as _MESSAGE_RESOURCE_DATA
type PMESSAGE_RESOURCE_DATA as _MESSAGE_RESOURCE_DATA ptr

type _OSVERSIONINFOA
	dwOSVersionInfoSize as DWORD
	dwMajorVersion as DWORD
	dwMinorVersion as DWORD
	dwBuildNumber as DWORD
	dwPlatformId as DWORD
	szCSDVersion(0 to 127) as CHAR
end type

type OSVERSIONINFOA as _OSVERSIONINFOA
type POSVERSIONINFOA as _OSVERSIONINFOA ptr
type LPOSVERSIONINFOA as _OSVERSIONINFOA ptr

type _OSVERSIONINFOW
	dwOSVersionInfoSize as DWORD
	dwMajorVersion as DWORD
	dwMinorVersion as DWORD
	dwBuildNumber as DWORD
	dwPlatformId as DWORD
	szCSDVersion(0 to 127) as WCHAR
end type

type OSVERSIONINFOW as _OSVERSIONINFOW
type POSVERSIONINFOW as _OSVERSIONINFOW ptr
type LPOSVERSIONINFOW as _OSVERSIONINFOW ptr
type RTL_OSVERSIONINFOW as _OSVERSIONINFOW
type PRTL_OSVERSIONINFOW as _OSVERSIONINFOW ptr

#ifdef UNICODE
	type OSVERSIONINFO as OSVERSIONINFOW
	type POSVERSIONINFO as POSVERSIONINFOW
	type LPOSVERSIONINFO as LPOSVERSIONINFOW
#else
	type OSVERSIONINFO as OSVERSIONINFOA
	type POSVERSIONINFO as POSVERSIONINFOA
	type LPOSVERSIONINFO as LPOSVERSIONINFOA
#endif

type _OSVERSIONINFOEXA
	dwOSVersionInfoSize as DWORD
	dwMajorVersion as DWORD
	dwMinorVersion as DWORD
	dwBuildNumber as DWORD
	dwPlatformId as DWORD
	szCSDVersion(0 to 127) as CHAR
	wServicePackMajor as WORD
	wServicePackMinor as WORD
	wSuiteMask as WORD
	wProductType as BYTE
	wReserved as BYTE
end type

type OSVERSIONINFOEXA as _OSVERSIONINFOEXA
type POSVERSIONINFOEXA as _OSVERSIONINFOEXA ptr
type LPOSVERSIONINFOEXA as _OSVERSIONINFOEXA ptr

type _OSVERSIONINFOEXW
	dwOSVersionInfoSize as DWORD
	dwMajorVersion as DWORD
	dwMinorVersion as DWORD
	dwBuildNumber as DWORD
	dwPlatformId as DWORD
	szCSDVersion(0 to 127) as WCHAR
	wServicePackMajor as WORD
	wServicePackMinor as WORD
	wSuiteMask as WORD
	wProductType as BYTE
	wReserved as BYTE
end type

type OSVERSIONINFOEXW as _OSVERSIONINFOEXW
type POSVERSIONINFOEXW as _OSVERSIONINFOEXW ptr
type LPOSVERSIONINFOEXW as _OSVERSIONINFOEXW ptr
type RTL_OSVERSIONINFOEXW as _OSVERSIONINFOEXW
type PRTL_OSVERSIONINFOEXW as _OSVERSIONINFOEXW ptr

#ifdef UNICODE
	type OSVERSIONINFOEX as OSVERSIONINFOEXW
	type POSVERSIONINFOEX as POSVERSIONINFOEXW
	type LPOSVERSIONINFOEX as LPOSVERSIONINFOEXW
#else
	type OSVERSIONINFOEX as OSVERSIONINFOEXA
	type POSVERSIONINFOEX as POSVERSIONINFOEXA
	type LPOSVERSIONINFOEX as LPOSVERSIONINFOEXA
#endif

#define VER_EQUAL 1
#define VER_GREATER 2
#define VER_GREATER_EQUAL 3
#define VER_LESS 4
#define VER_LESS_EQUAL 5
#define VER_AND 6
#define VER_OR 7
#define VER_CONDITION_MASK 7
#define VER_NUM_BITS_PER_CONDITION_MASK 3
#define VER_MINORVERSION &h0000001
#define VER_MAJORVERSION &h0000002
#define VER_BUILDNUMBER &h0000004
#define VER_PLATFORMID &h0000008
#define VER_SERVICEPACKMINOR &h0000010
#define VER_SERVICEPACKMAJOR &h0000020
#define VER_SUITENAME &h0000040
#define VER_PRODUCT_TYPE &h0000080
#define VER_NT_WORKSTATION &h0000001
#define VER_NT_DOMAIN_CONTROLLER &h0000002
#define VER_NT_SERVER &h0000003
#define VER_PLATFORM_WIN32s 0
#define VER_PLATFORM_WIN32_WINDOWS 1
#define VER_PLATFORM_WIN32_NT 2

declare function VerSetConditionMask(byval ConditionMask as ULONGLONG, byval TypeMask as DWORD, byval Condition as BYTE) as ULONGLONG

'' TODO: #define VER_SET_CONDITION(_m_,_t_,_c_) ((_m_) = VerSetConditionMask((_m_),(_t_),(_c_)))

#define RTL_UMS_VERSION &h0100

type _RTL_UMS_THREAD_INFO_CLASS as long
enum
	UmsThreadInvalidInfoClass = 0
	UmsThreadUserContext
	UmsThreadPriority
	UmsThreadAffinity
	UmsThreadTeb
	UmsThreadIsSuspended
	UmsThreadIsTerminated
	UmsThreadMaxInfoClass
end enum

type RTL_UMS_THREAD_INFO_CLASS as _RTL_UMS_THREAD_INFO_CLASS
type PRTL_UMS_THREAD_INFO_CLASS as _RTL_UMS_THREAD_INFO_CLASS ptr

type _RTL_UMS_SCHEDULER_REASON as long
enum
	UmsSchedulerStartup = 0
	UmsSchedulerThreadBlocked
	UmsSchedulerThreadYield
end enum

type RTL_UMS_SCHEDULER_REASON as _RTL_UMS_SCHEDULER_REASON
type PRTL_UMS_SCHEDULER_REASON as _RTL_UMS_SCHEDULER_REASON ptr
type PRTL_UMS_SCHEDULER_ENTRY_POINT as sub(byval Reason as RTL_UMS_SCHEDULER_REASON, byval ActivationPayload as ULONG_PTR, byval SchedulerParam as PVOID)

type _RTL_CRITICAL_SECTION_DEBUG
	as WORD Type
	CreatorBackTraceIndex as WORD
	CriticalSection as _RTL_CRITICAL_SECTION ptr
	ProcessLocksList as LIST_ENTRY
	EntryCount as DWORD
	ContentionCount as DWORD
	Flags as DWORD
	CreatorBackTraceIndexHigh as WORD
	SpareWORD as WORD
end type

type RTL_CRITICAL_SECTION_DEBUG as _RTL_CRITICAL_SECTION_DEBUG
type PRTL_CRITICAL_SECTION_DEBUG as _RTL_CRITICAL_SECTION_DEBUG ptr
type RTL_RESOURCE_DEBUG as _RTL_CRITICAL_SECTION_DEBUG
type PRTL_RESOURCE_DEBUG as _RTL_CRITICAL_SECTION_DEBUG ptr

#define RTL_CRITSECT_TYPE 0
#define RTL_RESOURCE_TYPE 1
#define RTL_CRITICAL_SECTION_FLAG_NO_DEBUG_INFO &h01000000
#define RTL_CRITICAL_SECTION_FLAG_DYNAMIC_SPIN &h02000000
#define RTL_CRITICAL_SECTION_FLAG_STATIC_INIT &h04000000
#define RTL_CRITICAL_SECTION_FLAG_RESOURCE_TYPE &h08000000
#define RTL_CRITICAL_SECTION_FLAG_FORCE_DEBUG_INFO &h10000000
#define RTL_CRITICAL_SECTION_ALL_FLAG_BITS &hff000000
#define RTL_CRITICAL_SECTION_FLAG_RESERVED (RTL_CRITICAL_SECTION_ALL_FLAG_BITS and (not ((((RTL_CRITICAL_SECTION_FLAG_NO_DEBUG_INFO or RTL_CRITICAL_SECTION_FLAG_DYNAMIC_SPIN) or RTL_CRITICAL_SECTION_FLAG_STATIC_INIT) or RTL_CRITICAL_SECTION_FLAG_RESOURCE_TYPE) or RTL_CRITICAL_SECTION_FLAG_FORCE_DEBUG_INFO)))
#define RTL_CRITICAL_SECTION_DEBUG_FLAG_STATIC_INIT &h00000001

type _RTL_CRITICAL_SECTION_ field = 8
	DebugInfo as PRTL_CRITICAL_SECTION_DEBUG
	LockCount as LONG_
	RecursionCount as LONG_
	OwningThread as HANDLE
	LockSemaphore as HANDLE
	SpinCount as ULONG_PTR
end type

type RTL_CRITICAL_SECTION as _RTL_CRITICAL_SECTION
type PRTL_CRITICAL_SECTION as _RTL_CRITICAL_SECTION ptr

type _RTL_SRWLOCK
	Ptr as PVOID
end type

type RTL_SRWLOCK as _RTL_SRWLOCK
type PRTL_SRWLOCK as _RTL_SRWLOCK ptr

type _RTL_CONDITION_VARIABLE
	Ptr as PVOID
end type

type RTL_CONDITION_VARIABLE as _RTL_CONDITION_VARIABLE
type PRTL_CONDITION_VARIABLE as _RTL_CONDITION_VARIABLE ptr

#define RTL_SRWLOCK_INIT (0)
#define RTL_CONDITION_VARIABLE_INIT (0)
#define RTL_CONDITION_VARIABLE_LOCKMODE_SHARED &h1

type PAPCFUNC as sub(byval Parameter as ULONG_PTR)
type PVECTORED_EXCEPTION_HANDLER as function(byval ExceptionInfo as _EXCEPTION_POINTERS ptr) as LONG_

type _HEAP_INFORMATION_CLASS as long
enum
	HeapCompatibilityInformation
	HeapEnableTerminationOnCorruption
end enum

type HEAP_INFORMATION_CLASS as _HEAP_INFORMATION_CLASS
type WORKERCALLBACKFUNC as sub(byval as PVOID)
type APC_CALLBACK_FUNCTION as sub(byval as DWORD, byval as PVOID, byval as PVOID)
type WAITORTIMERCALLBACKFUNC as sub(byval as PVOID, byval as BOOLEAN)
type WAITORTIMERCALLBACK as WAITORTIMERCALLBACKFUNC
type PFLS_CALLBACK_FUNCTION as sub(byval lpFlsData as PVOID)
type PSECURE_MEMORY_CACHE_CALLBACK as function(byval Addr as PVOID, byval Range as SIZE_T_) as BOOLEAN

#define WT_EXECUTEDEFAULT &h00000000
#define WT_EXECUTEINIOTHREAD &h00000001
#define WT_EXECUTEINUITHREAD &h00000002
#define WT_EXECUTEINWAITTHREAD &h00000004
#define WT_EXECUTEONLYONCE &h00000008
#define WT_EXECUTEINTIMERTHREAD &h00000020
#define WT_EXECUTELONGFUNCTION &h00000010
#define WT_EXECUTEINPERSISTENTIOTHREAD &h00000040
#define WT_EXECUTEINPERSISTENTTHREAD &h00000080
#define WT_TRANSFER_IMPERSONATION &h00000100

'' TODO: #define WT_SET_MAX_THREADPOOL_THREADS(Flags, Limit) ((Flags) |= (Limit) << 16)

#define WT_EXECUTEDELETEWAIT &h00000008
#define WT_EXECUTEINLONGTHREAD &h00000010

type _ACTIVATION_CONTEXT_INFO_CLASS as long
enum
	ActivationContextBasicInformation = 1
	ActivationContextDetailedInformation = 2
	AssemblyDetailedInformationInActivationContext = 3
	FileInformationInAssemblyOfAssemblyInActivationContext = 4
	RunlevelInformationInActivationContext = 5
	CompatibilityInformationInActivationContext = 6
	ActivationContextManifestResourceName = 7
	MaxActivationContextInfoClass
	AssemblyDetailedInformationInActivationContxt = 3
	FileInformationInAssemblyOfAssemblyInActivationContxt = 4
end enum

type ACTIVATION_CONTEXT_INFO_CLASS as _ACTIVATION_CONTEXT_INFO_CLASS

type ACTCTX_REQUESTED_RUN_LEVEL as long
enum
	ACTCTX_RUN_LEVEL_UNSPECIFIED = 0
	ACTCTX_RUN_LEVEL_AS_INVOKER
	ACTCTX_RUN_LEVEL_HIGHEST_AVAILABLE
	ACTCTX_RUN_LEVEL_REQUIRE_ADMIN
	ACTCTX_RUN_LEVEL_NUMBERS
end enum

type ACTCTX_COMPATIBILITY_ELEMENT_TYPE as long
enum
	ACTCTX_COMPATIBILITY_ELEMENT_TYPE_UNKNOWN = 0
	ACTCTX_COMPATIBILITY_ELEMENT_TYPE_OS
	ACTCTX_COMPATIBILITY_ELEMENT_TYPE_MITIGATION
end enum

type _ACTIVATION_CONTEXT_QUERY_INDEX
	ulAssemblyIndex as DWORD
	ulFileIndexInAssembly as DWORD
end type

type ACTIVATION_CONTEXT_QUERY_INDEX as _ACTIVATION_CONTEXT_QUERY_INDEX
type PACTIVATION_CONTEXT_QUERY_INDEX as _ACTIVATION_CONTEXT_QUERY_INDEX ptr

type _ASSEMBLY_FILE_DETAILED_INFORMATION
	ulFlags as DWORD
	ulFilenameLength as DWORD
	ulPathLength as DWORD
	lpFileName as PCWSTR
	lpFilePath as PCWSTR
end type

type ASSEMBLY_FILE_DETAILED_INFORMATION as _ASSEMBLY_FILE_DETAILED_INFORMATION
type PASSEMBLY_FILE_DETAILED_INFORMATION as _ASSEMBLY_FILE_DETAILED_INFORMATION ptr

type _ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION
	ulFlags as DWORD
	ulEncodedAssemblyIdentityLength as DWORD
	ulManifestPathType as DWORD
	ulManifestPathLength as DWORD
	liManifestLastWriteTime as LARGE_INTEGER
	ulPolicyPathType as DWORD
	ulPolicyPathLength as DWORD
	liPolicyLastWriteTime as LARGE_INTEGER
	ulMetadataSatelliteRosterIndex as DWORD
	ulManifestVersionMajor as DWORD
	ulManifestVersionMinor as DWORD
	ulPolicyVersionMajor as DWORD
	ulPolicyVersionMinor as DWORD
	ulAssemblyDirectoryNameLength as DWORD
	lpAssemblyEncodedAssemblyIdentity as PCWSTR
	lpAssemblyManifestPath as PCWSTR
	lpAssemblyPolicyPath as PCWSTR
	lpAssemblyDirectoryName as PCWSTR
	ulFileCount as DWORD
end type

type ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION as _ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION
type PACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION as _ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION ptr

type _ACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION
	ulFlags as DWORD
	RunLevel as ACTCTX_REQUESTED_RUN_LEVEL
	UiAccess as DWORD
end type

type ACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION as _ACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION
type PACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION as _ACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION ptr

type _COMPATIBILITY_CONTEXT_ELEMENT
	Id as GUID
	as ACTCTX_COMPATIBILITY_ELEMENT_TYPE Type
end type

type COMPATIBILITY_CONTEXT_ELEMENT as _COMPATIBILITY_CONTEXT_ELEMENT
type PCOMPATIBILITY_CONTEXT_ELEMENT as _COMPATIBILITY_CONTEXT_ELEMENT ptr

type _ACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION
	ElementCount as DWORD
	Elements(0 to ...) as COMPATIBILITY_CONTEXT_ELEMENT
end type

type ACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION as _ACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION
type PACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION as _ACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION ptr

#define MAX_SUPPORTED_OS_NUM 4

type _SUPPORTED_OS_INFO
	OsCount as WORD
	MitigationExist as WORD
	OsList(0 to 3) as WORD
end type

type SUPPORTED_OS_INFO as _SUPPORTED_OS_INFO
type PSUPPORTED_OS_INFO as _SUPPORTED_OS_INFO ptr

type _ACTIVATION_CONTEXT_DETAILED_INFORMATION
	dwFlags as DWORD
	ulFormatVersion as DWORD
	ulAssemblyCount as DWORD
	ulRootManifestPathType as DWORD
	ulRootManifestPathChars as DWORD
	ulRootConfigurationPathType as DWORD
	ulRootConfigurationPathChars as DWORD
	ulAppDirPathType as DWORD
	ulAppDirPathChars as DWORD
	lpRootManifestPath as PCWSTR
	lpRootConfigurationPath as PCWSTR
	lpAppDirPath as PCWSTR
end type

type ACTIVATION_CONTEXT_DETAILED_INFORMATION as _ACTIVATION_CONTEXT_DETAILED_INFORMATION
type PACTIVATION_CONTEXT_DETAILED_INFORMATION as _ACTIVATION_CONTEXT_DETAILED_INFORMATION ptr
type PCACTIVATION_CONTEXT_QUERY_INDEX as const _ACTIVATION_CONTEXT_QUERY_INDEX ptr
type PCASSEMBLY_FILE_DETAILED_INFORMATION as const ASSEMBLY_FILE_DETAILED_INFORMATION ptr
type PCACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION as const _ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION ptr
type PCACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION as const _ACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION ptr
type PCCOMPATIBILITY_CONTEXT_ELEMENT as const _COMPATIBILITY_CONTEXT_ELEMENT ptr
type PCACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION as const _ACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION ptr
type PCACTIVATION_CONTEXT_DETAILED_INFORMATION as const _ACTIVATION_CONTEXT_DETAILED_INFORMATION ptr

#define ACTIVATIONCONTEXTINFOCLASS ACTIVATION_CONTEXT_INFO_CLASS
#define ACTIVATION_CONTEXT_PATH_TYPE_NONE 1
#define ACTIVATION_CONTEXT_PATH_TYPE_WIN32_FILE 2
#define ACTIVATION_CONTEXT_PATH_TYPE_URL 3
#define ACTIVATION_CONTEXT_PATH_TYPE_ASSEMBLYREF 4
#define _ASSEMBLY_DLL_REDIRECTION_DETAILED_INFORMATION _ASSEMBLY_FILE_DETAILED_INFORMATION
#define ASSEMBLY_DLL_REDIRECTION_DETAILED_INFORMATION ASSEMBLY_FILE_DETAILED_INFORMATION
#define PASSEMBLY_DLL_REDIRECTION_DETAILED_INFORMATION PASSEMBLY_FILE_DETAILED_INFORMATION
#define PCASSEMBLY_DLL_REDIRECTION_DETAILED_INFORMATION PCASSEMBLY_FILE_DETAILED_INFORMATION
#define INVALID_OS_COUNT &hffff
#define CREATE_BOUNDARY_DESCRIPTOR_ADD_APPCONTAINER_SID &h1

type RTL_VERIFIER_DLL_LOAD_CALLBACK as sub(byval DllName as PWSTR, byval DllBase as PVOID, byval DllSize as SIZE_T_, byval Reserved as PVOID)
type RTL_VERIFIER_DLL_UNLOAD_CALLBACK as sub(byval DllName as PWSTR, byval DllBase as PVOID, byval DllSize as SIZE_T_, byval Reserved as PVOID)
type RTL_VERIFIER_NTDLLHEAPFREE_CALLBACK as sub(byval AllocationBase as PVOID, byval AllocationSize as SIZE_T_)

type _RTL_VERIFIER_THUNK_DESCRIPTOR
	ThunkName as PCHAR
	ThunkOldAddress as PVOID
	ThunkNewAddress as PVOID
end type

type RTL_VERIFIER_THUNK_DESCRIPTOR as _RTL_VERIFIER_THUNK_DESCRIPTOR
type PRTL_VERIFIER_THUNK_DESCRIPTOR as _RTL_VERIFIER_THUNK_DESCRIPTOR ptr

type _RTL_VERIFIER_DLL_DESCRIPTOR
	DllName as PWCHAR
	DllFlags as DWORD
	DllAddress as PVOID
	DllThunks as PRTL_VERIFIER_THUNK_DESCRIPTOR
end type

type RTL_VERIFIER_DLL_DESCRIPTOR as _RTL_VERIFIER_DLL_DESCRIPTOR
type PRTL_VERIFIER_DLL_DESCRIPTOR as _RTL_VERIFIER_DLL_DESCRIPTOR ptr

type _RTL_VERIFIER_PROVIDER_DESCRIPTOR
	Length as DWORD
	ProviderDlls as PRTL_VERIFIER_DLL_DESCRIPTOR
	ProviderDllLoadCallback as RTL_VERIFIER_DLL_LOAD_CALLBACK
	ProviderDllUnloadCallback as RTL_VERIFIER_DLL_UNLOAD_CALLBACK
	VerifierImage as PWSTR
	VerifierFlags as DWORD
	VerifierDebug as DWORD
	RtlpGetStackTraceAddress as PVOID
	RtlpDebugPageHeapCreate as PVOID
	RtlpDebugPageHeapDestroy as PVOID
	ProviderNtdllHeapFreeCallback as RTL_VERIFIER_NTDLLHEAPFREE_CALLBACK
end type

type RTL_VERIFIER_PROVIDER_DESCRIPTOR as _RTL_VERIFIER_PROVIDER_DESCRIPTOR
type PRTL_VERIFIER_PROVIDER_DESCRIPTOR as _RTL_VERIFIER_PROVIDER_DESCRIPTOR ptr

#define RTL_VRF_FLG_FULL_PAGE_HEAP &h00000001
#define RTL_VRF_FLG_RESERVED_DONOTUSE &h00000002
#define RTL_VRF_FLG_HANDLE_CHECKS &h00000004
#define RTL_VRF_FLG_STACK_CHECKS &h00000008
#define RTL_VRF_FLG_APPCOMPAT_CHECKS &h00000010
#define RTL_VRF_FLG_TLS_CHECKS &h00000020
#define RTL_VRF_FLG_DIRTY_STACKS &h00000040
#define RTL_VRF_FLG_RPC_CHECKS &h00000080
#define RTL_VRF_FLG_COM_CHECKS &h00000100
#define RTL_VRF_FLG_DANGEROUS_APIS &h00000200
#define RTL_VRF_FLG_RACE_CHECKS &h00000400
#define RTL_VRF_FLG_DEADLOCK_CHECKS &h00000800
#define RTL_VRF_FLG_FIRST_CHANCE_EXCEPTION_CHECKS &h00001000
#define RTL_VRF_FLG_VIRTUAL_MEM_CHECKS &h00002000
#define RTL_VRF_FLG_ENABLE_LOGGING &h00004000
#define RTL_VRF_FLG_FAST_FILL_HEAP &h00008000
#define RTL_VRF_FLG_VIRTUAL_SPACE_TRACKING &h00010000
#define RTL_VRF_FLG_ENABLED_SYSTEM_WIDE &h00020000
#define RTL_VRF_FLG_MISCELLANEOUS_CHECKS &h00020000
#define RTL_VRF_FLG_LOCK_CHECKS &h00040000
#define APPLICATION_VERIFIER_INTERNAL_ERROR &h80000000
#define APPLICATION_VERIFIER_INTERNAL_WARNING &h40000000
#define APPLICATION_VERIFIER_NO_BREAK &h20000000
#define APPLICATION_VERIFIER_CONTINUABLE_BREAK &h10000000
#define APPLICATION_VERIFIER_UNKNOWN_ERROR &h0001
#define APPLICATION_VERIFIER_ACCESS_VIOLATION &h0002
#define APPLICATION_VERIFIER_UNSYNCHRONIZED_ACCESS &h0003
#define APPLICATION_VERIFIER_EXTREME_SIZE_REQUEST &h0004
#define APPLICATION_VERIFIER_BAD_HEAP_HANDLE &h0005
#define APPLICATION_VERIFIER_SWITCHED_HEAP_HANDLE &h0006
#define APPLICATION_VERIFIER_DOUBLE_FREE &h0007
#define APPLICATION_VERIFIER_CORRUPTED_HEAP_BLOCK &h0008
#define APPLICATION_VERIFIER_DESTROY_PROCESS_HEAP &h0009
#define APPLICATION_VERIFIER_UNEXPECTED_EXCEPTION &h000A
#define APPLICATION_VERIFIER_CORRUPTED_HEAP_BLOCK_EXCEPTION_RAISED_FOR_HEADER &h000B
#define APPLICATION_VERIFIER_CORRUPTED_HEAP_BLOCK_EXCEPTION_RAISED_FOR_PROBING &h000C
#define APPLICATION_VERIFIER_CORRUPTED_HEAP_BLOCK_HEADER &h000D
#define APPLICATION_VERIFIER_CORRUPTED_FREED_HEAP_BLOCK &h000E
#define APPLICATION_VERIFIER_CORRUPTED_HEAP_BLOCK_SUFFIX &h000F
#define APPLICATION_VERIFIER_CORRUPTED_HEAP_BLOCK_START_STAMP &h0010
#define APPLICATION_VERIFIER_CORRUPTED_HEAP_BLOCK_END_STAMP &h0011
#define APPLICATION_VERIFIER_CORRUPTED_HEAP_BLOCK_PREFIX &h0012
#define APPLICATION_VERIFIER_FIRST_CHANCE_ACCESS_VIOLATION &h0013
#define APPLICATION_VERIFIER_CORRUPTED_HEAP_LIST &h0014
#define APPLICATION_VERIFIER_TERMINATE_THREAD_CALL &h0100
#define APPLICATION_VERIFIER_STACK_OVERFLOW &h0101
#define APPLICATION_VERIFIER_INVALID_EXIT_PROCESS_CALL &h0102
#define APPLICATION_VERIFIER_EXIT_THREAD_OWNS_LOCK &h0200
#define APPLICATION_VERIFIER_LOCK_IN_UNLOADED_DLL &h0201
#define APPLICATION_VERIFIER_LOCK_IN_FREED_HEAP &h0202
#define APPLICATION_VERIFIER_LOCK_DOUBLE_INITIALIZE &h0203
#define APPLICATION_VERIFIER_LOCK_IN_FREED_MEMORY &h0204
#define APPLICATION_VERIFIER_LOCK_CORRUPTED &h0205
#define APPLICATION_VERIFIER_LOCK_INVALID_OWNER &h0206
#define APPLICATION_VERIFIER_LOCK_INVALID_RECURSION_COUNT &h0207
#define APPLICATION_VERIFIER_LOCK_INVALID_LOCK_COUNT &h0208
#define APPLICATION_VERIFIER_LOCK_OVER_RELEASED &h0209
#define APPLICATION_VERIFIER_LOCK_NOT_INITIALIZED &h0210
#define APPLICATION_VERIFIER_LOCK_ALREADY_INITIALIZED &h0211
#define APPLICATION_VERIFIER_LOCK_IN_FREED_VMEM &h0212
#define APPLICATION_VERIFIER_LOCK_IN_UNMAPPED_MEM &h0213
#define APPLICATION_VERIFIER_THREAD_NOT_LOCK_OWNER &h0214
#define APPLICATION_VERIFIER_INVALID_HANDLE &h0300
#define APPLICATION_VERIFIER_INVALID_TLS_VALUE &h0301
#define APPLICATION_VERIFIER_INCORRECT_WAIT_CALL &h0302
#define APPLICATION_VERIFIER_NULL_HANDLE &h0303
#define APPLICATION_VERIFIER_WAIT_IN_DLLMAIN &h0304
#define APPLICATION_VERIFIER_COM_ERROR &h0400
#define APPLICATION_VERIFIER_COM_API_IN_DLLMAIN &h0401
#define APPLICATION_VERIFIER_COM_UNHANDLED_EXCEPTION &h0402
#define APPLICATION_VERIFIER_COM_UNBALANCED_COINIT &h0403
#define APPLICATION_VERIFIER_COM_UNBALANCED_OLEINIT &h0404
#define APPLICATION_VERIFIER_COM_UNBALANCED_SWC &h0405
#define APPLICATION_VERIFIER_COM_NULL_DACL &h0406
#define APPLICATION_VERIFIER_COM_UNSAFE_IMPERSONATION &h0407
#define APPLICATION_VERIFIER_COM_SMUGGLED_WRAPPER &h0408
#define APPLICATION_VERIFIER_COM_SMUGGLED_PROXY &h0409
#define APPLICATION_VERIFIER_COM_CF_SUCCESS_WITH_NULL &h040A
#define APPLICATION_VERIFIER_COM_GCO_SUCCESS_WITH_NULL &h040B
#define APPLICATION_VERIFIER_COM_OBJECT_IN_FREED_MEMORY &h040C
#define APPLICATION_VERIFIER_COM_OBJECT_IN_UNLOADED_DLL &h040D
#define APPLICATION_VERIFIER_COM_VTBL_IN_FREED_MEMORY &h040E
#define APPLICATION_VERIFIER_COM_VTBL_IN_UNLOADED_DLL &h040F
#define APPLICATION_VERIFIER_COM_HOLDING_LOCKS_ON_CALL &h0410
#define APPLICATION_VERIFIER_RPC_ERROR &h0500
#define APPLICATION_VERIFIER_INVALID_FREEMEM &h0600
#define APPLICATION_VERIFIER_INVALID_ALLOCMEM &h0601
#define APPLICATION_VERIFIER_INVALID_MAPVIEW &h0602
#define APPLICATION_VERIFIER_PROBE_INVALID_ADDRESS &h0603
#define APPLICATION_VERIFIER_PROBE_FREE_MEM &h0604
#define APPLICATION_VERIFIER_PROBE_GUARD_PAGE &h0605
#define APPLICATION_VERIFIER_PROBE_NULL &h0606
#define APPLICATION_VERIFIER_PROBE_INVALID_START_OR_SIZE &h0607
#define APPLICATION_VERIFIER_SIZE_HEAP_UNEXPECTED_EXCEPTION &h0618
#macro VERIFIER_STOP(Code, Msg, P1, S1, P2, S2, P3, S3, P4, S4)
	scope
		RtlApplicationVerifierStop((Code), (Msg), cast(ULONG_PTR, (P1)), (S1), cast(ULONG_PTR, (P2)), (S2), cast(ULONG_PTR, (P3)), (S3), cast(ULONG_PTR, (P4)), (S4))
	end scope
#endmacro

declare sub RtlApplicationVerifierStop(byval Code as ULONG_PTR, byval Message as PSTR, byval Param1 as ULONG_PTR, byval Description1 as PSTR, byval Param2 as ULONG_PTR, byval Description2 as PSTR, byval Param3 as ULONG_PTR, byval Description3 as PSTR, byval Param4 as ULONG_PTR, byval Description4 as PSTR)
declare function RtlSetHeapInformation(byval HeapHandle as PVOID, byval HeapInformationClass as HEAP_INFORMATION_CLASS, byval HeapInformation as PVOID, byval HeapInformationLength as SIZE_T_) as DWORD
declare function RtlQueryHeapInformation(byval HeapHandle as PVOID, byval HeapInformationClass as HEAP_INFORMATION_CLASS, byval HeapInformation as PVOID, byval HeapInformationLength as SIZE_T_, byval ReturnLength as PSIZE_T) as DWORD
declare function RtlMultipleAllocateHeap(byval HeapHandle as PVOID, byval Flags as DWORD, byval Size as SIZE_T_, byval Count as DWORD, byval Array as PVOID ptr) as DWORD
declare function RtlMultipleFreeHeap(byval HeapHandle as PVOID, byval Flags as DWORD, byval Count as DWORD, byval Array as PVOID ptr) as DWORD

type _HARDWARE_COUNTER_DATA
	as HARDWARE_COUNTER_TYPE Type
	Reserved as DWORD
	Value as DWORD64
end type

type HARDWARE_COUNTER_DATA as _HARDWARE_COUNTER_DATA
type PHARDWARE_COUNTER_DATA as _HARDWARE_COUNTER_DATA ptr

type _PERFORMANCE_DATA
	Size as WORD
	Version as BYTE
	HwCountersCount as BYTE
	ContextSwitchCount as DWORD
	WaitReasonBitMap as DWORD64
	CycleTime as DWORD64
	RetryCount as DWORD
	Reserved as DWORD
	HwCounters(0 to 15) as HARDWARE_COUNTER_DATA
end type

type PERFORMANCE_DATA as _PERFORMANCE_DATA
type PPERFORMANCE_DATA as _PERFORMANCE_DATA ptr

#define PERFORMANCE_DATA_VERSION 1
#define READ_THREAD_PROFILING_FLAG_DISPATCHING &h00000001
#define READ_THREAD_PROFILING_FLAG_HARDWARE_COUNTERS &h00000002
#define DLL_PROCESS_ATTACH 1
#define DLL_THREAD_ATTACH 2
#define DLL_THREAD_DETACH 3
#define DLL_PROCESS_DETACH 0
#define DLL_PROCESS_VERIFIER 4
#define EVENTLOG_SEQUENTIAL_READ &h0001
#define EVENTLOG_SEEK_READ &h0002
#define EVENTLOG_FORWARDS_READ &h0004
#define EVENTLOG_BACKWARDS_READ &h0008
#define EVENTLOG_SUCCESS &h0000
#define EVENTLOG_ERROR_TYPE &h0001
#define EVENTLOG_WARNING_TYPE &h0002
#define EVENTLOG_INFORMATION_TYPE &h0004
#define EVENTLOG_AUDIT_SUCCESS &h0008
#define EVENTLOG_AUDIT_FAILURE &h0010
#define EVENTLOG_START_PAIRED_EVENT &h0001
#define EVENTLOG_END_PAIRED_EVENT &h0002
#define EVENTLOG_END_ALL_PAIRED_EVENTS &h0004
#define EVENTLOG_PAIRED_EVENT_ACTIVE &h0008
#define EVENTLOG_PAIRED_EVENT_INACTIVE &h0010

type _EVENTLOGRECORD
	Length as DWORD
	Reserved as DWORD
	RecordNumber as DWORD
	TimeGenerated as DWORD
	TimeWritten as DWORD
	EventID as DWORD
	EventType as WORD
	NumStrings as WORD
	EventCategory as WORD
	ReservedFlags as WORD
	ClosingRecordNumber as DWORD
	StringOffset as DWORD
	UserSidLength as DWORD
	UserSidOffset as DWORD
	DataLength as DWORD
	DataOffset as DWORD
end type

type EVENTLOGRECORD as _EVENTLOGRECORD
type PEVENTLOGRECORD as _EVENTLOGRECORD ptr

#define MAXLOGICALLOGNAMESIZE 256

type _EVENTSFORLOGFILE
	ulSize as DWORD
	szLogicalLogFile(0 to 255) as WCHAR
	ulNumRecords as DWORD
	pEventLogRecords(0 to ...) as EVENTLOGRECORD
end type

type EVENTSFORLOGFILE as _EVENTSFORLOGFILE
type PEVENTSFORLOGFILE as _EVENTSFORLOGFILE ptr

type _PACKEDEVENTINFO
	ulSize as DWORD
	ulNumEventsForLogFile as DWORD
	ulOffsets(0 to ...) as DWORD
end type

type PACKEDEVENTINFO as _PACKEDEVENTINFO
type PPACKEDEVENTINFO as _PACKEDEVENTINFO ptr

#define KEY_QUERY_VALUE &h0001
#define KEY_SET_VALUE &h0002
#define KEY_CREATE_SUB_KEY &h0004
#define KEY_ENUMERATE_SUB_KEYS &h0008
#define KEY_NOTIFY &h0010
#define KEY_CREATE_LINK &h0020
#define KEY_WOW64_64KEY &h0100
#define KEY_WOW64_32KEY &h0200
#define KEY_WOW64_RES &h0300
#define KEY_READ ((((STANDARD_RIGHTS_READ or KEY_QUERY_VALUE) or KEY_ENUMERATE_SUB_KEYS) or KEY_NOTIFY) and (not SYNCHRONIZE))
#define KEY_WRITE (((STANDARD_RIGHTS_WRITE or KEY_SET_VALUE) or KEY_CREATE_SUB_KEY) and (not SYNCHRONIZE))
#define KEY_EXECUTE (KEY_READ and (not SYNCHRONIZE))
#define KEY_ALL_ACCESS (((((((STANDARD_RIGHTS_ALL or KEY_QUERY_VALUE) or KEY_SET_VALUE) or KEY_CREATE_SUB_KEY) or KEY_ENUMERATE_SUB_KEYS) or KEY_NOTIFY) or KEY_CREATE_LINK) and (not SYNCHRONIZE))
#define REG_OPTION_RESERVED __MSABI_LONG(&h00000000)
#define REG_OPTION_NON_VOLATILE __MSABI_LONG(&h00000000)
#define REG_OPTION_VOLATILE __MSABI_LONG(&h00000001)
#define REG_OPTION_CREATE_LINK __MSABI_LONG(&h00000002)
#define REG_OPTION_BACKUP_RESTORE __MSABI_LONG(&h00000004)
#define REG_OPTION_OPEN_LINK __MSABI_LONG(&h00000008)
#define REG_LEGAL_OPTION (((((REG_OPTION_RESERVED or REG_OPTION_NON_VOLATILE) or REG_OPTION_VOLATILE) or REG_OPTION_CREATE_LINK) or REG_OPTION_BACKUP_RESTORE) or REG_OPTION_OPEN_LINK)
#define REG_CREATED_NEW_KEY __MSABI_LONG(&h00000001)
#define REG_OPENED_EXISTING_KEY __MSABI_LONG(&h00000002)
#define REG_STANDARD_FORMAT 1
#define REG_LATEST_FORMAT 2
#define REG_NO_COMPRESSION 4
#define REG_WHOLE_HIVE_VOLATILE __MSABI_LONG(&h00000001)
#define REG_REFRESH_HIVE __MSABI_LONG(&h00000002)
#define REG_NO_LAZY_FLUSH __MSABI_LONG(&h00000004)
#define REG_FORCE_RESTORE __MSABI_LONG(&h00000008)
#define REG_APP_HIVE __MSABI_LONG(&h00000010)
#define REG_PROCESS_PRIVATE __MSABI_LONG(&h00000020)
#define REG_START_JOURNAL __MSABI_LONG(&h00000040)
#define REG_HIVE_EXACT_FILE_GROWTH __MSABI_LONG(&h00000080)
#define REG_HIVE_NO_RM __MSABI_LONG(&h00000100)
#define REG_HIVE_SINGLE_LOG __MSABI_LONG(&h00000200)
#define REG_BOOT_HIVE __MSABI_LONG(&h00000400)
#define REG_FORCE_UNLOAD 1
#define REG_NOTIFY_CHANGE_NAME __MSABI_LONG(&h00000001)
#define REG_NOTIFY_CHANGE_ATTRIBUTES __MSABI_LONG(&h00000002)
#define REG_NOTIFY_CHANGE_LAST_SET __MSABI_LONG(&h00000004)
#define REG_NOTIFY_CHANGE_SECURITY __MSABI_LONG(&h00000008)
#define REG_NOTIFY_THREAD_AGNOSTIC __MSABI_LONG(&h10000000)
#define REG_LEGAL_CHANGE_FILTER ((((REG_NOTIFY_CHANGE_NAME or REG_NOTIFY_CHANGE_ATTRIBUTES) or REG_NOTIFY_CHANGE_LAST_SET) or REG_NOTIFY_CHANGE_SECURITY) or REG_NOTIFY_THREAD_AGNOSTIC)
#define REG_NONE 0
#define REG_SZ 1
#define REG_EXPAND_SZ 2
#define REG_BINARY 3
#define REG_DWORD 4
#define REG_DWORD_LITTLE_ENDIAN 4
#define REG_DWORD_BIG_ENDIAN 5
#define REG_LINK 6
#define REG_MULTI_SZ 7
#define REG_RESOURCE_LIST 8
#define REG_FULL_RESOURCE_DESCRIPTOR 9
#define REG_RESOURCE_REQUIREMENTS_LIST 10
#define REG_QWORD 11
#define REG_QWORD_LITTLE_ENDIAN 11
#define SERVICE_KERNEL_DRIVER &h00000001
#define SERVICE_FILE_SYSTEM_DRIVER &h00000002
#define SERVICE_ADAPTER &h00000004
#define SERVICE_RECOGNIZER_DRIVER &h00000008
#define SERVICE_DRIVER ((SERVICE_KERNEL_DRIVER or SERVICE_FILE_SYSTEM_DRIVER) or SERVICE_RECOGNIZER_DRIVER)
#define SERVICE_WIN32_OWN_PROCESS &h00000010
#define SERVICE_WIN32_SHARE_PROCESS &h00000020
#define SERVICE_WIN32 (SERVICE_WIN32_OWN_PROCESS or SERVICE_WIN32_SHARE_PROCESS)
#define SERVICE_INTERACTIVE_PROCESS &h00000100
#define SERVICE_TYPE_ALL (((SERVICE_WIN32 or SERVICE_ADAPTER) or SERVICE_DRIVER) or SERVICE_INTERACTIVE_PROCESS)
#define SERVICE_BOOT_START &h00000000
#define SERVICE_SYSTEM_START &h00000001
#define SERVICE_AUTO_START &h00000002
#define SERVICE_DEMAND_START &h00000003
#define SERVICE_DISABLED &h00000004
#define SERVICE_ERROR_IGNORE &h00000000
#define SERVICE_ERROR_NORMAL &h00000001
#define SERVICE_ERROR_SEVERE &h00000002
#define SERVICE_ERROR_CRITICAL &h00000003

type _CM_SERVICE_NODE_TYPE as long
enum
	DriverType = &h00000001
	FileSystemType = &h00000002
	Win32ServiceOwnProcess = &h00000010
	Win32ServiceShareProcess = &h00000020
	AdapterType = &h00000004
	RecognizerType = &h00000008
end enum

type SERVICE_NODE_TYPE as _CM_SERVICE_NODE_TYPE

type _CM_SERVICE_LOAD_TYPE as long
enum
	BootLoad = &h00000000
	SystemLoad = &h00000001
	AutoLoad = &h00000002
	DemandLoad = &h00000003
	DisableLoad = &h00000004
end enum

type SERVICE_LOAD_TYPE as _CM_SERVICE_LOAD_TYPE

type _CM_ERROR_CONTROL_TYPE as long
enum
	IgnoreError = &h00000000
	NormalError = &h00000001
	SevereError = &h00000002
	CriticalError = &h00000003
end enum

type SERVICE_ERROR_TYPE as _CM_ERROR_CONTROL_TYPE

#define CM_SERVICE_NETWORK_BOOT_LOAD &h00000001
#define CM_SERVICE_VIRTUAL_DISK_BOOT_LOAD &h00000002
#define CM_SERVICE_USB_DISK_BOOT_LOAD &h00000004
#define CM_SERVICE_SD_DISK_BOOT_LOAD &h00000008
#define CM_SERVICE_USB3_DISK_BOOT_LOAD &h00000010
#define CM_SERVICE_MEASURED_BOOT_LOAD &h00000020
#define CM_SERVICE_VERIFIER_BOOT_LOAD &h00000040
#define CM_SERVICE_WINPE_BOOT_LOAD &h00000080
#define CM_SERVICE_VALID_PROMOTION_MASK (((((((CM_SERVICE_NETWORK_BOOT_LOAD or CM_SERVICE_VIRTUAL_DISK_BOOT_LOAD) or CM_SERVICE_USB_DISK_BOOT_LOAD) or CM_SERVICE_SD_DISK_BOOT_LOAD) or CM_SERVICE_USB3_DISK_BOOT_LOAD) or CM_SERVICE_MEASURED_BOOT_LOAD) or CM_SERVICE_VERIFIER_BOOT_LOAD) or CM_SERVICE_WINPE_BOOT_LOAD)
#define _NTDDTAPE_WINNT_
#define TAPE_ERASE_SHORT __MSABI_LONG(0)
#define TAPE_ERASE_LONG __MSABI_LONG(1)

type _TAPE_ERASE
	as DWORD Type
	Immediate as BOOLEAN
end type

type TAPE_ERASE as _TAPE_ERASE
type PTAPE_ERASE as _TAPE_ERASE ptr

#define TAPE_LOAD __MSABI_LONG(0)
#define TAPE_UNLOAD __MSABI_LONG(1)
#define TAPE_TENSION __MSABI_LONG(2)
#define TAPE_LOCK __MSABI_LONG(3)
#define TAPE_UNLOCK __MSABI_LONG(4)
#define TAPE_FORMAT __MSABI_LONG(5)

type _TAPE_PREPARE
	Operation as DWORD
	Immediate as BOOLEAN
end type

type TAPE_PREPARE as _TAPE_PREPARE
type PTAPE_PREPARE as _TAPE_PREPARE ptr

#define TAPE_SETMARKS __MSABI_LONG(0)
#define TAPE_FILEMARKS __MSABI_LONG(1)
#define TAPE_SHORT_FILEMARKS __MSABI_LONG(2)
#define TAPE_LONG_FILEMARKS __MSABI_LONG(3)

type _TAPE_WRITE_MARKS
	as DWORD Type
	Count as DWORD
	Immediate as BOOLEAN
end type

type TAPE_WRITE_MARKS as _TAPE_WRITE_MARKS
type PTAPE_WRITE_MARKS as _TAPE_WRITE_MARKS ptr

#define TAPE_ABSOLUTE_POSITION __MSABI_LONG(0)
#define TAPE_LOGICAL_POSITION __MSABI_LONG(1)
#define TAPE_PSEUDO_LOGICAL_POSITION __MSABI_LONG(2)

type _TAPE_GET_POSITION
	as DWORD Type
	Partition as DWORD
	Offset as LARGE_INTEGER
end type

type TAPE_GET_POSITION as _TAPE_GET_POSITION
type PTAPE_GET_POSITION as _TAPE_GET_POSITION ptr

#define TAPE_REWIND __MSABI_LONG(0)
#define TAPE_ABSOLUTE_BLOCK __MSABI_LONG(1)
#define TAPE_LOGICAL_BLOCK __MSABI_LONG(2)
#define TAPE_PSEUDO_LOGICAL_BLOCK __MSABI_LONG(3)
#define TAPE_SPACE_END_OF_DATA __MSABI_LONG(4)
#define TAPE_SPACE_RELATIVE_BLOCKS __MSABI_LONG(5)
#define TAPE_SPACE_FILEMARKS __MSABI_LONG(6)
#define TAPE_SPACE_SEQUENTIAL_FMKS __MSABI_LONG(7)
#define TAPE_SPACE_SETMARKS __MSABI_LONG(8)
#define TAPE_SPACE_SEQUENTIAL_SMKS __MSABI_LONG(9)

type _TAPE_SET_POSITION
	Method as DWORD
	Partition as DWORD
	Offset as LARGE_INTEGER
	Immediate as BOOLEAN
end type

type TAPE_SET_POSITION as _TAPE_SET_POSITION
type PTAPE_SET_POSITION as _TAPE_SET_POSITION ptr

#define TAPE_DRIVE_FIXED &h00000001
#define TAPE_DRIVE_SELECT &h00000002
#define TAPE_DRIVE_INITIATOR &h00000004
#define TAPE_DRIVE_ERASE_SHORT &h00000010
#define TAPE_DRIVE_ERASE_LONG &h00000020
#define TAPE_DRIVE_ERASE_BOP_ONLY &h00000040
#define TAPE_DRIVE_ERASE_IMMEDIATE &h00000080
#define TAPE_DRIVE_TAPE_CAPACITY &h00000100
#define TAPE_DRIVE_TAPE_REMAINING &h00000200
#define TAPE_DRIVE_FIXED_BLOCK &h00000400
#define TAPE_DRIVE_VARIABLE_BLOCK &h00000800
#define TAPE_DRIVE_WRITE_PROTECT &h00001000
#define TAPE_DRIVE_EOT_WZ_SIZE &h00002000
#define TAPE_DRIVE_ECC &h00010000
#define TAPE_DRIVE_COMPRESSION &h00020000
#define TAPE_DRIVE_PADDING &h00040000
#define TAPE_DRIVE_REPORT_SMKS &h00080000
#define TAPE_DRIVE_GET_ABSOLUTE_BLK &h00100000
#define TAPE_DRIVE_GET_LOGICAL_BLK &h00200000
#define TAPE_DRIVE_SET_EOT_WZ_SIZE &h00400000
#define TAPE_DRIVE_EJECT_MEDIA &h01000000
#define TAPE_DRIVE_CLEAN_REQUESTS &h02000000
#define TAPE_DRIVE_SET_CMP_BOP_ONLY &h04000000
#define TAPE_DRIVE_RESERVED_BIT &h80000000
#define TAPE_DRIVE_LOAD_UNLOAD &h80000001
#define TAPE_DRIVE_TENSION &h80000002
#define TAPE_DRIVE_LOCK_UNLOCK &h80000004
#define TAPE_DRIVE_REWIND_IMMEDIATE &h80000008
#define TAPE_DRIVE_SET_BLOCK_SIZE &h80000010
#define TAPE_DRIVE_LOAD_UNLD_IMMED &h80000020
#define TAPE_DRIVE_TENSION_IMMED &h80000040
#define TAPE_DRIVE_LOCK_UNLK_IMMED &h80000080
#define TAPE_DRIVE_SET_ECC &h80000100
#define TAPE_DRIVE_SET_COMPRESSION &h80000200
#define TAPE_DRIVE_SET_PADDING &h80000400
#define TAPE_DRIVE_SET_REPORT_SMKS &h80000800
#define TAPE_DRIVE_ABSOLUTE_BLK &h80001000
#define TAPE_DRIVE_ABS_BLK_IMMED &h80002000
#define TAPE_DRIVE_LOGICAL_BLK &h80004000
#define TAPE_DRIVE_LOG_BLK_IMMED &h80008000
#define TAPE_DRIVE_END_OF_DATA &h80010000
#define TAPE_DRIVE_RELATIVE_BLKS &h80020000
#define TAPE_DRIVE_FILEMARKS &h80040000
#define TAPE_DRIVE_SEQUENTIAL_FMKS &h80080000
#define TAPE_DRIVE_SETMARKS &h80100000
#define TAPE_DRIVE_SEQUENTIAL_SMKS &h80200000
#define TAPE_DRIVE_REVERSE_POSITION &h80400000
#define TAPE_DRIVE_SPACE_IMMEDIATE &h80800000
#define TAPE_DRIVE_WRITE_SETMARKS &h81000000
#define TAPE_DRIVE_WRITE_FILEMARKS &h82000000
#define TAPE_DRIVE_WRITE_SHORT_FMKS &h84000000
#define TAPE_DRIVE_WRITE_LONG_FMKS &h88000000
#define TAPE_DRIVE_WRITE_MARK_IMMED &h90000000
#define TAPE_DRIVE_FORMAT &hA0000000
#define TAPE_DRIVE_FORMAT_IMMEDIATE &hC0000000
#define TAPE_DRIVE_HIGH_FEATURES &h80000000

type _TAPE_GET_DRIVE_PARAMETERS
	ECC as BOOLEAN
	Compression as BOOLEAN
	DataPadding as BOOLEAN
	ReportSetmarks as BOOLEAN
	DefaultBlockSize as DWORD
	MaximumBlockSize as DWORD
	MinimumBlockSize as DWORD
	MaximumPartitionCount as DWORD
	FeaturesLow as DWORD
	FeaturesHigh as DWORD
	EOTWarningZoneSize as DWORD
end type

type TAPE_GET_DRIVE_PARAMETERS as _TAPE_GET_DRIVE_PARAMETERS
type PTAPE_GET_DRIVE_PARAMETERS as _TAPE_GET_DRIVE_PARAMETERS ptr

type _TAPE_SET_DRIVE_PARAMETERS
	ECC as BOOLEAN
	Compression as BOOLEAN
	DataPadding as BOOLEAN
	ReportSetmarks as BOOLEAN
	EOTWarningZoneSize as DWORD
end type

type TAPE_SET_DRIVE_PARAMETERS as _TAPE_SET_DRIVE_PARAMETERS
type PTAPE_SET_DRIVE_PARAMETERS as _TAPE_SET_DRIVE_PARAMETERS ptr

type _TAPE_GET_MEDIA_PARAMETERS
	Capacity as LARGE_INTEGER
	Remaining as LARGE_INTEGER
	BlockSize as DWORD
	PartitionCount as DWORD
	WriteProtected as BOOLEAN
end type

type TAPE_GET_MEDIA_PARAMETERS as _TAPE_GET_MEDIA_PARAMETERS
type PTAPE_GET_MEDIA_PARAMETERS as _TAPE_GET_MEDIA_PARAMETERS ptr

type _TAPE_SET_MEDIA_PARAMETERS
	BlockSize as DWORD
end type

type TAPE_SET_MEDIA_PARAMETERS as _TAPE_SET_MEDIA_PARAMETERS
type PTAPE_SET_MEDIA_PARAMETERS as _TAPE_SET_MEDIA_PARAMETERS ptr

#define TAPE_FIXED_PARTITIONS __MSABI_LONG(0)
#define TAPE_SELECT_PARTITIONS __MSABI_LONG(1)
#define TAPE_INITIATOR_PARTITIONS __MSABI_LONG(2)

type _TAPE_CREATE_PARTITION
	Method as DWORD
	Count as DWORD
	Size as DWORD
end type

type TAPE_CREATE_PARTITION as _TAPE_CREATE_PARTITION
type PTAPE_CREATE_PARTITION as _TAPE_CREATE_PARTITION ptr

#define TAPE_QUERY_DRIVE_PARAMETERS __MSABI_LONG(0)
#define TAPE_QUERY_MEDIA_CAPACITY __MSABI_LONG(1)
#define TAPE_CHECK_FOR_DRIVE_PROBLEM __MSABI_LONG(2)
#define TAPE_QUERY_IO_ERROR_DATA __MSABI_LONG(3)
#define TAPE_QUERY_DEVICE_ERROR_DATA __MSABI_LONG(4)

type _TAPE_WMI_OPERATIONS
	Method as DWORD
	DataBufferSize as DWORD
	DataBuffer as PVOID
end type

type TAPE_WMI_OPERATIONS as _TAPE_WMI_OPERATIONS
type PTAPE_WMI_OPERATIONS as _TAPE_WMI_OPERATIONS ptr

type _TAPE_DRIVE_PROBLEM_TYPE as long
enum
	TapeDriveProblemNone
	TapeDriveReadWriteWarning
	TapeDriveReadWriteError
	TapeDriveReadWarning
	TapeDriveWriteWarning
	TapeDriveReadError
	TapeDriveWriteError
	TapeDriveHardwareError
	TapeDriveUnsupportedMedia
	TapeDriveScsiConnectionError
	TapeDriveTimetoClean
	TapeDriveCleanDriveNow
	TapeDriveMediaLifeExpired
	TapeDriveSnappedTape
end enum

type TAPE_DRIVE_PROBLEM_TYPE as _TAPE_DRIVE_PROBLEM_TYPE
type TP_VERSION as DWORD
type PTP_VERSION as DWORD ptr
type TP_CALLBACK_INSTANCE as _TP_CALLBACK_INSTANCE
type PTP_CALLBACK_INSTANCE as _TP_CALLBACK_INSTANCE ptr
type PTP_SIMPLE_CALLBACK as sub(byval Instance as PTP_CALLBACK_INSTANCE, byval Context as PVOID)
type TP_POOL as _TP_POOL
type PTP_POOL as _TP_POOL ptr

type _TP_CALLBACK_PRIORITY as long
enum
	TP_CALLBACK_PRIORITY_HIGH
	TP_CALLBACK_PRIORITY_NORMAL
	TP_CALLBACK_PRIORITY_LOW
	TP_CALLBACK_PRIORITY_INVALID
	TP_CALLBACK_PRIORITY_COUNT = TP_CALLBACK_PRIORITY_INVALID
end enum

type TP_CALLBACK_PRIORITY as _TP_CALLBACK_PRIORITY

type _TP_POOL_STACK_INFORMATION
	StackReserve as SIZE_T_
	StackCommit as SIZE_T_
end type

type TP_POOL_STACK_INFORMATION as _TP_POOL_STACK_INFORMATION
type PTP_POOL_STACK_INFORMATION as _TP_POOL_STACK_INFORMATION ptr
type TP_CLEANUP_GROUP as _TP_CLEANUP_GROUP
type PTP_CLEANUP_GROUP as _TP_CLEANUP_GROUP ptr
type PTP_CLEANUP_GROUP_CANCEL_CALLBACK as sub(byval ObjectContext as PVOID, byval CleanupContext as PVOID)

type ___TP_CALLBACK_ENVIRON_V1_s
	LongFunction : 1 as DWORD
	Persistent : 1 as DWORD
	as DWORD Private : 30
end type

union ___TP_CALLBACK_ENVIRON_V1_u
	Flags as DWORD
	s as ___TP_CALLBACK_ENVIRON_V1_s
end union

type _TP_CALLBACK_ENVIRON_V1
	Version as TP_VERSION
	Pool as PTP_POOL
	CleanupGroup as PTP_CLEANUP_GROUP
	CleanupGroupCancelCallback as PTP_CLEANUP_GROUP_CANCEL_CALLBACK
	RaceDll as PVOID
	ActivationContext as _ACTIVATION_CONTEXT ptr
	FinalizationCallback as PTP_SIMPLE_CALLBACK
	u as ___TP_CALLBACK_ENVIRON_V1_u
end type

type TP_CALLBACK_ENVIRON_V1 as _TP_CALLBACK_ENVIRON_V1
type TP_CALLBACK_ENVIRON as TP_CALLBACK_ENVIRON_V1
type PTP_CALLBACK_ENVIRON as TP_CALLBACK_ENVIRON_V1 ptr
type TP_WORK as _TP_WORK
type PTP_WORK as _TP_WORK ptr
type PTP_WORK_CALLBACK as sub(byval Instance as PTP_CALLBACK_INSTANCE, byval Context as PVOID, byval Work as PTP_WORK)
type TP_TIMER as _TP_TIMER
type PTP_TIMER as _TP_TIMER ptr
type PTP_TIMER_CALLBACK as sub(byval Instance as PTP_CALLBACK_INSTANCE, byval Context as PVOID, byval Timer_ as PTP_TIMER)
type TP_WAIT_RESULT as DWORD
type TP_WAIT as _TP_WAIT
type PTP_WAIT as _TP_WAIT ptr
type PTP_WAIT_CALLBACK as sub(byval Instance as PTP_CALLBACK_INSTANCE, byval Context as PVOID, byval Wait_ as PTP_WAIT, byval WaitResult as TP_WAIT_RESULT)
type TP_IO as _TP_IO
type PTP_IO as _TP_IO ptr

#ifdef __FB_64BIT__
	'' TODO: extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void TpInitializeCallbackEnviron (PTP_CALLBACK_ENVIRON cbe) { cbe->Pool = ((void *)0); cbe->CleanupGroup = ((void *)0); cbe->CleanupGroupCancelCallback = ((void *)0); cbe->RaceDll = ((void *)0); cbe->ActivationContext = ((void *)0); cbe->FinalizationCallback = ((void *)0); cbe->u.Flags = 0; cbe->Version = 1; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void TpSetCallbackThreadpool (PTP_CALLBACK_ENVIRON cbe, PTP_POOL pool) { cbe->Pool = pool; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void TpSetCallbackCleanupGroup (PTP_CALLBACK_ENVIRON cbe, PTP_CLEANUP_GROUP cleanup_group, PTP_CLEANUP_GROUP_CANCEL_CALLBACK cleanup_group_cb) { cbe->CleanupGroup = cleanup_group; cbe->CleanupGroupCancelCallback = cleanup_group_cb; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void TpSetCallbackActivationContext (PTP_CALLBACK_ENVIRON cbe, struct _ACTIVATION_CONTEXT *actx) { cbe->ActivationContext = actx; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void TpSetCallbackNoActivationContext (PTP_CALLBACK_ENVIRON cbe) { cbe->ActivationContext = (struct _ACTIVATION_CONTEXT *) (LONG_PTR) -1; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void TpSetCallbackLongFunction (PTP_CALLBACK_ENVIRON cbe) { cbe->u.s.LongFunction = 1; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void TpSetCallbackRaceWithDll (PTP_CALLBACK_ENVIRON cbe, PVOID h) { cbe->RaceDll = h; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void TpSetCallbackFinalizationCallback (PTP_CALLBACK_ENVIRON cbe, PTP_SIMPLE_CALLBACK fini_cb) { cbe->FinalizationCallback = fini_cb; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void TpSetCallbackPersistent (PTP_CALLBACK_ENVIRON cbe) { cbe->u.s.Persistent = 1; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void TpDestroyCallbackEnviron (PTP_CALLBACK_ENVIRON cbe) { {(cbe) = (cbe);}; } struct _TEB *NtCurrentTeb(void);

	declare function GetCurrentFiber() as PVOID
	declare function GetFiberData() as PVOID

	'' TODO: extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) struct _TEB *NtCurrentTeb(void) { return (struct _TEB *)__readgsqword(((LONG)(LONG_PTR)&(((NT_TIB *)0)->Self))); } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) PVOID GetCurrentFiber(void) { return(PVOID)__readgsqword(((LONG)(LONG_PTR)&(((NT_TIB *)0)->FiberData))); } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) PVOID GetFiberData(void) { return *(PVOID *)GetCurrentFiber(); } typedef GUID CRM_PROTOCOL_ID,*PCRM_PROTOCOL_ID;
#else
	'' TODO: extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void TpInitializeCallbackEnviron (PTP_CALLBACK_ENVIRON cbe) { cbe->Pool = ((void *)0); cbe->CleanupGroup = ((void *)0); cbe->CleanupGroupCancelCallback = ((void *)0); cbe->RaceDll = ((void *)0); cbe->ActivationContext = ((void *)0); cbe->FinalizationCallback = ((void *)0); cbe->u.Flags = 0; cbe->Version = 1; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void TpSetCallbackThreadpool (PTP_CALLBACK_ENVIRON cbe, PTP_POOL pool) { cbe->Pool = pool; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void TpSetCallbackCleanupGroup (PTP_CALLBACK_ENVIRON cbe, PTP_CLEANUP_GROUP cleanup_group, PTP_CLEANUP_GROUP_CANCEL_CALLBACK cleanup_group_cb) { cbe->CleanupGroup = cleanup_group; cbe->CleanupGroupCancelCallback = cleanup_group_cb; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void TpSetCallbackActivationContext (PTP_CALLBACK_ENVIRON cbe, struct _ACTIVATION_CONTEXT *actx) { cbe->ActivationContext = actx; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void TpSetCallbackNoActivationContext (PTP_CALLBACK_ENVIRON cbe) { cbe->ActivationContext = (struct _ACTIVATION_CONTEXT *) (LONG_PTR) -1; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void TpSetCallbackLongFunction (PTP_CALLBACK_ENVIRON cbe) { cbe->u.s.LongFunction = 1; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void TpSetCallbackRaceWithDll (PTP_CALLBACK_ENVIRON cbe, PVOID h) { cbe->RaceDll = h; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void TpSetCallbackFinalizationCallback (PTP_CALLBACK_ENVIRON cbe, PTP_SIMPLE_CALLBACK fini_cb) { cbe->FinalizationCallback = fini_cb; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void TpSetCallbackPersistent (PTP_CALLBACK_ENVIRON cbe) { cbe->u.s.Persistent = 1; } extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void TpDestroyCallbackEnviron (PTP_CALLBACK_ENVIRON cbe) { {(cbe) = (cbe);}; } typedef GUID CRM_PROTOCOL_ID,*PCRM_PROTOCOL_ID;
#endif

#define _NTTMAPI_
#define TRANSACTIONMANAGER_QUERY_INFORMATION &h00001
#define TRANSACTIONMANAGER_SET_INFORMATION &h00002
#define TRANSACTIONMANAGER_RECOVER &h00004
#define TRANSACTIONMANAGER_RENAME &h00008
#define TRANSACTIONMANAGER_CREATE_RM &h00010
#define TRANSACTIONMANAGER_BIND_TRANSACTION &h00020
#define TRANSACTIONMANAGER_GENERIC_READ (STANDARD_RIGHTS_READ or TRANSACTIONMANAGER_QUERY_INFORMATION)
#define TRANSACTIONMANAGER_GENERIC_WRITE ((((STANDARD_RIGHTS_WRITE or TRANSACTIONMANAGER_SET_INFORMATION) or TRANSACTIONMANAGER_RECOVER) or TRANSACTIONMANAGER_RENAME) or TRANSACTIONMANAGER_CREATE_RM)
#define TRANSACTIONMANAGER_GENERIC_EXECUTE STANDARD_RIGHTS_EXECUTE
#define TRANSACTIONMANAGER_ALL_ACCESS ((((STANDARD_RIGHTS_REQUIRED or TRANSACTIONMANAGER_GENERIC_READ) or TRANSACTIONMANAGER_GENERIC_WRITE) or TRANSACTIONMANAGER_GENERIC_EXECUTE) or TRANSACTIONMANAGER_BIND_TRANSACTION)
#define TRANSACTION_QUERY_INFORMATION &h0001
#define TRANSACTION_SET_INFORMATION &h0002
#define TRANSACTION_ENLIST &h0004
#define TRANSACTION_COMMIT &h0008
#define TRANSACTION_ROLLBACK &h0010
#define TRANSACTION_PROPAGATE &h0020
#define TRANSACTION_RIGHT_RESERVED1 &h0040
#define TRANSACTION_GENERIC_READ ((STANDARD_RIGHTS_READ or TRANSACTION_QUERY_INFORMATION) or SYNCHRONIZE)
#define TRANSACTION_GENERIC_WRITE ((((((STANDARD_RIGHTS_WRITE or TRANSACTION_SET_INFORMATION) or TRANSACTION_COMMIT) or TRANSACTION_ENLIST) or TRANSACTION_ROLLBACK) or TRANSACTION_PROPAGATE) or SYNCHRONIZE)
#define TRANSACTION_GENERIC_EXECUTE (((STANDARD_RIGHTS_EXECUTE or TRANSACTION_COMMIT) or TRANSACTION_ROLLBACK) or SYNCHRONIZE)
#define TRANSACTION_ALL_ACCESS (((STANDARD_RIGHTS_REQUIRED or TRANSACTION_GENERIC_READ) or TRANSACTION_GENERIC_WRITE) or TRANSACTION_GENERIC_EXECUTE)
#define TRANSACTION_RESOURCE_MANAGER_RIGHTS ((((((TRANSACTION_GENERIC_READ or STANDARD_RIGHTS_WRITE) or TRANSACTION_SET_INFORMATION) or TRANSACTION_ENLIST) or TRANSACTION_ROLLBACK) or TRANSACTION_PROPAGATE) or SYNCHRONIZE)
#define RESOURCEMANAGER_QUERY_INFORMATION &h0001
#define RESOURCEMANAGER_SET_INFORMATION &h0002
#define RESOURCEMANAGER_RECOVER &h0004
#define RESOURCEMANAGER_ENLIST &h0008
#define RESOURCEMANAGER_GET_NOTIFICATION &h0010
#define RESOURCEMANAGER_REGISTER_PROTOCOL &h0020
#define RESOURCEMANAGER_COMPLETE_PROPAGATION &h0040
#define RESOURCEMANAGER_GENERIC_READ ((STANDARD_RIGHTS_READ or RESOURCEMANAGER_QUERY_INFORMATION) or SYNCHRONIZE)
#define RESOURCEMANAGER_GENERIC_WRITE (((((((STANDARD_RIGHTS_WRITE or RESOURCEMANAGER_SET_INFORMATION) or RESOURCEMANAGER_RECOVER) or RESOURCEMANAGER_ENLIST) or RESOURCEMANAGER_GET_NOTIFICATION) or RESOURCEMANAGER_REGISTER_PROTOCOL) or RESOURCEMANAGER_COMPLETE_PROPAGATION) or SYNCHRONIZE)
#define RESOURCEMANAGER_GENERIC_EXECUTE (((((STANDARD_RIGHTS_EXECUTE or RESOURCEMANAGER_RECOVER) or RESOURCEMANAGER_ENLIST) or RESOURCEMANAGER_GET_NOTIFICATION) or RESOURCEMANAGER_COMPLETE_PROPAGATION) or SYNCHRONIZE)
#define RESOURCEMANAGER_ALL_ACCESS (((STANDARD_RIGHTS_REQUIRED or RESOURCEMANAGER_GENERIC_READ) or RESOURCEMANAGER_GENERIC_WRITE) or RESOURCEMANAGER_GENERIC_EXECUTE)
#define ENLISTMENT_QUERY_INFORMATION 1
#define ENLISTMENT_SET_INFORMATION 2
#define ENLISTMENT_RECOVER 4
#define ENLISTMENT_SUBORDINATE_RIGHTS 8
#define ENLISTMENT_SUPERIOR_RIGHTS &h10
#define ENLISTMENT_GENERIC_READ (STANDARD_RIGHTS_READ or ENLISTMENT_QUERY_INFORMATION)
#define ENLISTMENT_GENERIC_WRITE ((((STANDARD_RIGHTS_WRITE or ENLISTMENT_SET_INFORMATION) or ENLISTMENT_RECOVER) or ENLISTMENT_SUBORDINATE_RIGHTS) or ENLISTMENT_SUPERIOR_RIGHTS)
#define ENLISTMENT_GENERIC_EXECUTE (((STANDARD_RIGHTS_EXECUTE or ENLISTMENT_RECOVER) or ENLISTMENT_SUBORDINATE_RIGHTS) or ENLISTMENT_SUPERIOR_RIGHTS)
#define ENLISTMENT_ALL_ACCESS (((STANDARD_RIGHTS_REQUIRED or ENLISTMENT_GENERIC_READ) or ENLISTMENT_GENERIC_WRITE) or ENLISTMENT_GENERIC_EXECUTE)

type _TRANSACTION_OUTCOME as long
enum
	TransactionOutcomeUndetermined = 1
	TransactionOutcomeCommitted
	TransactionOutcomeAborted
end enum

type TRANSACTION_OUTCOME as _TRANSACTION_OUTCOME

type _TRANSACTION_STATE as long
enum
	TransactionStateNormal = 1
	TransactionStateIndoubt
	TransactionStateCommittedNotify
end enum

type TRANSACTION_STATE as _TRANSACTION_STATE

type _TRANSACTION_BASIC_INFORMATION
	TransactionId as GUID
	State as DWORD
	Outcome as DWORD
end type

type TRANSACTION_BASIC_INFORMATION as _TRANSACTION_BASIC_INFORMATION
type PTRANSACTION_BASIC_INFORMATION as _TRANSACTION_BASIC_INFORMATION ptr

type _TRANSACTIONMANAGER_BASIC_INFORMATION
	TmIdentity as GUID
	VirtualClock as LARGE_INTEGER
end type

type TRANSACTIONMANAGER_BASIC_INFORMATION as _TRANSACTIONMANAGER_BASIC_INFORMATION
type PTRANSACTIONMANAGER_BASIC_INFORMATION as _TRANSACTIONMANAGER_BASIC_INFORMATION ptr

type _TRANSACTIONMANAGER_LOG_INFORMATION
	LogIdentity as GUID
end type

type TRANSACTIONMANAGER_LOG_INFORMATION as _TRANSACTIONMANAGER_LOG_INFORMATION
type PTRANSACTIONMANAGER_LOG_INFORMATION as _TRANSACTIONMANAGER_LOG_INFORMATION ptr

type _TRANSACTIONMANAGER_LOGPATH_INFORMATION
	LogPathLength as DWORD
	LogPath(0 to 0) as WCHAR
end type

type TRANSACTIONMANAGER_LOGPATH_INFORMATION as _TRANSACTIONMANAGER_LOGPATH_INFORMATION
type PTRANSACTIONMANAGER_LOGPATH_INFORMATION as _TRANSACTIONMANAGER_LOGPATH_INFORMATION ptr

type _TRANSACTIONMANAGER_RECOVERY_INFORMATION
	LastRecoveredLsn as ULONGLONG
end type

type TRANSACTIONMANAGER_RECOVERY_INFORMATION as _TRANSACTIONMANAGER_RECOVERY_INFORMATION
type PTRANSACTIONMANAGER_RECOVERY_INFORMATION as _TRANSACTIONMANAGER_RECOVERY_INFORMATION ptr

type _TRANSACTIONMANAGER_OLDEST_INFORMATION
	OldestTransactionGuid as GUID
end type

type TRANSACTIONMANAGER_OLDEST_INFORMATION as _TRANSACTIONMANAGER_OLDEST_INFORMATION
type PTRANSACTIONMANAGER_OLDEST_INFORMATION as _TRANSACTIONMANAGER_OLDEST_INFORMATION ptr

type _TRANSACTION_PROPERTIES_INFORMATION
	IsolationLevel as DWORD
	IsolationFlags as DWORD
	Timeout as LARGE_INTEGER
	Outcome as DWORD
	DescriptionLength as DWORD
	Description(0 to 0) as WCHAR
end type

type TRANSACTION_PROPERTIES_INFORMATION as _TRANSACTION_PROPERTIES_INFORMATION
type PTRANSACTION_PROPERTIES_INFORMATION as _TRANSACTION_PROPERTIES_INFORMATION ptr

type _TRANSACTION_BIND_INFORMATION
	TmHandle as HANDLE
end type

type TRANSACTION_BIND_INFORMATION as _TRANSACTION_BIND_INFORMATION
type PTRANSACTION_BIND_INFORMATION as _TRANSACTION_BIND_INFORMATION ptr

type _TRANSACTION_ENLISTMENT_PAIR
	EnlistmentId as GUID
	ResourceManagerId as GUID
end type

type TRANSACTION_ENLISTMENT_PAIR as _TRANSACTION_ENLISTMENT_PAIR
type PTRANSACTION_ENLISTMENT_PAIR as _TRANSACTION_ENLISTMENT_PAIR ptr

type _TRANSACTION_ENLISTMENTS_INFORMATION
	NumberOfEnlistments as DWORD
	EnlistmentPair(0 to 0) as TRANSACTION_ENLISTMENT_PAIR
end type

type TRANSACTION_ENLISTMENTS_INFORMATION as _TRANSACTION_ENLISTMENTS_INFORMATION
type PTRANSACTION_ENLISTMENTS_INFORMATION as _TRANSACTION_ENLISTMENTS_INFORMATION ptr

type _TRANSACTION_SUPERIOR_ENLISTMENT_INFORMATION
	SuperiorEnlistmentPair as TRANSACTION_ENLISTMENT_PAIR
end type

type TRANSACTION_SUPERIOR_ENLISTMENT_INFORMATION as _TRANSACTION_SUPERIOR_ENLISTMENT_INFORMATION
type PTRANSACTION_SUPERIOR_ENLISTMENT_INFORMATION as _TRANSACTION_SUPERIOR_ENLISTMENT_INFORMATION ptr

type _RESOURCEMANAGER_BASIC_INFORMATION
	ResourceManagerId as GUID
	DescriptionLength as DWORD
	Description(0 to 0) as WCHAR
end type

type RESOURCEMANAGER_BASIC_INFORMATION as _RESOURCEMANAGER_BASIC_INFORMATION
type PRESOURCEMANAGER_BASIC_INFORMATION as _RESOURCEMANAGER_BASIC_INFORMATION ptr

type _RESOURCEMANAGER_COMPLETION_INFORMATION
	IoCompletionPortHandle as HANDLE
	CompletionKey as ULONG_PTR
end type

type RESOURCEMANAGER_COMPLETION_INFORMATION as _RESOURCEMANAGER_COMPLETION_INFORMATION
type PRESOURCEMANAGER_COMPLETION_INFORMATION as _RESOURCEMANAGER_COMPLETION_INFORMATION ptr

type _TRANSACTION_INFORMATION_CLASS as long
enum
	TransactionBasicInformation
	TransactionPropertiesInformation
	TransactionEnlistmentInformation
	TransactionSuperiorEnlistmentInformation
	TransactionBindInformation
	TransactionDTCPrivateInformation
end enum

type TRANSACTION_INFORMATION_CLASS as _TRANSACTION_INFORMATION_CLASS

type _TRANSACTIONMANAGER_INFORMATION_CLASS as long
enum
	TransactionManagerBasicInformation
	TransactionManagerLogInformation
	TransactionManagerLogPathInformation
	TransactionManagerOnlineProbeInformation = 3
	TransactionManagerRecoveryInformation = 4
	TransactionManagerOldestTransactionInformation = 5
end enum

type TRANSACTIONMANAGER_INFORMATION_CLASS as _TRANSACTIONMANAGER_INFORMATION_CLASS

type _RESOURCEMANAGER_INFORMATION_CLASS as long
enum
	ResourceManagerBasicInformation
	ResourceManagerCompletionInformation
end enum

type RESOURCEMANAGER_INFORMATION_CLASS as _RESOURCEMANAGER_INFORMATION_CLASS

type _ENLISTMENT_BASIC_INFORMATION
	EnlistmentId as GUID
	TransactionId as GUID
	ResourceManagerId as GUID
end type

type ENLISTMENT_BASIC_INFORMATION as _ENLISTMENT_BASIC_INFORMATION
type PENLISTMENT_BASIC_INFORMATION as _ENLISTMENT_BASIC_INFORMATION ptr

type _ENLISTMENT_CRM_INFORMATION
	CrmTransactionManagerId as GUID
	CrmResourceManagerId as GUID
	CrmEnlistmentId as GUID
end type

type ENLISTMENT_CRM_INFORMATION as _ENLISTMENT_CRM_INFORMATION
type PENLISTMENT_CRM_INFORMATION as _ENLISTMENT_CRM_INFORMATION ptr

type _ENLISTMENT_INFORMATION_CLASS as long
enum
	EnlistmentBasicInformation
	EnlistmentRecoveryInformation
	EnlistmentCrmInformation
end enum

type ENLISTMENT_INFORMATION_CLASS as _ENLISTMENT_INFORMATION_CLASS

type _TRANSACTION_LIST_ENTRY
	UOW as GUID
end type

type TRANSACTION_LIST_ENTRY as _TRANSACTION_LIST_ENTRY
type PTRANSACTION_LIST_ENTRY as _TRANSACTION_LIST_ENTRY ptr

type _TRANSACTION_LIST_INFORMATION
	NumberOfTransactions as DWORD
	TransactionInformation(0 to 0) as TRANSACTION_LIST_ENTRY
end type

type TRANSACTION_LIST_INFORMATION as _TRANSACTION_LIST_INFORMATION
type PTRANSACTION_LIST_INFORMATION as _TRANSACTION_LIST_INFORMATION ptr

type _KTMOBJECT_TYPE as long
enum
	KTMOBJECT_TRANSACTION
	KTMOBJECT_TRANSACTION_MANAGER
	KTMOBJECT_RESOURCE_MANAGER
	KTMOBJECT_ENLISTMENT
	KTMOBJECT_INVALID
end enum

type KTMOBJECT_TYPE as _KTMOBJECT_TYPE
type PKTMOBJECT_TYPE as _KTMOBJECT_TYPE ptr

type _KTMOBJECT_CURSOR
	LastQuery as GUID
	ObjectIdCount as DWORD
	ObjectIds(0 to 0) as GUID
end type

type KTMOBJECT_CURSOR as _KTMOBJECT_CURSOR
type PKTMOBJECT_CURSOR as _KTMOBJECT_CURSOR ptr

#define WOW64_CONTEXT_i386 &h00010000
#define WOW64_CONTEXT_i486 &h00010000
#define WOW64_CONTEXT_CONTROL (WOW64_CONTEXT_i386 or __MSABI_LONG(&h00000001))
#define WOW64_CONTEXT_INTEGER (WOW64_CONTEXT_i386 or __MSABI_LONG(&h00000002))
#define WOW64_CONTEXT_SEGMENTS (WOW64_CONTEXT_i386 or __MSABI_LONG(&h00000004))
#define WOW64_CONTEXT_FLOATING_POINT (WOW64_CONTEXT_i386 or __MSABI_LONG(&h00000008))
#define WOW64_CONTEXT_DEBUG_REGISTERS (WOW64_CONTEXT_i386 or __MSABI_LONG(&h00000010))
#define WOW64_CONTEXT_EXTENDED_REGISTERS (WOW64_CONTEXT_i386 or __MSABI_LONG(&h00000020))
#define WOW64_CONTEXT_FULL ((WOW64_CONTEXT_CONTROL or WOW64_CONTEXT_INTEGER) or WOW64_CONTEXT_SEGMENTS)
#define WOW64_CONTEXT_ALL (((((WOW64_CONTEXT_CONTROL or WOW64_CONTEXT_INTEGER) or WOW64_CONTEXT_SEGMENTS) or WOW64_CONTEXT_FLOATING_POINT) or WOW64_CONTEXT_DEBUG_REGISTERS) or WOW64_CONTEXT_EXTENDED_REGISTERS)
#define WOW64_CONTEXT_XSTATE (WOW64_CONTEXT_i386 or __MSABI_LONG(&h00000040))
#define WOW64_CONTEXT_EXCEPTION_ACTIVE &h08000000
#define WOW64_CONTEXT_SERVICE_ACTIVE &h10000000
#define WOW64_CONTEXT_EXCEPTION_REQUEST &h40000000
#define WOW64_CONTEXT_EXCEPTION_REPORTING &h80000000
#define WOW64_SIZE_OF_80387_REGISTERS 80
#define WOW64_MAXIMUM_SUPPORTED_EXTENSION 512

type _WOW64_FLOATING_SAVE_AREA
	ControlWord as DWORD
	StatusWord as DWORD
	TagWord as DWORD
	ErrorOffset as DWORD
	ErrorSelector as DWORD
	DataOffset as DWORD
	DataSelector as DWORD
	RegisterArea(0 to 79) as BYTE
	Cr0NpxState as DWORD
end type

type WOW64_FLOATING_SAVE_AREA as _WOW64_FLOATING_SAVE_AREA
type PWOW64_FLOATING_SAVE_AREA as _WOW64_FLOATING_SAVE_AREA ptr

type _WOW64_CONTEXT field = 4
	ContextFlags as DWORD
	Dr0 as DWORD
	Dr1 as DWORD
	Dr2 as DWORD
	Dr3 as DWORD
	Dr6 as DWORD
	Dr7 as DWORD
	FloatSave as WOW64_FLOATING_SAVE_AREA
	SegGs as DWORD
	SegFs as DWORD
	SegEs as DWORD
	SegDs as DWORD
	Edi as DWORD
	Esi as DWORD
	Ebx as DWORD
	Edx as DWORD
	Ecx as DWORD
	Eax as DWORD
	Ebp as DWORD
	Eip as DWORD
	SegCs as DWORD
	EFlags as DWORD
	Esp as DWORD
	SegSs as DWORD
	ExtendedRegisters(0 to 511) as BYTE
end type

type WOW64_CONTEXT as _WOW64_CONTEXT
type PWOW64_CONTEXT as _WOW64_CONTEXT ptr

type ___WOW64_LDT_ENTRY_Bytes
	BaseMid as BYTE
	Flags1 as BYTE
	Flags2 as BYTE
	BaseHi as BYTE
end type

type ___WOW64_LDT_ENTRY_Bits
	BaseMid : 8 as DWORD
	as DWORD Type : 5
	Dpl : 2 as DWORD
	Pres : 1 as DWORD
	LimitHi : 4 as DWORD
	Sys : 1 as DWORD
	Reserved_0 : 1 as DWORD
	Default_Big : 1 as DWORD
	Granularity : 1 as DWORD
	BaseHi : 8 as DWORD
end type

union ___WOW64_LDT_ENTRY_HighWord
	Bytes as ___WOW64_LDT_ENTRY_Bytes
	Bits as ___WOW64_LDT_ENTRY_Bits
end union

type _WOW64_LDT_ENTRY
	LimitLow as WORD
	BaseLow as WORD
	HighWord as ___WOW64_LDT_ENTRY_HighWord
end type

type WOW64_LDT_ENTRY as _WOW64_LDT_ENTRY
type PWOW64_LDT_ENTRY as _WOW64_LDT_ENTRY ptr

type _WOW64_DESCRIPTOR_TABLE_ENTRY
	Selector as DWORD
	Descriptor as WOW64_LDT_ENTRY
end type

type WOW64_DESCRIPTOR_TABLE_ENTRY as _WOW64_DESCRIPTOR_TABLE_ENTRY
type PWOW64_DESCRIPTOR_TABLE_ENTRY as _WOW64_DESCRIPTOR_TABLE_ENTRY ptr

#define ACTIVATION_CONTEXT_SECTION_ASSEMBLY_INFORMATION 1
#define ACTIVATION_CONTEXT_SECTION_DLL_REDIRECTION 2
#define ACTIVATION_CONTEXT_SECTION_WINDOW_CLASS_REDIRECTION 3
#define ACTIVATION_CONTEXT_SECTION_COM_SERVER_REDIRECTION 4
#define ACTIVATION_CONTEXT_SECTION_COM_INTERFACE_REDIRECTION 5
#define ACTIVATION_CONTEXT_SECTION_COM_TYPE_LIBRARY_REDIRECTION 6
#define ACTIVATION_CONTEXT_SECTION_COM_PROGID_REDIRECTION 7
#define ACTIVATION_CONTEXT_SECTION_GLOBAL_OBJECT_RENAME_TABLE 8
#define ACTIVATION_CONTEXT_SECTION_CLR_SURROGATES 9
#define ACTIVATION_CONTEXT_SECTION_APPLICATION_SETTINGS 10
#define ACTIVATION_CONTEXT_SECTION_COMPATIBILITY_INFO 11

end extern