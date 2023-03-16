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
    return counter = 0 if @head.nil?

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
    return head if index == 1

    node = @head
    [2..index].each { node = node.next_node }
    node
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
p list.at(2)