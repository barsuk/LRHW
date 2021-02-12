class Number < Struct.new(:value)
end

class Add < Struct.new(:left, :right)
end

class Multiply < Struct.new(:left, :right)
end

Add.new(
  Multiply.new(Number.new(1),Number.new(2)),
  Multiply.new(Number.new(3),Number.new(4))
)

class Number
  def to_s
    value.to_s
  end

  def inspect
    "<<#{self}>>"
  end
end

class Add
  def to_s
    "#{left} + #{right}"
  end

  def inspect
    "<<#{self}>>"
  end
end

class Multiply
  def to_s
    "#{left} * #{right}"
  end

  def inspect
    "<<#{self}>>"
  end
end

Add.new(
  Multiply.new(Number.new(1),Number.new(2)),
  Multiply.new(Number.new(3),Number.new(4))
)

Number.new(5)

