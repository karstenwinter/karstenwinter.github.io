class Chief
  def self.new()
    if @@instance.nil?
      @@instance = super
    end
    @@instance
  end
end

c1 = Chief.new
c2 = Chief.new

raise unless
  c1.hash ==
    c2.hash