class Weapon
  def use() "'s weapon cannot be used" end
end

class Dagger < Weapon
  def use()
    " uses a dagger"
  end
end

class Gun < Weapon
  def use()
    " uses a gun"
  end
end

class Man
  attr :weapon
  def initialize(name, weapon)
    @name = name
  @weapon = weapon
  end
  def use()
    "#{@name}#{weapon.use}"
  end
end

joe = Man.new("Joe", Gun.new)
pete = Man.new("Pete", Weapon.new)

raise unless
  joe.use ==
    "Joe uses a gun"
    
raise unless
  pete.use ==
    "Pete's weapon cannot be used"

pete.weapon = Dagger.new

raise unless
  pete.use ==
    "Pete uses a dagger"
