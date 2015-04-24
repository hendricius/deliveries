json.array!(@tours) do |tour|
  json.extract! tour, :id, :tour, :capacityarray, :time, :driver_id, :kind
  json.url tour_url(tour, format: :json)
end
