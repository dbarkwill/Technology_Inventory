class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address
      t.integer :device_id
      t.string :device_type

      t.timestamps
    end
  end
end
