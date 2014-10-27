class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address
      t.integer :network_id
      t.integer :device_id
      t.timestamps
    end
  end
end
