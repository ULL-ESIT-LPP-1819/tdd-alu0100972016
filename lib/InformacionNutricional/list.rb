Node = Struct.new(:value, :next, :prev)

class List
 
  attr_reader :head, :tale

  def initialize (node)
    @head = Node.new(node,nil,nil)
    @tale = @head
  end
end