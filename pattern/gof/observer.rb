class Mayor
  def initialize(name)
    @listeners = []    
    @name = name
  end
  def add_listener(item)
    @listeners << item
  end
  def say(something)
    for listener in @listeners
      listener.notify(self, something)
    end
  end
  def to_s()
    @name
  end
end

class Listener
  attr :said
  def notify(sender, something)
    if @said.nil? then @said = [] end
    @said << "#{sender} said: #{something}"
  end
end


mayor = Mayor.new("Old Mike")
citizen = Listener.new
mayor.add_listener(citizen)
mayor.say("My folks...")
mayor.say("Jack and his gang came to town yesterday...")
citizen.said