class Robber
end

class Cowboy
end

class Western
  def self.character()
    if rand(2) == 0 then Cowboy.new else Robber.new end
  end
end

"In a western, there are #{Western.character.class}s."