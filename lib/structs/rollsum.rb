require 'ffi'

module RubyLibrsync
  class Rollsum < FFI::Struct
    layout :count,      :ulong,
           :s1,         :ulong,
           :s2,         :ulong
  end
end