class AddNetworkIdToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :network_id, :integer
  end
end
