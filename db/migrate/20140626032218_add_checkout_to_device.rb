class AddCheckoutToDevice < ActiveRecord::Migration
  def change
  	add_column :devices, :checkedout, :boolean
  end
end
