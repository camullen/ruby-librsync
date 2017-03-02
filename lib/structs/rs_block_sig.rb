require 'ffi'

module RubyLibrsync
  class RsBlockSig < FFI::Struct
    layout :i,          :int,
           :weak_sum,   :rs_weak_sum_t,
           :strong_sum, [:uchar, RS_MAX_STRONG_SUM_LENGTH]
  end
end