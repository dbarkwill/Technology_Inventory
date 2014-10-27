class Property < ActiveRecord::Base
	has_and_belongs_to_many :device_groups
	has_many :devices, :through => :device_property

	@@valid_styles = ['Text Field','Text Area','Dropdown List', 'Person Select']

	def self.valid_styles
		@@valid_styles
	end

end
