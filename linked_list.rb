# linked List implementation in ruby


class Node
  attr_accessor :value, :next_node
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList

  # check if list is empty
  def is_empty?
    return @head == nil ? true : false
  end

   #push: given a data, add a new node in the end
   def push(value)
    puts "Pushing the values to the end of the linked list - #{value}"
    new_node = Node.new(value)
    if self.is_empty?
      @head  = new_node
    else
      current_node = @head

      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.next_node = new_node
    end
  end

  #unshift: add a new node in the front

  def unshift(value)
    puts "Pushing the values to the begining of the linked list - #{value}"
    new_node = Node.new(value)
    if self.is_empty?
      @head  = new_node
    else
      current_node = new_node
      current_node.next_node = @head
      @head = current_node
    end
  end

  #pop: remove the last node and return it
  def pop
    if self.is_empty?
        return "This list is currently empty"
    else
        current_node = @head
        while current_node.next_node.next_node != nil
            current_node = current_node.next_node
        end
        last_node = current_node.next_node
        current_node.next_node = nil
    end
    last_node
  end

   #shift: remove the first node and return it
   def shift
    if self.is_empty?
        return "This list is currently empty"
    else
      curr_head = @head
      new_head = @head.next_node
      @head.next_node = nil
      @head = new_head
    end
    curr_head
end

  
  #pretty_print: print the current linked list as an array
  def print
      current_node = @head
      str = current_node.value.to_s

      while current_node.next_node != nil
        current_node = current_node.next_node
        str += '-->' + current_node.value.to_s 
      end
      puts str
  end
  

  def size
    return 0 if self.is_empty?
    count = 1
    current_node = @head
    while current_node.next_node != nil
      current_node = current_node.next_node
      count += 1
    end
    count
  end
end

list = LinkedList.new
list.push(30)
list.push(15)
list.push(5)
list.unshift(50)
list.unshift(90)
list.unshift(100)
list.print
puts "after removing last item in the linked list"
list.pop
list.print
puts "after removing first item in the linked list"
list.shift
list.print
puts "size of linked list #{list.size}"