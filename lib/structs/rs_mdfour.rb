require 'ffi'

module RubyLibrsync
  class RsMdfour < FFI::Struct
    layout :A,          :uint,
           :B,          :uint,
           :C,          :uint,
           :D,          :uint,
           :totalN,     :uint64_t,
           :tail_len,   :int,
           :tail,       [:uchar, 64]
  end
end
