require 'benchmark'


def fib(n)
fib = []
  return 0 if n == 0
  return 1 if n == 1

  fib_0 = 0
  fib_1 = 1

(1.. n).each do
  temp = fib_0
  fib_0 = fib_1

  fib_1 += temp
  fib << fib_0

  if fib.length == 10
   break
 end

 end
 print fib
end

puts Benchmark.measure{ fib(20)}
