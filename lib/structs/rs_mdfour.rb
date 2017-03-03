require 'ffi'
require_relative '../util/uint64_checker'

module RubyLibrsync
  class RsMdfour < FFI::Struct
    C_TYPE = 'rs_mdfour_t'

    totalN_fields = if UINT64Checker.defined?
                      [:totalN, :uint64_t]
                    else
                      [:totalN_hi, :uint32_t, :totalN_lo, :uint32_t]
                    end

    layout :A,          :uint,
           :B,          :uint,
           :C,          :uint,
           :D,          :uint,
           *totalN_fields,
           :tail_len,   :int,
           :tail,       [:uchar, 64]
  end
end
