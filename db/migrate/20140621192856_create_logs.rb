class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.text :message
      t.integer :device_id, index: true

      t.timestamps
    end
  end
end
