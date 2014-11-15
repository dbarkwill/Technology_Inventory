class InventoryCategory < ActiveRecord::Base
	has_many :inventory_items
end
