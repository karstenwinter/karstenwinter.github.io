class Man
  attr :name
  def initialize(name)
    @name = name  
  end
  def shoot() @name.length end
  def to_s() @name.to_s end
end

class Noisy
  def initialize(something)
    @something = something
  end
  def method_missing(name, *args)
    res = eval("@something.#{name}")
    "#{@something} tries to #{name} --> #{res}"
  end
end

sneaking = Man.new("Sneaking Steve")
clumsy = Noisy.new(Man.new("Dumb Doe"))

raise unless
  clumsy.shoot ==
    "Dumb Doe tries to shoot --> 8"
raise unless
  sneaking.shoot ==
    14
