require 'InformacionNutricional/etiqueta.rb'
require 'InformacionNutricional/list.rb'
require 'InformacionNutricional/persona.rb'
require 'InformacionNutricional/paciente.rb'

RSpec.describe InformacionNutricional do
 
  before :all do
    @pan = Etiqueta.new("Pan", true, 28, 15.0, 3.8, 1.8, 38.0, 2.5, 3.8, 0.4)
    @queso = Etiqueta.new("Queso", true, 17, 15.0, 13.9, 8.1, 0.6, 0.6, 15.7, 3.15)
    @leche = Etiqueta.new("Leche", true, 4, 197.25, 0.3, 0.2, 5.1, 5.1, 3.9, 0.15)
    @chocolate_untar = Etiqueta.new("Chocolate de untar", true, 26, 15, 31.6, 11.0, 56.7, 56.8, 6, 0.114)
    @galletas = Etiqueta.new("Galletas", true, 25, 8.0, 13.5, 6.2, 67.7, 1.4, 10, 1.3)
    @sopa = Etiqueta.new("Sopa", true, 1, 14, 4.3, 1.6, 71.6, 37.3, 5.5, 1.5)
    @salsa_tomate = Etiqueta.new("Salsa de Tomate", true, 39, 10, 3.9, 0.4, 9.8, 4.4, 1.3, 0.87)
    @mylist = List.new
    @p1 = Persona.new("María", 18, 0)
    @pc1 = Paciente.new("Juan", 20, 1, 60, 1.52, [60.0, 60.1], [80.0, 80.2], [17.4, 17.6, 17.5], [8.0, 8.1, 8.0], [14.0, 13.9, 13.8], [17.5, 17.6, 17.4], [29.0, 28.9] )
    @pc2 = Paciente.new("Pepe", 50, 1, 58, 1.60, [60.0, 60.1], [80.0, 80.2], [17.4, 17.6, 17.5], [8.0, 8.1, 8.0], [14.0, 13.9, 13.8], [17.5, 17.6, 17.4], [29.0, 28.9] )
    @pc3 = Paciente.new("Loli", 43, 0, 79, 1.80, [60.0, 60.1], [80.0, 80.2], [17.4, 17.6, 17.5], [8.0, 8.1, 8.0], [14.0, 13.9, 13.8], [17.5, 17.6, 17.4], [29.0, 28.9] )
    @pc4 = Paciente.new("Carla", 36, 0, 67, 1.45, [60.0, 60.1], [80.0, 80.2], [17.4, 17.6, 17.5], [8.0, 8.1, 8.0], [14.0, 13.9, 13.8], [17.5, 17.6, 17.4], [29.0, 28.9] )
    @pc5 = Paciente.new("Pedro", 60, 1, 50, 1.70, [60.0, 60.1], [80.0, 80.2], [17.4, 17.6, 17.5], [8.0, 8.1, 8.0], [14.0, 13.9, 13.8], [17.5, 17.6, 17.4], [29.0, 28.9] )
    @mylist2 = List.new
end

  it "has a version number" do
    expect(InformacionNutricional::VERSION).not_to be nil
  end

  describe "#Etiqueta" do
    it "has a name" do
        expect(@pan.name).to eq("Pan")
    end

    it "has portions" do
        expect(@pan.portions).to eq(true)
    end

    it "has fats" do
        expect(@pan.fats).to eq(3.8)
    end

    it "has s_fats" do
        expect(@pan.s_fats).to eq(1.8)
    end

    it "has carbs" do
        expect(@pan.carbs).to eq(38.0)
    end

    it "has sugar" do
        expect(@pan.sugar).to eq(2.5)
    end

    it "has protein" do
        expect(@pan.protein).to eq(3.8)
    end

    it "has salt" do
        expect(@pan.salt).to eq(0.4)
    end

    it "has calories" do
        @pan.calculate_calories
        expect(@pan.kcal).to eq(203.8)
        expect(@pan.kj).to eq(862.4)
    end

    it "has format" do
        expect(@pan.to_s).to eq("PAN(28 porciones; 15.0g/porcion): Por 100g - IR; VALOR ENERGETICO: 203.8 kcal/862.4 kJ - 2000 kcal/8400 kJ; GRASAS: 3.8g - 70g; SATURADAS: 1.8g - 20g; CARBOHIDRATOS: 38.0g - 260g; AZUCARES: 2.5g - 90g; PROTEINAS: 3.8g - 50g; SAL: 0.4g - 6g;")
    end
  end

  describe "#List" do
    it "First" do
      @mylist.insert_head(@pan)
      expect(@mylist.head.prev).to eq(nil)
      expect(@mylist.head.value.name).to eq("Pan")
      expect(@mylist.head.next).to eq(nil)

      expect(@mylist.tail.prev).to eq(nil)
      expect(@mylist.tail.value.name).to eq("Pan")
      expect(@mylist.tail.next).to eq(nil)
    end

    it "Adding 1 node" do
      @mylist.insert_head(@queso)
      expect(@mylist.head.prev).to eq(nil)
      expect(@mylist.head.value.name).to eq("Queso")
      expect(@mylist.head.next.value.name).to eq("Pan")

      @mylist.insert_tail(@leche)
      expect(@mylist.tail.prev.value.name).to eq("Pan")
      expect(@mylist.tail.value.name).to eq("Leche")
      expect(@mylist.tail.next).to eq(nil)
    end

    it "Adding more than one node at a time" do
      @mylist.insert_n_to_head([@chocolate_untar, @galletas])
      expect(@mylist.head.prev).to eq(nil)
      expect(@mylist.head.value.name).to eq("Galletas")
      expect(@mylist.head.next.value.name).to eq("Chocolate de untar")
      
      @mylist.insert_n_to_tail([@sopa, @salsa_tomate])
      expect(@mylist.tail.prev.value.name).to eq("Sopa")
      expect(@mylist.tail.value.name).to eq("Salsa de Tomate")
      expect(@mylist.tail.next).to eq(nil)
    end

    it "Salt under IR values" do
      node = @mylist.head
      while node != nil
        expect(6.0 >= node.value.salt).to eq(true)
        node = node.next
      end
    end
    
    it "Has a format" do
      expect(@mylist.to_s).to eq("Galletas, Chocolate de untar, Queso, Pan, Leche, Sopa, Salsa de Tomate")
    end

    it "Is empty?" do
      expect(@mylist.is_empty).to eq(false)
    end

    it "Has size" do
      expect(@mylist.size).to eq(7)
    end

    it "Removing 1 node" do
      @mylist.remove_head
      expect(@mylist.head.prev).to eq(nil)
      expect(@mylist.head.value.name).to eq("Chocolate de untar")
      expect(@mylist.head.next.value.name).to eq("Queso")

      @mylist.remove_tail
      expect(@mylist.tail.prev.value.name).to eq("Leche")
      expect(@mylist.tail.value.name).to eq("Sopa")
      expect(@mylist.tail.next).to eq(nil)
    end

    it "Removing more than one node at a time" do
      @mylist.remove_n_from_head(2)
      expect(@mylist.head.prev).to eq(nil)
      expect(@mylist.head.value.name).to eq("Pan")
      expect(@mylist.head.next.value.name).to eq("Leche")
      
      @mylist.remove_n_from_tail(2)
      expect(@mylist.tail.prev).to eq(nil)
      expect(@mylist.tail.value.name).to eq("Pan")
      expect(@mylist.tail.next).to eq(nil)
    end

  end
  
  describe "#Persona" do
    it "has a name" do
        expect(@p1.name).to eq("María")
    end
     
    it "has an age" do
        expect(@p1.age).to eq(18)
    end
      
    it "has a sex" do
        expect(@p1.sex).to eq("Mujer")
    end
      
    it "has format" do
        expect(@p1.to_s).to eq("Nombre: María, Edad: 18, Sexo: Mujer")
    end      
  end

  describe "#Paciente" do
    it "has a name" do
        expect(@pc1.name).to eq("Juan")
    end
    
    it "has an age" do
        expect(@pc1.age).to eq(20)
    end
    
    it "has a sex" do
        expect(@pc1.sex).to eq("Hombre")
    end
  
    it "has format" do
      @pc1.calculo_imc
      @pc1.porcentaje_fat
      @pc1.calculo_pliegues
      @pc1.calculo_rcc
      expect(@pc1.to_s).to eq("Nombre: Juan, Edad: 20, Sexo: Hombre, IMC: 25.97, Grasa: 19.56%, Tricipital: 17.5, Bicipital: 8.03, Subescapular: 13.9, Suprailíaco: 17.5, Brazo: 28.95, RCC: 0.75")
    end

  end

  describe "Lista Pacientes" do
    it "Añadiendo pacientes" do
        @mylist2.insert_n_to_head([@pc1, @pc2, @pc3, @pc4, @pc5])
        expect(@mylist2.head.prev).to eq(nil)
        expect(@mylist2.head.value.name).to eq("Pedro")
        expect(@mylist2.head.next.value.name).to eq("Carla")
    end
    
    it "Clasificar por IMC" do
      node = @mylist2.head
      imc_bajo = []
      imc_normal = []
      imc_obeso = []
      imc_sobrepeso = []
      while node != nil
        if node.value.calculo_imc < 18.5
            imc_bajo << node.value
        elsif node.value.imc >= 18.5 &&  node.value.imc <= 24.9
            imc_normal << node.value
        elsif node.value.imc >= 25.0 && node.value.imc <= 29.9
            imc_sobrepeso << node.value
        else
            imc_obeso << node.value
        end
        node = node.next
      end
      imc_bajo.each do |paciente|
        expect(paciente.imc < 18.5).to eq(true)
      end
      imc_normal.each do |paciente|
        expect(paciente.imc >= 18.5 && paciente.imc <= 24.9).to eq(true)
      end
      imc_sobrepeso.each do |paciente|
        expect(paciente.imc > 25 && paciente.imc <= 29.9).to eq(true)
      end
      imc_obeso.each do |paciente|
        expect(paciente.imc > 30).to eq(true)
      end
    end
  end
  
  describe "Clase, tipo y pertenencia a jerarquía" do
      it "Clase de un objeto" do
          expect(@pan.instance_of? Etiqueta).to eq(true)
          expect(@mylist.instance_of? List).to eq(true)
          expect(@p1.instance_of? Persona).to eq(true)
          expect(@pc1.instance_of? Paciente).to eq(true)

          expect(@pan.class).to eq(Etiqueta)
          expect(@mylist.class).to eq(List)
          expect(@p1.class).to eq(Persona)
          expect(@pc1.class).to eq(Paciente)

          expect(Etiqueta.superclass).to eq(Object)
          expect(List.superclass).to eq(Object)
          expect(Persona.superclass).to eq(Object)
          expect(Paciente.superclass).to eq(Persona)
      end
      
      it "Tipo de un objeto" do
          expect(@pan.respond_to?:name).to eq(true)
          expect(@mylist.respond_to?:head).to eq(true)
          expect(@p1.respond_to?:name).to eq(true)
          expect(@pc1.respond_to?:weight).to eq(true)
      end
      
      it "Jerarquía" do
          expect(@pan.is_a? Object).to eq(true)
          expect(@mylist.is_a? Object).to eq(true)
          expect(@p1.is_a? Object).to eq(true)
          expect(@pc1.is_a? Persona).to eq(true)
      end   
  end

  describe "Comparable y Enumerable" do
    it "Comparable Etiqueta" do
        expect(@pan < @queso).to eq(true)
        expect(@pan <= @queso).to eq(true)
        expect(@pan > @queso).to eq(false)
        expect(@pan >= @queso).to eq(false)
        expect(@pan == @queso).to eq(false)
    end

    it "Comparable Paciente" do
        expect(@pc1 < @pc3).to eq(false)
        expect(@pc1 <= @pc3).to eq(false)
        expect(@pc1 > @pc3).to eq(true)
        expect(@pc1 >= @pc3).to eq(true)
        expect(@pc1 == @pc3).to eq(false)
    end

    it "Enumerable List" do
        expect(@mylist2.collect{|pc| pc.name}).to eq(["Pedro", "Carla", "Loli", "Pepe", "Juan"])
        expect(@mylist2.select{|pc| pc.calculo_imc < 25}).to eq([@pc5, @pc3, @pc2])
        expect(@mylist2.min).to eq(@pc5)
        expect(@mylist2.max).to eq(@pc4)
        expect(@mylist2.sort).to eq([@pc5, @pc2, @pc3, @pc1, @pc4])
    end
  end
end
