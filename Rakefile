require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Ejecutar las expectativas de los menus y los pacientes"
task :spec do
	sh "rspec -I. spec/menu_spec.rb"
end

desc "Ejecutar con documentacion"
task :doc do
	sh "rspec -I. spec/menu_spec.rb --format documentation"
end
