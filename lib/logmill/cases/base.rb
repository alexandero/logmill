module Logmill
  module Cases
    class Base
      def store date, data
        Logmill::DB[:log].insert(:log_type => @log_type, :date => date, :data => data)
      end
    end
  end
end