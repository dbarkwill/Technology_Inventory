module AddressesHelper
	def validate_ip(network, ip)
		ip_network = IPAddress(network.network)
		temp_ip = IPAddress(ip)
		ip_network.include?(temp_ip)
	end
end
