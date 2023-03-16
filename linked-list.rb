class LinkedList
  attr_reader :head

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
      return @tail = tail
    end
    @tail.next_node = Node.new(value)
    @tail = @tail.next_node
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    return 0 if @head.nil?

    counter = 1
    node = @head
    until node.next_node.nil?
      counter += 1
      node = node.next_node
    end
    counter
  end

  def tail(node = @head)
    return node if node.nil? || node.next_node.nil?

    current_node = node.next_node
    tail(current_node)
  end

  def at(index)
    return head if index.zero?

    node = @head
    (1..index).each do
      return nil if node.next_node.nil?

      node = node.next_node
    end
    node
  end

  def pop
    return @head if @head.nil?

    if @head.next_node.nil?
      @head.next_node = nil
      return @head
    end

    node = @head
    node = node.next_node until node.next_node.next_node.nil?
    node.next_node = nil
  end

  def contains?(value)
    node = @head
    until node.value == value
      return false if node.next_node.nil?

      node = node.next_node
    end
    true
  end

  def find(value)
    index = 0
    node = @head
    until node.value == value
      return nil if node.next_node.nil?

      index += 1
      node = node.next_node
    end
    index
  end

  def to_s
    node = @head
    string = ''
    until node.nil?
      string += "( #{node.value} ) -> "
      node = node.next_node
    end
    string += 'nil'
    string
  end

  def insert_at(value, index)
    return prepend(value) if index.zero?

    if at(index - 1).nil?
      puts 'index is too high'
      return nil
    end

    following = at(index)
    node = Node.new(value, following)
    at(index - 1).next_node = node
  end

  def remove_at(index)
    if at(index).nil?
      puts 'index is too high'
      return nil
    end

    following = at(index).next_node
    at(index - 1).next_node = following
    @head
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new
p list.append('test1')
p list.append('test2')
p list.append('test3')
p list.prepend('test0')
p list.tail
p list.size
p list.head
p list.at(0)
p list.at(3)
p list.at(4)
p list.at(5)
p list.pop
p list.contains?('test2')
p list.contains?('test')
p list.find('test0')
p list.find('test2')
p list.find('test')
puts list.to_s

list2 = LinkedList.new
puts list2.to_s

p list.insert_at('test0.5', 1)
p list
p list.insert_at('test5', 5)
p list.remove_at(1)
p list.remove_at(3)