json.array!(@printers) do |printer|
  json.extract! printer, :id, :name, :namufacturer, :model, :MAC, :location, :print_queue
  json.url printer_url(printer, format: :json)
end
