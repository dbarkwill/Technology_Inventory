class Device < ActiveRecord::Base
	belongs_to :device_group
	has_many :attrs, :through => :device_group
	has_many :attr_devices
	accepts_nested_attributes_for :device_group
end
