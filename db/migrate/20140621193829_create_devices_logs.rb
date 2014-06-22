class CreateDevicesLogs < ActiveRecord::Migration
  def change
    create_table :devices_logs, :id => false do |t|
    	t.integer :device_id
    	t.integer :user_id
    end
  end
end
