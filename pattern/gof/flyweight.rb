class Inventory
  def initialize()
    @contents = Hash.new
  end
  def get(name)
    @contents[name]
  end
  def add(item)
    @contents[item.name] = item
  end
end

class Item
  attr :name, :value, :damage
  def initialize(name, value, damage)
    @name, @value, @damage = name, value, damage
  end
  def to_s() "#{@name}: #{@value}$, #{@damage}DPS" end
end

inv = Inventory.new
name = "Ol' Joe's steady gun"
inv.add(Item.new(name, 10, 20))

raise unless
  inv.get(name).to_s ==
    "Ol' Joe's steady gun: 10$, 20DPS"
