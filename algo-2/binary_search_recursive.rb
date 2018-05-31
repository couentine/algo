def recursive(collection,value,low=0,high=collection.length-1)
  mid = (low + high) / 2
  return - 1 if low > high
  if collection[mid] > value
    high = mid - 1
    recursive(collection,value,low,high)
  elsif collection[mid] < value
    low = mid + 1
    recursive(collection,value,low,high)
  elsif collection[mid] === value
    return mid
  else
    return 'not found'
  end
end
