class Tour

  attr_accessor :tour, :capacityarray, :time, :orderarray, :kind
  def initialize
    self.tour = []
    self.orderarray = []
    self.capacityarray = [0]
    self.time= 10000000
    # FIXME - Art der Tourenplanung - PDP, collect oder deliver, muss bei erstellung geändert werden
    self.kind= "PDP"
  end

  def clone
    tour = Tour.new
    tour.time = self.time
    tour.capacityarray = self.capacityarray.clone
    #echtes klonen Orderarray
    orderarray = []
    self.orderarray.each do |order|
      new_order = order.clone # .clone wurde in Order ebenfalss modifiziert für echtes klonen
      orderarray.push(new_order)
    end
    tour.orderarray=orderarray
    #echtes klonen vom tourarray
    tourarray = []
    self.tour.each do |task|
      if task == nil
        binding.pry
      end
      new_task = task.clone
      new_task.position = task.position.clone
      tourarray.push(new_task)
    end
    tour.tour=tourarray
    tour # geclontes Objekt zurückgeben
  end

  # Zeit bis Order im Array, 
  # FIXME Wenn Order nicht im Array ist, nil
  def time_for_order(order)
    time = 0
    # Je nach Typ anders
    # für pdp
    if kind == "PDP"
      tour.each_with_index do |position, index|
      # erstes Element auslassen
        if index > 1
          #Methode aus komplexer_tour für Zeit errechnung
          time = time + komplexe_tour.time_for_distanz(tour[index].position,position.position)
        end
        # break wenn Zeit bis order errechnet wurde, bzw nachdem die order im array erreicht worden ist
        if position.id == order.id
        break
        end
      end
      
    # für die anderen zwei
    elsif kind == "collect" || "deliver"
      tour.each_with_index do |position, index|
      # erstes Element auslassen
        if index > 1
          #Methode aus komplexer_tour für Zeit errechnung
          time = time + komplexe_tour.time_for_distanz(tour[index].destination,position.destination)
        end
        # break wenn Zeit bis order errechnet wurde, bzw nachdem die order im array erreicht worden ist
        if position.id == order.id
        break
        end
      end
    end
    #return time
    time
  end

end