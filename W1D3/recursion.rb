require 'byebug'

def range(start, endr)
  return [] if start == endr
  range(start,endr-1) << endr -1

end

def sum_array(arr)
  arr.reduce(:+)
end

def rec_sum_array(arr)
  return arr[0] if arr.length == 1
  arr[0] + rec_sum_array(arr[1..-1])
end

def expo_it(number,power)
  return 1 if power == 0
  number * expo_it(number, power - 1)
end

def expo_rec(number,power)
  return 1 if power ==0
  return number if power == 1
  if power.even?
    expo_rec(number, power / 2) ** 2
  else
    number * (expo_rec(number, (power-1)/2) * expo_rec(number, (power-1)/2) )
  end
end

def deep_dup(arr)
  arr.each.map {|el| el.is_a?(Array) ? deep_dup(el) : el}
end

def fib(n)
  return [0, 1] if n == 2
  fib(n-1) << (fib(n-1)[-1]+fib(n-1)[-2])
end

def fib_it(n)
  return [0] if n == 1
  result_arr = [0,1]
  (n-2).times do |idx|
    result_arr << result_arr[-1]+ result_arr[-2]
  end
  result_arr
end

def subsets(arr)

  return [[]] if arr.empty?
  next_arr = []
  temp = subsets(arr[0..-2])
  temp.each do |el|
    next_arr += [(el += [arr[-1]])]
  end
  temp + next_arr
end

def permutations(arr)
  # debugger
  return [arr] if arr.length == 1



  first = arr.first
  rest = permutations(arr[1..-1])
  result = []
  rest.each do |permutation|
    permutation.each_index do |index|
      result << permutation[0...index] + [first] + permutation[index..-1]
    end
  end
  result
end



def binary_search(arr, target)
  # debugger
  mid = arr.length/2
  return mid if arr[mid] == target
  return nil if arr.length == 1
  return binary_search(arr[mid..-1], target) + mid if (target > arr[mid]) && mid != nil
  return binary_search(arr[0...mid] , target) if target < arr[mid]
end



p binary_search([1,2,3,4,5,6,7,90, 100, 101], 54)





# p permutations([1,2,3])
#
#
#
#
# p subsets([1,2])
