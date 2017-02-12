class Robber
  def initialize(name, reliable)
    @name = name
    @reliable = reliable
  end

  def rob_bank()
    if @reliable || rand(2) == 0 then "#{@name} goes and robs a bank." end
  end
end

class Gang
  def initialize(*members)
    @members = members
  end
  
  def let_someone_rob_a_bank()
    @members.inject(nil) do |res, item|
      if res then res else item.rob_bank end
    end
  end
end

gang = Gang.new(Robber.new("Bob"), Robber.new("Doe"), Robber.new("Jack"), Robber.new("Pete", true))
gang.let_someone_rob_a_bank()