require 'ffi'

module RubyLibrsync
  extend FFI::Library
  ffi_lib File.expand_path('../librsync.dylib', __FILE__)

  require_relative './typedefs'

  # Callbacks
  callback :rs_trace_fn_t, [:int, :string], :void
  callback :rs_copy_cb, [:pointer, :rs_long_t, :size_t_star, :pointer], :rs_result

  # Struct imports
  require_relative './structs/rs_mdfour'
  require_relative './structs/rs_stats'
  require_relative './structs/rs_mdfour'
  require_relative './structs/rs_stats'
  require_relative './structs/rs_signature'
  require_relative './structs/rs_job'
  require_relative './structs/rs_buffers_s'

  # Needs RsJob pointer
  callback :rs_driven_cb, [RsJob.ptr, RsBuffersS.ptr, :pointer], :rs_result 

  # Function Attachments
  attach_function :rs_trace_set_level, [:rs_loglevel], :void
  attach_function :rs_trace_to, [:rs_trace_fn_t], :void
  attach_function :rs_trace_stderr, [:int, :string], :void
  attach_function :rs_supports_trace, [], :int

  attach_function :rs_hexify, [:buffer_out, :buffer_in, :int], :void
  attach_function :rs_unbase64, [:buffer_inout], :size_t
  attach_function :rs_base64, [:buffer_in, :int, :buffer_out], :void

  attach_function :rs_strerror, [:rs_result], :string

  attach_function :rs_mdfour, [:buffer_out, :buffer_in, :size_t], :void
  attach_function :rs_mdfour_begin, [RsMdfour.ptr], :void
  attach_function :rs_mdfour_update, [RsMdfour.ptr, :pointer, :size_t], :void
  attach_function :rs_mdfour_result, [RsMdfour.ptr, :buffer_out], :void

  attach_function :rs_format_stats, [RsStats.ptr, :pointer, :size_t], :strptr
  attach_function :rs_log_stats, [RsStats.ptr], :int

  attach_function :rs_free_sumset, [RsSignature.ptr], :void
  attach_function :rs_sumset_dump, [RsSignature.ptr], :void

  attach_function :rs_job_iter, [RsJob.ptr, RsBuffersS.ptr], :rs_result
  attach_function :rs_job_drive, [RsJob.ptr, RsBuffersS.ptr, :rs_driven_cb, :pointer, :rs_driven_cb, :pointer], :rs_result
  # attach_function :rs_accum_value, [RsJob.ptr, :pointer, :size_t], :int

  attach_function :rs_sig_begin, [:size_t, :size_t, :rs_magic_number], RsJob.ptr
  attach_function :rs_delta_begin, [RsSignature.ptr], RsJob.ptr

  attach_function :rs_loadsig_begin, [:pointer], RsJob.ptr
  attach_function :rs_build_hash_table, [RsSignature.ptr], :rs_result

  attach_function :rs_patch_begin, [:rs_copy_cb, :pointer], RsJob.ptr

  # attach_function :rs_mdfour_file, [:file_star, :buffer_out], :void
  attach_function :rs_sig_file, [:file_star, :file_star, :size_t, :size_t, :rs_magic_number, RsStats.ptr], :rs_result
  attach_function :rs_loadsig_file, [:file_star, :pointer, RsStats.ptr], :rs_result
  attach_function :rs_file_copy_cb, [:pointer, :rs_long_t, :size_t_star, :pointer], :rs_result
  attach_function :rs_delta_file, [RsSignature.ptr, :file_star, :file_star, RsStats.ptr], :rs_result
  attach_function :rs_patch_file, [:file_star, :file_star, :file_star, RsStats.ptr], :rs_result


end
