class AddSerialRequiredToInventoryItems < ActiveRecord::Migration
  def change
    add_column :inventory_items, :serial_required, :boolean
  end
end
