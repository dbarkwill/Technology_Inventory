class AddDeviceGroupIdToAttrs < ActiveRecord::Migration
  def change
    add_column :attrs, :device_group_id, :integer
  end
end
