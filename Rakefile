$LOAD_PATH.unshift('lib')

require 'rubygems'
require 'bundler'
require 'ffi-swig-generator'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'
require 'jeweler'
require 'vlcrb/version'

Jeweler::Tasks.new do |gem|
  gem.name = "vlcrb"
  gem.homepage = "http://github.com/nashby/vlcrb"
  gem.license = "MIT"
  gem.version = VLC::Version::STRING
  gem.summary = %Q{Ruby wrapper for libVLC}
  gem.description = %Q{Ruby wrapper for libVLC}
  gem.email = "younash@gmail.com"
  gem.authors = ["nashby"]
  gem.add_runtime_dependency 'ffi'
  gem.add_development_dependency 'ffi-swig-generator'
  gem.files.include Dir.glob('lib/**/*.rb')
  gem.files.exclude 'generated', 'interfaces', 'pkg'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "vlcrb #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'ffi-swig-generator'
FFI::Generator::Task.new do |task|
	task.input_fn = 'interfaces/*.i'
	task.output_dir = "generated/"
end

task :move_generated do
	files = FileList["generated/*.rb"]
	files.map do |file|
		new_file = File.basename(file.gsub("_wrap", ""))
		cp file, "lib/vlcrb/ffi/#{new_file}"
	end
	#mv "generated/libvlc_events_wrap.rb", "lib/vlcrb/ffi"
end

