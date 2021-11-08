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
      @head = new_node
    else
      last_node = @head
      while(!last_node.next_node.nil?)
        last_node = last_node.next_node
      end
      last_node.next_node = new_node
    end
  end

  # prepend: adds a new node to the begining of the list
  def prepend(value)
    puts "Pushing the values to the begining of the linked list - #{value}"
    new_node = Node.new(value)
     if self.is_empty?
      @head = new_node
     else
      old_node = @head
      @head = Node.new(value, old_node)
     end
  end

  # remove: removes the value from the list
  def remove(value)
    return nil if self.is_empty?

    current_node = @head
    prev_node = nil
    until(current_node.nil?)
      if current_node.value == value
        if !prev_node.nil?
          prev_node.next_node = current_node.next_node
          return
        else
          @head = current_node.next_node
          return
        end
      end
      prev_node = current_node
      current_node = current_node.next_node
    end
  end

  # pop: removes the last node and return it
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

  # shift: removes the first node and return it
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

  # unshift: find the value in the list and returns true/false
  def find(value)
    puts "Finding the value in the linked list - #{value}"
    current_node = @head
     while(!current_node.next_node.nil?)
      return true if current_node.value == value
      current_node = current_node.next_node
     end
     false
  end

  
  # print: print the current linked list in a formatted way
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
list.prepend(50)
list.prepend(90)
list.prepend(100)
list.print
puts "after removing last item in the linked list"
list.pop
list.print
puts "after removing first item in the linked list"
list.shift
list.print
puts "size of linked list #{list.size}"
puts list.find(30)
puts list.find(5)
list.remove(90)
list.print