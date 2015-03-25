class Order < ActiveRecord::Base
  belongs_to :company
  geocoded_by :from_address, latitude: :from_latitude, longitude: :from_longitude
  geocoded_by :to_address, latitude: :to_latitude, longitude: :to_longitude
  after_validation :geocode
end
