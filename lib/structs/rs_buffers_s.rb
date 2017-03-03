require 'ffi'

module RubyLibrsync
  class RsBuffersS < FFI::Struct
    C_TYPE = 'rs_buffers_t'
    layout :next_in,        :pointer,
           :avail_in,       :size_t,
           :eof_in,         :int,
           :next_out,       :pointer,
           :avail_out,      :size_t
  end
end