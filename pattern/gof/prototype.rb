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

raise unless
  Robber.new("Jack").to_s ==
    "Jack of the prairie"

raise unless    
  Robber.new("Doe").to_s ==
    "Doe of the prairie"
