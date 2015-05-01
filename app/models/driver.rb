class Driver < ActiveRecord::Base
  belongs_to :company
  has_one :tour

  def coordinates
    # FIXME implement
  end

  def distance_to_order?
    # FIXME real implementation
    Geocoder::Calculations.distance_between([47.858205,2.294359], [40.748433,-73.985655])
  end
end
