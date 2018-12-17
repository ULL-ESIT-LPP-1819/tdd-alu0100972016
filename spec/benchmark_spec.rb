require 'InformacionNutricional/etiqueta.rb'
require 'InformacionNutricional/list.rb'
require 'InformacionNutricional/paciente.rb'
require 'benchmark'
include Benchmark

RSpec.describe "Benchmark" do
 
    before :all do
        @pan = Etiqueta.new("Pan", true, 28, 15.0, 3.8, 1.8, 38.0, 2.5, 3.8, 0.4)
        @queso = Etiqueta.new("Queso", true, 17, 15.0, 13.9, 8.1, 0.6, 0.6, 15.7, 3.15)
        @leche = Etiqueta.new("Leche", true, 4, 197.25, 0.3, 0.2, 5.1, 5.1, 3.9, 0.15)
        @chocolate_untar = Etiqueta.new("Chocolate de untar", true, 26, 15, 31.6, 11.0, 56.7, 56.8, 6, 0.114)
        @galletas = Etiqueta.new("Galletas", true, 25, 8.0, 13.5, 6.2, 67.7, 1.4, 10, 1.3)
        @sopa = Etiqueta.new("Sopa", true, 1, 14, 4.3, 1.6, 71.6, 37.3, 5.5, 1.5)
        @salsa_tomate = Etiqueta.new("Salsa de Tomate", true, 39, 10, 3.9, 0.4, 9.8, 4.4, 1.3, 0.87)


        @pc1 = Paciente.new("Juan", 20, 1, 60, 1.52, [60.0, 60.1], [80.0, 80.2], [17.4, 17.6, 17.5], [8.0, 8.1, 8.0], [14.0, 13.9, 13.8], [17.5, 17.6, 17.4], [29.0, 28.9], 1 )
        @pc2 = Paciente.new("Pepe", 50, 1, 58, 1.60, [60.0, 60.1], [80.0, 80.2], [17.4, 17.6, 17.5], [8.0, 8.1, 8.0], [14.0, 13.9, 13.8], [17.5, 17.6, 17.4], [29.0, 28.9], 1 )
        @pc3 = Paciente.new("Loli", 43, 0, 79, 1.80, [60.0, 60.1], [80.0, 80.2], [17.4, 17.6, 17.5], [8.0, 8.1, 8.0], [14.0, 13.9, 13.8], [17.5, 17.6, 17.4], [29.0, 28.9], 4 )
        @pc4 = Paciente.new("Carla", 36, 0, 67, 1.45, [60.0, 60.1], [80.0, 80.2], [17.4, 17.6, 17.5], [8.0, 8.1, 8.0], [14.0, 13.9, 13.8], [17.5, 17.6, 17.4], [29.0, 28.9], 3 )
        @pc5 = Paciente.new("Pedro", 60, 1, 50, 1.70, [60.0, 60.1], [80.0, 80.2], [17.4, 17.6, 17.5], [8.0, 8.1, 8.0], [14.0, 13.9, 13.8], [17.5, 17.6, 17.4], [29.0, 28.9], 2 )
        @pc6 = Paciente.new("Ana", 70, 0, 50, 1.70, [60.8, 60.1], [80.0, 80.2], [18.4, 17.6, 17.5], [9.0, 8.1, 8.0], [14.0, 13.9, 13.8], [17.5, 17.6, 17.4], [29.0, 28.9], 2 )
        @pc7 = Paciente.new("Paco", 50, 1, 50, 1.70, [60.0, 60.7], [80.0, 81.2], [17.4, 17.9, 17.5], [8.0, 9.1, 8.0], [14.0, 13.9, 13.8], [17.5, 17.6, 17.4], [29.0, 28.9], 2 )
        @pc8 = Paciente.new("Mercedes", 60, 0, 50, 1.40, [61.0, 60.1], [90.0, 90.2], [18.4, 17.6, 17.5], [9.0, 8.1, 8.0], [14.0, 13.9, 13.8], [17.5, 17.6, 17.4], [29.0, 28.9], 2 )
        @pc9 = Paciente.new("Jesus", 75, 1, 50, 1.75, [71.0, 70.1], [90.0, 90.4], [17.4, 17.6, 17.5], [8.0, 8.1, 8.0], [14.0, 13.9, 13.8], [17.5, 17.6, 17.4], [29.0, 28.9], 2 )
        @pc10 = Paciente.new("Luis", 60, 1, 50, 1.80, [60.0, 60.1], [80.0, 80.2], [17.4, 17.6, 17.5], [8.0, 8.1, 8.0], [14.0, 13.9, 13.8], [17.5, 17.6, 17.4], [29.0, 28.9], 2 )

        @menu1 = [@salsa_tomate, @pan]
        @menu2 = [@galletas, @leche, @salsa_tomate]
        @menu3 = [@sopa]
        @menu4 = [@sopa, @queso, @salsa_tomate, @leche]
        @menu5 = [@galletas, @chocolate_untar]
        @menu6 = [@pan, @chocolate_untar]
        @menu7 = [@sopa, @pan, @queso]
        @menu8 = [@galletas, @sopa]
        @menu9 = [@chocolate_untar, @queso]
        @menu10 = [@salsa_tomate, @pan, @queso]
        @menus = [@menu1, @menu2, @menu3, @menu4, @menu5, @menu6, @menu7, @menu8, @menu9, @menu10]
        @pacientes = List.new
        @pacientes.insert_n_to_head([@pc1, @pc2, @pc3, @pc4, @pc5, @pc6, @pc7, @pc8, @pc9, @pc10])
    end

    it "has a version number" do
        expect(InformacionNutricional::VERSION).not_to be nil
    end

    describe "#Benchmark" do
        it "ordenar lista con for" do
            expect(@pacientes.sort_for).to eq([@pc9, @pc6, @pc8, @pc5, @pc10, @pc2, @pc7, @pc1, @pc4, @pc3])
        end

        it "ordenar array con for" do
            class Array
                def kcal_for
                    total = 0
                    for i in (0...self.size)
                        total += self[i].calculate_calories
                    end
                    total
                end
                def sort_for
                    sorted = [self[0]]
                    for i in (1...self.size)
                        actual = self[i]
                        for j in (0..sorted.size)
                            if (j == sorted.size)
                                sorted.push(actual)
                            elsif (actual.kcal_for < sorted[j].kcal_for)
                                sorted.insert(j, actual)
                                break
                            end
                        end
                    end
                    return sorted
                end
            end

            expect(@menus.sort_for).to eq([@menu1, @menu3, @menu10, @menu2, @menu4, @menu6, @menu9, @menu7, @menu8, @menu5])
        end

        it "ordenar lista con each" do
            expect(@pacientes.sort_each).to eq([@pc9, @pc6, @pc8, @pc5, @pc10, @pc2, @pc7, @pc1, @pc4, @pc3])
        end

        it "ordenar array con each" do
            class Array
                def kcal_each
                    self.collect{|comida| comida.calculate_calories;}.reduce(:+).round(2)
                end
                def sort_each
                    sorted = [self[0]]
                    self.each_with_index do |x, pos_x|
                        if (pos_x != 0)
                            sorted.each_with_index do |y, pos_y|
                                if (pos_y == sorted.size-1)
                                    if (x.kcal_each < y.kcal_each)
                                        sorted.insert(pos_y, x)
                                        break
                                    else
                                        sorted.push(x)
                                        break
                                    end
                                elsif (x.kcal_each < y.kcal_each)
                                    sorted.insert(pos_y, x)
                                    break
                                end
                            end
                        end
                    end
                    return sorted
                end
            end

            expect(@menus.sort_each).to eq([@menu1, @menu3, @menu10, @menu2, @menu4, @menu6, @menu9, @menu7, @menu8, @menu5])
        end

        it "ordenar lista con sort" do
            expect(@pacientes.sort).to eq([@pc9, @pc6, @pc8, @pc5, @pc10, @pc2, @pc7, @pc1, @pc4, @pc3])
        end

        it "ordenar array con sort" do
            @menus_kcal = @menus.map do |menu|
                menu.kcal_each
            end
            expect(@menus_kcal.sort).to eq([288.52, 356.1, 497.72, 564.42, 689.62, 739.68, 745.08, 769.1, 796.2, 975.98])
        end

        it "Benchmark" do
            Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
                tfl = x.report("for list:")     { vec = @pacientes.sort_for }
                tfa = x.report("for array:")    { vec2 = @menus.sort_for }
                tel = x.report("each list:")    { vec3 = @pacientes.sort_each }
                tea = x.report("each array:")   { vec4 = @menus.sort_each }
                tsl = x.report("sort list:")    { vec5 = @pacientes.sort }
                tsa = x.report("sort array:")   { vec6 = @menus.map{ |menu| menu.kcal_each }.sort }
                [tfl+tfa+tel+tea+tsl+tsa, (tfl+tfa+tel+tea+tsl+tsa)/6]
            end
        end
    end
end
