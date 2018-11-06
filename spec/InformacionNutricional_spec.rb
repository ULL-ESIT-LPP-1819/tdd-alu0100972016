require 'InformacionNutricional/etiqueta.rb'

RSpec.describe InformacionNutricional do
 
  before :all do
	  @pan = Etiqueta.new("Pan", true, 28, 15.0, 3.8, 1.8, 38.0, 2.5, 3.8, 0.4)
  end

  it "has a version number" do
    expect(InformacionNutricional::VERSION).not_to be nil
  end

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
