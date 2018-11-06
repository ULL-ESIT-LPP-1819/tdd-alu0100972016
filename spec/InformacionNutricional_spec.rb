require 'InformacionNutricional/etiqueta.rb'

RSpec.describe InformacionNutricional do
 
  before :all do
	  @pan = Etiqueta.new("Pan", true, 28.5, 15.0, 3.8, 1.8, 38.0, 2.5, 3.8, 0.4)
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

end
