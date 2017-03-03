require 'inline'

class UINT64Checker
  inline do |builder|
    builder.include '<stdint.h>'
    builder.c_singleton'
      int uint64defined() {
        #ifdef UINT64_MAX
          return 1;
        #else
          return 0;
        #endif
      }
    '
  end

  def self.defined?
    uint64defined == 1
  end
end