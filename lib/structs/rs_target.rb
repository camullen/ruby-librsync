require 'ffi'

module RubyLibrsync
  class RsTarget < FFI::Struct
    C_TYPE = 'rs_target_t'
    layout :t,  :ushort,
           :i,  :int
  end
end
