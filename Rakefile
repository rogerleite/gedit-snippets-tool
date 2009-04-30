require 'rubygems'
require 'rubygems/specification'
require 'rake'
require 'rake/gempackagetask'
require 'spec/rake/spectask'

GEM = "gedit-snippets-tool"
GEM_VERSION = "0.2.0"
SUMMARY = "Tool to generate cheat sheet of gedit's snippets"
AUTHOR = "Roger Leite"
EMAIL = "roger.leite@1up4dev.org"
HOMEPAGE = "http://1up4dev.org"


spec = Gem::Specification.new do |s|
  s.name = GEM
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.summary = SUMMARY
  s.require_paths = ['bin', 'lib']
  s.files = FileList['bin/*', 'lib/**/*.rb', 'template/**/*.eruby', '[A-Z]*'].to_a
  s.executables = ["gedit-snippets-tool"]

  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE

  s.rubyforge_project = GEM # GitHub bug, gem isn't being build when this miss

  s.add_dependency(%q<erubis>, [">= 2.6.4"])
end

Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = %w(-fs --color)
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Install the gem locally"
task :install => [:package] do
  sh %{sudo gem install pkg/#{GEM}-#{GEM_VERSION}}
end

desc "Create a gemspec file"
task :make_spec do
  File.open("#{GEM}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

