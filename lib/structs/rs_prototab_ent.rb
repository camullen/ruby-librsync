require 'ffi'

module RubyLibrsync
  class RsPrototabEnt < FFI::Struct
    C_TYPE = 'rs_prototab_ent_t'
    layout :kind,         :rs_op_kind,
           :immediate,    :int,
           :len_1,        :size_t,
           :len_2,        :size_t
  end
end