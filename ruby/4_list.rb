require "minitest/autorun"

# 1. You may NOT use Array, Enumerable or any built-in Ruby class that implements Enumerable.
# 2. You must use as little memory as possible (fewest number of data attributes, etc)
# 3. If you must loop, you can use while..., but not .each, etc.

# Make the tests pass:

class Node
  attr_accessor :data, :next
end

class List
  attr_accessor :head

  # YOUR CODE GOES HERE:


end


class ListTest < Minitest::Test
  def test_list_size
    colors = List.new
    assert_equal 0, colors.size

    colors.add("red")
    colors.add("orange")
    assert_equal 2, colors.size
  end

  def test_to_s
    colors = List.new
    colors.add("red")
    colors.add("orange")
    colors.add("yellow")
    colors.add("green")
    colors.add("blue")
    colors.add("indigo")
    colors.add("violet")
    assert_equal "red orange yellow green blue indigo violet", colors.to_s
  end

  def test_read_by_index
    colors = List.new
    colors.add("red")
    colors.add("orange")
    colors.add("yellow")
    
    assert_equal "red", colors[0]
    assert_equal "yellow", colors[2]
  end

  def test_membership
    colors = List.new
    colors.add("red")
    colors.add("orange")
    colors.add("yellow")

    assert colors.has?("red")
    assert colors.has?("yellow")
    refute colors.has?("purple")
  end

  def test_delete_by_value
    colors = List.new
    colors.add("red")
    colors.add("orange")
    colors.add("yellow")

    colors.delete("orange")
    assert_equal 2, colors.size
  end

  # def test_sort
  #   colors = List.new
  #   colors.add("red")
  #   colors.add("orange")
  #   colors.add("yellow")
  #   colors.add("green")
  #   colors.add("blue")
  #   colors.add("indigo")
  #   colors.add("violet")

  #   sorted_colors = colors.sort
  #   assert_equal "blue green indigo orange red violet yellow", sorted_colors.to_s
  # end
end
