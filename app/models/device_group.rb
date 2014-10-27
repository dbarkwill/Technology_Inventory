class DeviceGroup < ActiveRecord::Base
	has_and_belongs_to_many :properties
	has_many :devices

	has_many :links, :as => :linkable
	has_many :articles, :through => :links
end
