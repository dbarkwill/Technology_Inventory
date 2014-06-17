class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :name
      t.string :network
      t.integer :vlan
      t.text :description

      t.timestamps
    end
  end
end
