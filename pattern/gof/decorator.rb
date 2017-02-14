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
text = "Gun deals #{bad.damage} damage, after repairing #{good.damage}."
raise unless
  text ==
    "Gun deals 4 damage, after repairing 6."