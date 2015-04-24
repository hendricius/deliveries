class KomplexeTour

  attr_accessor :tour, :order, :position, :capacity

# FIXME - Tourenbildung programmieren - Depot Info laden

  # tTT minimale Tour ohne CR
  #Liefer, Depot immer am Anfang jeder Tour
  def build_tour_deliver()
    new_tour = Tour.new

  end
  
  #Sammeln (Wenn Kapazität Grenzwert überschreiten würde, Fahrt zum Depot)
  def build_tour_collect()
    
  end

  # tTT minimale Tour mit CR
  def build_tour_collect_CR()

  end
  
  def build_tour_deliver_CR()

  end

  def set_ready (order, tour, position, capacity, speed)
    self.position = Position.new
    self.position.position = position

    self.tour = tour
    if self.tour.tour.empty?
    # deliver oder collect
    self.tour.tour.push(self.position)
    end
    self.capacity = capacity
    self.speed = speed
  end

  # Schnittstellen zur Strecken- / Zeitberechnung
  def time_for_distanz(pos1,pos2)
    # Mapstime von pos1 nach pos2
  end

  # Gibt für ein tourobjekt die totalTourTime zurück
  def time_for_tour(tour)
    tour_array = tour.tour.clone
    time = 0
    tour_array.each_with_index do |position, index|
      if index >0
        index = index -1
        first =  tour_array[index] # Vorheriges Tourelement
        second = position # Aktuelles Tourelement
        time = time + time_for_distanz(first.position, second.position)
      end
    end
    time #return
  end

  # Gibt Zeit bis zur Order zurück
  def time_for(order)

  end

end