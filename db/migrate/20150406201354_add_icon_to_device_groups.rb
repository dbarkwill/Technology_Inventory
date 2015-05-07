class AddIconToDeviceGroups < ActiveRecord::Migration
  def change
    add_column :device_groups, :icon, :string
  end
end
