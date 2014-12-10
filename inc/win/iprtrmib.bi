#pragma once

#include once "crt/wchar.bi"
#include once "mprapi.bi"
#include once "ipmib.bi"
#include once "ipifcons.bi"
#include once "udpmib.bi"

'' The following symbols have been renamed:
''     #define MIB_IPPROTO_OTHER => MIB_IPPROTO_OTHER_
''     #define MIB_IPPROTO_LOCAL => MIB_IPPROTO_LOCAL_
''     #define MIB_IPPROTO_NETMGMT => MIB_IPPROTO_NETMGMT_
''     #define MIB_IPPROTO_ICMP => MIB_IPPROTO_ICMP_
''     #define MIB_IPPROTO_EGP => MIB_IPPROTO_EGP_
''     #define MIB_IPPROTO_GGP => MIB_IPPROTO_GGP_
''     #define MIB_IPPROTO_HELLO => MIB_IPPROTO_HELLO_
''     #define MIB_IPPROTO_RIP => MIB_IPPROTO_RIP_
''     #define MIB_IPPROTO_IS_IS => MIB_IPPROTO_IS_IS_
''     #define MIB_IPPROTO_ES_IS => MIB_IPPROTO_ES_IS_
''     #define MIB_IPPROTO_CISCO => MIB_IPPROTO_CISCO_
''     #define MIB_IPPROTO_BBN => MIB_IPPROTO_BBN_
''     #define MIB_IPPROTO_OSPF => MIB_IPPROTO_OSPF_
''     #define MIB_IPPROTO_BGP => MIB_IPPROTO_BGP_
''     #define MIB_IPPROTO_NT_AUTOSTATIC => MIB_IPPROTO_NT_AUTOSTATIC_
''     #define MIB_IPPROTO_NT_STATIC => MIB_IPPROTO_NT_STATIC_
''     #define MIB_IPPROTO_NT_STATIC_NON_DOD => MIB_IPPROTO_NT_STATIC_NON_DOD_

#define __ROUTING_IPRTRMIB_H__
#define IPRTRMGR_PID 10000
#define TCPIP_OWNING_MODULE_SIZE 16
#define IF_NUMBER 0
#define IF_TABLE (IF_NUMBER + 1)
#define IF_ROW (IF_TABLE + 1)
#define IP_STATS (IF_ROW + 1)
#define IP_ADDRTABLE (IP_STATS + 1)
#define IP_ADDRROW (IP_ADDRTABLE + 1)
#define IP_FORWARDNUMBER (IP_ADDRROW + 1)
#define IP_FORWARDTABLE (IP_FORWARDNUMBER + 1)
#define IP_FORWARDROW (IP_FORWARDTABLE + 1)
#define IP_NETTABLE (IP_FORWARDROW + 1)
#define IP_NETROW (IP_NETTABLE + 1)
#define ICMP_STATS (IP_NETROW + 1)
#define TCP_STATS (ICMP_STATS + 1)
#define TCP_TABLE (TCP_STATS + 1)
#define TCP_ROW (TCP_TABLE + 1)
#define UDP_STATS (TCP_ROW + 1)
#define UDP_TABLE (UDP_STATS + 1)
#define UDP_ROW (UDP_TABLE + 1)
#define MCAST_MFE (UDP_ROW + 1)
#define MCAST_MFE_STATS (MCAST_MFE + 1)
#define BEST_IF (MCAST_MFE_STATS + 1)
#define BEST_ROUTE (BEST_IF + 1)
#define PROXY_ARP (BEST_ROUTE + 1)
#define MCAST_IF_ENTRY (PROXY_ARP + 1)
#define MCAST_GLOBAL (MCAST_IF_ENTRY + 1)
#define IF_STATUS (MCAST_GLOBAL + 1)
#define MCAST_BOUNDARY (IF_STATUS + 1)
#define MCAST_SCOPE (MCAST_BOUNDARY + 1)
#define DEST_MATCHING (MCAST_SCOPE + 1)
#define DEST_LONGER (DEST_MATCHING + 1)
#define DEST_SHORTER (DEST_LONGER + 1)
#define ROUTE_MATCHING (DEST_SHORTER + 1)
#define ROUTE_LONGER (ROUTE_MATCHING + 1)
#define ROUTE_SHORTER (ROUTE_LONGER + 1)
#define ROUTE_STATE (ROUTE_SHORTER + 1)
#define MCAST_MFE_STATS_EX (ROUTE_STATE + 1)
#define IP6_STATS (MCAST_MFE_STATS_EX + 1)
#define UDP6_STATS (IP6_STATS + 1)
#define TCP6_STATS (UDP6_STATS + 1)
#define NUMBER_OF_EXPORTED_VARIABLES (TCP6_STATS + 1)

type _MIB_OPAQUE_QUERY
	dwVarId as DWORD
	rgdwVarIndex(0 to 0) as DWORD
end type

type MIB_OPAQUE_QUERY as _MIB_OPAQUE_QUERY
type PMIB_OPAQUE_QUERY as _MIB_OPAQUE_QUERY ptr

type _MIB_IFNUMBER
	dwValue as DWORD
end type

type MIB_IFNUMBER as _MIB_IFNUMBER
type PMIB_IFNUMBER as _MIB_IFNUMBER ptr

#define MAXLEN_IFDESCR 256
#define MAXLEN_PHYSADDR 8

type _MIB_IFROW
	wszName(0 to 255) as WCHAR
	dwIndex as DWORD
	dwType as DWORD
	dwMtu as DWORD
	dwSpeed as DWORD
	dwPhysAddrLen as DWORD
	bPhysAddr(0 to 7) as BYTE_
	dwAdminStatus as DWORD
	dwOperStatus as DWORD
	dwLastChange as DWORD
	dwInOctets as DWORD
	dwInUcastPkts as DWORD
	dwInNUcastPkts as DWORD
	dwInDiscards as DWORD
	dwInErrors as DWORD
	dwInUnknownProtos as DWORD
	dwOutOctets as DWORD
	dwOutUcastPkts as DWORD
	dwOutNUcastPkts as DWORD
	dwOutDiscards as DWORD
	dwOutErrors as DWORD
	dwOutQLen as DWORD
	dwDescrLen as DWORD
	bDescr(0 to 255) as BYTE_
end type

type MIB_IFROW as _MIB_IFROW
type PMIB_IFROW as _MIB_IFROW ptr

type _MIB_IFTABLE
	dwNumEntries as DWORD
	table(0 to 0) as MIB_IFROW
end type

type MIB_IFTABLE as _MIB_IFTABLE
type PMIB_IFTABLE as _MIB_IFTABLE ptr

#define SIZEOF_IFTABLE(X) ((FIELD_OFFSET(MIB_IFTABLE, table[0]) + ((X) * sizeof(MIB_IFROW))) + ALIGN_SIZE)

type _MIBICMPSTATS
	dwMsgs as DWORD
	dwErrors as DWORD
	dwDestUnreachs as DWORD
	dwTimeExcds as DWORD
	dwParmProbs as DWORD
	dwSrcQuenchs as DWORD
	dwRedirects as DWORD
	dwEchos as DWORD
	dwEchoReps as DWORD
	dwTimestamps as DWORD
	dwTimestampReps as DWORD
	dwAddrMasks as DWORD
	dwAddrMaskReps as DWORD
end type

type MIBICMPSTATS as _MIBICMPSTATS
type PMIBICMPSTATS as _MIBICMPSTATS ptr

type _MIBICMPINFO
	icmpInStats as MIBICMPSTATS
	icmpOutStats as MIBICMPSTATS
end type

type MIBICMPINFO as _MIBICMPINFO

type _MIB_ICMP
	stats as MIBICMPINFO
end type

type MIB_ICMP as _MIB_ICMP
type PMIB_ICMP as _MIB_ICMP ptr

type ICMP6_TYPE as long
enum
	ICMP6_DST_UNREACH = 1
	ICMP6_PACKET_TOO_BIG = 2
	ICMP6_TIME_EXCEEDED = 3
	ICMP6_PARAM_PROB = 4
	ICMP6_ECHO_REQUEST = 128
	ICMP6_ECHO_REPLY = 129
	ICMP6_MEMBERSHIP_QUERY = 130
	ICMP6_MEMBERSHIP_REPORT = 131
	ICMP6_MEMBERSHIP_REDUCTION = 132
	ND_ROUTER_SOLICIT = 133
	ND_ROUTER_ADVERT = 134
	ND_NEIGHBOR_SOLICIT = 135
	ND_NEIGHBOR_ADVERT = 136
	ND_REDIRECT = 137
end enum

type PICMP6_TYPE as ICMP6_TYPE ptr

type ICMP4_TYPE as long
enum
	ICMP4_ECHO_REPLY = 0
	ICMP4_DST_UNREACH = 3
	ICMP4_SOURCE_QUENCH = 4
	ICMP4_REDIRECT = 5
	ICMP4_ECHO_REQUEST = 8
	ICMP4_ROUTER_ADVERT = 9
	ICMP4_ROUTER_SOLICIT = 10
	ICMP4_TIME_EXCEEDED = 11
	ICMP4_PARAM_PROB = 12
	ICMP4_TIMESTAMP_REQUEST = 13
	ICMP4_TIMESTAMP_REPLY = 14
	ICMP4_MASK_REQUEST = 17
	ICMP4_MASK_REPLY = 18
end enum

type PICMP4_TYPE as ICMP4_TYPE ptr

type _MIBICMPSTATS_EX
	dwMsgs as DWORD
	dwErrors as DWORD
	rgdwTypeCount(0 to 255) as DWORD
end type

type MIBICMPSTATS_EX as _MIBICMPSTATS_EX
type PMIBICMPSTATS_EX as _MIBICMPSTATS_EX ptr

type _MIB_ICMP_EX
	icmpInStats as MIBICMPSTATS_EX
	icmpOutStats as MIBICMPSTATS_EX
end type

type MIB_ICMP_EX as _MIB_ICMP_EX
type PMIB_ICMP_EX as _MIB_ICMP_EX ptr

type _MIB_UDPSTATS
	dwInDatagrams as DWORD
	dwNoPorts as DWORD
	dwInErrors as DWORD
	dwOutDatagrams as DWORD
	dwNumAddrs as DWORD
end type

type MIB_UDPSTATS as _MIB_UDPSTATS
type PMIB_UDPSTATS as _MIB_UDPSTATS ptr

type _MIB_UDPROW
	dwLocalAddr as DWORD
	dwLocalPort as DWORD
end type

type MIB_UDPROW as _MIB_UDPROW
type PMIB_UDPROW as _MIB_UDPROW ptr
type MIB_UDPROW_BASIC as MIB_UDPROW
type PMIB_UDPROW_BASIC as MIB_UDPROW ptr

type _MIB_UDPROW_OWNER_PID
	dwLocalAddr as DWORD
	dwLocalPort as DWORD
	dwOwningPid as DWORD
end type

type MIB_UDPROW_OWNER_PID as _MIB_UDPROW_OWNER_PID
type PMIB_UDPROW_OWNER_PID as _MIB_UDPROW_OWNER_PID ptr

type _MIB_UDPROW_OWNER_MODULE
	dwLocalAddr as DWORD
	dwLocalPort as DWORD
	dwOwningPid as DWORD
	liCreateTimestamp as LARGE_INTEGER

	union
		type
			SpecificPortBind : 1 as DWORD
		end type

		dwFlags as DWORD
	end union

	OwningModuleInfo(0 to 15) as ULONGLONG
end type

type MIB_UDPROW_OWNER_MODULE as _MIB_UDPROW_OWNER_MODULE
type PMIB_UDPROW_OWNER_MODULE as _MIB_UDPROW_OWNER_MODULE ptr

type _MIB_UDP6ROW_OWNER_PID
	ucLocalAddr(0 to 15) as UCHAR
	dwLocalScopeId as DWORD
	dwLocalPort as DWORD
	dwOwningPid as DWORD
end type

type MIB_UDP6ROW_OWNER_PID as _MIB_UDP6ROW_OWNER_PID
type PMIB_UDP6ROW_OWNER_PID as _MIB_UDP6ROW_OWNER_PID ptr

type _MIB_UDP6ROW_OWNER_MODULE
	ucLocalAddr(0 to 15) as UCHAR
	dwLocalScopeId as DWORD
	dwLocalPort as DWORD
	dwOwningPid as DWORD
	liCreateTimestamp as LARGE_INTEGER

	union
		type
			SpecificPortBind : 1 as DWORD
		end type

		dwFlags as DWORD
	end union

	OwningModuleInfo(0 to 15) as ULONGLONG
end type

type MIB_UDP6ROW_OWNER_MODULE as _MIB_UDP6ROW_OWNER_MODULE
type PMIB_UDP6ROW_OWNER_MODULE as _MIB_UDP6ROW_OWNER_MODULE ptr

type _MIB_UDPTABLE
	dwNumEntries as DWORD
	table(0 to 0) as MIB_UDPROW
end type

type MIB_UDPTABLE as _MIB_UDPTABLE
type PMIB_UDPTABLE as _MIB_UDPTABLE ptr
type MIB_UDPTABLE_BASIC as MIB_UDPTABLE
type PMIB_UDPTABLE_BASIC as MIB_UDPTABLE ptr

#define SIZEOF_UDPTABLE(X) ((FIELD_OFFSET(MIB_UDPTABLE, table[0]) + ((X) * sizeof(MIB_UDPROW))) + ALIGN_SIZE)
#define SIZEOF_UDPTABLE_BASIC(X) SIZEOF_UDPTABLE(X)

type _MIB_UDPTABLE_OWNER_PID
	dwNumEntries as DWORD
	table(0 to 0) as MIB_UDPROW_OWNER_PID
end type

type MIB_UDPTABLE_OWNER_PID as _MIB_UDPTABLE_OWNER_PID
type PMIB_UDPTABLE_OWNER_PID as _MIB_UDPTABLE_OWNER_PID ptr

#define SIZEOF_UDPTABLE_OWNER_PID(X) ((FIELD_OFFSET(MIB_UDPTABLE_OWNER_PID, table[0]) + ((X) * sizeof(MIB_UDPROW_OWNER_PID))) + ALIGN_SIZE)

type _MIB_UDPTABLE_OWNER_MODULE
	dwNumEntries as DWORD
	table(0 to 0) as MIB_UDPROW_OWNER_MODULE
end type

type MIB_UDPTABLE_OWNER_MODULE as _MIB_UDPTABLE_OWNER_MODULE
type PMIB_UDPTABLE_OWNER_MODULE as _MIB_UDPTABLE_OWNER_MODULE ptr

#define SIZEOF_UDPTABLE_OWNER_MODULE(X) ((FIELD_OFFSET(MIB_UDPTABLE_OWNER_MODULE, table[0]) + ((X) * sizeof(MIB_UDPROW_OWNER_MODULE))) + ALIGN_SIZE)

type _MIB_UDP6TABLE_OWNER_PID
	dwNumEntries as DWORD
	table(0 to 0) as MIB_UDP6ROW_OWNER_PID
end type

type MIB_UDP6TABLE_OWNER_PID as _MIB_UDP6TABLE_OWNER_PID
type PMIB_UDP6TABLE_OWNER_PID as _MIB_UDP6TABLE_OWNER_PID ptr

#define SIZEOF_UDP6TABLE_OWNER_PID(X) ((FIELD_OFFSET(MIB_UDP6TABLE_OWNER_PID, table[0]) + ((X) * sizeof(MIB_UDP6ROW_OWNER_PID))) + ALIGN_SIZE)

type _MIB_UDP6TABLE_OWNER_MODULE
	dwNumEntries as DWORD
	table(0 to 0) as MIB_UDP6ROW_OWNER_MODULE
end type

type MIB_UDP6TABLE_OWNER_MODULE as _MIB_UDP6TABLE_OWNER_MODULE
type PMIB_UDP6TABLE_OWNER_MODULE as _MIB_UDP6TABLE_OWNER_MODULE ptr

#define SIZEOF_UDP6TABLE_OWNER_MODULE(X) ((FIELD_OFFSET(MIB_UDP6TABLE_OWNER_MODULE, table[0]) + ((X) * sizeof(MIB_UDP6ROW_OWNER_MODULE))) + ALIGN_SIZE)

type _MIB_TCPSTATS
	dwRtoAlgorithm as DWORD
	dwRtoMin as DWORD
	dwRtoMax as DWORD
	dwMaxConn as DWORD
	dwActiveOpens as DWORD
	dwPassiveOpens as DWORD
	dwAttemptFails as DWORD
	dwEstabResets as DWORD
	dwCurrEstab as DWORD
	dwInSegs as DWORD
	dwOutSegs as DWORD
	dwRetransSegs as DWORD
	dwInErrs as DWORD
	dwOutRsts as DWORD
	dwNumConns as DWORD
end type

type MIB_TCPSTATS as _MIB_TCPSTATS
type PMIB_TCPSTATS as _MIB_TCPSTATS ptr

#define MIB_TCP_RTO_OTHER 1
#define MIB_TCP_RTO_CONSTANT 2
#define MIB_TCP_RTO_RSRE 3
#define MIB_TCP_RTO_VANJ 4
#define MIB_TCP_MAXCONN_DYNAMIC cast(DWORD, -1)

type _TCP_TABLE_CLASS as long
enum
	TCP_TABLE_BASIC_LISTENER
	TCP_TABLE_BASIC_CONNECTIONS
	TCP_TABLE_BASIC_ALL
	TCP_TABLE_OWNER_PID_LISTENER
	TCP_TABLE_OWNER_PID_CONNECTIONS
	TCP_TABLE_OWNER_PID_ALL
	TCP_TABLE_OWNER_MODULE_LISTENER
	TCP_TABLE_OWNER_MODULE_CONNECTIONS
	TCP_TABLE_OWNER_MODULE_ALL
end enum

type TCP_TABLE_CLASS as _TCP_TABLE_CLASS
type PTCP_TABLE_CLASS as _TCP_TABLE_CLASS ptr

type _MIB_TCPROW
	dwState as DWORD
	dwLocalAddr as DWORD
	dwLocalPort as DWORD
	dwRemoteAddr as DWORD
	dwRemotePort as DWORD
end type

type MIB_TCPROW as _MIB_TCPROW
type PMIB_TCPROW as _MIB_TCPROW ptr
type MIB_TCPROW_BASIC as MIB_TCPROW
type PMIB_TCPROW_BASIC as MIB_TCPROW ptr

type _MIB_TCPROW_OWNER_PID
	dwState as DWORD
	dwLocalAddr as DWORD
	dwLocalPort as DWORD
	dwRemoteAddr as DWORD
	dwRemotePort as DWORD
	dwOwningPid as DWORD
end type

type MIB_TCPROW_OWNER_PID as _MIB_TCPROW_OWNER_PID
type PMIB_TCPROW_OWNER_PID as _MIB_TCPROW_OWNER_PID ptr

type _MIB_TCPROW_OWNER_MODULE
	dwState as DWORD
	dwLocalAddr as DWORD
	dwLocalPort as DWORD
	dwRemoteAddr as DWORD
	dwRemotePort as DWORD
	dwOwningPid as DWORD
	liCreateTimestamp as LARGE_INTEGER
	OwningModuleInfo(0 to 15) as ULONGLONG
end type

type MIB_TCPROW_OWNER_MODULE as _MIB_TCPROW_OWNER_MODULE
type PMIB_TCPROW_OWNER_MODULE as _MIB_TCPROW_OWNER_MODULE ptr

type _MIB_TCP6ROW_OWNER_PID
	ucLocalAddr(0 to 15) as UCHAR
	dwLocalScopeId as DWORD
	dwLocalPort as DWORD
	ucRemoteAddr(0 to 15) as UCHAR
	dwRemoteScopeId as DWORD
	dwRemotePort as DWORD
	dwState as DWORD
	dwOwningPid as DWORD
end type

type MIB_TCP6ROW_OWNER_PID as _MIB_TCP6ROW_OWNER_PID
type PMIB_TCP6ROW_OWNER_PID as _MIB_TCP6ROW_OWNER_PID ptr

type _MIB_TCP6ROW_OWNER_MODULE
	ucLocalAddr(0 to 15) as UCHAR
	dwLocalScopeId as DWORD
	dwLocalPort as DWORD
	ucRemoteAddr(0 to 15) as UCHAR
	dwRemoteScopeId as DWORD
	dwRemotePort as DWORD
	dwState as DWORD
	dwOwningPid as DWORD
	liCreateTimestamp as LARGE_INTEGER
	OwningModuleInfo(0 to 15) as ULONGLONG
end type

type MIB_TCP6ROW_OWNER_MODULE as _MIB_TCP6ROW_OWNER_MODULE
type PMIB_TCP6ROW_OWNER_MODULE as _MIB_TCP6ROW_OWNER_MODULE ptr

#define MIB_TCP_STATE_CLOSED 1
#define MIB_TCP_STATE_LISTEN 2
#define MIB_TCP_STATE_SYN_SENT 3
#define MIB_TCP_STATE_SYN_RCVD 4
#define MIB_TCP_STATE_ESTAB 5
#define MIB_TCP_STATE_FIN_WAIT1 6
#define MIB_TCP_STATE_FIN_WAIT2 7
#define MIB_TCP_STATE_CLOSE_WAIT 8
#define MIB_TCP_STATE_CLOSING 9
#define MIB_TCP_STATE_LAST_ACK 10
#define MIB_TCP_STATE_TIME_WAIT 11
#define MIB_TCP_STATE_DELETE_TCB 12

type MIB_TCP_STATE as long

type _MIB_TCPTABLE
	dwNumEntries as DWORD
	table(0 to 0) as MIB_TCPROW
end type

type MIB_TCPTABLE as _MIB_TCPTABLE
type PMIB_TCPTABLE as _MIB_TCPTABLE ptr
type MIB_TCPTABLE_BASIC as MIB_TCPTABLE
type PMIB_TCPTABLE_BASIC as MIB_TCPTABLE ptr

#define SIZEOF_TCPTABLE(X) ((FIELD_OFFSET(MIB_TCPTABLE, table[0]) + ((X) * sizeof(MIB_TCPROW))) + ALIGN_SIZE)
#define SIZEOF_TCPTABLE_BASIC(X) SIZEOF_TCPTABLE(X)

type _MIB_TCPTABLE_OWNER_PID
	dwNumEntries as DWORD
	table(0 to 0) as MIB_TCPROW_OWNER_PID
end type

type MIB_TCPTABLE_OWNER_PID as _MIB_TCPTABLE_OWNER_PID
type PMIB_TCPTABLE_OWNER_PID as _MIB_TCPTABLE_OWNER_PID ptr

#define SIZEOF_TCPTABLE_OWNER_PID(X) ((FIELD_OFFSET(MIB_TCPTABLE_OWNER_PID, table[0]) + ((X) * sizeof(MIB_TCPROW_OWNER_PID))) + ALIGN_SIZE)

type _MIB_TCPTABLE_OWNER_MODULE
	dwNumEntries as DWORD
	table(0 to 0) as MIB_TCPROW_OWNER_MODULE
end type

type MIB_TCPTABLE_OWNER_MODULE as _MIB_TCPTABLE_OWNER_MODULE
type PMIB_TCPTABLE_OWNER_MODULE as _MIB_TCPTABLE_OWNER_MODULE ptr

#define SIZEOF_TCPTABLE_OWNER_MODULE(X) ((FIELD_OFFSET(MIB_TCPTABLE_OWNER_MODULE, table[0]) + ((X) * sizeof(MIB_TCPROW_OWNER_MODULE))) + ALIGN_SIZE)

type _MIB_TCP6TABLE_OWNER_PID
	dwNumEntries as DWORD
	table(0 to 0) as MIB_TCP6ROW_OWNER_PID
end type

type MIB_TCP6TABLE_OWNER_PID as _MIB_TCP6TABLE_OWNER_PID
type PMIB_TCP6TABLE_OWNER_PID as _MIB_TCP6TABLE_OWNER_PID ptr

#define SIZEOF_TCP6TABLE_OWNER_PID(X) ((FIELD_OFFSET(MIB_TCP6TABLE_OWNER_PID, table[0]) + ((X) * sizeof(MIB_TCP6ROW_OWNER_PID))) + ALIGN_SIZE)

type _MIB_TCP6TABLE_OWNER_MODULE
	dwNumEntries as DWORD
	table(0 to 0) as MIB_TCP6ROW_OWNER_MODULE
end type

type MIB_TCP6TABLE_OWNER_MODULE as _MIB_TCP6TABLE_OWNER_MODULE
type PMIB_TCP6TABLE_OWNER_MODULE as _MIB_TCP6TABLE_OWNER_MODULE ptr

#define SIZEOF_TCP6TABLE_OWNER_MODULE(X) ((FIELD_OFFSET(MIB_TCP6TABLE_OWNER_MODULE, table[0]) + ((X) * sizeof(MIB_TCP6ROW_OWNER_PID))) + ALIGN_SIZE)
#define MIB_SECURITY_TCP_SYN_ATTACK &h00000001
#define MIB_USE_CURRENT_TTL cast(DWORD, -1)
#define MIB_USE_CURRENT_FORWARDING cast(DWORD, -1)

type _MIB_IPSTATS
	dwForwarding as DWORD
	dwDefaultTTL as DWORD
	dwInReceives as DWORD
	dwInHdrErrors as DWORD
	dwInAddrErrors as DWORD
	dwForwDatagrams as DWORD
	dwInUnknownProtos as DWORD
	dwInDiscards as DWORD
	dwInDelivers as DWORD
	dwOutRequests as DWORD
	dwRoutingDiscards as DWORD
	dwOutDiscards as DWORD
	dwOutNoRoutes as DWORD
	dwReasmTimeout as DWORD
	dwReasmReqds as DWORD
	dwReasmOks as DWORD
	dwReasmFails as DWORD
	dwFragOks as DWORD
	dwFragFails as DWORD
	dwFragCreates as DWORD
	dwNumIf as DWORD
	dwNumAddr as DWORD
	dwNumRoutes as DWORD
end type

type MIB_IPSTATS as _MIB_IPSTATS
type PMIB_IPSTATS as _MIB_IPSTATS ptr

#define MIB_IP_FORWARDING 1
#define MIB_IP_NOT_FORWARDING 2
#define MIB_IPADDR_PRIMARY &h0001
#define MIB_IPADDR_DYNAMIC &h0004
#define MIB_IPADDR_DISCONNECTED &h0008
#define MIB_IPADDR_DELETED &h0040
#define MIB_IPADDR_TRANSIENT &h0080

type _MIB_IPADDRROW
	dwAddr as DWORD
	dwIndex as DWORD
	dwMask as DWORD
	dwBCastAddr as DWORD
	dwReasmSize as DWORD
	unused1 as ushort
	wType as ushort
end type

type MIB_IPADDRROW as _MIB_IPADDRROW
type PMIB_IPADDRROW as _MIB_IPADDRROW ptr

type _MIB_IPADDRTABLE
	dwNumEntries as DWORD
	table(0 to 0) as MIB_IPADDRROW
end type

type MIB_IPADDRTABLE as _MIB_IPADDRTABLE
type PMIB_IPADDRTABLE as _MIB_IPADDRTABLE ptr

#define SIZEOF_IPADDRTABLE(X) ((FIELD_OFFSET(MIB_IPADDRTABLE, table[0]) + ((X) * sizeof(MIB_IPADDRROW))) + ALIGN_SIZE)

type _MIB_IPFORWARDNUMBER
	dwValue as DWORD
end type

type MIB_IPFORWARDNUMBER as _MIB_IPFORWARDNUMBER
type PMIB_IPFORWARDNUMBER as _MIB_IPFORWARDNUMBER ptr

type _MIB_IPFORWARDROW
	dwForwardDest as DWORD
	dwForwardMask as DWORD
	dwForwardPolicy as DWORD
	dwForwardNextHop as DWORD
	dwForwardIfIndex as DWORD
	dwForwardType as DWORD
	dwForwardProto as DWORD
	dwForwardAge as DWORD
	dwForwardNextHopAS as DWORD
	dwForwardMetric1 as DWORD
	dwForwardMetric2 as DWORD
	dwForwardMetric3 as DWORD
	dwForwardMetric4 as DWORD
	dwForwardMetric5 as DWORD
end type

type MIB_IPFORWARDROW as _MIB_IPFORWARDROW
type PMIB_IPFORWARDROW as _MIB_IPFORWARDROW ptr

#define MIB_IPROUTE_TYPE_OTHER 1
#define MIB_IPROUTE_TYPE_INVALID 2
#define MIB_IPROUTE_TYPE_DIRECT 3
#define MIB_IPROUTE_TYPE_INDIRECT 4
#define MIB_IPROUTE_METRIC_UNUSED cast(DWORD, -1)
#define MIB_IPPROTO_OTHER_ 1
#define MIB_IPPROTO_LOCAL_ 2
#define MIB_IPPROTO_NETMGMT_ 3
#define MIB_IPPROTO_ICMP_ 4
#define MIB_IPPROTO_EGP_ 5
#define MIB_IPPROTO_GGP_ 6
#define MIB_IPPROTO_HELLO_ 7
#define MIB_IPPROTO_RIP_ 8
#define MIB_IPPROTO_IS_IS_ 9
#define MIB_IPPROTO_ES_IS_ 10
#define MIB_IPPROTO_CISCO_ 11
#define MIB_IPPROTO_BBN_ 12
#define MIB_IPPROTO_OSPF_ 13
#define MIB_IPPROTO_BGP_ 14
#define MIB_IPPROTO_NT_AUTOSTATIC_ 10002
#define MIB_IPPROTO_NT_STATIC_ 10006
#define MIB_IPPROTO_NT_STATIC_NON_DOD_ 10007

type _MIB_IPFORWARDTABLE
	dwNumEntries as DWORD
	table(0 to 0) as MIB_IPFORWARDROW
end type

type MIB_IPFORWARDTABLE as _MIB_IPFORWARDTABLE
type PMIB_IPFORWARDTABLE as _MIB_IPFORWARDTABLE ptr

#define SIZEOF_IPFORWARDTABLE(X) ((FIELD_OFFSET(MIB_IPFORWARDTABLE, table[0]) + ((X) * sizeof(MIB_IPFORWARDROW))) + ALIGN_SIZE)

type _MIB_IPNETROW
	dwIndex as DWORD
	dwPhysAddrLen as DWORD
	bPhysAddr(0 to 7) as BYTE_
	dwAddr as DWORD
	dwType as DWORD
end type

type MIB_IPNETROW as _MIB_IPNETROW
type PMIB_IPNETROW as _MIB_IPNETROW ptr

#define MIB_IPNET_TYPE_OTHER 1
#define MIB_IPNET_TYPE_INVALID 2
#define MIB_IPNET_TYPE_DYNAMIC 3
#define MIB_IPNET_TYPE_STATIC 4

type _MIB_IPNETTABLE
	dwNumEntries as DWORD
	table(0 to 0) as MIB_IPNETROW
end type

type MIB_IPNETTABLE as _MIB_IPNETTABLE
type PMIB_IPNETTABLE as _MIB_IPNETTABLE ptr

#define SIZEOF_IPNETTABLE(X) ((FIELD_OFFSET(MIB_IPNETTABLE, table[0]) + ((X) * sizeof(MIB_IPNETROW))) + ALIGN_SIZE)

type _MIB_IPMCAST_OIF
	dwOutIfIndex as DWORD
	dwNextHopAddr as DWORD
	dwReserved as DWORD
	dwReserved1 as DWORD
end type

type MIB_IPMCAST_OIF as _MIB_IPMCAST_OIF
type PMIB_IPMCAST_OIF as _MIB_IPMCAST_OIF ptr

type _MIB_IPMCAST_MFE
	dwGroup as DWORD
	dwSource as DWORD
	dwSrcMask as DWORD
	dwUpStrmNgbr as DWORD
	dwInIfIndex as DWORD
	dwInIfProtocol as DWORD
	dwRouteProtocol as DWORD
	dwRouteNetwork as DWORD
	dwRouteMask as DWORD
	ulUpTime as ULONG_
	ulExpiryTime as ULONG_
	ulTimeOut as ULONG_
	ulNumOutIf as ULONG_
	fFlags as DWORD
	dwReserved as DWORD
	rgmioOutInfo(0 to 0) as MIB_IPMCAST_OIF
end type

type MIB_IPMCAST_MFE as _MIB_IPMCAST_MFE
type PMIB_IPMCAST_MFE as _MIB_IPMCAST_MFE ptr

type _MIB_MFE_TABLE
	dwNumEntries as DWORD
	table(0 to 0) as MIB_IPMCAST_MFE
end type

type MIB_MFE_TABLE as _MIB_MFE_TABLE
type PMIB_MFE_TABLE as _MIB_MFE_TABLE ptr

#define SIZEOF_BASIC_MIB_MFE cast(ULONG_, FIELD_OFFSET(MIB_IPMCAST_MFE, rgmioOutInfo[0]))
#define SIZEOF_MIB_MFE(X) (SIZEOF_BASIC_MIB_MFE + ((X) * sizeof(MIB_IPMCAST_OIF)))

type _MIB_IPMCAST_OIF_STATS
	dwOutIfIndex as DWORD
	dwNextHopAddr as DWORD
	dwDialContext as DWORD
	ulTtlTooLow as ULONG_
	ulFragNeeded as ULONG_
	ulOutPackets as ULONG_
	ulOutDiscards as ULONG_
end type

type MIB_IPMCAST_OIF_STATS as _MIB_IPMCAST_OIF_STATS
type PMIB_IPMCAST_OIF_STATS as _MIB_IPMCAST_OIF_STATS ptr

type _MIB_IPMCAST_MFE_STATS
	dwGroup as DWORD
	dwSource as DWORD
	dwSrcMask as DWORD
	dwUpStrmNgbr as DWORD
	dwInIfIndex as DWORD
	dwInIfProtocol as DWORD
	dwRouteProtocol as DWORD
	dwRouteNetwork as DWORD
	dwRouteMask as DWORD
	ulUpTime as ULONG_
	ulExpiryTime as ULONG_
	ulNumOutIf as ULONG_
	ulInPkts as ULONG_
	ulInOctets as ULONG_
	ulPktsDifferentIf as ULONG_
	ulQueueOverflow as ULONG_
	rgmiosOutStats(0 to 0) as MIB_IPMCAST_OIF_STATS
end type

type MIB_IPMCAST_MFE_STATS as _MIB_IPMCAST_MFE_STATS
type PMIB_IPMCAST_MFE_STATS as _MIB_IPMCAST_MFE_STATS ptr

type _MIB_MFE_STATS_TABLE
	dwNumEntries as DWORD
	table(0 to 0) as MIB_IPMCAST_MFE_STATS
end type

type MIB_MFE_STATS_TABLE as _MIB_MFE_STATS_TABLE
type PMIB_MFE_STATS_TABLE as _MIB_MFE_STATS_TABLE ptr

#define SIZEOF_BASIC_MIB_MFE_STATS cast(ULONG_, FIELD_OFFSET(MIB_IPMCAST_MFE_STATS, rgmiosOutStats[0]))
#define SIZEOF_MIB_MFE_STATS(X) (SIZEOF_BASIC_MIB_MFE_STATS + ((X) * sizeof(MIB_IPMCAST_OIF_STATS)))

type _MIB_IPMCAST_MFE_STATS_EX
	dwGroup as DWORD
	dwSource as DWORD
	dwSrcMask as DWORD
	dwUpStrmNgbr as DWORD
	dwInIfIndex as DWORD
	dwInIfProtocol as DWORD
	dwRouteProtocol as DWORD
	dwRouteNetwork as DWORD
	dwRouteMask as DWORD
	ulUpTime as ULONG_
	ulExpiryTime as ULONG_
	ulNumOutIf as ULONG_
	ulInPkts as ULONG_
	ulInOctets as ULONG_
	ulPktsDifferentIf as ULONG_
	ulQueueOverflow as ULONG_
	ulUninitMfe as ULONG_
	ulNegativeMfe as ULONG_
	ulInDiscards as ULONG_
	ulInHdrErrors as ULONG_
	ulTotalOutPackets as ULONG_
	rgmiosOutStats(0 to 0) as MIB_IPMCAST_OIF_STATS
end type

type MIB_IPMCAST_MFE_STATS_EX as _MIB_IPMCAST_MFE_STATS_EX
type PMIB_IPMCAST_MFE_STATS_EX as _MIB_IPMCAST_MFE_STATS_EX ptr

type _MIB_MFE_STATS_TABLE_EX
	dwNumEntries as DWORD
	table(0 to 0) as MIB_IPMCAST_MFE_STATS_EX
end type

type MIB_MFE_STATS_TABLE_EX as _MIB_MFE_STATS_TABLE_EX
type PMIB_MFE_STATS_TABLE_EX as _MIB_MFE_STATS_TABLE_EX ptr

#define SIZEOF_BASIC_MIB_MFE_STATS_EX cast(ULONG_, FIELD_OFFSET(MIB_IPMCAST_MFE_STATS_EX, rgmiosOutStats[0]))
#define SIZEOF_MIB_MFE_STATS_EX(X) (SIZEOF_BASIC_MIB_MFE_STATS_EX + ((X) * sizeof(MIB_IPMCAST_OIF_STATS)))

type _MIB_IPMCAST_GLOBAL
	dwEnable as DWORD
end type

type MIB_IPMCAST_GLOBAL as _MIB_IPMCAST_GLOBAL
type PMIB_IPMCAST_GLOBAL as _MIB_IPMCAST_GLOBAL ptr

type _MIB_IPMCAST_IF_ENTRY
	dwIfIndex as DWORD
	dwTtl as DWORD
	dwProtocol as DWORD
	dwRateLimit as DWORD
	ulInMcastOctets as ULONG_
	ulOutMcastOctets as ULONG_
end type

type MIB_IPMCAST_IF_ENTRY as _MIB_IPMCAST_IF_ENTRY
type PMIB_IPMCAST_IF_ENTRY as _MIB_IPMCAST_IF_ENTRY ptr

type _MIB_IPMCAST_IF_TABLE
	dwNumEntries as DWORD
	table(0 to 0) as MIB_IPMCAST_IF_ENTRY
end type

type MIB_IPMCAST_IF_TABLE as _MIB_IPMCAST_IF_TABLE
type PMIB_IPMCAST_IF_TABLE as _MIB_IPMCAST_IF_TABLE ptr

#define SIZEOF_MCAST_IF_TABLE(X) ((FIELD_OFFSET(MIB_IPMCAST_IF_TABLE, table[0]) + ((X) * sizeof(MIB_IPMCAST_IF_ENTRY))) + ALIGN_SIZE)

type _MIB_IPMCAST_BOUNDARY
	dwIfIndex as DWORD
	dwGroupAddress as DWORD
	dwGroupMask as DWORD
	dwStatus as DWORD
end type

type MIB_IPMCAST_BOUNDARY as _MIB_IPMCAST_BOUNDARY
type PMIB_IPMCAST_BOUNDARY as _MIB_IPMCAST_BOUNDARY ptr

type _MIB_IPMCAST_BOUNDARY_TABLE
	dwNumEntries as DWORD
	table(0 to 0) as MIB_IPMCAST_BOUNDARY
end type

type MIB_IPMCAST_BOUNDARY_TABLE as _MIB_IPMCAST_BOUNDARY_TABLE
type PMIB_IPMCAST_BOUNDARY_TABLE as _MIB_IPMCAST_BOUNDARY_TABLE ptr

#define SIZEOF_BOUNDARY_TABLE(X) ((FIELD_OFFSET(MIB_IPMCAST_BOUNDARY_TABLE, table[0]) + ((X) * sizeof(MIB_IPMCAST_BOUNDARY))) + ALIGN_SIZE)

type MIB_BOUNDARYROW
	dwGroupAddress as DWORD
	dwGroupMask as DWORD
end type

type PMIB_BOUNDARYROW as MIB_BOUNDARYROW ptr

type MIB_MCAST_LIMIT_ROW
	dwTtl as DWORD
	dwRateLimit as DWORD
end type

type PMIB_MCAST_LIMIT_ROW as MIB_MCAST_LIMIT_ROW ptr

#define MAX_SCOPE_NAME_LEN 255
#define SN_UNICODE

type SN_CHAR as WCHAR
type SCOPE_NAME as SN_CHAR ptr

type _MIB_IPMCAST_SCOPE
	dwGroupAddress as DWORD
	dwGroupMask as DWORD
	snNameBuffer(0 to (255 + 1) - 1) as SN_CHAR
	dwStatus as DWORD
end type

type MIB_IPMCAST_SCOPE as _MIB_IPMCAST_SCOPE
type PMIB_IPMCAST_SCOPE as _MIB_IPMCAST_SCOPE ptr

type _MIB_IPDESTROW
	union
		dwForwardDest as DWORD
		dwForwardMask as DWORD
		dwForwardPolicy as DWORD
		dwForwardNextHop as DWORD
		dwForwardIfIndex as DWORD
		dwForwardType as DWORD
		dwForwardProto as DWORD
		dwForwardAge as DWORD
		dwForwardNextHopAS as DWORD
		dwForwardMetric1 as DWORD
		dwForwardMetric2 as DWORD
		dwForwardMetric3 as DWORD
		dwForwardMetric4 as DWORD
		dwForwardMetric5 as DWORD
	end union

	dwForwardPreference as DWORD
	dwForwardViewSet as DWORD
end type

type MIB_IPDESTROW as _MIB_IPDESTROW
type PMIB_IPDESTROW as _MIB_IPDESTROW ptr

type _MIB_IPDESTTABLE
	dwNumEntries as DWORD
	table(0 to 0) as MIB_IPDESTROW
end type

type MIB_IPDESTTABLE as _MIB_IPDESTTABLE
type PMIB_IPDESTTABLE as _MIB_IPDESTTABLE ptr

type _MIB_BEST_IF
	dwDestAddr as DWORD
	dwIfIndex as DWORD
end type

type MIB_BEST_IF as _MIB_BEST_IF
type PMIB_BEST_IF as _MIB_BEST_IF ptr

type _MIB_PROXYARP
	dwAddress as DWORD
	dwMask as DWORD
	dwIfIndex as DWORD
end type

type MIB_PROXYARP as _MIB_PROXYARP
type PMIB_PROXYARP as _MIB_PROXYARP ptr

type _MIB_IFSTATUS
	dwIfIndex as DWORD
	dwAdminStatus as DWORD
	dwOperationalStatus as DWORD
	bMHbeatActive as WINBOOL
	bMHbeatAlive as WINBOOL
end type

type MIB_IFSTATUS as _MIB_IFSTATUS
type PMIB_IFSTATUS as _MIB_IFSTATUS ptr

type _MIB_ROUTESTATE
	bRoutesSetToStack as WINBOOL
end type

type MIB_ROUTESTATE as _MIB_ROUTESTATE
type PMIB_ROUTESTATE as _MIB_ROUTESTATE ptr

type _MIB_OPAQUE_INFO
	dwId as DWORD

	union
		ullAlign as ULONGLONG
		rgbyData(0 to 0) as BYTE_
	end union
end type

type MIB_OPAQUE_INFO as _MIB_OPAQUE_INFO
type PMIB_OPAQUE_INFO as _MIB_OPAQUE_INFO ptr

type _TCPIP_OWNER_MODULE_BASIC_INFO
	pModuleName as PWCHAR
	pModulePath as PWCHAR
end type

type TCPIP_OWNER_MODULE_BASIC_INFO as _TCPIP_OWNER_MODULE_BASIC_INFO
type PTCPIP_OWNER_MODULE_BASIC_INFO as _TCPIP_OWNER_MODULE_BASIC_INFO ptr

type _UDP_TABLE_CLASS as long
enum
	UDP_TABLE_BASIC
	UDP_TABLE_OWNER_PID
	UDP_TABLE_OWNER_MODULE
end enum

type UDP_TABLE_CLASS as _UDP_TABLE_CLASS
type PUDP_TABLE_CLASS as _UDP_TABLE_CLASS ptr

type _TCPIP_OWNER_MODULE_INFO_CLASS as long
enum
	TCPIP_OWNER_MODULE_INFO_BASIC
end enum

type TCPIP_OWNER_MODULE_INFO_CLASS as _TCPIP_OWNER_MODULE_INFO_CLASS
type PTCPIP_OWNER_MODULE_INFO_CLASS as _TCPIP_OWNER_MODULE_INFO_CLASS ptr

#define MAX_MIB_OFFSET 8
#define MIB_INFO_SIZE(S) (MAX_MIB_OFFSET + sizeof((S)))
#define MIB_INFO_SIZE_IN_DWORDS(S) ((MIB_INFO_SIZE(S) / sizeof(DWORD)) + 1)

'' TODO: #define DEFINE_MIB_BUFFER(X,Y,Z) DWORD __rgdwBuff[MIB_INFO_SIZE_IN_DWORDS(Y)]; PMIB_OPAQUE_INFO X = (PMIB_OPAQUE_INFO)__rgdwBuff; Y *Z = (Y *)(X->rgbyData)
'' TODO: #define CAST_MIB_INFO(X,Y,Z) Z = (Y)(X->rgbyData)