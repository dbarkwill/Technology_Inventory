json.array!(@logs) do |log|
  json.extract! log, :id, :message
  json.url log_url(log, format: :json)
end
