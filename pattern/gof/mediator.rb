class Lawyer
  attr :pursuer
  attr :culprit
  def initialize(pursuer, culprit)
    @pursuer = pursuer
    @culprit = culprit
    @pursuer.mediator = self
    @culprit.mediator = self
  end
  def send(sender, message)
    if sender == culprit
      pursuer.receive(message)
    elsif sender == pursuer
      culprit.receive(message)
    end
  end
end

class Person
  attr :mediator
  def initialize(name)
    @name = name
  end
  def receive(message)
    "Statement directed to #{@name}: #{message}"
  end
  def send(message)
    mediator.send(self, message)
  end
end

bad_bob = Person.new("Bad Bob")
mayor = Person.new("Mayor")
lawyer = Lawyer.new(mayor, bad_bob)
[
    "Protocol:",
    bad_bob.send("What did I do wrong? :("),
    mayor.send("You shot my horse! >:(")
].join("\n")