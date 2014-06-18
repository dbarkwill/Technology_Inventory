class Device < ActiveRecord::Base
	belongs_to :device_group
	has_many :attrs, :through => :device_group
	has_many :attr_devices, dependent: :destroy
	accepts_nested_attributes_for :device_group
	has_many :networks, through: :addresses
	has_many :addresses


	def MAC
		self.attr_devices.each do |attrb|
			if attrb.attr.name.to_s == 'MAC'
				@MacAddress = attrb.value
			end
		end
		return @MacAddress if @MacAddress
	end
end
