class Number < Struct.new(:value)
  def to_s
    value.to_s
  end

  def inspect
    "<<#{self}>>"
  end

  def reducible?
    false
  end
end

class Add < Struct.new(:left, :right)
  def to_s
    "#{left} + #{right}"
  end

  def inspect
    "<<#{self}>>"
  end

  def reducible?
    true
  end

  def reduce(environment)
    if left.reducible?
      Add.new(left.reduce(environment), right)
    elsif right.reducible?
      Add.new(left, right.reduce(environment))
    else
      Number.new(left.value + right.value)
    end
  end
end

class Multiply < Struct.new(:left, :right)
  def to_s
    "#{left} * #{right}"
  end

  def inspect
    "<<#{self}>>"
  end

  def reducible?
    true
  end

  def reduce(environment)
    if left.reducible?
      Multiply.new(left.reduce(environment), right)
    elsif right.reducible?
      Multiply.new(left, right.reduce(environment))
    else
      Number.new(left.value * right.value)
    end
  end
end

class Machine < Struct.new(:expression, :environment)
  def step
    self.expression = expression.reduce(environment)
  end

  def run
    while expression.reducible?
      puts expression
      step
    end
    puts expression
  end
end

class Variable < Struct.new(:name)
  def to_s
    name.to_s
  end
  def inspect
    "<<#{self}>>"
  end
  def reducible?
    true
  end
  def reduce(environment)
    environment[name]
  end
end

#Machine.new( Add.new( Multiply.new(Variable.new(:x), Multiply.new(Variable.new(:y),Variable.new(:y)) ), Variable.new(:y)), {x: Number.new(3), y: Number.new(4), z:Add.new(1,1)}).run

class DoNothing
  def to_s
    'do-nothing'
  end
  def inspect
    "<<#{self}>>"
  end
  def ==(other_statement)
    other_statement.instance_of?(DoNothing)
  end
  def reducible?
    false
  end
end


class Assign < Struct.new(:name, :expression)
  def to_s
    "#{name} = #{expression}"
  end
  def inspect
    "<<#{self}>>"
  end
  def reducible?
    true
  end
  def reduce(environment)
    if expression.reducible?
      [Assign.new(name, expression.reduce(environment)), environment]
    else
      [DoNothing.new, environment.merge({ name => expression })]
    end
  end
end
