# encoding: utf-8
# Author:: Ana de Lorenzo-Cáceres Luis  (mailto:alu0100972016@ull.edu.es)
# Copyright:: Creative Commons
# License:: Distributes under the same terms as Ruby

require 'InformacionNutricional/persona.rb'

#Esta clase permite ver los datos de un paciente
#Es una subclase de la clase Persona
#Se ha incluido el mixin Comparable

class Paciente < Persona
	include Comparable

	#Getters de las variables de instancia
    attr_reader :name, :weight, :height, :age, :waist, :hip, :imc, :rcc, :fat, :pliegues, :brazo, :medias, :media_brazo, :media_hip, :media_waist
	
	#Se genera el objeto con los datos proporcionados
	def initialize(name, age, sexo, weight, height, waist, hip, tricipital, bicipital, subescapular, suprailiaco, brazo)
		super(name, age, sexo)
        @weight, @height, @waist, @hip = weight, height, waist, hip
		@pliegues = [tricipital, bicipital, subescapular, suprailiaco]
		@brazo = brazo
	end
	
	#Devuelve el imc del paciente
    def calculo_imc
		@imc = (@weight/@height**2).round(2)
	end

	#Devuelve el porcentaje de grasa del paciente
	def porcentaje_fat
		@fat = (1.2 * @imc + 0.23 * @age - 10.8 * @sex - 5.4).round(2)
	end

	#Devuelve las medidas de los pliegues del paciente
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

	#Devuelve el RCC del paciente
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
	
	#Override del to_s
    def to_s
        array = super()
        array += ", IMC: #{@imc}, Grasa: #{@fat}%, Tricipital: #{@medias[0]}, Bicipital: #{@medias[1]}, Subescapular: #{@medias[2]}, Suprailíaco: #{@medias[3]}, Brazo: #{@media_brazo}, RCC: #{@rcc}"
	end
	
	#Se define para incluir el mixin Comparable
	#Se toma como valor para la comparación el imc de los pacientes
	#(Valor que devuelve la función calculo_imc)
	def <=> (other)
		return nil unless other.is_a?Paciente
		calculo_imc <=> other.calculo_imc
	end

	#Override del ==
	#Se toman para considerar iguales: nombre, imc y rcc
	def == (other)
		return nil unless other.is_a?Paciente
		(@name == other.name) && (calculo_imc == other.calculo_imc) && (calculo_rcc == other.calculo_rcc)
	end
end