class Robber
  def initialize(name, reliable)
    @name = name
    @reliable = reliable
  end

  def rob_bank()
    if @reliable then "#{@name} goes and robs a bank." else "#{@name} didn't." end
  end
end

class Gang
  def initialize(*members)
    @members = members
  end
  
  def let_someone_rob_a_bank()
    @members.inject([]) do |res, item|
      res << item.rob_bank
      res
    end
  end
end

gang = Gang.new(Robber.new("Bob"), Robber.new("Doe"), Robber.new("Jack"), Robber.new("Pete", true))

raise unless
  gang.let_someone_rob_a_bank() == 
    ["Bob didn't.",
     "Doe didn't.",
     "Jack didn't.",
     "Pete goes and robs a bank."]