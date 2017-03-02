require 'ffi'

module RubyLibrsync
  RS_MAX_STRONG_SUM_LENGTH = 32
  RS_DEFAULT_BLOCK_LEN = 2048

  typedef :uchar, :rs_byte_t
  typedef :uint, :rs_weak_sum_t
  typedef :long_long, :rs_long_t
  typedef :uchar, :rs_byte_t
  typedef :pointer, :rs_byte_t_star
  typedef :pointer, :size_t_star
  typedef :pointer, :file_star

  enum :rs_result, [
    :RS_DONE, 0,
    :RS_BLOCKED, 1,
    :RS_RUNNING , 2,
    :RS_TEST_SKIPPED, 77,
    :RS_IO_ERROR, 100,
    :RS_SYNTAX_ERROR, 101,
    :RS_MEM_ERROR, 102,
    :RS_INPUT_ENDED, 103,
    :RS_BAD_MAGIC, 104,
    :RS_UNIMPLEMENTED, 105,
    :RS_CORRUPT, 106,
    :RS_INTERNAL_ERROR, 107,
    :RS_PARAM_ERROR, 108
  ]

  enum :rs_magic_number, [
    :RS_DELTA_MAGIC, 0x72730236,
    :RS_MD4_SIG_MAGIC, 0x72730136,
    :RS_BLAKE2_SIG_MAGIC, 0x72730137
  ]

  enum :rs_loglevel, [
    :RS_LOG_EMERG, 0,
    :RS_LOG_ALERT, 1,
    :RS_LOG_CRIT, 2,
    :RS_LOG_ERR, 3,
    :RS_LOG_WARNING, 4,
    :RS_LOG_NOTICE, 5,
    :RS_LOG_INFO, 6,
    :RS_LOG_DEBUG, 7
  ]

  enum :rs_op_kind, [
    :RS_KIND_END, 1000,
    :RS_KIND_LITERAL,
    :RS_KIND_SIGNATURE,
    :RS_KIND_COPY,
    :RS_KIND_CHECKSUM,
    :RS_KIND_RESERVED,
    :RS_KIND_INVALID
  ]
end
