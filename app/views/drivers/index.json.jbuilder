json.array!(@drivers) do |driver|
  json.extract! driver, :id, :name, :phone, :company_id, :address, :max_capacity, :current_capacity, :latitude, :longitude
  json.url driver_url(driver, format: :json)
end
