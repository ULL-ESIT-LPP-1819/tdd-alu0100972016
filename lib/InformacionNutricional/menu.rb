class Menu
    
    attr_accessor :nombre, :titulo, :ingesta, :desayuno, :almuerzo, :cena, :total
    
    def initialize(nombre, &block)
        @nombre = nombre
        @titulo = ""
        @ingesta = []
        @desayuno = []
        @almuerzo = []
        @cena = []
        @total = 0

        if block_given?  
            if block.arity == 1
                yield self
            else
                instance_eval(&block) 
            end
        end
    end

    def calculate_calories(grasas, carbs, proteina, sal)
        kcal = ((grasas.to_f * 9) + (carbs.to_f * 4) + (proteina.to_f * 4) + (sal.to_f * 6)).round(2)
        @total += kcal
        kcal
	end

    def to_s
        output = @nombre
        output << "#{' ' * (30 - @nombre.size)}  Composición nutricional"
        output << "\n#{'=' * 120}"
        output << "\n#{' ' * 30}"
        output << "grasas".ljust(15)
        output << "carbs".ljust(15)
        output << "proteínas".ljust(15)
        output << "fibra".ljust(15)
        output << "sal".ljust(15)
        output << "Kcal".ljust(15)
        output << "\nDesayuno"
        @desayuno.each do |comida|
            output << "\n"
            comida.each_with_index do |opcion, index|
                if index == 0
                    name = "#{opcion}"
                    output << "#{opcion} #{' ' * (30-name.size)}"
                elsif index != 1 && index != 2
                    output << "#{opcion}".ljust(15)
                end
            end
        end

        output << "\n#{'-' * 120}"

        @almuerzo.each do |comida|
            output << "\n"
            comida.each_with_index do |opcion, index|
                if index == 0
                    name = "#{opcion}"
                    output << "#{opcion} #{' ' * (30-name.size)}"
                elsif index != 1 && index != 2
                    output << "#{opcion}".ljust(15)
                end
            end
        end

        output << "\n#{'-' * 120}"

        @cena.each do |comida|
            output << "\n"
            comida.each_with_index do |opcion, index|
                if index == 0
                    name = "#{opcion}"
                    output << "#{opcion} #{' ' * (30-name.size)}"
                elsif index != 1 && index != 2
                    output << "#{opcion}".ljust(15)
                end
            end
        end
        output << "\n#{'-' * 120}\n"
        output << "Kcal totales".ljust(15)
        output << (@total.round(2)).to_s
        output
    end

    def titulo(titulo)
        @titulo = titulo
    end

    def ingesta(options = {})
        ingesta = []
        ingesta << " #{options[:min]}" if options[:min]
        ingesta << " #{options[:max]}" if options[:max]
        @ingesta << ingesta
    end

    def desayuno(options = {})
        desayuno = []
        desayuno << " #{options[:descripcion]}" if options[:descripcion]
        if options[:porcion] 
            desayuno << " #{options[:porcion]}"
        else 
            desayuno << " 0"
        end
        if options[:gramos] 
            desayuno << " #{options[:gramos]}"
        else 
            desayuno << " 0"
        end
        if options[:grasas] 
            desayuno << " #{options[:grasas]}"
        else 
            desayuno << " 0"
        end
        if options[:carbohidratos] 
            desayuno << " #{options[:carbohidratos]}"
        else 
            desayuno << " 0"
        end
        if options[:proteinas] 
            desayuno << " #{options[:proteinas]}"
        else 
            desayuno << " 0"
        end
        if options[:fibra] 
            desayuno << " #{options[:fibra]}"
        else 
            desayuno << " 0"
        end
        if options[:sal] 
            desayuno << " #{options[:sal]}"
        else 
            desayuno << " 0"
        end
        desayuno << calculate_calories(options[:grasas], options[:carbohidratos], options[:proteina], options[:sal])
        @desayuno << desayuno 
    end

    def almuerzo(options = {})
        almuerzo = []
        almuerzo << " #{options[:descripcion]}" if options[:descripcion]
        if options[:porcion] 
            almuerzo << " #{options[:porcion]}"
        else 
            almuerzo << " 0"
        end
        if options[:gramos] 
            almuerzo << " #{options[:gramos]}"
        else 
            almuerzo << " 0"
        end
        if options[:grasas] 
            almuerzo << " #{options[:grasas]}"
        else 
            almuerzo << " 0"
        end
        if options[:carbohidratos] 
            almuerzo << " #{options[:carbohidratos]}"
        else 
            almuerzo << " 0"
        end
        if options[:proteinas] 
            almuerzo << " #{options[:proteinas]}"
        else 
            almuerzo << " 0"
        end
        if options[:fibra] 
            almuerzo << " #{options[:fibra]}"
        else 
            almuerzo << " 0"
        end
        if options[:sal] 
            almuerzo << " #{options[:sal]}"
        else 
            almuerzo << " 0"
        end
        almuerzo << calculate_calories(options[:grasas], options[:carbohidratos], options[:proteina], options[:sal])
        @almuerzo << almuerzo
    end

    def cena(options = {})
        cena = []
        cena << " #{options[:descripcion]}" if options[:descripcion]
        if options[:porcion] 
            cena << " #{options[:porcion]}"
        else 
            cena << " 0"
        end
        if options[:gramos] 
            cena << " #{options[:gramos]}"
        else 
            cena << " 0"
        end
        if options[:grasas] 
            cena << " #{options[:grasas]}"
        else 
            cena << " 0"
        end
        if options[:carbohidratos] 
            cena << " #{options[:carbohidratos]}"
        else 
            cena << " 0"
        end
        if options[:proteinas] 
            cena << " #{options[:proteinas]}"
        else 
            cena << " 0"
        end
        if options[:fibra] 
            cena << " #{options[:fibra]}"
        else 
            cena << " 0"
        end
        if options[:sal] 
            cena << " #{options[:sal]}"
        else 
            cena << " 0"
        end
        cena << calculate_calories(options[:grasas], options[:carbohidratos], options[:proteina], options[:sal])
        @cena << cena
    end

end