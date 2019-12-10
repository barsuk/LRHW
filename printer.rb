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

