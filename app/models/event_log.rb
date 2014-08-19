class EventLog < ActiveRecord::Base
  establish_connection "#{Rails.env}_event_log"
  self.table_name = 'event_log'
end
