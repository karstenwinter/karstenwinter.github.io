class Robber
  def to_s() "Robber \##{hash}" end
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

i = Inspection.new([Robber.new, Robber.new, Robber.new])
while i.move_next
	puts("Sherrif inspects #{i.item}")
end