def binary_search(list,value)
  low = 0
  high = list.length - 1

  while (low <= high) do
    mid = (low + high) / 2
    if list[mid] > value
      high = mid - 1
    elsif list[mid] < value
      low = mid + 1
    else
      return mid
    end
  end
  return 'not found'
end
