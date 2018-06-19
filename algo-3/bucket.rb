require 'benchmark'
require_relative 'quick.rb'
require_relative 'heap.rb'

def minMax(array)
  len = array.length - 1
  puts "len = #{len}"
  @minValue = array[0]
  @maxValue = array[0]
  for i in 0..len
    puts "@max = #{@maxValue}"
    if array[i + 1].nil?
      @maxValue = @maxValue
    elsif array[i] > @maxValue
      @maxValue = array[i]
    end

    @minValue = i if array[i] < @minValue
  end

  getDiff(array)
end

def getDiff(array)
  numBuckets = 10
  diff = @maxValue - @minValue
  @blockSize = diff / 5

  initBuckets(array, diff, numBuckets)
end

def initBuckets(array, _diff, numBuckets)
  buckets = []

  for i in 0..(numBuckets - 1) do
    buckets.push([])
  end

  distribute(array, buckets)
end

def distribute(array, buckets)
  for i in 0..(array.length - 1) do
    currentValue = array[i]
    putInBlock = case currentValue
                 when @minValue..(@minValue + @blockSize) then 0
                 when (@minValue + @blockSize)..(@minValue + @blockSize * 2) then 1
                 when (@minValue + @blockSize * 2)..(@minValue + @blockSize * 3) then 2
                 when (@minValue + @blockSize * 3)..(@minValue + @blockSize * 4) then 3
                 when (@minValue + @blockSize * 4)..(@minValue + @blockSize * 5) then 4
                 when (@minValue + @blockSize * 5)..(@minValue + @blockSize * 6) then 5
                 when (@minValue + @blockSize * 6)..(@minValue + @blockSize * 7) then 6
                 when (@minValue + @blockSize * 7)..(@minValue + @blockSize * 8) then 7
                 when (@minValue + @blockSize * 8)..(@minValue + @blockSize * 9) then 8
                 when (@minValue + @blockSize * 9)..@maxValue then 10
    end

    buckets[putInBlock].push(currentValue)
  end

  puts ' '

  for i in 0..(buckets.length - 1) do
    puts "buckets[#{i}]: #{buckets[i]}"
  end

  sortBuckets(buckets)
end

def sortBuckets(buckets)
  for i in 0..(buckets.length - 1) do
    next unless buckets[i].length > 1
    puts ' '
    puts buckets[i].to_s
    buckets[i] = quickSort(buckets[i], 0, buckets[i].length - 1)
    puts buckets[i].to_s
  end

  replace(buckets)
end

def replace(buckets)
  finalArray = []

  for i in 0..(buckets.length - 1) do
    next if (buckets.length - 1) < 1
    for j in 0..(buckets[i].length - 1) do
      finalArray.push(buckets[i].shift)
    end
  end

  puts ' '
  puts finalArray.to_s
end


puts Benchmark.measure {quick(['a','b','d','e','f','h','g','c'])}
