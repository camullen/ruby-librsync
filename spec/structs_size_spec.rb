require 'inline'
require_relative '../lib/ruby_librsync'

STRUCT_CLASSES = [
  RubyLibrsync::RsJob,
  RubyLibrsync::Rollsum,
  RubyLibrsync::RsBlockSig,
  RubyLibrsync::RsBuffersS,
  RubyLibrsync::RsMdfour,
  RubyLibrsync::RsPrototabEnt,
  RubyLibrsync::RsSignature,
  RubyLibrsync::RsStats,
  RubyLibrsync::RsTagTableEntry,
  RubyLibrsync::RsTarget
]

class StructSizes
  LIBRSYNC_BASE = File.expand_path('../../ext/librsync/src/', __FILE__)
  inline do |builder|
    builder.add_compile_flags("-I#{LIBRSYNC_BASE}")
    builder.include '"config.h"'
    builder.include '"librsync.h"'
    builder.include '"job.h"'
    builder.include '"sumset.h"'
    builder.include '"command.h"'
    builder.include '"prototab.h"'

    STRUCT_CLASSES.each do |clazz|
      builder.c "
        int #{clazz::C_TYPE}_size() { return sizeof(#{clazz::C_TYPE}); }
      "
    end
  end
end

describe 'Structs size' do
  let(:struct_sizes) { StructSizes.new }
  STRUCT_CLASSES.each do |clazz|
    it "should have the right packed size for #{clazz.to_s}" do
      expect(clazz.size).to eq(struct_sizes.send("#{clazz::C_TYPE}_size"))
    end
  end
end