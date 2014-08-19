class SetupVersionNumber < ActiveRecord::Migration
  def change
    create_table :event_version_number do |t|
      t.integer :version
    end
  end
end
