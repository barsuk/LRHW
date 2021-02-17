class FARule < Struct.new(:state, :character, :next_state)
  def applies_to?(state, character)
    self.state == state && self.character == character
  end

  def follow
    next_state
  end

  def inspect
    "#<FARule #{state.inspect} --#{character}--> #{next_state.inspect}>"
  end
end

class DFARulebook < Struct.new(:rules)
  def next_state(state, character)
    rule_for(state, character).follow
  end

  def rule_for(state, character)
    rules.detect { |rule| rule.applies_to?(state, character) }
  end
end

class DFA < Struct.new(:current_state, :accept_states, :rulebook)
  def accepting?
    accept_states.include?(current_state)
  end

  def read_character(character)
    self.curent_state = rulebook.next_state(curent_state, character)
  end
end

rulebook = DFARulebook.new([
  FARule.new(1,'a',2),
  FARule.new(1,'b',1),
  FARule.new(2,'a',2),
  FARule.new(2,'b',3),
  FARule.new(3,'a',3),
  FARule.new(3,'b',3),
])

DFA.new(1, [1,3], rulebook).accepting?
DFA.new(1, [3], rulebook).accepting?
