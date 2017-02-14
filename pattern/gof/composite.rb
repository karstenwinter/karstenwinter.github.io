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

bob = Robber.new
gang = Gang.new(bob, Robber.new, Robber.new)
raise unless
  bob.bullets == 2
  
raise unless
  gang.bullets == 6
