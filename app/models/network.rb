class Network < ActiveRecord::Base
	has_many :addresses
	has_many :devices, :through => :addresses

	validate :valid_ip



	def valid_ip
		if !(IPAddress(self.network) rescue nil)
			errors.add(:network, "The provided network is not valid. A valid format is 192.168.0.1/24")
		end
	end
end
