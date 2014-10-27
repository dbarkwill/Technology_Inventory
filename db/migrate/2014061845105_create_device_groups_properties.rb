class CreateDeviceGroupsProperties < ActiveRecord::Migration
  def change
    create_table :device_groups_properties, id: false do |t|
      t.belongs_to :device_group
      t.belongs_to :property
    end
  end
end
