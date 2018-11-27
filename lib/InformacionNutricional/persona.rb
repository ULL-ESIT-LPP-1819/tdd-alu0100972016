# encoding: utf-8
# Author:: Ana de Lorenzo-Cáceres Luis  (mailto:alu0100972016@ull.edu.es)
# Copyright:: Creative Commons
# License:: Distributes under the same terms as Ruby

#Esta clase permite ver los datos de una persona
class Persona
    
    #Getters de las variables de instancia
    attr_reader :name, :age
    
    #Se genera el objeto con los datos proporcionados
    def initialize(name, age, sex)
        @name, @age, @sex = name, age, sex
    end
    
    #Devuelve un string para identificar el sexo
    def sex
        array = ""
        if @sex == 1
            array = "Hombre"
        else
            array = "Mujer"
        end
        array
    end
    
    #Override del to_s
    def to_s
        "Nombre: #{@name}, Edad: #{@age}, Sexo: #{sex}"
    end
end
