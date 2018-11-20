require 'InformacionNutricional/persona.rb'

class Paciente < Persona
    attr_accessor :name, :weight, :height, :age, :waist, :hip, :imc, :rcc, :fat, :pliegues, :brazo, :medias, :media_brazo, :media_hip, :media_waist
	def initialize(name, age, sexo, weight, height, waist, hip, tricipital, bicipital, subescapular, suprailiaco, brazo)
        super(name, age, sexo)
        @weight, @height, @waist, @hip = weight, height, waist, hip
		@pliegues = [tricipital, bicipital, subescapular, suprailiaco]
		@brazo = brazo
    end
    def calculo_imc
		@imc = (@weight/@height**2).round(2)

	end

	def porcentaje_fat
		@fat = (1.2 * @imc + 0.23 * @age - 10.8 * @sex - 5.4).round(2)
	end

	def calculo_pliegues
		@medias = []
		@pliegues.each do |pliegue|
			suma = 0
			pliegue.each do |elemento|
				suma += elemento
			end
			@medias << (suma/pliegue.length).round(2)
		end
		
		suma_brazo = 0
		@brazo.each do |elemento|
			suma_brazo += elemento
		end
		@media_brazo = (suma_brazo/@brazo.length).round(2)

	end

	def calculo_rcc
		suma = 0
		@waist.each do |elemento|
			suma += elemento
		end
		@media_waist = suma/@waist.length
		suma = 0
		@hip.each do |elemento|
			suma += elemento
		end
		@media_hip = suma/@hip.length
		@rcc = (@media_waist/@media_hip).round(2)
    end
    
    def to_s
        array = super()
        array += ", IMC: #{@imc}, Grasa: #{@fat}%, Tricipital: #{@medias[0]}, Bicipital: #{@medias[1]}, Subescapular: #{@medias[2]}, Suprailíaco: #{@medias[3]}, Brazo: #{@media_brazo}, RCC: #{@rcc}"
    end
end