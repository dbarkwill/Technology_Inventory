class DeviceGroup < ActiveRecord::Base
	has_many :attrs
	has_many :devices
end
