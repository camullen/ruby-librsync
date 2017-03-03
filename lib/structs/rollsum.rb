require 'ffi'

module RubyLibrsync
  class Rollsum < FFI::Struct
    C_TYPE = 'Rollsum'
    layout :count,      :ulong,
           :s1,         :ulong,
           :s2,         :ulong
  end
end