class CreateDeviceProperties < ActiveRecord::Migration
  def change
    create_table :device_properties do |t|
      t.integer :property_id, index: true
      t.integer :device_id, index: true
      t.text :value
      t.timestamps
    end
  end
end
