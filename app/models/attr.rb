class Attr < ActiveRecord::Base
	belongs_to :device_group
	has_many :attr_device, dependent: :destroy
	has_many :devices, :through => :attr_device

	@@valid_styles = ['Text Field','Text Area','Dropdown List', 'Person Select']

	def self.valid_styles
		@@valid_styles
	end

end
