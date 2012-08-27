module Logmill
  module Cases

    require_relative 'rails_log_item.pb'

    class RailsLog < Base

      def initialize
        @log_type = 1
      end

      def cases
        rx_main = /(\w+)\s+"([\w\/]+)"\s+for\s+(\d.+)\s+at\s+(.+)/
        rx_cmpld = /\d\d\d/

        item = nil

        [
          [/\n/, proc { 
            if item              
              store Time.parse(item.date), item.serialize_to_string 
            end
            :break
          }],
          [/Started\s+/, proc { |s|
            item = RailsLogItem.new

            s.scan(rx_main)

            item.method = s[1]
            item.url = s[2]
            item.ip = s[3]
            item.date = s[4] 
          }],
          [/Completed\s+/, proc { |s|
            item.code = s.scan(rx_cmpld)
          }],
          [/\s+Parameters:\s+{(.+)}/, proc { |s| 
            item.parameters = s[1]
          }]
        ]

      end

    end
  end
end