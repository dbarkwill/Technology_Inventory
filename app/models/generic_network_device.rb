class GenericNetworkDevice < ActiveRecord::Base
	has_many :addresses, :as => :device
	has_many :networks, through: :addresses
end
