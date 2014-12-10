#pragma once

#include once "_mingw_unicode.bi"

extern "C"

#define __WINE_DXERR8_H

extern     WINAPI as const zstring ptr
dim shared WINAPI as const zstring ptr

'' TODO: const char* WINAPI DXGetErrorString8A(HRESULT hr);
'' TODO: const WCHAR* WINAPI DXGetErrorString8W(HRESULT hr);

#define DXGetErrorString8 __MINGW_NAME_AW(DXGetErrorString8)

'' TODO: const char* WINAPI DXGetErrorDescription8A(HRESULT hr);
'' TODO: const WCHAR* WINAPI DXGetErrorDescription8W(HRESULT hr);

#define DXGetErrorDescription8 __MINGW_NAME_AW(DXGetErrorDescription8)

'' TODO: HRESULT WINAPI DXTraceA(const char* strFile, DWORD dwLine, HRESULT hr, const char* strMsg, WINBOOL bPopMsgBox);
'' TODO: HRESULT WINAPI DXTraceW(const char* strFile, DWORD dwLine, HRESULT hr, const WCHAR* strMsg, WINBOOL bPopMsgBox);

#define DXTrace __MINGW_NAME_AW(DXTrace)
#define DXTRACE_MSG(str) __MSABI_LONG(0)
#define DXTRACE_ERR(str, hr) (hr)
#define DXTRACE_ERR_NOMSGBOX(str, hr) (hr)

end extern