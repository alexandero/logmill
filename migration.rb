require 'sequel'

DB = Sequel.sqlite "logmill.sqlite"

DB.create_table :log do
  primary_key :id
  Integer :log_type
  DateTime :date
  String :data, :text => true
end

DB.create_table :reports do
  primary_key :id
  Integer :report_type
  DateTime :date
  String :log_ids
end
