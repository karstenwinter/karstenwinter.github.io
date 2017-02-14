class Man
  def fight()
    "#{name} steps up to his opponent, #{special} and then #{finish}."
  end
end

class Cowboy < Man
  def name()
    "Cowboy Frank"
  end
  def special()
    "draws his gun"
  end
  def finish()
    "shoots"
  end
end

raise unless
  Cowboy.new.fight ==
    "Cowboy Frank steps up to his opponent, draws his gun and then shoots."