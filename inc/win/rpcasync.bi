#pragma once

#include once "_mingw_unicode.bi"

#ifdef __FB_64BIT__
	extern "C"
#else
	extern "Windows"
#endif

type _RPC_ASYNC_STATE as _RPC_ASYNC_STATE_

#define __RPCASYNC_H__

#ifndef __FB_64BIT__
	#define RPC_ASYNC_VERSION_1_0 sizeof(RPC_ASYNC_STATE)
#endif

type _RPC_NOTIFICATION_TYPES as long
enum
	RpcNotificationTypeNone
	RpcNotificationTypeEvent
	RpcNotificationTypeApc
	RpcNotificationTypeIoc
	RpcNotificationTypeHwnd
	RpcNotificationTypeCallback
end enum

type RPC_NOTIFICATION_TYPES as _RPC_NOTIFICATION_TYPES

#ifdef __FB_64BIT__
	#define RPC_ASYNC_VERSION_1_0 sizeof(RPC_ASYNC_STATE)
#endif

type _RPC_ASYNC_EVENT as long
enum
	RpcCallComplete
	RpcSendComplete
	RpcReceiveComplete
end enum

type RPC_ASYNC_EVENT as _RPC_ASYNC_EVENT
type PFN_RPCNOTIFICATION_ROUTINE as sub(byval pAsync as _RPC_ASYNC_STATE ptr, byval Context as any ptr, byval Event as RPC_ASYNC_EVENT)

type ___RPC_ASYNC_STATE_APC
	NotificationRoutine as PFN_RPCNOTIFICATION_ROUTINE
	hThread as HANDLE
end type

type ___RPC_ASYNC_STATE_IOC
	hIOPort as HANDLE
	dwNumberOfBytesTransferred as DWORD
	dwCompletionKey as DWORD_PTR
	lpOverlapped as LPOVERLAPPED
end type

type ___RPC_ASYNC_STATE_HWND
	hWnd as HWND
	Msg as UINT
end type

union ___RPC_ASYNC_STATE_u
	APC as ___RPC_ASYNC_STATE_APC
	IOC as ___RPC_ASYNC_STATE_IOC
	HWND as ___RPC_ASYNC_STATE_HWND
	hEvent as HANDLE
	NotificationRoutine as PFN_RPCNOTIFICATION_ROUTINE
end union

type _RPC_ASYNC_STATE_
	Size as ulong
	Signature as ulong
	Lock as long
	Flags as ulong
	StubInfo as any ptr
	UserInfo as any ptr
	RuntimeInfo as any ptr
	Event as RPC_ASYNC_EVENT
	NotificationType as RPC_NOTIFICATION_TYPES
	u as ___RPC_ASYNC_STATE_u
	Reserved(0 to 3) as LONG_PTR
end type

type RPC_ASYNC_STATE as _RPC_ASYNC_STATE
type PRPC_ASYNC_STATE as _RPC_ASYNC_STATE ptr

#define RPC_C_NOTIFY_ON_SEND_COMPLETE &h1
#define RPC_C_INFINITE_TIMEOUT INFINITE
#define RpcAsyncGetCallHandle(pAsync) cast(PRPC_ASYNC_STATE, pAsync)->RuntimeInfo

declare function RpcAsyncInitializeHandle(byval pAsync as PRPC_ASYNC_STATE, byval Size as ulong) as RPC_STATUS
declare function RpcAsyncRegisterInfo(byval pAsync as PRPC_ASYNC_STATE) as RPC_STATUS
declare function RpcAsyncGetCallStatus(byval pAsync as PRPC_ASYNC_STATE) as RPC_STATUS
declare function RpcAsyncCompleteCall(byval pAsync as PRPC_ASYNC_STATE, byval Reply as any ptr) as RPC_STATUS
declare function RpcAsyncAbortCall(byval pAsync as PRPC_ASYNC_STATE, byval ExceptionCode as ulong) as RPC_STATUS
declare function RpcAsyncCancelCall(byval pAsync as PRPC_ASYNC_STATE, byval fAbort as WINBOOL) as RPC_STATUS
declare function RpcAsyncCleanupThread(byval dwTimeout as DWORD) as RPC_STATUS

type tagExtendedErrorParamTypes as long
enum
	eeptAnsiString = 1
	eeptUnicodeString
	eeptLongVal
	eeptShortVal
	eeptPointerVal
	eeptNone
	eeptBinary
end enum

type ExtendedErrorParamTypes as tagExtendedErrorParamTypes

#define MaxNumberOfEEInfoParams 4
#define RPC_EEINFO_VERSION 1

type tagBinaryParam
	Buffer as any ptr
	Size as short
end type

type BinaryParam as tagBinaryParam

union __tagRPC_EE_INFO_PARAM_u
	AnsiString as LPSTR
	UnicodeString as LPWSTR
	LVal as long
	SVal as short
	PVal as ULONGLONG
	BVal as BinaryParam
end union

type tagRPC_EE_INFO_PARAM
	ParameterType as ExtendedErrorParamTypes
	u as __tagRPC_EE_INFO_PARAM_u
end type

type RPC_EE_INFO_PARAM as tagRPC_EE_INFO_PARAM

#define EEInfoPreviousRecordsMissing 1
#define EEInfoNextRecordsMissing 2
#define EEInfoUseFileTime 4
#define EEInfoGCCOM 11
#define EEInfoGCFRS 12

union __tagRPC_EXTENDED_ERROR_INFO_u
	SystemTime as SYSTEMTIME
	FileTime as FILETIME
end union

type tagRPC_EXTENDED_ERROR_INFO
	Version as ULONG
	ComputerName as LPWSTR
	ProcessID as ULONG
	u as __tagRPC_EXTENDED_ERROR_INFO_u
	GeneratingComponent as ULONG
	Status as ULONG
	DetectionLocation as USHORT
	Flags as USHORT
	NumberOfParameters as long
	Parameters(0 to 3) as RPC_EE_INFO_PARAM
end type

type RPC_EXTENDED_ERROR_INFO as tagRPC_EXTENDED_ERROR_INFO

type tagRPC_ERROR_ENUM_HANDLE
	Signature as ULONG
	CurrentPos as any ptr
	Head as any ptr
end type

type RPC_ERROR_ENUM_HANDLE as tagRPC_ERROR_ENUM_HANDLE

declare function RpcErrorStartEnumeration(byval EnumHandle as RPC_ERROR_ENUM_HANDLE ptr) as RPC_STATUS
declare function RpcErrorGetNextRecord(byval EnumHandle as RPC_ERROR_ENUM_HANDLE ptr, byval CopyStrings as WINBOOL, byval ErrorInfo as RPC_EXTENDED_ERROR_INFO ptr) as RPC_STATUS
declare function RpcErrorEndEnumeration(byval EnumHandle as RPC_ERROR_ENUM_HANDLE ptr) as RPC_STATUS
declare function RpcErrorResetEnumeration(byval EnumHandle as RPC_ERROR_ENUM_HANDLE ptr) as RPC_STATUS
declare function RpcErrorGetNumberOfRecords(byval EnumHandle as RPC_ERROR_ENUM_HANDLE ptr, byval Records as long ptr) as RPC_STATUS
declare function RpcErrorSaveErrorInfo(byval EnumHandle as RPC_ERROR_ENUM_HANDLE ptr, byval ErrorBlob as PVOID ptr, byval BlobSize as uinteger ptr) as RPC_STATUS
declare function RpcErrorLoadErrorInfo(byval ErrorBlob as PVOID, byval BlobSize as uinteger, byval EnumHandle as RPC_ERROR_ENUM_HANDLE ptr) as RPC_STATUS
declare function RpcErrorAddRecord(byval ErrorInfo as RPC_EXTENDED_ERROR_INFO ptr) as RPC_STATUS
declare sub RpcErrorClearInformation()
declare function RpcGetAuthorizationContextForClient(byval ClientBinding as RPC_BINDING_HANDLE, byval ImpersonateOnReturn as WINBOOL, byval Reserved1 as PVOID, byval pExpirationTime as PLARGE_INTEGER, byval Reserved2 as LUID, byval Reserved3 as DWORD, byval Reserved4 as PVOID, byval pAuthzClientContext as PVOID ptr) as RPC_STATUS
declare function RpcFreeAuthorizationContext(byval pAuthzClientContext as PVOID ptr) as RPC_STATUS
declare function RpcSsContextLockExclusive(byval ServerBindingHandle as RPC_BINDING_HANDLE, byval UserContext as PVOID) as RPC_STATUS
declare function RpcSsContextLockShared(byval ServerBindingHandle as RPC_BINDING_HANDLE, byval UserContext as PVOID) as RPC_STATUS

#define RPC_CALL_ATTRIBUTES_VERSION 1
#define RPC_QUERY_SERVER_PRINCIPAL_NAME 2
#define RPC_QUERY_CLIENT_PRINCIPAL_NAME 4

type tagRPC_CALL_ATTRIBUTES_V1_W
	Version as ulong
	Flags as ulong
	ServerPrincipalNameBufferLength as ulong
	ServerPrincipalName as ushort ptr
	ClientPrincipalNameBufferLength as ulong
	ClientPrincipalName as ushort ptr
	AuthenticationLevel as ulong
	AuthenticationService as ulong
	NullSession as WINBOOL
end type

type RPC_CALL_ATTRIBUTES_V1_W as tagRPC_CALL_ATTRIBUTES_V1_W

type tagRPC_CALL_ATTRIBUTES_V1_A
	Version as ulong
	Flags as ulong
	ServerPrincipalNameBufferLength as ulong
	ServerPrincipalName as ubyte ptr
	ClientPrincipalNameBufferLength as ulong
	ClientPrincipalName as ubyte ptr
	AuthenticationLevel as ulong
	AuthenticationService as ulong
	NullSession as WINBOOL
end type

type RPC_CALL_ATTRIBUTES_V1_A as tagRPC_CALL_ATTRIBUTES_V1_A

#define RPC_CALL_ATTRIBUTES_V1 __MINGW_NAME_UAW(RPC_CALL_ATTRIBUTES_V1)
#define RpcServerInqCallAttributes __MINGW_NAME_AW(RpcServerInqCallAttributes)

declare function RpcServerInqCallAttributesW(byval ClientBinding as RPC_BINDING_HANDLE, byval RpcCallAttributes as any ptr) as RPC_STATUS
declare function RpcServerInqCallAttributesA(byval ClientBinding as RPC_BINDING_HANDLE, byval RpcCallAttributes as any ptr) as RPC_STATUS

#ifdef UNICODE
	type RPC_CALL_ATTRIBUTES as RPC_CALL_ATTRIBUTES_V1_W
#else
	type RPC_CALL_ATTRIBUTES as RPC_CALL_ATTRIBUTES_V1_A
#endif

declare function I_RpcAsyncSetHandle(byval Message as PRPC_MESSAGE, byval pAsync as PRPC_ASYNC_STATE) as RPC_STATUS
declare function I_RpcAsyncAbortCall(byval pAsync as PRPC_ASYNC_STATE, byval ExceptionCode as ulong) as RPC_STATUS
declare function I_RpcExceptionFilter(byval ExceptionCode as ulong) as long

type ___RPC_ASYNC_NOTIFICATION_INFO_APC
	NotificationRoutine as PFN_RPCNOTIFICATION_ROUTINE
	hThread as HANDLE
end type

type ___RPC_ASYNC_NOTIFICATION_INFO_IOC
	hIOPort as HANDLE
	dwNumberOfBytesTransferred as DWORD
	dwCompletionKey as DWORD_PTR
	lpOverlapped as LPOVERLAPPED
end type

type ___RPC_ASYNC_NOTIFICATION_INFO_HWND
	hWnd as HWND
	Msg as UINT
end type

union _RPC_ASYNC_NOTIFICATION_INFO
	APC as ___RPC_ASYNC_NOTIFICATION_INFO_APC
	IOC as ___RPC_ASYNC_NOTIFICATION_INFO_IOC
	HWND as ___RPC_ASYNC_NOTIFICATION_INFO_HWND
	hEvent as HANDLE
	NotificationRoutine as PFN_RPCNOTIFICATION_ROUTINE
end union

type RPC_ASYNC_NOTIFICATION_INFO as _RPC_ASYNC_NOTIFICATION_INFO
type PRPC_ASYNC_NOTIFICATION_INFO as _RPC_ASYNC_NOTIFICATION_INFO ptr

declare function RpcBindingBind(byval pAsync as PRPC_ASYNC_STATE, byval Binding as RPC_BINDING_HANDLE, byval IfSpec as RPC_IF_HANDLE) as RPC_STATUS
declare function RpcBindingUnbind(byval Binding as RPC_BINDING_HANDLE) as RPC_STATUS

type _RpcCallType as long
enum
	rctInvalid
	rctNormal
	rctTraining
	rctGuaranteed
end enum

type RpcCallType as _RpcCallType

type _RpcLocalAddressFormat as long
enum
	rlafInvalid
	rlafIPv4
	rlafIPv6
end enum

type RpcLocalAddressFormat as _RpcLocalAddressFormat

type _RPC_NOTIFICATIONS as long
enum
	RpcNotificationCallNone = 0
	RpcNotificationClientDisconnect = 1
	RpcNotificationCallCancel = 2
end enum

type RPC_NOTIFICATIONS as _RPC_NOTIFICATIONS

type _RpcCallClientLocality as long
enum
	rcclInvalid
	rcclLocal
	rcclRemote
	rcclClientUnknownLocality
end enum

type RpcCallClientLocality as _RpcCallClientLocality

declare function RpcServerSubscribeForNotification(byval Binding as RPC_BINDING_HANDLE, byval Notification as DWORD, byval NotificationType as RPC_NOTIFICATION_TYPES, byval NotificationInfo as RPC_ASYNC_NOTIFICATION_INFO ptr) as RPC_STATUS
declare function RpcServerUnsubscribeForNotification(byval Binding as RPC_BINDING_HANDLE, byval Notification as RPC_NOTIFICATIONS, byval NotificationsQueued as ulong ptr) as RPC_STATUS

end extern
