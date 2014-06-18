class AddDeviceGroupIdToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :device_group_id, :integer
  end
end
