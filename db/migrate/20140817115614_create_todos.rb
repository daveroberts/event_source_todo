class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :guid
      t.string :title
      t.string :description
      t.datetime :completed_at
      t.timestamps
    end
  end
end
