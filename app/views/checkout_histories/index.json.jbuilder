json.array!(@checkout_histories) do |checkout_history|
  json.extract! checkout_history, :id, :device_id, :name, :notes
  json.url checkout_history_url(checkout_history, format: :json)
end
