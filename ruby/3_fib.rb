require "minitest/autorun"

# Given: fib(0) = 0
#        fib(1) = 1
#
# Sequence:
# 0 1 1 2 3 5 8 13 21 34 55 89 ...

def fib(n)
  # YOUR CODE GOES HERE
  return 0 if n < 1
  return 1 if n == 1
  
  return fib(n-1) + fib(n-2)
end


class FibTest < Minitest::Test
  def test_0
    assert_equal 0, fib(0)
  end

  def test_2
    assert_equal 2, fib(3)
  end

  def test_3
    assert_equal 21, fib(8)
  end
end
