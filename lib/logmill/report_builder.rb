module Logmill
  class ReportBuilder
    def build
      log_items = group_log_items Logmill::DB[:log]
      store_grouped_log_items Logmill::DB[:reports], log_items
    end

    def group_log_items log_set
      items = Hash.new { |hash, key| hash[key] = [] }
      log_set.each do |row|
        d = row[:date]
        short_date = Time.utc(d.year, d.month, d.day, d.hour, d.min, 0, 0)
        items[short_date] << row[:id]        
      end
      items
    end

    def store_grouped_log_items db_set, items
      items.each do |date, ids|
        db_set.insert(:report_type => 1, :date => date, :log_ids => ids.join(','))
      end
    end
  end
end