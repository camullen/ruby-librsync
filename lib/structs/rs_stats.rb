require 'ffi'

module RubyLibrsync
  class RsStats < FFI::Struct
    C_TYPE = 'rs_stats_t'
    layout :op,             :pointer,
           :lit_cmds,       :int,
           :lit_bytes,      :rs_long_t,
           :lit_cmdbyts,    :rs_long_t,
           :copy_cmds,      :rs_long_t,
           :copy_bytes,     :rs_long_t,
           :copy_cmdbytes,  :rs_long_t,
           :sig_cmds,       :rs_long_t,
           :sig_bytes,      :rs_long_t,
           :false_matches,  :int,
           :sig_blocks,     :rs_long_t,
           :block_len,      :size_t,
           :in_bytes,       :rs_long_t,
           :out_bytes,      :rs_long_t
  end
end