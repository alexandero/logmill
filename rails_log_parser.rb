require_relative 'lib/logmill'
require_relative 'lib/logmill/parser'
require_relative 'lib/logmill/cases/base'
require_relative 'lib/logmill/cases/rails_log'

filename = 'rails.log'
lines = IO.readlines(filename)

cases = Logmill::Cases::RailsLog.new
parser = Logmill::Parser.new cases 

lines.each do |line|
  parser.parse line
end
