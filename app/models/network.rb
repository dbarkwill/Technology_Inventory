class Network < ActiveRecord::Base
	has_many :addresses, dependent: :destroy
	has_many :devices, :through => :addresses

	accepts_nested_attributes_for :addresses

	validate :valid_network



	def valid_network
		unless (IPAddress(self.network) rescue nil)
			errors.add(:network, "The provided network is not valid. A valid format is 192.168.0.1/24")
		end
	end
end
