require 'sequel'

module Logmill
  DB = Sequel.sqlite "logmill.sqlite"
end