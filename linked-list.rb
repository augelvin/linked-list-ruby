class LinkedList

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

    def tail(node = @head)
        return node if node.nil? || node.next_node.nil?
        current_node = node.next_node
        tail(current_node)
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
p list.append('test')
p list.append('test2')
p list.append('test3')
p list.tail