class Robber
end

class Cowboy
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

"#{ol_hideout.inhabitant.class} vs #{saloon.inhabitant.class}"