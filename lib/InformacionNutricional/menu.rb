class Menu
    
    attr_accessor :titulo, :ingesta, :desayuno, :almuerzo, :cena
    
    def initialize(titulo, &block)
        @titulo = titulo
        @ingesta = []
        @desayuno = []
        @almuerzo = []
        @cena = []

        if block_given?  
            if block.arity == 1
                yield self
            else
                instance_eval(&block) 
            end
        end
    end
end