json.array!(@devices) do |device|
  json.extract! device, :id, :name, :asset_tag, :notes
  json.url device_url(device, format: :json)
end
