class Robber
  def initialize(num)
      @num = num
  end
  def to_s()
    "Robber \##{@num}"
  end
end

class Inspection
  def initialize(arr)
    @arr = arr
    @index = -1
  end
  def move_next()
    @index += 1
    @index < @arr.length
  end
  def item()
    @arr[@index]
  end
end

insp = []
i = Inspection.new([Robber.new(1), Robber.new(2), Robber.new(3)])
while i.move_next
  insp << ("Sherrif inspects #{i.item}")
end

insp unless
  insp ==
    ["Sherrif inspects Robber #1",
     "Sherrif inspects Robber #2",
     "Sherrif inspects Robber #3"]
