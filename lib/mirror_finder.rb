class MirrorFinder

  def big_enough?(num)
    num > 1000
  end

  def reverse(num)
    num.digits.join.to_i
  end

  def find_b(num)
    reversed_num = reverse(num)
    sum_of_orig_reversed = num + reversed_num
    return sum_of_orig_reversed
  end

  def find_mirror(floor)
    z = floor + 1
    (z..9999999999999999).each do |i|
      sum_of_orig_reversed = find_b(i)
      if palindrome?(sum_of_orig_reversed) && big_enough?(sum_of_orig_reversed)
        return i
      end
    end
  end

  def palindrome?(num)
    num == reverse(num)
  end
end

# Another example below, more mathematical approach

# class MirrorFinder
#
#   def reverse(i)
#     result = 0
#     while result != 0
#       digit = i % 10
#       result = (result * 10) + digit
#       i = i / 10
#     end
#     result
#   end
#
#   def palindrome?(x)
#     x == reverse(x)
#   end
#
#   i = 0
#   output = []
#   while output.count < 25
#     rev = reverse(i)
#     sum = rev + i
#     if palindrome? sum and sum > 1000
#       output << i
#     end
#     i += 1
#   end
# end
