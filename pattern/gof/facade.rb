class Customer
  attr :money
  def initialize(money)
    @money = money
  end
end

class Item
  attr :name
  attr :price
  attr :quantity
  def initialize(name, price, quantity)
    @name = name
    @price = price
    @quantity = quantity
  end
  def to_s() "#{quantity} #{name} (#{price}$)" end
end

class Inventory
  def initialize(*items)
    @inventory = Hash.new()
    for item in items
      @inventory[item.name] = item
    end
  end
  def get(item)
    @inventory[item]
  end
end

class Saloon
  def initialize(inventory)
    @inventory = inventory
  end
  def order(name, customer)
    item = @inventory.get(name)
    if item.nil? || item.quantity == 0
      "We don't have #{name}."
    elsif customer.money >= item.price
      item.quantity -= 1
      customer.money -= item.price
      Item.new(item.name, item.price, 1)
    else
      "You can't afford that. It costs #{item.price}$."
    end
  end
end

inv = Inventory.new(Item.new("whisky", 10, 1), Item.new("beer", 2, 2))
saloon = Saloon.new(inv)
customer = Customer.new(14)
"
  #{saloon.order("whisky", customer)}
  #{saloon.order("peanuts", customer)}
  #{saloon.order("beer", customer)}
  #{saloon.order("beer", customer)}
  #{saloon.order("beer", customer)}
"