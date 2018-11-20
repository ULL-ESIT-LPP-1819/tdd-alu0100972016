class Persona
    
    attr_reader :name, :age
    
    def initialize(name, age, sex)
        @name, @age, @sex = name, age, sex
    end
    
    def sex
        array = ""
        if @sex == 1
            array = "Hombre"
        else
            array = "Mujer"
        end
        array
    end
    
    def to_s
        "Nombre: #{@name}, Edad: #{@age}, Sexo: #{sex}"
    end
end
