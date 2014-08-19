class SetupEventLog < ActiveRecord::Migration
  def change
    create_table :event_log do |t|
      t.string :event_name
      t.datetime :event_time
      t.string :event_params
      t.integer :event_number
      t.string :notes
      t.timestamps
    end
    def connection
      ActiveRecord::Base.establish_connection("#{Rails.env}_event_log").connection
    end
  end
end
