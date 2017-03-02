require 'ffi'
require_relative './rs_buffers_s'
require_relative './rs_signature'
require_relative './rollsum'
require_relative './rs_prototab_ent'
require_relative './rs_mdfour'
require_relative './rs_stats'

module RubyLibrsync
  class RsJob < FFI::Struct
    layout :dogtag,               :int,
           :job_name,             :string,
           :stream,               RsBuffersS.ptr,
           :statefn,              callback([RsJob.ptr], :rs_result),
           :final_result,         :rs_result,
           :block_len,            :int,
           :strong_sum_len,       :int,
           :signature,            RsSignature.ptr,
           :op,                   :uchar,
           :weak_sig,             :rs_weak_sum_t,
           :weak_sum,             Rollsum,
           :param1,               :rs_long_t,
           :param2,               :rs_long_t,
           :cmd,                  RsPrototabEnt.ptr,
           :output_md4,           RsMdfour,
           :stats,                RsStats,
           :scoop_buf,            :rs_byte_t_star,
           :scoop_next,           :rs_byte_t_star,
           :scoop_alloc,          :size_t,
           :scoop_avail,          :size_t,
           :scoop_pos,            :size_t,
           :write_buf,            [:rs_byte_t, 36],
           :write_len,            :int,
           :copy_len,             :rs_long_t,
           :basis_pos,            :rs_long_t,
           :basis_len,            :rs_long_t,
           :copy_cb,              :rs_copy_cb,
           :copy_arg,             :pointer,
           :magic,                :int
  end
end