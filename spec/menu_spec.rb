require 'InformacionNutricional/menu.rb'

RSpec.describe "Menu" do
 
    before :all do
        menu = Menu.new("Lunes") do
            titulo      "Bajo en calorías",
            ingesta     :min => 30, :max => 35
            desayuno    :descripcion => "Pan de trigo integral",
                        :porcion => "1 rodaja",
                        :gramos => 100,
                        :grasas => 3.3,
                        :carbohidratos => 54.0,
                        :proteinas => 11.0,
                        :fibra => 2.3,
                        :sal => 0.06
            desayuno    :descripcion => "Actimel",
                        :porcion => "1 porción",
                        :gramos => 100,
                        :grasas =>  3.4,
                        :carbohidratos => 4.4,
                        :proteinas => 3.6,
                        :sal => 0.05
            almuerzo    :description =>  "Arroz",
                        :porcion => "1 taza",
                        :gramos => 100,
                        :grasas => 0.9,
                        :carbohidratos => 81.6,
                        :proteinas => 6.67,
                        :fibra => 1.4,
                        :sal => 0.04
            almuerzo    "Lentejas",
                        :porcion => "1/2 cucharón",
                        :grasas => 0.4,
                        :carbohidratos => 20.0,
                        :proteinas => 9.0,
                        :fibra => 8.0,
                        :sal => 0.02
            almuerzo    :descripcion => "Naranja",
                        :porcion => "1 pieza",
                        :gramos => 100,
                        :grasas =>  0.12,
                        :carbohidratos => 11.75,
                        :proteinas => 0.94,
                        :fibra => 2.4
            cena        :descripcion => "Leche entera hacendado",
                        :porcion => "1 vaso",
                        :gramos => 100,
                        :grasas => 3.6,
                        :carbohidratos => 4.6,
                        :proteinas => 3.1,
                        :sal => 0.13
            end
    end

    it "has a version number" do
        expect(InformacionNutricional::VERSION).not_to be nil
    end

end