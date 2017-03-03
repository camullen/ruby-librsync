require 'ffi'

module RubyLibrsync
  class RsMdfour < FFI::Struct
    C_TYPE = 'rs_mdfour_t'
    layout :A,          :uint,
           :B,          :uint,
           :C,          :uint,
           :D,          :uint,
           :totalN,     :uint64_t,
           :tail_len,   :int,
           :tail,       [:uchar, 64]
  end
end
