class Network < ActiveRecord::Base
	has_many :addresses
	has_many :devices, :through => :addresses
end
