class Address < ActiveRecord::Base
	belongs_to :network
	belongs_to :device
	validate :ip_address_belongs_to_network

	def ip_address_belongs_to_network
		ip_network = IPAddress(network.network)
		temp_ip = IPAddress(address)
		unless ip_network.include?(temp_ip)
			errors.add(:address, "does not belong to that network.")
		end
	end
end
