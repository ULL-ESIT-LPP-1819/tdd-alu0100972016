Node = Struct.new(:value, :next, :prev)

class List
 
  attr_reader :head, :tale

  def initialize (node)
    @head = Node.new(node,nil,nil)
    @tale = @head
  end

  def insert_head(node)
    new_node = Node.new(node,@head,nil)
    @head.prev = new_node
    @head = new_node
  end

  def insert_tale(node)
    new_node = Node.new(node,nil,@tale)
    @tale.next = new_tnode
    @tale = new_node
  end

end