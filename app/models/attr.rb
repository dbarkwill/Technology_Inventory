class Attr < ActiveRecord::Base
	belongs_to :device_group
	has_many :attr_device, dependent: :destroy
	has_many :devices, :through => :attr_device

	@@valid_types = ['Text Field','Text Area','Dropdown List']

	def self.valid_types
		@@valid_types
	end

end
