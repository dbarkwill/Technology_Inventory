module ApplicationHelper

	def find_device(network, ip)
		search = network.addresses.find_by_address(ip.to_s)

		if search
			device = search.device
			row = "<td>#{device.name}</td><td>#{device.MAC}</td><td>#{device.description}</td><td>#{device.class.to_s}</td>".html_safe
			return row
		else
			return "<td></td><td></td><td></td><td></td>".html_safe
		end
	end

	
end
