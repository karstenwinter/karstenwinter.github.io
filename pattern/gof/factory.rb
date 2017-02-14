class Robber
  def to_s()
    "Robber"    
  end
end

class Cowboy
  def to_s()
    "Cowboy"    
  end
end

class Robbers
  def create()
    Robber.new
  end
end

class Cowboys
  def create()
    Cowboy.new
  end
end

class House
  def initialize(fact)
    @fact = fact
  end
  def inhabitant()
    @fact.create
  end
end

ol_hideout = House.new(Robbers.new)
saloon = House.new(Cowboys.new)

raise unless
  "#{ol_hideout.inhabitant} vs #{saloon.inhabitant}" ==
    "Robber vs Cowboy"