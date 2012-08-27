require 'strscan'

module Logmill
  class Parser
    def initialize cases
      @cases = cases.cases
    end

    def parse string
      s = StringScanner.new(string)
      @cases.each do |exp, blck|
        if s.scan(exp)
          break if blck.call(s) == :break
        end
      end
    end
  end
end
