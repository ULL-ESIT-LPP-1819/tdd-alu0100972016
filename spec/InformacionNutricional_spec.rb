require 'InformacionNutricional/etiqueta.rb'
require 'InformacionNutricional/list.rb'
require 'InformacionNutricional/persona.rb'

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
        expect(@p1.nombre).to eq("María")
    end
     
    it "has an age" do
        expect(@p1.edad).to eq(18)
    end
      
    it "has a sex" do
        expect(@p1.sexo).to eq("Mujer")
    end
      
    it "has format" do
        expect(@p1.to_s).to eq("Nombre: María, Edad: 18, Sexo: Mujer")
    end      
  end
  
  describe "Clase, tipo y pertenencia a jerarquía" do
      it "Clase de un objeto" do
          expect(@pan.instance_of? Etiqueta).to eq(true)
          expect(@mylist.instance_of? List).to eq(true)
          expect(@p1.instance_of? Persona).to eq(true)
      end
      
      it "Tipo de un objeto" do
          expect(@pan.respond_to?:name).to eq(true)
          expect(@mylist.respond_to?:head).to eq(true)
          expect(@p1.respond_to?:nombre).to eq(true)
      end
      
      it "Jerarquía" do
          expect(@pan.is_a? Object).to eq(true)
          expect(@mylist.is_a? Object).to eq(true)
          expect(@p1.is_a? Object).to eq(true)
      end   
  end
end
