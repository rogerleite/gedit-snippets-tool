# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gedit-snippets-tool}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Roger Leite"]
  s.date = %q{2009-04-30}
  s.default_executable = %q{gedit-snippets-tool}
  s.email = %q{roger.barreto@gmail.com}
  s.executables = ["gedit-snippets-tool"]
  s.files = ["bin/gedit-snippets-tool", "lib/gedit_snippets_tool.rb", "lib/snippet.rb", "template/template.eruby", "Rakefile", "README.textile"]
  s.homepage = %q{http://1up4dev.org}
  s.require_paths = ["bin", "lib"]
  s.rubyforge_project = %q{gedit-snippets-tool}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Tool to generate cheat sheet of gedit's snippets}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<erubis>, [">= 2.6.4"])
    else
      s.add_dependency(%q<erubis>, [">= 2.6.4"])
    end
  else
    s.add_dependency(%q<erubis>, [">= 2.6.4"])
  end
end
