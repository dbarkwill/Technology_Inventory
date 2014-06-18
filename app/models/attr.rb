class Attr < ActiveRecord::Base
	belongs_to :device_group
	has_many :attr_device
	has_many :devices, :through => :attr_device
end
