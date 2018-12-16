# encoding: utf-8
# Author:: Ana de Lorenzo-Cáceres Luis  (mailto:alu0100972016@ull.edu.es)
# Copyright:: Creative Commons
# License:: Distributes under the same terms as Ruby

#Crea un nodo con :value, :next y :prev
Node = Struct.new(:value, :next, :prev)

#Esta clase implementa una lista doblemente enlazada
#Se ha incluido el mixin Enumerable
class List
    include Enumerable

    #Getters de las variables de instancia
    attr_reader :head, :tail, :size
    
    #Creamos una lista vacía
    def initialize 
        @tail = @head = nil
        @size = 0
    end

    #Comprueba si la lista está vacía
    def is_empty
        empty = ""
        if (@head == nil)
            empty = true
        else
            empty = false
        end
        empty
    end
    
    #Método para insertar un nodo por la cabeza
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
    
    #Método para insertar un nodo por la cola
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
    
    #Método para insertar varios nodos por la cabeza
    def insert_n_to_head(array)
        array.each do |node|
            insert_head(node)
        end
    end

    #Método para insertar varios nodos por la cola
    def insert_n_to_tail(array)
        array.each do |node|
            insert_tail(node)
        end
    end

    #Método para eliminar la cabeza
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
    
    #Método para eliminar la cola
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
    
    #Método para eliminar varios nodos por la cabeza
    def remove_n_from_head(qty)
        times = 0
        while times < qty && @size > 0
            remove_head
            times = times + 1
        end
    end

    #Método para eliminar varios nodos por la cola
    def remove_n_from_tail(qty)
        times = 0
        while times < qty && @size > 0
            remove_tail
            times = times + 1
        end
    end

    #Override del to_s
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

    #Se incluye el método del mixin Enumerable
    #Se define como una iteración c/u de los calores de los nodos
    def each
        aux = @head
        sz = @size
        for i in (1..sz)
            yield aux.value
            aux = aux.next
        end
    end

    #Ordena la lista con for
    def sort_for
        sorted = [@head.value]
        aux = @head
        sz = @size
        for i in (1...sz)
            aux = aux.next
            for j in (0..sorted.size)
                if (j == sorted.size)
                    sorted.push(aux.value)
                elsif (aux.value < sorted[j])
                    sorted.insert(j, aux.value)
                    break
                end
            end
        end
        return sorted
    end

    #Oredena la lista con each
    def sort_each
        sorted = [@head.value]
        self.each_with_index do |x, pos_x|
            if (pos_x != 0)
                sorted.each_with_index do |y, pos_y|
                    if (pos_y == sorted.size - 1)
                        if (x < y)
                            sorted.insert(pos_y, x)
                            break
                        else
                            sorted.push(x)
                            break
                        end
                    elsif (x < y)
                        sorted.insert(pos_y, x)
                        break
                    end
                end
            end
        end
        return sorted
    end

end