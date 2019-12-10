module A
	def twice(x)
		x+x
	end
end

class AA
	include A
end

a = AA.new
print a.twice(5)

print a.twice('ab\n')
print a.twice("ab\n")

a,b,c = ['a', 'b', {c:1000}]
print a,b,c[:c], "\n"


o = Object.new
def o.to_s
'новый объект'
end

print o
print o.class
print "here is #{o}\n"

def o.inspect
"объект класса опачки, стр.23\n"
end

print o, "\n"

puts "это #{o}", "\n"

puts 'стр 23'

def join_with_commas(*words)
words.join(', ')
end

puts join_with_commas(5,3,9)

puts join_with_commas([['a.a', 4, 98],['a.a', 4, 98]],['a.a', 4, 98])

puts "\n параллельное присваивание \n"

a, *w, b = ['a', 'b', 3,4,5,8,'.']
puts 'a: ', a, "\n" 
puts 'b: ', b, "\n"
puts w, "\n"

print 'a: ', a, "\n" 
print 'b: ', b, "\n"
print w, "\n"

def triple
yield
yield
yield
end

print triple { puts 'хан' }

def triple
x = 5
while x < 10
yield(x)
x +=1
end
end

triple { |a| puts "#{a}: gde" }

def num_names
[yield('uno'), yield('dos'), yield('tres')].join(', ')
end

num_names { |n| puts n.upcase.reverse }

(1..10).count {
 |n| print n, ': ', n.even?, "\n" 
}

puts ' '

puts (1..10).count {
 |n| n.even?
}

puts ' '
puts (1..10).select {
 |n| n.even?
}

puts ' '
puts (1..10).any? {
 |n| n < 7
}

puts 'from 1 to 10 all < 7?'
puts (1..10).all? {
 |n| n < 7
}

puts ' '
(1..10).each do |n| 
  if n.even?
    puts sprintf('%s even', n)
  else
    puts sprintf('%s odd', n)
  end
end

puts ' '
print (1..10).select(&:even?)
puts ' '
print ['o', 'A', 'e'].map(&:upcase)

puts ' '
print ['only', 'Aesopus', 'ends'].map(&:chars)
puts ' '
print ['only', 'Aesopus', 'ends'].flat_map(&:chars)

puts ' '
print (1..10).inject(1) { |r, n| r + n }

puts ''
(1..22).inject('a') { |r,n| sprintf('_%s_',n)+r }
# "_22__21__20__19__18__17__16__15__14__13__12__11__10__9__8__7__6__5__4__3__2__1_a"

class P < Struct.new(:x, :y)
  def *(op)
    P.new(x * op.x, y*op.y)
  end

  def +(op)
    P.new(x + op.x, y+op.y)
  end

  def inspect
	"#<P (#{x}, #{y})>"
  end
end

a = P.new(4,5)
b = P.new(6,7)
puts a+b
puts a*a
puts a*b
puts a
puts b

a.x = 0
puts ''
puts a+b
puts ''
puts a*a
puts ''
puts a*b
puts ''
puts a
puts b

class P
	def -(o)
		P.new(x-o.x, y-o.y)
	end
end

puts ''
puts a-b

puts ''
NUM = [1,2,5]
puts NUM.last
puts NUM.first
puts NUM[5]

Object.send(:remove_const, :NUM)
#puts NUM.last

class G
A = 'A'
B = 'C'
end

puts G.new
puts ''
puts G::A

#Object.send(:remove_const, :G)
puts G.new


