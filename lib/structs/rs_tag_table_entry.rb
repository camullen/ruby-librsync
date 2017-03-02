require 'ffi'

module RubyLibrsync
  class RsTagTableEntry < FFI::Struct
    layout :l,    :int,
           :r,    :int
  end
end