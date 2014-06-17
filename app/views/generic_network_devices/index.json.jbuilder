json.array!(@generic_network_devices) do |generic_network_device|
  json.extract! generic_network_device, :id, :name, :MAC, :description
  json.url generic_network_device_url(generic_network_device, format: :json)
end
