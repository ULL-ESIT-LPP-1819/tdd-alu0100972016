require 'InformacionNutricional/persona.rb'

class Paciente < Persona
    attr_accessor :nombre, :peso, :altura, :edad, :cintura, :cadera, :imc, :rcc, :grasa, :pliegues, :brazo, :medias, :media_brazo, :media_cadera, :media_cintura
	def initialize(nombre, edad, sexo, peso, altura, cintura, cadera, tricipital, bicipital, subescapular, suprailiaco, brazo)
        super(nombre, edad, sexo)
        @peso, @altura, @cintura, @cadera = peso, altura, cintura, cadera
		@pliegues = [tricipital, bicipital, subescapular, suprailiaco]
		@brazo = brazo
    end
    def calculo_imc
		@imc = (@peso/@altura**2).round(2)

	end

	def porcentaje_grasa
		@grasa = (1.2 * @imc + 0.23 * @edad - 10.8 * @sexo - 5.4).round(2)
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
		@cintura.each do |elemento|
			suma += elemento
		end
		@media_cintura = suma/@cintura.length
		suma = 0
		@cadera.each do |elemento|
			suma += elemento
		end
		@media_cadera = suma/@cadera.length
		@rcc = (@media_cintura/@media_cadera).round(2)
    end
    
    def to_s
        array = super()
        array += ", IMC: #{@imc}, Grasa: #{@grasa}%, Tricipital: #{@medias[0]}, Bicipital: #{@medias[1]}, Subescapular: #{@medias[2]}, Suprailíaco: #{@medias[3]}, Brazo: #{@media_brazo}, RCC: #{@rcc}"
    end
end