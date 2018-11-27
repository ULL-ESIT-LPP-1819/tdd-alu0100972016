# encoding: utf-8
# Author:: Ana de Lorenzo-Cáceres Luis  (mailto:alu0100972016@ull.edu.es)
# Copyright:: Creative Commons
# License:: Distributes under the same terms as Ruby

#Esta clase implementa una etiqueta que almacena el valor nutricional de alimentos
#Se ha incluido el mixin Comparable

class Etiqueta
	include Comparable

	#Getters de las variables de instancia
	attr_reader :name, :portions, :n_portions, :portion_size, :fats, :s_fats, :carbs, :sugar, :protein, :salt, :kcal, :kj
	
	#Se genera la etiqueta con los datos del alimento proporcionados
	def initialize (name, portions, n_portions, portion_size, fats, s_fats, carbs, sugar, protein, salt)
		@name, @portions, @n_portions, @portion_size, @fats, @s_fats, @carbs, @sugar, @protein, @salt = name, portions, n_portions, portion_size, fats, s_fats, carbs, sugar, protein, salt
	end

	#Función que gendetermina las kilocalorías y los kilojulios de  los alimentos
	def calculate_calories
		@kcal = ((@fats * 9) + (@carbs * 4) + (@protein * 4) + (@salt * 6)).round(2)
		@kj = ((@fats * 37) + (@carbs * 17) + (@protein * 17) + (@salt * 28)).round(2)
	end

	#Override del to_s
	def to_s
		s = ""
		if @portions == true
			s = "(#{@n_portions} porciones; #{@portion_size}g/porcion)"
		end
		"#{@name.upcase}#{s}: Por 100g - IR; VALOR ENERGETICO: #{@kcal} kcal/#{@kj} kJ - 2000 kcal/8400 kJ; GRASAS: #{@fats}g - 70g; SATURADAS: #{@s_fats}g - 20g; CARBOHIDRATOS: #{@carbs}g - 260g; AZUCARES: #{@sugar}g - 90g; PROTEINAS: #{@protein}g - 50g; SAL: #{@salt}g - 6g;"
	end
	
	#Se define para incluir el mixin Comparable
	#Se toma como valor para la comparación los kJ
	#(Valor que devuelve la función calculate_calories)
	def <=> (other)
		return nil unless other.is_a?Etiqueta
		calculate_calories <=> other.calculate_calories
	end

	#Override del ==
	#Se toman para considerar iguales: kcal, grasas, carbohidratos,
	#proteínas y sal
	def == (other)
		return nil unless other.is_a?Etiqueta
		@kcal == other.kcal
		@fats == other.fats
		@carbs == other.carbs
		@protein == other.protein
		@salt == other.salt
	end
end
