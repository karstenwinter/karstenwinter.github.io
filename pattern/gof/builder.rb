class Caravan
  def initialize(horse)
    if horse.class != Horse
      raise "Horse needed"
    end
    @horse = horse
  end
end

class Horse
end

class Caravans
  def build()
    horse = Horse.new
    Caravan.new(horse)
  end
end

Caravans.new.build
