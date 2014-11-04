class InventoryItem < ActiveRecord::Base
	belongs_to :inventory_category
	attr_accessor :new_inventory_category_name
	before_save :create_inventory_category_from_name

	def create_inventory_category_from_name
		create_inventory_category(:name => new_inventory_category_name) unless new_inventory_category_name.blank?
	end

	def self.search_by_sku(query)
	  where("sku like ?", "%#{query}%") 
	end
end
