class Rob
  def execute(actor)
    actor.rob()
  end
end

class Walk
  def execute(actor)
    actor.walk()
  end
end

class Robber
  def walk()
    "The robber walks to the bank."
  end
  def rob()
    "The robber robbs the place he's at."
  end
end

joe = Robber.new
command = Walk.new

raise unless
  command.execute(joe) ==
    "The robber walks to the bank."

command = Rob.new

raise unless
  command.execute(joe) ==
    "The robber robbs the place he's at."
