require 'benchmark'

def quick(list)

  return list if list.length <= 1
  new_pivot = partition(list)
  left = list.slice(0...new_pivot)
  right = list.slice(new_pivot .. -1)

  return quick(left) + quick(right)

end

def partition(list)
  pivot_index = list.length - 1
  pivot_value = list[pivot_index]

  left_list = 0

  for j in 0..list.length - 2

    if list[j] < pivot_value
      left_list += 1
    end
  end
   list[left_list],list[pivot_index] = list[pivot_index], list[left_list]

return left_list
end

puts Benchmark.measure {quick(['a','b','d','e','f','h','g','c'])}
