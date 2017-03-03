require 'ffi'
require_relative './rs_block_sig'
require_relative './rs_tag_table_entry'
require_relative './rs_target'

module RubyLibrsync
  class RsSignature < FFI::Struct
    C_TYPE = 'rs_signature_t'
    layout :flength,               :rs_long_t,
           :count,                 :int,
           :remainder,             :int,
           :block_len,             :int,
           :strong_sum_len,        :int,
           :block_sigs,            RsBlockSig.ptr,
           :tag_table,             RsTagTableEntry.ptr,
           :targets,               RsTarget.ptr,
           :magic,                 :int
  end
end
