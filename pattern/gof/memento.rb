class Memento
  def initialize(obj, *keys)
    @hash = Hash.new
    @keys = keys
    for k in @keys
      @hash[k.to_s] = obj.eval(k.to_s)
    end
  end
  def apply(obj)
    for k in @keys
      obj.eval("self.#{k.to_s} = #{@hash[k.to_s].inspect}")
    end
  end
end

class Town
  attr :name
  attr :habitants
  attr :country
  def store()
    Memento.new(self, :name, :habitants, :country)
  end
  def restore(memento)
    memento.apply(self)
  end
  def to_s() "#{@name} #{@habitants} #{@country}" end
end

saltlake_city = Town.new
saltlake_city.name = "Saltlake City"
saltlake_city.habitants = 200
saltlake_city.country = "Texas"

raise unless 
  saltlake_city.to_s ==
    "Saltlake City 200 Texas"

memento = saltlake_city.store
saltlake_city.name = "Ol' City"
saltlake_city.habitants = 100
saltlake_city.country = "TX"
snap2 = saltlake_city.to_s
raise unless 
  saltlake_city.to_s ==
  "Ol' City 100 TX"

saltlake_city.restore(memento)

raise unless 
  saltlake_city.to_s ==
    "Saltlake City 200 Texas"
