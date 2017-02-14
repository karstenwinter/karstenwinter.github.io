class State
  def moving() false end
  def to_s()
    name = self.class.name.scan(/.*::(.*)/)
    "#{name}#{if moving then " (moving)" end}"
  end
end

class Broken < State
  def next_state() Fixed.new end
end

class Rolling < State
  def next_state() Broken.new end
  def moving() true end
end

class Fixed < State
  def next_state() Repaired.new end
end

class Repaired < State
  def next_state() Rolling.new end
end

st = Rolling.new
states = (1..6).map do
    st = st.next_state
    st.to_s
end

raise unless
  states ==
    ["Broken", "Fixed", "Repaired", "Rolling (moving)", "Broken", "Fixed"]
