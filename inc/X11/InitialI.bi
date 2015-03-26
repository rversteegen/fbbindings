#pragma once

#include once "crt/long.bi"

#ifdef __FB_LINUX__
	#include once "crt/limits.bi"
	#include once "sys/param.bi"
#endif

#include once "X11/Xos.bi"
#include once "X11/Xpoll.bi"

extern "C"

#define _XtinitialI_h

#ifdef __FB_WIN32__
	const PATH_MAX = 512
#else
	const PATH_MAX = 1024
#endif

type _TimerEventRec
	te_timer_value as timeval
	te_next as _TimerEventRec ptr
	te_proc as XtTimerCallbackProc
	app as XtAppContext
	te_closure as XtPointer
end type

type TimerEventRec as _TimerEventRec

type _InputEvent
	ie_proc as XtInputCallbackProc
	ie_closure as XtPointer
	ie_next as _InputEvent ptr
	ie_oq as _InputEvent ptr
	app as XtAppContext
	ie_source as long
	ie_condition as XtInputMask
end type

type InputEvent as _InputEvent

type _SignalEventRec
	se_proc as XtSignalCallbackProc
	se_closure as XtPointer
	se_next as _SignalEventRec ptr
	app as XtAppContext
	se_notice as byte
end type

type SignalEventRec as _SignalEventRec

type _WorkProcRec
	proc as XtWorkProc
	closure as XtPointer
	next as _WorkProcRec ptr
	app as XtAppContext
end type

type WorkProcRec as _WorkProcRec

type FdStruct
	rmask as fd_set
	wmask as fd_set
	emask as fd_set
	nfds as long
end type

type _LangProcRec
	proc as XtLanguageProc
	closure as XtPointer
end type

type LangProcRec as _LangProcRec

type _ProcessContextRec
	defaultAppContext as XtAppContext
	appContextList as XtAppContext
	globalConverterTable as ConverterTable
	globalLangProcRec as LangProcRec
end type

type ProcessContextRec as _ProcessContextRec
type ProcessContext as _ProcessContextRec ptr

type Heap
	start as zstring ptr
	current as zstring ptr
	bytes_remaining as long
end type

type DestroyRec as _DestroyRec

type _XtAppStruct
	next as XtAppContext
	process as ProcessContext
	destroy_callbacks as InternalCallbackList
	list as Display ptr ptr
	timerQueue as TimerEventRec ptr
	workQueue as WorkProcRec ptr
	input_list as InputEvent ptr ptr
	outstandingQueue as InputEvent ptr
	signalQueue as SignalEventRec ptr
	errorDB as XrmDatabase
	errorMsgHandler as XtErrorMsgHandler
	warningMsgHandler as XtErrorMsgHandler
	errorHandler as XtErrorHandler
	warningHandler as XtErrorHandler
	action_table as _ActionListRec ptr
	converterTable as ConverterTable
	selectionTimeout as culong
	fds as FdStruct
	count as short
	max as short
	last as short
	input_count as short
	input_max as short
	sync as byte
	being_destroyed as byte
	error_inited as byte
	identify_windows as byte
	heap as Heap
	fallback_resources as String ptr
	action_hook_list as _ActionHookRec ptr
	block_hook_list as _BlockHookRec ptr
	destroy_list_size as long
	destroy_count as long
	dispatch_level as long
	destroy_list as DestroyRec ptr
	in_phase2_destroy as Widget
	langProcRec as LangProcRec
	free_bindings as _TMBindCacheRec ptr
	display_name_tried as String
	dpy_destroy_list as Display ptr ptr
	dpy_destroy_count as long
	exit_flag as byte
	rebuild_fdlist as byte
	lock_info as LockPtr
	lock as ThreadAppProc
	unlock as ThreadAppProc
	yield_lock as ThreadAppYieldLockProc
	restore_lock as ThreadAppRestoreLockProc
	free_lock as ThreadAppProc
end type

type XtAppStruct as _XtAppStruct
declare sub _XtHeapInit(byval heap as Heap ptr)
declare sub _XtHeapFree(byval heap as Heap ptr)
declare function _XtHeapAlloc(byval as Heap ptr, byval as Cardinal) as zstring ptr
declare sub _XtSetDefaultErrorHandlers(byval as XtErrorMsgHandler ptr, byval as XtErrorMsgHandler ptr, byval as XtErrorHandler ptr, byval as XtErrorHandler ptr)
declare sub _XtSetDefaultSelectionTimeout(byval as culong ptr)
declare function _XtDefaultAppContext() as XtAppContext
declare function _XtGetProcessContext() as ProcessContext
declare function _XtAppInit(byval as XtAppContext ptr, byval as String, byval as XrmOptionDescRec ptr, byval as Cardinal, byval as long ptr, byval as String ptr ptr, byval as String ptr) as Display ptr
declare sub _XtDestroyAppContexts()
declare sub _XtCloseDisplays(byval as XtAppContext)
extern _XtAppDestroyCount as long
declare function _XtWaitForSomething(byval as XtAppContext, byval as byte, byval as byte, byval as byte, byval as byte, byval as byte, byval as byte, byval as culong ptr) as long
type CaseConverterPtr as _CaseConverterRec ptr

type _CaseConverterRec
	start as KeySym
	stop as KeySym
	proc as XtCaseProc
	next as CaseConverterPtr
end type

type CaseConverterRec as _CaseConverterRec

type _ExtensionSelectorRec
	proc as XtExtensionSelectProc
	min as long
	max as long
	client_data as XtPointer
end type

type ExtSelectRec as _ExtensionSelectorRec

type _XtPerDisplayStruct
	destroy_callbacks as InternalCallbackList
	region as Region
	case_cvt as CaseConverterPtr
	defaultKeycodeTranslator as XtKeyProc
	appContext as XtAppContext
	keysyms_serial as culong
	keysyms as KeySym ptr
	keysyms_per_keycode as long
	min_keycode as long
	max_keycode as long
	modKeysyms as KeySym ptr
	modsToKeysyms as ModToKeysymTable ptr
	isModifier(0 to 31) as ubyte
	lock_meaning as KeySym
	mode_switch as Modifiers
	num_lock as Modifiers
	being_destroyed as byte
	rv as byte
	name as XrmName
	class as XrmClass
	heap as Heap
	GClist as _GCrec ptr
	pixmap_tab as Drawable ptr ptr
	language as String
	last_event as XEvent
	last_timestamp as Time
	multi_click_time as long
	tm_context as _TMKeyContextRec ptr
	mapping_callbacks as InternalCallbackList
	pdi as XtPerDisplayInputRec
	WWtable as _WWTable ptr
	per_screen_db as XrmDatabase ptr
	cmd_db as XrmDatabase
	server_db as XrmDatabase
	dispatcher_list as XtEventDispatchProc ptr
	ext_select_list as ExtSelectRec ptr
	ext_select_count as long
	hook_object as Widget
	rcm_init as Atom
	rcm_data as Atom
end type

type XtPerDisplayStruct as _XtPerDisplayStruct
type XtPerDisplay as _XtPerDisplayStruct ptr

type _PerDisplayTable
	dpy as Display ptr
	perDpy as XtPerDisplayStruct
	next as _PerDisplayTable ptr
end type

type PerDisplayTable as _PerDisplayTable
type PerDisplayTablePtr as _PerDisplayTable ptr
extern _XtperDisplayList as PerDisplayTablePtr
declare function _XtSortPerDisplayList(byval as Display ptr) as XtPerDisplay
declare function _XtGetPerDisplay(byval as Display ptr) as XtPerDisplay
declare function _XtGetPerDisplayInput(byval as Display ptr) as XtPerDisplayInputRec ptr
declare sub _XtDisplayInitialize(byval as Display ptr, byval as XtPerDisplay, byval as const zstring ptr, byval as XrmOptionDescRec ptr, byval as Cardinal, byval as long ptr, byval as zstring ptr ptr)
declare sub _XtCacheFlushTag(byval as XtAppContext, byval as XtPointer)
declare sub _XtFreeActions(byval as _ActionListRec ptr)
declare sub _XtDoPhase2Destroy(byval as XtAppContext, byval as long)
declare sub _XtDoFreeBindings(byval as XtAppContext)
declare sub _XtExtensionSelect(byval as Widget)
#define _XtSafeToDestroy(app) ((app)->dispatch_level = 0)
declare sub _XtAllocWWTable(byval pd as XtPerDisplay)
declare sub _XtFreeWWTable(byval pd as XtPerDisplay)
declare function _XtGetUserName(byval dest as String, byval len as long) as String
declare function _XtPreparseCommandLine(byval urlist as XrmOptionDescRec ptr, byval num_urs as Cardinal, byval argc as long, byval argv as String ptr, byval applName as String ptr, byval displayName as String ptr, byval language as String ptr) as XrmDatabase

end extern