#pragma once

#include once "rpc.bi"
#include once "rpcndr.bi"
#include once "windows.bi"
#include once "ole2.bi"
#include once "unknwn.bi"
#include once "wtypes.bi"

#define __shtypes_h__

type _SHITEMID field = 1
	cb as USHORT
	abID(0 to 0) as UBYTE
end type

type SHITEMID as _SHITEMID
type LPSHITEMID as SHITEMID ptr
type LPCSHITEMID as const SHITEMID ptr

type _ITEMIDLIST field = 1
	mkid as SHITEMID
end type

type ITEMIDLIST as _ITEMIDLIST
type ITEMIDLIST_RELATIVE as ITEMIDLIST
type ITEMID_CHILD as ITEMIDLIST
type ITEMIDLIST_ABSOLUTE as ITEMIDLIST
type wirePIDL as BYTE_BLOB ptr
type LPITEMIDLIST as ITEMIDLIST ptr
type LPCITEMIDLIST as const ITEMIDLIST ptr

#define PIDLIST_ABSOLUTE LPITEMIDLIST
#define PCIDLIST_ABSOLUTE LPCITEMIDLIST
#define PCUIDLIST_ABSOLUTE LPCITEMIDLIST
#define PIDLIST_RELATIVE LPITEMIDLIST
#define PCIDLIST_RELATIVE LPCITEMIDLIST
#define PUIDLIST_RELATIVE LPITEMIDLIST
#define PCUIDLIST_RELATIVE LPCITEMIDLIST
#define PITEMID_CHILD LPITEMIDLIST
#define PCITEMID_CHILD LPCITEMIDLIST
#define PUITEMID_CHILD LPITEMIDLIST
#define PCUITEMID_CHILD LPCITEMIDLIST
#define PCUITEMID_CHILD_ARRAY LPCITEMIDLIST ptr
#define PCUIDLIST_RELATIVE_ARRAY LPCITEMIDLIST ptr
#define PCIDLIST_ABSOLUTE_ARRAY LPCITEMIDLIST ptr
#define PCUIDLIST_ABSOLUTE_ARRAY LPCITEMIDLIST ptr

type tagSTRRET_TYPE as long
enum
	STRRET_WSTR = &h0
	STRRET_OFFSET = &h1
	STRRET_CSTR = &h2
end enum

type STRRET_TYPE as tagSTRRET_TYPE

type _STRRET
	uType as UINT

	union
		pOleStr as LPWSTR
		uOffset as UINT
		cStr as zstring * 260
	end union
end type

type STRRET as _STRRET
type LPSTRRET as STRRET ptr

type _SHELLDETAILS field = 1
	fmt as long
	cxChar as long
	str as STRRET
end type

type SHELLDETAILS as _SHELLDETAILS
type LPSHELLDETAILS as _SHELLDETAILS ptr

#if _WIN32_WINNT = &h0602
	type tagPERCEIVED as long
	enum
		PERCEIVED_TYPE_FIRST = -3
		PERCEIVED_TYPE_CUSTOM = -3
		PERCEIVED_TYPE_UNSPECIFIED = -2
		PERCEIVED_TYPE_FOLDER = -1
		PERCEIVED_TYPE_UNKNOWN = 0
		PERCEIVED_TYPE_TEXT = 1
		PERCEIVED_TYPE_IMAGE = 2
		PERCEIVED_TYPE_AUDIO = 3
		PERCEIVED_TYPE_VIDEO = 4
		PERCEIVED_TYPE_COMPRESSED = 5
		PERCEIVED_TYPE_DOCUMENT = 6
		PERCEIVED_TYPE_SYSTEM = 7
		PERCEIVED_TYPE_APPLICATION = 8
		PERCEIVED_TYPE_GAMEMEDIA = 9
		PERCEIVED_TYPE_CONTACTS = 10
		PERCEIVED_TYPE_LAST = 10
	end enum

	type PERCEIVED as tagPERCEIVED

	#define PERCEIVEDFLAG_UNDEFINED &h0000
	#define PERCEIVEDFLAG_SOFTCODED &h0001
	#define PERCEIVEDFLAG_HARDCODED &h0002
	#define PERCEIVEDFLAG_NATIVESUPPORT &h0004
	#define PERCEIVEDFLAG_GDIPLUS &h0010
	#define PERCEIVEDFLAG_WMSDK &h0020
	#define PERCEIVEDFLAG_ZIPFOLDER &h0040

	type PERCEIVEDFLAG as DWORD
#endif

type _COMDLG_FILTERSPEC
	pszName as LPCWSTR
	pszSpec as LPCWSTR
end type

type COMDLG_FILTERSPEC as _COMDLG_FILTERSPEC
type KNOWNFOLDERID as GUID
type KF_REDIRECT_FLAGS as DWORD
type FOLDERTYPEID as GUID
type TASKOWNERID as GUID
type ELEMENTID as GUID

type tagSHCOLSTATE as long
enum
	SHCOLSTATE_DEFAULT = &h0
	SHCOLSTATE_TYPE_STR = &h1
	SHCOLSTATE_TYPE_INT = &h2
	SHCOLSTATE_TYPE_DATE = &h3
	SHCOLSTATE_TYPEMASK = &hf
	SHCOLSTATE_ONBYDEFAULT = &h10
	SHCOLSTATE_SLOW = &h20
	SHCOLSTATE_EXTENDED = &h40
	SHCOLSTATE_SECONDARYUI = &h80
	SHCOLSTATE_HIDDEN = &h100
	SHCOLSTATE_PREFER_VARCMP = &h200
	SHCOLSTATE_PREFER_FMTCMP = &h400
	SHCOLSTATE_NOSORTBYFOLDERNESS = &h800
	SHCOLSTATE_VIEWONLY = &h10000
	SHCOLSTATE_BATCHREAD = &h20000
	SHCOLSTATE_NO_GROUPBY = &h40000
	SHCOLSTATE_FIXED_WIDTH = &h1000
	SHCOLSTATE_NODPISCALE = &h2000
	SHCOLSTATE_FIXED_RATIO = &h4000
	SHCOLSTATE_DISPLAYMASK = &hf000
end enum

type SHCOLSTATE as tagSHCOLSTATE
type SHCOLSTATEF as DWORD
type SHCOLUMNID as PROPERTYKEY
type LPCSHCOLUMNID as const SHCOLUMNID ptr

type DEVICE_SCALE_FACTOR as long
enum
	SCALE_100_PERCENT = 100
	SCALE_140_PERCENT = 140
	SCALE_180_PERCENT = 180
end enum
