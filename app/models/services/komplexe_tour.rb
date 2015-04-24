class KomplexeTour

  attr_accessor :tour, :origin, :destination, :position, :capacity
  
  # Tour mit CR
  def build_tour(tour,order,postion,new_capacity, speed)
    #Werte und Objekte vorbereiten
    set_ready(order, tour, postion, new_capacity, speed)
    new_tour = Tour.new

    #Schleife - Kapazitäsverlauf auf Stellen untersuchen, an den += order.kapazität nicht über Kapazität-max geht
    self.tour.capacityarray.each_with_index do |capacity, index|
      tmp_tour = self.tour.clone
      new_capacity = capacity + order.capacity
      if new_capacity <= self.capacity
        # An Stelle Origin-new einsetzen und capacityarray updaten von tmp_tour
        tmp_tour.capacityarray.insert(index+1, new_capacity)
        tmp_tour.tour.insert(index+1,self.origin)
        # tmp_tour capacityarray updaten. Alle Kapazitäten nach der neuen Origin werden um 
        #Kapazität des neuen Items erhöht
        new_capacityarray = []
        runarray = tmp_tour.capacityarray.clone
        runarray.each_with_index do |update_capacity, index1|
          if index1 > index+1
            newer_capacity = update_capacity + order.capacity
            new_capacityarray.push(newer_capacity)
          else
            new_capacityarray.push(update_capacity)
          end
        end
        tmp_tour.capacityarray = new_capacityarray.clone

        #Schleife - bis Kapazitätsgrenze verletzt werden würde, weil Delivery zu spät in Reihenfolge
        reset_tour = tmp_tour.clone
        reset_tour.capacityarray.each_with_index do |dest_capacity, index2|
          break if dest_capacity > self.capacity
          break if index2 < index

          # Destination-new einsetzen, Kapazität in Capacityarray und Destination in Tourarray
          if index2 == 0
            tmp_tour.tour.insert(index2+2,self.destination)
          else
            tmp_tour.tour.insert(index2+1,self.destination)
          end
          
          # Kapazitätsarray von tmp_tour updaten - Nach Desitnation wieder d.capacity abziehen
          new_capacityarray = []
          reset_tour.capacityarray.each_with_index do |update_capacity, index3|
            if index3 > index2+1
              update_capacity = update_capacity + self.destination.capacity
              new_capacityarray.push(update_capacity)
            else
              new_capacityarray.push(update_capacity)
            end
          end
          if new_capacityarray[new_capacityarray.length-1] != 0
            new_capacityarray.push(0)
          end         
          tmp_tour.capacityarray = new_capacityarray.clone          

          # Tourtime berechnen
          tmp_tour.time = time_for_tour(tmp_tour)
          
          # Wenn neue Tour schneller als bisherige neue Touren, wird die schnellere Zeit gespeichert
          if new_tour.time > tmp_tour.time
            new_tour = tmp_tour.clone
            new_tour.orderarray.push(order)
            tmp_tour = reset_tour.clone
          else
            # Zurücksetzen von tmp_tour
            tmp_tour = reset_tour.clone
          end
        end
      end
    end
    #Return schnellste Tour
    new_tour 
  end
  
  # Tour ohne CR
  # FIXME - Testen
  def build_tour_light(tour, order, position)
    #Werte und Objekte vorbereiten
    set_ready(order, tour, postion)
    new_tour = Tour.new
    tmp_tour = new_tour.clone
    
    #jede Stelle zum einsetzen der Origin betrachten
    self.tour.each_with_index do |order1, index1| # each1
      #Order-Origin an Position einsetzen
      tmp_tour.insert(index1,self.origin)
      # Tour zum reseten
      reset_tour = tmp_tour.clone
      #jede Stelle zum einsetzen der Destination betrachten
      tmp_tour.each_with_index do |order2, index2| # each2
        # Erst einsetzen, wenn index2 > index1, wenn die Einsetzposition hinter der Origin ist
         if index2 > index1
           tmp_tour.insert(index2,self.destination)
         end
        # Test welche Tour schneller ist, die mit der alten Destination oder mit der neun   
        if new_tour.time > tmp_tour.time # Beim ersten mal hat new_tour.time = 10000000
          new_tour = tmp_tour.clone
          new_tour.orderarray.push(order)
          tmp_tour = reset_tour.clone
        else
        # Zurücksetzen von tmp_tour auf alten Stand
          tmp_tour = reset_tour.clone
       end  
      end #end each2
    end #end each1
    #Return schnellste Tour
    new_tour 
  end # End build_tour

  def set_ready (order, tour, position, capacity, speed)
    self.origin = Origin.new
    self.origin.name = "origin-#{order.name}" self.origin.id = order.id
    self.origin.position = order.origin
    self.origin.capacity = order.capacity

    self.destination = Destination.new
    self.destination.name = "destination-#{order.name}"
    self.destination.id = order.id
    self.destination.position = order.destination
    self.destination.capacity = order.capacity*-1
    
    
    self.position = Position.new
    self.position.position = position

    self.tour = tour
    if self.tour.tour.empty?
    self.tour.tour.push(self.position)
    end
    self.capacity = capacity
  end
  
  def set_ready ()
    
  end

  # Für zwei Arrays pos1= [X,Y] ; pos2 = [X,Y] wird Zeit zurückgegeben
  # Kann durch andere Methoden /Schnittstellen zur Strecken- / Zeitberechnung ersetzt werden
  def time_for_distanz(pos1,pos2)
  #Maps
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
  
end