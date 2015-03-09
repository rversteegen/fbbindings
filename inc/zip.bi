#pragma once

#include once "inttypes.bi"
#include once "crt/sys/types.bi"
#include once "crt/stdio.bi"
#include once "crt/time.bi"

extern "C"

#define LIBZIP_VERSION "0.11.2"
#define LIBZIP_VERSION_MAJOR 0
#define LIBZIP_VERSION_MINOR 11
#define LIBZIP_VERSION_MICRO 0

type zip_int8_t as byte

#define ZIP_INT8_MIN INT8_MIN
#define ZIP_INT8_MAX INT8_MAX

type zip_uint8_t as ubyte

#define ZIP_UINT8_MAX UINT8_MAX

type zip_int16_t as short

#define ZIP_INT16_MIN INT16_MIN
#define ZIP_INT16_MAX INT16_MAX

type zip_uint16_t as ushort

#define ZIP_UINT16_MAX UINT16_MAX

type zip_int32_t as long

#define ZIP_INT32_MIN INT32_MIN
#define ZIP_INT32_MAX INT32_MAX

type zip_uint32_t as ulong

#define ZIP_UINT32_MAX UINT32_MAX

type zip_int64_t as longint

#define ZIP_INT64_MIN INT64_MIN
#define ZIP_INT64_MAX INT64_MAX

type zip_uint64_t as ulongint

#define ZIP_UINT64_MAX UINT64_MAX
#define ZIP_CREATE 1
#define ZIP_EXCL 2
#define ZIP_CHECKCONS 4
#define ZIP_TRUNCATE 8
#define ZIP_FL_NOCASE 1u
#define ZIP_FL_NODIR 2u
#define ZIP_FL_COMPRESSED 4u
#define ZIP_FL_UNCHANGED 8u
#define ZIP_FL_RECOMPRESS 16u
#define ZIP_FL_ENCRYPTED 32u
#define ZIP_FL_ENC_GUESS 0u
#define ZIP_FL_ENC_RAW 64u
#define ZIP_FL_ENC_STRICT 128u
#define ZIP_FL_LOCAL 256u
#define ZIP_FL_CENTRAL 512u
#define ZIP_FL_ENC_UTF_8 2048u
#define ZIP_FL_ENC_CP437 4096u
#define ZIP_FL_OVERWRITE 8192u
#define ZIP_AFL_TORRENT 1u
#define ZIP_AFL_RDONLY 2u
#define ZIP_EXTRA_FIELD_ALL ZIP_UINT16_MAX
#define ZIP_EXTRA_FIELD_NEW ZIP_UINT16_MAX
#define ZIP_CODEC_DECODE 0
#define ZIP_CODEC_ENCODE 1
#define ZIP_ER_OK 0
#define ZIP_ER_MULTIDISK 1
#define ZIP_ER_RENAME 2
#define ZIP_ER_CLOSE 3
#define ZIP_ER_SEEK 4
#define ZIP_ER_READ 5
#define ZIP_ER_WRITE 6
#define ZIP_ER_CRC 7
#define ZIP_ER_ZIPCLOSED 8
#define ZIP_ER_NOENT 9
#define ZIP_ER_EXISTS 10
#define ZIP_ER_OPEN 11
#define ZIP_ER_TMPOPEN 12
#define ZIP_ER_ZLIB 13
#define ZIP_ER_MEMORY 14
#define ZIP_ER_CHANGED 15
#define ZIP_ER_COMPNOTSUPP 16
#define ZIP_ER_EOF 17
#define ZIP_ER_INVAL 18
#define ZIP_ER_NOZIP 19
#define ZIP_ER_INTERNAL 20
#define ZIP_ER_INCONS 21
#define ZIP_ER_REMOVE 22
#define ZIP_ER_DELETED 23
#define ZIP_ER_ENCRNOTSUPP 24
#define ZIP_ER_RDONLY 25
#define ZIP_ER_NOPASSWD 26
#define ZIP_ER_WRONGPASSWD 27
#define ZIP_ET_NONE 0
#define ZIP_ET_SYS 1
#define ZIP_ET_ZLIB 2
#define ZIP_CM_DEFAULT (-1)
#define ZIP_CM_STORE 0
#define ZIP_CM_SHRINK 1
#define ZIP_CM_REDUCE_1 2
#define ZIP_CM_REDUCE_2 3
#define ZIP_CM_REDUCE_3 4
#define ZIP_CM_REDUCE_4 5
#define ZIP_CM_IMPLODE 6
#define ZIP_CM_DEFLATE 8
#define ZIP_CM_DEFLATE64 9
#define ZIP_CM_PKWARE_IMPLODE 10
#define ZIP_CM_BZIP2 12
#define ZIP_CM_LZMA 14
#define ZIP_CM_TERSE 18
#define ZIP_CM_LZ77 19
#define ZIP_CM_WAVPACK 97
#define ZIP_CM_PPMD 98
#define ZIP_EM_NONE 0
#define ZIP_EM_TRAD_PKWARE 1
#define ZIP_EM_UNKNOWN &hffff
#define ZIP_OPSYS_DOS &h00u
#define ZIP_OPSYS_AMIGA &h01u
#define ZIP_OPSYS_OPENVMS &h02u
#define ZIP_OPSYS_UNIX &h03u
#define ZIP_OPSYS_VM_CMS &h04u
#define ZIP_OPSYS_ATARI_ST &h05u
#define ZIP_OPSYS_OS_2 &h06u
#define ZIP_OPSYS_MACINTOSH &h07u
#define ZIP_OPSYS_Z_SYSTEM &h08u
#define ZIP_OPSYS_CPM &h09u
#define ZIP_OPSYS_WINDOWS_NTFS &h0au
#define ZIP_OPSYS_MVS &h0bu
#define ZIP_OPSYS_VSE &h0cu
#define ZIP_OPSYS_ACORN_RISC &h0du
#define ZIP_OPSYS_VFAT &h0eu
#define ZIP_OPSYS_ALTERNATE_MVS &h0fu
#define ZIP_OPSYS_BEOS &h10u
#define ZIP_OPSYS_TANDEM &h11u
#define ZIP_OPSYS_OS_400 &h12u
#define ZIP_OPSYS_OS_X &h13u
#define ZIP_OPSYS_DEFAULT ZIP_OPSYS_UNIX

type zip_source_cmd as long
enum
	ZIP_SOURCE_OPEN
	ZIP_SOURCE_READ
	ZIP_SOURCE_CLOSE
	ZIP_SOURCE_STAT
	ZIP_SOURCE_ERROR
	ZIP_SOURCE_FREE
end enum

#define ZIP_SOURCE_ERR_LOWER (-2)
#define ZIP_STAT_NAME &h0001u
#define ZIP_STAT_INDEX &h0002u
#define ZIP_STAT_SIZE &h0004u
#define ZIP_STAT_COMP_SIZE &h0008u
#define ZIP_STAT_MTIME &h0010u
#define ZIP_STAT_CRC &h0020u
#define ZIP_STAT_COMP_METHOD &h0040u
#define ZIP_STAT_ENCRYPTION_METHOD &h0080u
#define ZIP_STAT_FLAGS &h0100u

type zip_stat
	valid as zip_uint64_t
	name as const zstring ptr
	index as zip_uint64_t
	size as zip_uint64_t
	comp_size as zip_uint64_t
	mtime as time_t
	crc as zip_uint32_t
	comp_method as zip_uint16_t
	encryption_method as zip_uint16_t
	flags as zip_uint32_t
end type

type zip_flags_t as zip_uint32_t
type zip_source_callback as function(byval as any ptr, byval as any ptr, byval as zip_uint64_t, byval as zip_source_cmd) as zip_int64_t

declare function zip_add(byval as zip ptr, byval as const zstring ptr, byval as zip_source ptr) as zip_int64_t
declare function zip_add_dir(byval as zip ptr, byval as const zstring ptr) as zip_int64_t
declare function zip_get_file_comment(byval as zip ptr, byval as zip_uint64_t, byval as long ptr, byval as long) as const zstring ptr
declare function zip_get_num_files(byval as zip ptr) as long
declare function zip_rename(byval as zip ptr, byval as zip_uint64_t, byval as const zstring ptr) as long
declare function zip_replace(byval as zip ptr, byval as zip_uint64_t, byval as zip_source ptr) as long
declare function zip_set_file_comment(byval as zip ptr, byval as zip_uint64_t, byval as const zstring ptr, byval as long) as long
declare function zip_archive_set_tempdir(byval as zip ptr, byval as const zstring ptr) as long
declare function zip_close(byval as zip ptr) as long
declare function zip_delete(byval as zip ptr, byval as zip_uint64_t) as long
declare function zip_dir_add(byval as zip ptr, byval as const zstring ptr, byval as zip_flags_t) as zip_int64_t
declare sub zip_discard(byval as zip ptr)
declare sub zip_error_clear(byval as zip ptr)
declare sub zip_error_get(byval as zip ptr, byval as long ptr, byval as long ptr)
declare function zip_error_get_sys_type(byval as long) as long
declare function zip_error_to_str(byval as zstring ptr, byval as zip_uint64_t, byval as long, byval as long) as long
declare function zip_fclose(byval as zip_file ptr) as long
declare function zip_fdopen(byval as long, byval as long, byval as long ptr) as zip ptr
declare function zip_file_add(byval as zip ptr, byval as const zstring ptr, byval as zip_source ptr, byval as zip_flags_t) as zip_int64_t
declare sub zip_file_error_clear(byval as zip_file ptr)
declare sub zip_file_error_get(byval as zip_file ptr, byval as long ptr, byval as long ptr)
declare function zip_file_extra_field_delete(byval as zip ptr, byval as zip_uint64_t, byval as zip_uint16_t, byval as zip_flags_t) as long
declare function zip_file_extra_field_delete_by_id(byval as zip ptr, byval as zip_uint64_t, byval as zip_uint16_t, byval as zip_uint16_t, byval as zip_flags_t) as long
declare function zip_file_extra_field_set(byval as zip ptr, byval as zip_uint64_t, byval as zip_uint16_t, byval as zip_uint16_t, byval as const zip_uint8_t ptr, byval as zip_uint16_t, byval as zip_flags_t) as long
declare function zip_file_extra_fields_count(byval as zip ptr, byval as zip_uint64_t, byval as zip_flags_t) as zip_int16_t
declare function zip_file_extra_fields_count_by_id(byval as zip ptr, byval as zip_uint64_t, byval as zip_uint16_t, byval as zip_flags_t) as zip_int16_t
declare function zip_file_extra_field_get(byval as zip ptr, byval as zip_uint64_t, byval as zip_uint16_t, byval as zip_uint16_t ptr, byval as zip_uint16_t ptr, byval as zip_flags_t) as const zip_uint8_t ptr
declare function zip_file_extra_field_get_by_id(byval as zip ptr, byval as zip_uint64_t, byval as zip_uint16_t, byval as zip_uint16_t, byval as zip_uint16_t ptr, byval as zip_flags_t) as const zip_uint8_t ptr
declare function zip_file_get_comment(byval as zip ptr, byval as zip_uint64_t, byval as zip_uint32_t ptr, byval as zip_flags_t) as const zstring ptr
declare function zip_file_get_external_attributes(byval as zip ptr, byval as zip_uint64_t, byval as zip_flags_t, byval as zip_uint8_t ptr, byval as zip_uint32_t ptr) as long
declare function zip_file_rename(byval as zip ptr, byval as zip_uint64_t, byval as const zstring ptr, byval as zip_flags_t) as long
declare function zip_file_replace(byval as zip ptr, byval as zip_uint64_t, byval as zip_source ptr, byval as zip_flags_t) as long
declare function zip_file_set_comment(byval as zip ptr, byval as zip_uint64_t, byval as const zstring ptr, byval as zip_uint16_t, byval as zip_flags_t) as long
declare function zip_file_set_external_attributes(byval as zip ptr, byval as zip_uint64_t, byval as zip_flags_t, byval as zip_uint8_t, byval as zip_uint32_t) as long
declare function zip_file_strerror(byval as zip_file ptr) as const zstring ptr
declare function zip_fopen(byval as zip ptr, byval as const zstring ptr, byval as zip_flags_t) as zip_file ptr
declare function zip_fopen_encrypted(byval as zip ptr, byval as const zstring ptr, byval as zip_flags_t, byval as const zstring ptr) as zip_file ptr
declare function zip_fopen_index(byval as zip ptr, byval as zip_uint64_t, byval as zip_flags_t) as zip_file ptr
declare function zip_fopen_index_encrypted(byval as zip ptr, byval as zip_uint64_t, byval as zip_flags_t, byval as const zstring ptr) as zip_file ptr
declare function zip_fread(byval as zip_file ptr, byval as any ptr, byval as zip_uint64_t) as zip_int64_t
declare function zip_get_archive_comment(byval as zip ptr, byval as long ptr, byval as zip_flags_t) as const zstring ptr
declare function zip_get_archive_flag(byval as zip ptr, byval as zip_flags_t, byval as zip_flags_t) as long
declare function zip_get_name(byval as zip ptr, byval as zip_uint64_t, byval as zip_flags_t) as const zstring ptr
declare function zip_get_num_entries(byval as zip ptr, byval as zip_flags_t) as zip_int64_t
declare function zip_name_locate(byval as zip ptr, byval as const zstring ptr, byval as zip_flags_t) as zip_int64_t
declare function zip_open(byval as const zstring ptr, byval as long, byval as long ptr) as zip ptr
declare function zip_set_archive_comment(byval as zip ptr, byval as const zstring ptr, byval as zip_uint16_t) as long
declare function zip_set_archive_flag(byval as zip ptr, byval as zip_flags_t, byval as long) as long
declare function zip_set_default_password(byval as zip ptr, byval as const zstring ptr) as long
declare function zip_set_file_compression(byval as zip ptr, byval as zip_uint64_t, byval as zip_int32_t, byval as zip_uint32_t) as long
declare function zip_source_buffer(byval as zip ptr, byval as const any ptr, byval as zip_uint64_t, byval as long) as zip_source ptr
declare function zip_source_file(byval as zip ptr, byval as const zstring ptr, byval as zip_uint64_t, byval as zip_int64_t) as zip_source ptr
declare function zip_source_filep(byval as zip ptr, byval as FILE ptr, byval as zip_uint64_t, byval as zip_int64_t) as zip_source ptr
declare sub zip_source_free(byval as zip_source ptr)
declare function zip_source_function(byval as zip ptr, byval as zip_source_callback, byval as any ptr) as zip_source ptr
declare function zip_source_zip(byval as zip ptr, byval as zip ptr, byval as zip_uint64_t, byval as zip_flags_t, byval as zip_uint64_t, byval as zip_int64_t) as zip_source ptr
declare function zip_stat(byval as zip ptr, byval as const zstring ptr, byval as zip_flags_t, byval as zip_stat ptr) as long
declare function zip_stat_index(byval as zip ptr, byval as zip_uint64_t, byval as zip_flags_t, byval as zip_stat ptr) as long
declare sub zip_stat_init(byval as zip_stat ptr)
declare function zip_strerror(byval as zip ptr) as const zstring ptr
declare function zip_unchange(byval as zip ptr, byval as zip_uint64_t) as long
declare function zip_unchange_all(byval as zip ptr) as long
declare function zip_unchange_archive(byval as zip ptr) as long

end extern
