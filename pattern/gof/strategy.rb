class Cowboy
  def name()
    "Cowboy Alan"
  end
  def meal()
    "soup"
  end
  def pronoun()
    "his"
  end
end

class Story
  def initialize(actor)
    @actor = actor
  end
  def to_s()
    "Once upon a time, there was #{@actor.name},
and everybody knew: #{@actor.pronoun} favourite meal was #{@actor.meal}."
  end
end

raise unless
  Story.new(Cowboy.new).to_s ==
    "Once upon a time, there was Cowboy Alan,
and everybody knew: his favourite meal was soup."