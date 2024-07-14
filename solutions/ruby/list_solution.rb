require "minitest/autorun"

# 1. You may NOT use Array, Enumerable or any built-in Ruby class that implements Enumerable.
# 2. You must use as little memory as possible (fewest number of data attributes, etc)
# 3. If you must loop, you can use while..., but not .each, etc.

# Make this code work (feel free to adapt/change):

A -> B -> C -> D -> E -> null

class Node
  attr_accessor :data, :next
end

class List
  attr_accessor :head

  def initializer
    @head = nil
  end

  def to_s(node = head)
    result = ""
    if !node.nil?
      result << node.data
      if node.next
        result << " " + to_s(node.next)
      end
    end
    result
  end

  def size
    n = 0
    node = @head
    while node
      n += 1
      node = node.next
    end
    n
  end

  def add(data)
    if @head.nil?
      @head = Node.new
      @head.data = data
    else
      node = Node.new
      node.data = data
      temp = @head
      until temp.next.nil?
        temp = temp.next
      end
      temp.next = node
    end
  end

  def has?(value)
    node = @head
    while node
      return true if node.data == value
      node = node.next
    end
  end

  def delete(value)
    node = @head
    prev = nil
    while node
      if node.data == value
        if prev
          prev.next = node.next
        else
          @head = node
        end
      end
      node = node.next
    end
  end

  def [](index)
    node = @head
    while index > 0 
      node = node.next
      index -= 1
    end
    node ? node.data : nil
  end
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
