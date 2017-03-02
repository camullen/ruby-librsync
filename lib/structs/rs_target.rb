require 'ffi'

module RubyLibrsync
  class RsTarget < FFI::Struct
    layout :t,  :ushort,
           :i,  :int
  end
end
