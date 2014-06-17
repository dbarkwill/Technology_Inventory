json.array!(@networks) do |network|
  json.extract! network, :id, :name, :network, :vlan, :description
  json.url network_url(network, format: :json)
end
