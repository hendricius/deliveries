json.array!(@orders) do |order|
  json.extract! order, :id, :content, :driver_id, :company_id, :latitude, :longitude, :address, :capacity
  json.url order_url(order, format: :json)
end
