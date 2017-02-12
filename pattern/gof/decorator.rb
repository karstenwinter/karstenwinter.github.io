class Gun
  def damage()
    4
  end
end

class Repaired
  def initialize(gun)
    @gun = gun
  end
  def damage()
    @gun.damage * 1.5
  end
end

bad = Gun.new
good = Repaired.new(bad)
"Gun deals #{bad.damage} damage, after repairing #{good.damage}"