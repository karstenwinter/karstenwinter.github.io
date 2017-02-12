class Robber
  def walk() "The robber walks to the bank." end
  def rob() "The robber robbs the place he's at." end
end

class Boss
  def command(robber, task)
    if robber.respond_to? task
      robber.eval(task)
    else
      "The robber doesn't know how to #{task}."
    end
  end
end

boss = Boss.new
joe = Robber.new
["walk", "ask", "rob"].map do |command|
	boss.command(joe, command)
end