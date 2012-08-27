require 'sinatra'
require_relative '../logmill'
require_relative 'cases/rails_log_item.pb'

get '/' do
  out = ''
  out << '<form action="/details">'
  out << '<select name="dates[]" multiple="multiple" style="height:300px">'
  Logmill::DB[:reports].each do |row|
    out << %Q[<option value="#{row[:id]}">#{row[:date].strftime("%Y-%m-%d %H:%M")}</option>]
  end
  out << '</select><br/>'
  out << '<button type="submit">Details</button>'
  out << '</form>'
  out
end

get '/details' do
  ids = Logmill::DB[:reports].where(:id => params[:dates]).map do |row|
    row[:log_ids].split(',')
  end.flatten
  items = Logmill::DB[:log].where(:id => ids)
  out = ''
  out << items.map { |row| 
    rails_log_item = RailsLogItem.new
    rails_log_item.parse_from_string(row[:data])
    %Q[<strong>#{row[:date]}</strong><br >#{rails_log_item.inspect}] 
    }.join('<br /><br />')
  out << "<hr />"
  out << "Total: #{items.count}"
  out 
end