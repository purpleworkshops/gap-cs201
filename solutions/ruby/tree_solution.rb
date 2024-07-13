require "minitest/autorun"
require "debug"

# 1. You may not include Enumerable or any built-in Ruby class that implements Enumerable.
# 2. You must use as little memory as possible (fewest number of data attributes, etc)
# 3. If you must loop, you can use while..., but not .each, etc.

# Make this code work (feel free to adapt/change):

class TreeNode
  attr_accessor :data, :left, :right

  def initialize(new_data)
    @data = new_data
  end

  def add(new_data)
    if new_data > data
      if right
        right.add(new_data)
      else
        @right = TreeNode.new(new_data)
      end
    elsif new_data < data
      if left
        left.add(new_data)
      else
        @left = TreeNode.new(new_data)
      end
    end
  end

  def size
    result = 1
    result += left.size if left
    result += right.size if right
    return result
  end

  def to_s
    result = []
    if @left != nil
      result << @left.to_s
    end
    result << data
    if @right != nil
      result << @right.to_s
    end
    result.join(' ')
  end

  def has?(data_to_search_for)
    found = false
    if @data == data_to_search_for
      found = true
    else
      if left
        found = left.has?(data_to_search_for)
      end
      if !found && right
        found = right.has?(data_to_search_for)
      end
    end
    return found
  end
end

class BinaryTree

  attr_accessor :root

  def add(data)
    if root.nil?
      @root = TreeNode.new(data)
    else
      root.add(data)
    end
  end

  def size
    if root 
      root.size
    else
      0
    end
  end

  def to_s
    if root
      root.to_s
    else
      ""
    end
  end

  def has?(data)
    if root
      root.has?(data)
    end
  end
end

class BinaryTreeTest < Minitest::Test

  attr_reader :colors

  def setup
    @colors = BinaryTree.new
    @colors.add("red")   # start root node with "red"
    @colors.add("yellow")
    @colors.add("violet")
    @colors.add("orange")
    @colors.add("green")
    @colors.add("blue")
    @colors.add("indigo")
  end

  def test_size
    assert_equal 7, colors.size  
  end

  def test_membership
    assert colors.has?('yellow')  # true
    refute colors.has?('purple')  # false
  end

  def test_to_s
    assert_equal "blue green indigo orange red violet yellow", colors.to_s 
  end

  # def test_delete
  #   colors.delete("green")
  #   assert_equal 6, colors.size
  # end

end
