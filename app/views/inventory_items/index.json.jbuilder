json.array!(@inventory_items) do |inventory_item|
  json.extract! inventory_item, :id, :sku, :name, :description, :cost, :on_hand_quantity, :loaned_out_quantity, :in_use_quantity, :serial_numbers, :inventory_category_id
  json.url inventory_item_url(inventory_item, format: :json)
end
