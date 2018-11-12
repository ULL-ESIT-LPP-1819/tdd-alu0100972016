Node = Struct.new(:value, :next, :prev)

class List

    include Comparable
    attr_reader :head, :tail, :size
    
    def initialize (node)
        @head = Node.new(node,nil,nil)
        @tail = @head
        @size = 1
    end

    def is_empty
        empty = ""
        if (@head == nil)
            empty = true
        else
            empty = false
        end
        empty
    end

    def size
        @size
    end
    
    def insert_head(node)
        new_node = Node.new(node,@head,nil)
        @head.prev = new_node
        @head = new_node
        @size = @size + 1
    end
    
    def insert_tail(node)
        new_node = Node.new(node,nil,@tail)
        @tail.next = new_node
        @tail = new_node
        @size = @size + 1
    end
    
    def insert_n_to_head(array)
        array.each do |node|
            insert_head(node)
        end
    end

    def insert_n_to_tail(array)
        array.each do |node|
            insert_tail(node)
        end
    end

    def remove_head
        @head = @head.next
        @head.prev = nil
        @size = @size - 1
    end
    
    def remove_tail
        @tail = @tail.prev
        @tail.next = nil
        @size = @size - 1
    end
    
    def remove_n_from_head(qty)
        times = 0
        while times < qty && @size > 0 do
            remove_head
            times = times + 1
        end
    end

    def remove_n_from_tail(qty)
        times = 0
        while times < qty && @size > 0 do
            remove_tail
            times = times + 1
        end
    end

    def <=> (anOther)
        salt <=> anOther.value.salt
    end

    def to_s
        array = ""
        node = @head
        while node != nil
            array += "#{node.value.name}"
            if node.next != nil
                array += ", "
            end
            node = node.next
        end
        array
    end

    def clasify_salt
        array = ""
        node = @head
        while node != nil
            array += "#{node.value.name}:"
            if 6.0 >= node.value.salt
                array += " Sí"
            else 
                array += " No"
            end 
            if node.next != nil
                array += ", "
            end
            node = node.next
        end
        array
    end

end