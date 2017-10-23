'' FreeBASIC binding for linux-4.1.6
''
'' based on the C header files:
''       This program is free software; you can redistribute it and/or modify
''       it under the terms of the GNU General Public License as published by
''       the Free Software Foundation; either version 2 of the License, or
''       (at your option) any later version.
''
''       This program is distributed in the hope that it will be useful,
''       but WITHOUT ANY WARRANTY; without even the implied warranty of
''       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
''       GNU General Public License for more details.
''
''       You should have received a copy of the GNU General Public License
''       along with this program; if not, write to the Free Software
''       Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#if (not defined(__FB_64BIT__)) and defined(__FB_ARM__)
	#include once "crt/long.bi"
#endif

#ifdef __FB_ARM__
	type sigcontext
		#if (not defined(__FB_64BIT__)) and defined(__FB_ARM__)
			trap_no as culong
			error_code as culong
			oldmask as culong
			arm_r0 as culong
			arm_r1 as culong
			arm_r2 as culong
			arm_r3 as culong
			arm_r4 as culong
			arm_r5 as culong
			arm_r6 as culong
			arm_r7 as culong
			arm_r8 as culong
			arm_r9 as culong
			arm_r10 as culong
			arm_fp as culong
			arm_ip as culong
			arm_sp as culong
			arm_lr as culong
			arm_pc as culong
			arm_cpsr as culong
			fault_address as culong
		#elseif defined(__FB_64BIT__) and defined(__FB_ARM__)
			fault_address as __u64
			regs(0 to 30) as __u64
			sp as __u64
			pc as __u64
			pstate as __u64
			__reserved(0 to 4095) as __u8
		#endif
	end type

	type sigcontext_struct as sigcontext
#endif

#if defined(__FB_64BIT__) and defined(__FB_ARM__)
	type _aarch64_ctx
		magic as __u32
		size as __u32
	end type

	const FPSIMD_MAGIC = &h46508001

	type fpsimd_context
		head as _aarch64_ctx
		fpsr as __u32
		fpcr as __u32
		vregs(0 to 31) as __uint128_t
	end type

	const ESR_MAGIC = &h45535201

	type esr_context
		head as _aarch64_ctx
		esr as __u64
	end type
#endif
