class Man
  def accept(v) raise "accept must be overriden" end
end
class Cowboy < Man
  def accept(v) v.visitCowboy(self) end
end
class Robber < Man
  def accept(v) v.visitRobber(self) end
end
class BankDirector < Man
  def accept(v) v.visitBankDirector(self) end
end

class Tax
  def visitCowboy(g)
    2
  end
  def visitRobber(g)
    0
  end
  def visitBankDirector(g)
    10
  end
end

v = Tax.new
[Cowboy.new, Robber.new, BankDirector.new].map do |g|
    g.accept(v)
end