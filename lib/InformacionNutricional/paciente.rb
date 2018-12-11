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
    attr_reader :name, :weight, :height, :age, :waist, :hip, :imc, :rcc, :fat, :pliegues, :brazo, :medias, :media_brazo, :media_hip, :media_waist, :nivel_act_fis, :get
	
	#Se genera el objeto con los datos proporcionados
	def initialize(name, age, sexo, weight, height, waist, hip, tricipital, bicipital, subescapular, suprailiaco, brazo, nivel_act_fis)
		super(name, age, sexo)
        @weight, @height, @waist, @hip = weight, height, waist, hip
		@pliegues = [tricipital, bicipital, subescapular, suprailiaco]
		@brazo, @nivel_act_fis = brazo, nivel_act_fis
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
	
	#Devuelve el nivel de actividad física
	def nivel_actividad
		case @nivel_act_fis
		when 1
		  @nivel_act_fis = 0.0
		when 2
		  @nivel_act_fis = 0.12
		when 3
		  @nivel_act_fis = 0.27
		when 4
		  @nivel_act_fis = 0.54
		end
	end

	#Devuelve el gasto energético total
	def gasto_energetico
		basal = (10 * @weight) + (6.25 * @height) - (5 * @age)
		if sex == 0
			basal -= 161
		else
			basal += 5
		end
		termogeno = basal * 0.10
		actividad = basal * @nivel_act_fis
		@get = (basal + termogeno + actividad).round(2)
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