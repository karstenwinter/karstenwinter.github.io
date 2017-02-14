class Robber
end

class Cowboy
end

class Western
  def self.character(type)
    if type == "good" then Cowboy.new else Robber.new end
  end
end

raise unless
  Western.character("good").class ==
    Cowboy

raise unless
  Western.character("bad").class ==
    Robber
