class CreateGenericNetworkDevices < ActiveRecord::Migration
  def change
    create_table :generic_network_devices do |t|
      t.string :name
      t.string :MAC
      t.text :description

      t.timestamps
    end
  end
end
