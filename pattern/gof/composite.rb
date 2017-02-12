class Robber
  def bullets()
    2
  end
end

class Gang
  def initialize(*args)
    @members = args
  end
  def bullets()
    @members.inject(0) do |acc, item|
      acc + item.bullets
    end
  end
end

gang = Gang.new(Robber.new, Robber.new, Robber.new)
gang.bullets
