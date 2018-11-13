Node = Struct.new(:value, :next, :prev)

class List

    attr_reader :head, :tail, :size
    
    def initialize 
        @tail = @head = nil
        @size = 0
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
        if is_empty
            new_node = Node.new(node,nil,nil)
            @head = new_node
            @tail = @head
        else
            new_node = Node.new(node,@head,nil)
            @head.prev = new_node
            @head = new_node
        end
        @size = @size + 1
    end
    
    def insert_tail(node)
        if is_empty
            new_node = Node.new(node,nil,nil)
            @tail = new_node
            @head = @tail
        else
            new_node = Node.new(node,nil,@tail)
            @tail.next = new_node
            @tail = new_node
        end
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
        if @size == 1
            @head = nil
            @tail = @head
        else
            @head = @head.next
            @head.prev = nil
        end
        @size = @size - 1
    end
    
    def remove_tail
        if @size == 1
            @tail = nil
            @head = @tail
        else
            @tail = @tail.prev
            @tail.next = nil
        end
        @size = @size - 1
    end
    
    def remove_n_from_head(qty)
        times = 0
        while times < qty && @size > 0
            remove_head
            times = times + 1
        end
    end

    def remove_n_from_tail(qty)
        times = 0
        while times < qty && @size > 0
            remove_tail
            times = times + 1
        end
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
end