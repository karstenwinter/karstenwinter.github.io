class Caravan
  def initialize(horse)
    if horse.class != Horse
      raise "Horse needed"
    end
    @horse = horse
  end
  def to_s()
      "a caravan with #{@horse}"
  end
end

class Horse
  def to_s()
      "a horse"
  end
end

class Caravans
  def build()
    horse = Horse.new
    Caravan.new(horse)
  end
end

raise unless
  Caravans.new.build.to_s ==
    "a caravan with a horse"