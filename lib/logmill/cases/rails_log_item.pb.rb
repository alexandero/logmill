### Generated by rprotoc. DO NOT EDIT!
### <proto file: rails_log_item.proto>
# message Item {
#   required string date = 1;
#   optional string url = 2;
#   optional string ip = 3;
#   optional string parameters = 4;
#   optional string code = 5;
#   optional string method = 6;
# }
require 'protobuf/message/message'
require 'protobuf/message/enum'
require 'protobuf/message/service'
require 'protobuf/message/extend'

class RailsLogItem < ::Protobuf::Message
  defined_in __FILE__
  required :string, :date, 1
  optional :string, :url, 2
  optional :string, :ip, 3
  optional :string, :parameters, 4
  optional :string, :code, 5
  optional :string, :method, 6
end