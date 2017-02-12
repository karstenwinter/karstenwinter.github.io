class Chief
  def self.new()
    if @@instance.nil?
      @@instance = super
    end
    @@instance
  end
end

c = Chief.new
c2 = Chief.new
"
The chief has citizen number #{c.hash}.
And if you ever head of a chief, it was probably #{c2.hash}.
"