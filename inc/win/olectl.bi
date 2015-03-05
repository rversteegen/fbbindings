#pragma once

#include once "ocidl.bi"

#inclib "oleaut32"

extern "Windows"

#define _OLECTL_H_

extern IID_IPropertyFrame as const GUID
extern CLSID_CFontPropPage as const GUID
extern CLSID_CColorPropPage as const GUID
extern CLSID_CPicturePropPage as const GUID
extern CLSID_PersistPropset as const GUID
extern CLSID_ConvertVBX as const GUID
extern CLSID_StdFont as const GUID
extern CLSID_StdPicture as const GUID
extern GUID_HIMETRIC as const GUID
extern GUID_COLOR as const GUID
extern GUID_XPOSPIXEL as const GUID
extern GUID_YPOSPIXEL as const GUID
extern GUID_XSIZEPIXEL as const GUID
extern GUID_YSIZEPIXEL as const GUID
extern GUID_XPOS as const GUID
extern GUID_YPOS as const GUID
extern GUID_XSIZE as const GUID
extern GUID_YSIZE as const GUID
extern GUID_OPTIONVALUEEXCLUSIVE as const GUID
extern GUID_CHECKVALUEEXCLUSIVE as const GUID
extern GUID_FONTNAME as const GUID
extern GUID_FONTSIZE as const GUID
extern GUID_FONTBOLD as const GUID
extern GUID_FONTITALIC as const GUID
extern GUID_FONTUNDERSCORE as const GUID
extern GUID_FONTSTRIKETHROUGH as const GUID
extern GUID_HANDLE as const GUID

type tagOCPFIPARAMS
	cbStructSize as ULONG
	hWndOwner as HWND
	x as long
	y as long
	lpszCaption as LPCOLESTR
	cObjects as ULONG
	lplpUnk as LPUNKNOWN ptr
	cPages as ULONG
	lpPages as CLSID ptr
	lcid as LCID
	dispidInitialProperty as DISPID
end type

type OCPFIPARAMS as tagOCPFIPARAMS
type LPOCPFIPARAMS as tagOCPFIPARAMS ptr

#define FONTSIZE(n) (n##0000, 0)

type tagFONTDESC
	cbSizeofstruct as UINT
	lpstrName as LPOLESTR
	cySize as CY
	sWeight as SHORT
	sCharset as SHORT
	fItalic as WINBOOL
	fUnderline as WINBOOL
	fStrikethrough as WINBOOL
end type

type FONTDESC as tagFONTDESC
type LPFONTDESC as tagFONTDESC ptr

#define PICTYPE_UNINITIALIZED (-1)
#define PICTYPE_NONE 0
#define PICTYPE_BITMAP 1
#define PICTYPE_METAFILE 2
#define PICTYPE_ICON 3
#define PICTYPE_ENHMETAFILE 4

type tagPICTDESC_bmp
	hbitmap as HBITMAP
	hpal as HPALETTE
end type

type tagPICTDESC_wmf
	hmeta as HMETAFILE
	xExt as long
	yExt as long
end type

type tagPICTDESC_icon
	hicon as HICON
end type

type tagPICTDESC_emf
	hemf as HENHMETAFILE
end type

type tagPICTDESC
	cbSizeofstruct as UINT
	picType as UINT

	union
		bmp as tagPICTDESC_bmp
		wmf as tagPICTDESC_wmf
		icon as tagPICTDESC_icon
		emf as tagPICTDESC_emf
	end union
end type

type PICTDESC as tagPICTDESC
type LPPICTDESC as tagPICTDESC ptr
type OLE_XPOS_PIXELS as long
type OLE_YPOS_PIXELS as long
type OLE_XSIZE_PIXELS as long
type OLE_YSIZE_PIXELS as long
type OLE_XPOS_CONTAINER as single
type OLE_YPOS_CONTAINER as single
type OLE_XSIZE_CONTAINER as single
type OLE_YSIZE_CONTAINER as single

type OLE_TRISTATE as long
enum
	triUnchecked = 0
	triChecked = 1
	triGray = 2
end enum

type OLE_OPTEXCLUSIVE as VARIANT_BOOL
type OLE_CANCELBOOL as VARIANT_BOOL
type OLE_ENABLEDEFAULTBOOL as VARIANT_BOOL

#define STD_CTL_SCODE(n) MAKE_SCODE(SEVERITY_ERROR, FACILITY_CONTROL, n)
#define CTL_E_ILLEGALFUNCTIONCALL STD_CTL_SCODE(5)
#define CTL_E_OVERFLOW STD_CTL_SCODE(6)
#define CTL_E_OUTOFMEMORY STD_CTL_SCODE(7)
#define CTL_E_DIVISIONBYZERO STD_CTL_SCODE(11)
#define CTL_E_OUTOFSTRINGSPACE STD_CTL_SCODE(14)
#define CTL_E_OUTOFSTACKSPACE STD_CTL_SCODE(28)
#define CTL_E_BADFILENAMEORNUMBER STD_CTL_SCODE(52)
#define CTL_E_FILENOTFOUND STD_CTL_SCODE(53)
#define CTL_E_BADFILEMODE STD_CTL_SCODE(54)
#define CTL_E_FILEALREADYOPEN STD_CTL_SCODE(55)
#define CTL_E_DEVICEIOERROR STD_CTL_SCODE(57)
#define CTL_E_FILEALREADYEXISTS STD_CTL_SCODE(58)
#define CTL_E_BADRECORDLENGTH STD_CTL_SCODE(59)
#define CTL_E_DISKFULL STD_CTL_SCODE(61)
#define CTL_E_BADRECORDNUMBER STD_CTL_SCODE(63)
#define CTL_E_BADFILENAME STD_CTL_SCODE(64)
#define CTL_E_TOOMANYFILES STD_CTL_SCODE(67)
#define CTL_E_DEVICEUNAVAILABLE STD_CTL_SCODE(68)
#define CTL_E_PERMISSIONDENIED STD_CTL_SCODE(70)
#define CTL_E_DISKNOTREADY STD_CTL_SCODE(71)
#define CTL_E_PATHFILEACCESSERROR STD_CTL_SCODE(75)
#define CTL_E_PATHNOTFOUND STD_CTL_SCODE(76)
#define CTL_E_INVALIDPATTERNSTRING STD_CTL_SCODE(93)
#define CTL_E_INVALIDUSEOFNULL STD_CTL_SCODE(94)
#define CTL_E_INVALIDFILEFORMAT STD_CTL_SCODE(321)
#define CTL_E_INVALIDPROPERTYVALUE STD_CTL_SCODE(380)
#define CTL_E_INVALIDPROPERTYARRAYINDEX STD_CTL_SCODE(381)
#define CTL_E_SETNOTSUPPORTEDATRUNTIME STD_CTL_SCODE(382)
#define CTL_E_SETNOTSUPPORTED STD_CTL_SCODE(383)
#define CTL_E_NEEDPROPERTYARRAYINDEX STD_CTL_SCODE(385)
#define CTL_E_SETNOTPERMITTED STD_CTL_SCODE(387)
#define CTL_E_GETNOTSUPPORTEDATRUNTIME STD_CTL_SCODE(393)
#define CTL_E_GETNOTSUPPORTED STD_CTL_SCODE(394)
#define CTL_E_PROPERTYNOTFOUND STD_CTL_SCODE(422)
#define CTL_E_INVALIDCLIPBOARDFORMAT STD_CTL_SCODE(460)
#define CTL_E_INVALIDPICTURE STD_CTL_SCODE(481)
#define CTL_E_PRINTERERROR STD_CTL_SCODE(482)
#define CTL_E_CANTSAVEFILETOTEMP STD_CTL_SCODE(735)
#define CTL_E_SEARCHTEXTNOTFOUND STD_CTL_SCODE(744)
#define CTL_E_REPLACEMENTSTOOLONG STD_CTL_SCODE(746)
#define CUSTOM_CTL_SCODE(n) MAKE_SCODE(SEVERITY_ERROR, FACILITY_CONTROL, n)
#define CTL_E_CUSTOM_FIRST CUSTOM_CTL_SCODE(600)
#define CONNECT_E_FIRST MAKE_SCODE(SEVERITY_ERROR, FACILITY_ITF, &h0200)
#define CONNECT_E_LAST MAKE_SCODE(SEVERITY_ERROR, FACILITY_ITF, &h020F)
#define CONNECT_S_FIRST MAKE_SCODE(SEVERITY_SUCCESS, FACILITY_ITF, &h0200)
#define CONNECT_S_LAST MAKE_SCODE(SEVERITY_SUCCESS, FACILITY_ITF, &h020F)
#define CONNECT_E_NOCONNECTION (CONNECT_E_FIRST + 0)
#define CONNECT_E_ADVISELIMIT (CONNECT_E_FIRST + 1)
#define CONNECT_E_CANNOTCONNECT (CONNECT_E_FIRST + 2)
#define CONNECT_E_OVERRIDDEN (CONNECT_E_FIRST + 3)
#define SELFREG_E_FIRST MAKE_SCODE(SEVERITY_ERROR, FACILITY_ITF, &h0200)
#define SELFREG_E_LAST MAKE_SCODE(SEVERITY_ERROR, FACILITY_ITF, &h020F)
#define SELFREG_S_FIRST MAKE_SCODE(SEVERITY_SUCCESS, FACILITY_ITF, &h0200)
#define SELFREG_S_LAST MAKE_SCODE(SEVERITY_SUCCESS, FACILITY_ITF, &h020F)
#define SELFREG_E_TYPELIB (SELFREG_E_FIRST + 0)
#define SELFREG_E_CLASS (SELFREG_E_FIRST + 1)
#define PERPROP_E_FIRST MAKE_SCODE(SEVERITY_ERROR, FACILITY_ITF, &h0200)
#define PERPROP_E_LAST MAKE_SCODE(SEVERITY_ERROR, FACILITY_ITF, &h020F)
#define PERPROP_S_FIRST MAKE_SCODE(SEVERITY_SUCCESS, FACILITY_ITF, &h0200)
#define PERPROP_S_LAST MAKE_SCODE(SEVERITY_SUCCESS, FACILITY_ITF, &h020F)
#define PERPROP_E_NOPAGEAVAILABLE (PERPROP_E_FIRST + 0)
#define OLEIVERB_PROPERTIES __MSABI_LONG(-7)
#define VT_STREAMED_PROPSET 73
#define VT_STORED_PROPSET 74
#define VT_BLOB_PROPSET 75
#define VT_VERBOSE_ENUM 76
#define VT_COLOR VT_I4
#define VT_XPOS_PIXELS VT_I4
#define VT_YPOS_PIXELS VT_I4
#define VT_XSIZE_PIXELS VT_I4
#define VT_YSIZE_PIXELS VT_I4
#define VT_XPOS_HIMETRIC VT_I4
#define VT_YPOS_HIMETRIC VT_I4
#define VT_XSIZE_HIMETRIC VT_I4
#define VT_YSIZE_HIMETRIC VT_I4
#define VT_TRISTATE VT_I2
#define VT_OPTEXCLUSIVE VT_BOOL
#define VT_FONT VT_DISPATCH
#define VT_PICTURE VT_DISPATCH
#define VT_HANDLE VT_I4
#define OCM__BASE (WM_USER + &h1c00)
#define OCM_COMMAND (OCM__BASE + WM_COMMAND)
#define OCM_CTLCOLORBTN (OCM__BASE + WM_CTLCOLORBTN)
#define OCM_CTLCOLOREDIT (OCM__BASE + WM_CTLCOLOREDIT)
#define OCM_CTLCOLORDLG (OCM__BASE + WM_CTLCOLORDLG)
#define OCM_CTLCOLORLISTBOX (OCM__BASE + WM_CTLCOLORLISTBOX)
#define OCM_CTLCOLORMSGBOX (OCM__BASE + WM_CTLCOLORMSGBOX)
#define OCM_CTLCOLORSCROLLBAR (OCM__BASE + WM_CTLCOLORSCROLLBAR)
#define OCM_CTLCOLORSTATIC (OCM__BASE + WM_CTLCOLORSTATIC)
#define OCM_DRAWITEM (OCM__BASE + WM_DRAWITEM)
#define OCM_MEASUREITEM (OCM__BASE + WM_MEASUREITEM)
#define OCM_DELETEITEM (OCM__BASE + WM_DELETEITEM)
#define OCM_VKEYTOITEM (OCM__BASE + WM_VKEYTOITEM)
#define OCM_CHARTOITEM (OCM__BASE + WM_CHARTOITEM)
#define OCM_COMPAREITEM (OCM__BASE + WM_COMPAREITEM)
#define OCM_HSCROLL (OCM__BASE + WM_HSCROLL)
#define OCM_VSCROLL (OCM__BASE + WM_VSCROLL)
#define OCM_PARENTNOTIFY (OCM__BASE + WM_PARENTNOTIFY)
#define OCM_NOTIFY (OCM__BASE + WM_NOTIFY)

declare function DllRegisterServer() as HRESULT
declare function DllUnregisterServer() as HRESULT
declare function OleCreatePropertyFrame(byval hwndOwner as HWND, byval x as UINT, byval y as UINT, byval lpszCaption as LPCOLESTR, byval cObjects as ULONG, byval ppUnk as LPUNKNOWN ptr, byval cPages as ULONG, byval pPageClsID as LPCLSID, byval lcid as LCID, byval dwReserved as DWORD, byval pvReserved as LPVOID) as HRESULT
declare function OleCreatePropertyFrameIndirect(byval lpParams as LPOCPFIPARAMS) as HRESULT
declare function OleTranslateColor(byval clr as OLE_COLOR, byval hpal as HPALETTE, byval lpcolorref as COLORREF ptr) as HRESULT
declare function OleCreateFontIndirect(byval lpFontDesc as LPFONTDESC, byval riid as const IID const ptr, byval lplpvObj as LPVOID ptr) as HRESULT
declare function OleCreatePictureIndirect(byval lpPictDesc as LPPICTDESC, byval riid as const IID const ptr, byval fOwn as WINBOOL, byval lplpvObj as LPVOID ptr) as HRESULT
declare function OleLoadPicture(byval lpstream as LPSTREAM, byval lSize as LONG, byval fRunmode as WINBOOL, byval riid as const IID const ptr, byval lplpvObj as LPVOID ptr) as HRESULT
declare function OleLoadPictureEx(byval lpstream as LPSTREAM, byval lSize as LONG, byval fRunmode as WINBOOL, byval riid as const IID const ptr, byval xSizeDesired as DWORD, byval ySizeDesired as DWORD, byval dwFlags as DWORD, byval lplpvObj as LPVOID ptr) as HRESULT
declare function OleLoadPicturePath(byval szURLorPath as LPOLESTR, byval punkCaller as LPUNKNOWN, byval dwReserved as DWORD, byval clrReserved as OLE_COLOR, byval riid as const IID const ptr, byval ppvRet as LPVOID ptr) as HRESULT
declare function OleLoadPictureFile(byval varFileName as VARIANT, byval lplpdispPicture as LPDISPATCH ptr) as HRESULT
declare function OleLoadPictureFileEx(byval varFileName as VARIANT, byval xSizeDesired as DWORD, byval ySizeDesired as DWORD, byval dwFlags as DWORD, byval lplpdispPicture as LPDISPATCH ptr) as HRESULT
declare function OleSavePictureFile(byval lpdispPicture as LPDISPATCH, byval bstrFileName as BSTR) as HRESULT
declare function OleIconToCursor(byval hinstExe as HINSTANCE, byval hIcon as HICON) as HCURSOR

#define LP_DEFAULT &h00
#define LP_MONOCHROME &h01
#define LP_VGACOLOR &h02
#define LP_COLOR &h04
#define DISPID_AUTOSIZE (-500)
#define DISPID_BACKCOLOR (-501)
#define DISPID_BACKSTYLE (-502)
#define DISPID_BORDERCOLOR (-503)
#define DISPID_BORDERSTYLE (-504)
#define DISPID_BORDERWIDTH (-505)
#define DISPID_DRAWMODE (-507)
#define DISPID_DRAWSTYLE (-508)
#define DISPID_DRAWWIDTH (-509)
#define DISPID_FILLCOLOR (-510)
#define DISPID_FILLSTYLE (-511)
#define DISPID_FONT (-512)
#define DISPID_FORECOLOR (-513)
#define DISPID_ENABLED (-514)
#define DISPID_HWND (-515)
#define DISPID_TABSTOP (-516)
#define DISPID_TEXT (-517)
#define DISPID_CAPTION (-518)
#define DISPID_BORDERVISIBLE (-519)
#define DISPID_APPEARANCE (-520)
#define DISPID_MOUSEPOINTER (-521)
#define DISPID_MOUSEICON (-522)
#define DISPID_PICTURE (-523)
#define DISPID_VALID (-524)
#define DISPID_READYSTATE (-525)
#define DISPID_LISTINDEX (-526)
#define DISPID_SELECTED (-527)
#define DISPID_LIST (-528)
#define DISPID_COLUMN (-529)
#define DISPID_LISTCOUNT (-531)
#define DISPID_MULTISELECT (-532)
#define DISPID_MAXLENGTH (-533)
#define DISPID_PASSWORDCHAR (-534)
#define DISPID_SCROLLBARS (-535)
#define DISPID_WORDWRAP (-536)
#define DISPID_MULTILINE (-537)
#define DISPID_NUMBEROFROWS (-538)
#define DISPID_NUMBEROFCOLUMNS (-539)
#define DISPID_DISPLAYSTYLE (-540)
#define DISPID_GROUPNAME (-541)
#define DISPID_IMEMODE (-542)
#define DISPID_ACCELERATOR (-543)
#define DISPID_ENTERKEYBEHAVIOR (-544)
#define DISPID_TABKEYBEHAVIOR (-545)
#define DISPID_SELTEXT (-546)
#define DISPID_SELSTART (-547)
#define DISPID_SELLENGTH (-548)
#define DISPID_REFRESH (-550)
#define DISPID_DOCLICK (-551)
#define DISPID_ABOUTBOX (-552)
#define DISPID_ADDITEM (-553)
#define DISPID_CLEAR (-554)
#define DISPID_REMOVEITEM (-555)
#define DISPID_CLICK (-600)
#define DISPID_DBLCLICK (-601)
#define DISPID_KEYDOWN (-602)
#define DISPID_KEYPRESS (-603)
#define DISPID_KEYUP (-604)
#define DISPID_MOUSEDOWN (-605)
#define DISPID_MOUSEMOVE (-606)
#define DISPID_MOUSEUP (-607)
#define DISPID_ERROREVENT (-608)
#define DISPID_READYSTATECHANGE (-609)
#define DISPID_CLICK_VALUE (-610)
#define DISPID_RIGHTTOLEFT (-611)
#define DISPID_TOPTOBOTTOM (-612)
#define DISPID_THIS (-613)
#define DISPID_AMBIENT_BACKCOLOR (-701)
#define DISPID_AMBIENT_DISPLAYNAME (-702)
#define DISPID_AMBIENT_FONT (-703)
#define DISPID_AMBIENT_FORECOLOR (-704)
#define DISPID_AMBIENT_LOCALEID (-705)
#define DISPID_AMBIENT_MESSAGEREFLECT (-706)
#define DISPID_AMBIENT_SCALEUNITS (-707)
#define DISPID_AMBIENT_TEXTALIGN (-708)
#define DISPID_AMBIENT_USERMODE (-709)
#define DISPID_AMBIENT_UIDEAD (-710)
#define DISPID_AMBIENT_SHOWGRABHANDLES (-711)
#define DISPID_AMBIENT_SHOWHATCHING (-712)
#define DISPID_AMBIENT_DISPLAYASDEFAULT (-713)
#define DISPID_AMBIENT_SUPPORTSMNEMONICS (-714)
#define DISPID_AMBIENT_AUTOCLIP (-715)
#define DISPID_AMBIENT_APPEARANCE (-716)
#define DISPID_AMBIENT_CODEPAGE (-725)
#define DISPID_AMBIENT_PALETTE (-726)
#define DISPID_AMBIENT_CHARSET (-727)
#define DISPID_AMBIENT_TRANSFERPRIORITY (-728)
#define DISPID_AMBIENT_RIGHTTOLEFT (-732)
#define DISPID_AMBIENT_TOPTOBOTTOM (-733)
#define DISPID_Name (-800)
#define DISPID_Delete (-801)
#define DISPID_Object (-802)
#define DISPID_Parent (-803)
#define DISPID_FONT_NAME 0
#define DISPID_FONT_SIZE 2
#define DISPID_FONT_BOLD 3
#define DISPID_FONT_ITALIC 4
#define DISPID_FONT_UNDER 5
#define DISPID_FONT_STRIKE 6
#define DISPID_FONT_WEIGHT 7
#define DISPID_FONT_CHARSET 8
#define DISPID_FONT_CHANGED 9
#define DISPID_PICT_HANDLE 0
#define DISPID_PICT_HPAL 2
#define DISPID_PICT_TYPE 3
#define DISPID_PICT_WIDTH 4
#define DISPID_PICT_HEIGHT 5
#define DISPID_PICT_RENDER 6

end extern
