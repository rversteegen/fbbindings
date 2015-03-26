#pragma once

#include once "X11/extensions/multibufconst.bi"

#define _MULTIBUFPROTO_H_
const X_MbufGetBufferVersion = 0
const X_MbufCreateImageBuffers = 1
const X_MbufDestroyImageBuffers = 2
const X_MbufDisplayImageBuffers = 3
const X_MbufSetMBufferAttributes = 4
const X_MbufGetMBufferAttributes = 5
const X_MbufSetBufferAttributes = 6
const X_MbufGetBufferAttributes = 7
const X_MbufGetBufferInfo = 8
const X_MbufCreateStereoWindow = 9
const X_MbufClearImageBufferArea = 10

type xMbufBufferInfo
	visualID as CARD32
	maxBuffers as CARD16
	depth as CARD8
	unused as CARD8
end type

const sz_xMbufBufferInfo = 8

type xMbufClobberNotifyEvent
	as UBYTE type
	unused as UBYTE
	sequenceNumber as CARD16
	buffer as CARD32
	state as UBYTE
	unused1 as CARD8
	unused2 as CARD16
	unused3 as CARD32
	unused4 as CARD32
	unused5 as CARD32
	unused6 as CARD32
	unused7 as CARD32
end type

type xMbufUpdateNotifyEvent
	as UBYTE type
	unused as UBYTE
	sequenceNumber as CARD16
	buffer as CARD32
	timeStamp as CARD32
	unused1 as CARD32
	unused2 as CARD32
	unused3 as CARD32
	unused4 as CARD32
	unused5 as CARD32
	unused6 as CARD32
end type

type xMbufGetBufferVersionReq
	reqType as CARD8
	mbufReqType as CARD8
	length as CARD16
end type

const sz_xMbufGetBufferVersionReq = 4

type xMbufGetBufferVersionReply
	as UBYTE type
	unused as CARD8
	sequenceNumber as CARD16
	length as CARD32
	majorVersion as CARD8
	minorVersion as CARD8
	pad1 as CARD16
	pad2 as CARD32
	pad3 as CARD32
	pad4 as CARD32
	pad5 as CARD32
	pad6 as CARD32
end type

const sz_xMbufGetBufferVersionReply = 32

type xMbufCreateImageBuffersReq
	reqType as CARD8
	mbufReqType as CARD8
	length as CARD16
	window as CARD32
	updateAction as CARD8
	updateHint as CARD8
	unused as CARD16
end type

const sz_xMbufCreateImageBuffersReq = 12

type xMbufCreateImageBuffersReply
	as UBYTE type
	unused as CARD8
	sequenceNumber as CARD16
	length as CARD32
	numberBuffer as CARD16
	unused1 as CARD16
	unused2 as CARD32
	unused3 as CARD32
	unused4 as CARD32
	unused5 as CARD32
	unused6 as CARD32
end type

const sz_xMbufCreateImageBuffersReply = 32

type xMbufDestroyImageBuffersReq
	reqType as CARD8
	mbufReqType as CARD8
	length as CARD16
	window as CARD32
end type

const sz_xMbufDestroyImageBuffersReq = 8

type xMbufDisplayImageBuffersReq
	reqType as CARD8
	mbufReqType as CARD8
	length as CARD16
	minDelay as CARD16
	maxDelay as CARD16
end type

const sz_xMbufDisplayImageBuffersReq = 8

type xMbufSetMBufferAttributesReq
	reqType as CARD8
	mbufReqType as CARD8
	length as CARD16
	window as CARD32
	valueMask as CARD32
end type

const sz_xMbufSetMBufferAttributesReq = 12

type xMbufGetMBufferAttributesReq
	reqType as CARD8
	mbufReqType as CARD8
	length as CARD16
	window as CARD32
end type

const sz_xMbufGetMBufferAttributesReq = 8

type xMbufGetMBufferAttributesReply
	as UBYTE type
	unused as CARD8
	sequenceNumber as CARD16
	length as CARD32
	displayedBuffer as CARD16
	updateAction as CARD8
	updateHint as CARD8
	windowMode as CARD8
	unused0 as CARD8
	unused1 as CARD16
	unused2 as CARD32
	unused3 as CARD32
	unused4 as CARD32
	unused5 as CARD32
end type

const sz_xMbufGetMBufferAttributesReply = 32

type xMbufSetBufferAttributesReq
	reqType as CARD8
	mbufReqType as CARD8
	length as CARD16
	buffer as CARD32
	valueMask as CARD32
end type

const sz_xMbufSetBufferAttributesReq = 12

type xMbufGetBufferAttributesReq
	reqType as CARD8
	mbufReqType as CARD8
	length as CARD16
	buffer as CARD32
end type

const sz_xMbufGetBufferAttributesReq = 8

type xMbufGetBufferAttributesReply
	as UBYTE type
	unused as CARD8
	sequenceNumber as CARD16
	length as CARD32
	window as CARD32
	eventMask as CARD32
	bufferIndex as CARD16
	side as CARD8
	unused0 as CARD8
	unused1 as CARD32
	unused2 as CARD32
	unused3 as CARD32
end type

const sz_xMbufGetBufferAttributesReply = 32

type xMbufGetBufferInfoReq
	reqType as CARD8
	mbufReqType as CARD8
	length as CARD16
	drawable as CARD32
end type

const sz_xMbufGetBufferInfoReq = 8

type xMbufGetBufferInfoReply
	as UBYTE type
	unused as CARD8
	sequenceNumber as CARD16
	length as CARD32
	normalInfo as CARD16
	stereoInfo as CARD16
	unused1 as CARD32
	unused2 as CARD32
	unused3 as CARD32
	unused4 as CARD32
	unused5 as CARD32
end type

const sz_xMbufGetBufferInfoReply = 32

type xMbufCreateStereoWindowReq
	reqType as CARD8
	mbufReqType as CARD8
	length as CARD16
	unused0 as CARD8
	unused1 as CARD8
	unused2 as CARD8
	depth as CARD8
	wid as CARD32
	parent as CARD32
	left as CARD32
	right as CARD32
	x as INT16
	y as INT16
	width as CARD16
	height as CARD16
	borderWidth as CARD16
	class as CARD16
	visual as CARD32
	mask as CARD32
end type

const sz_xMbufCreateStereoWindowReq = 44

type xMbufClearImageBufferAreaReq
	reqType as CARD8
	mbufReqType as CARD8
	length as CARD16
	buffer as CARD32
	x as INT16
	y as INT16
	width as CARD16
	height as CARD16
	unused0 as CARD8
	unused1 as CARD8
	unused2 as CARD8
	exposures as BOOL
end type

const sz_xMbufClearImageBufferAreaReq = 20
