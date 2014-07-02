class DeviceGroup < ActiveRecord::Base
	has_many :attrs
	has_many :devices

	has_many :links, :as => :linkable
	has_many :articles, :through => :links
end
