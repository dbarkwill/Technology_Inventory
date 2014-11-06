class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.string :sku
      t.string :name
      t.text :description
      t.float :cost
      t.integer :on_hand_quantity
      t.integer :loaned_out_quantity
      t.integer :in_use_quantity
      t.text :serial_numbers
      t.integer :inventory_category_id
      t.boolean :serial_required

      t.timestamps
    end
  end
end
