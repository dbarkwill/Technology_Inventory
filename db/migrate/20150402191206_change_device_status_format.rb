class ChangeDeviceStatusFormat < ActiveRecord::Migration
  def up
  	change_column :devices, :status, :integer
  end
  def down
  	change_column :devices, :status, :string
  end
end
