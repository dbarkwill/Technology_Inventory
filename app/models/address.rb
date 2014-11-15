class Address < ActiveRecord::Base
	belongs_to :network
	belongs_to :device
	validate  :ip_address_belongs_to_network, :ip_address_not_taken

	def ip_address_belongs_to_network
		ip_network = IPAddress(network.network)
		temp_ip = (IPAddress(address) rescue nil)
		unless (ip_network.include?(temp_ip) rescue nil)
			errors.add(:address, "#{address} is not a valid IP address or does not belong to that network.")
		end
	end

	def ip_address_not_taken
		found = Address.find_by(address: address, network: network)
		if found
			errors.add(:address, "#{address} is already taken")
		end
	end

	def self.search(query)
	  where("address like ?", "%#{query}%") 
	end

	
end
