class InventoryItem < ActiveRecord::Base
	belongs_to :inventory_category
	attr_accessor :new_inventory_category_name
	attr_accessor :raw_serial_number_list
	serialize :serial_numbers
	before_save :create_inventory_category_from_name
	has_many :loan_line_items, :as => :loanable
	has_many :loans, :through => :loan_line_items

	def create_inventory_category_from_name
		create_inventory_category(:name => new_inventory_category_name) unless new_inventory_category_name.blank?
	end

	def self.search_by_sku(query)
	  where("sku like ?", "%#{query}%") 
	end

	def raw_serial_number_list=(value)
		serial_numbers_array = Array.new
		value.split(/\r\n/).each do |serial|
			serial_numbers_array << serial
		end
		write_attribute(:serial_numbers, serial_numbers_array)
	end

	def raw_serial_number_list
		value = ''
		serial_numbers.each do |serial_number|
			value += serial_number + "\r\n".html_safe
		end
		return value.html_safe
	end

	def total_quantity
		total = on_hand_quantity.to_i + loaned_out_quantity.to_i + in_use_quantity.to_i
		return total
	end

end
