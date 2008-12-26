require 'rubygems'
require 'rake'
require 'spec/rake/spectask'

task :default => :spec

desc "Run all specs in spec directory (excluding plugin specs)"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.libs << "lib"
  t.spec_files = FileList['test/**/*_spec.rb']
  t.verbose = true
end

