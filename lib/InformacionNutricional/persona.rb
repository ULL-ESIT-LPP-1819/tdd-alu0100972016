class Persona
    
    attr_accessor :nombre, :edad
    
    def initialize(nombre, edad, sexo)
        @nombre, @edad, @sexo = nombre, edad, sexo
    end
    
    def sexo
        array = ""
        if @sexo == 1
            array = "Hombre"
        else
            array = "Mujer"
        end
        array
    end
    
    def to_s
        "Nombre: #{@nombre}, Edad: #{@edad}, Sexo: #{sexo}"
    end
end
