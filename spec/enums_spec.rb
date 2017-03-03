require 'inline'
require_relative '../lib/ruby_librsync'

class EnumsValues
  LIBRSYNC_BASE = File.expand_path('../../ext/librsync/src/', __FILE__)
  ENUM_TYPES = [:rs_result, :rs_magic_number, :rs_loglevel, :rs_op_kind]
  ENUM_HASH = {}
  ENUM_TYPES.each do |type|
    ENUM_HASH.merge!(RubyLibrsync.enum_type(type).to_h)
  end
  inline do |builder|
    builder.add_compile_flags("-I#{LIBRSYNC_BASE}")
    builder.include '"config.h"'
    builder.include '"librsync.h"'
    builder.include '"command.h"'
    const_mapping = Hash[ENUM_HASH.keys.zip(Array.new(ENUM_HASH.size, :long))]
    builder.map_c_const(const_mapping)
  end
end

describe 'Enums' do
  EnumsValues::ENUM_HASH.each_pair do |key, value|
    it "should have the right value for #{key}" do
      expect(value).to eq(EnumsValues.const_get(key))
    end
  end
end