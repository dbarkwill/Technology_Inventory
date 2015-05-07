class InventoryCategory < ActiveRecord::Base
	has_many :inventory_items

	def self.search(query)
		where("name like ?", "%#{query}%")
	end
end
