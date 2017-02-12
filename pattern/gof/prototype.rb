class Robber
  def self.new(name)
    if @@proto.nil? then
      @@proto = super
      @@proto.appendix = "of the prairie"
    end
    @@proto.clone(name)
  end
 
  attr :name
  attr :appendix
  
  def to_s
    "#{name} #{appendix}" 
  end

  def clone(name)
    res = super
    res.name = name
    res
  end
end

[Robber.new("Jack"), Robber.new("Doe")]