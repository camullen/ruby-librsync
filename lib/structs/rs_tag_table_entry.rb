require 'ffi'

module RubyLibrsync
  class RsTagTableEntry < FFI::Struct
    C_TYPE = "rs_tag_table_entry_t"
    layout :l,    :int,
           :r,    :int
  end
end