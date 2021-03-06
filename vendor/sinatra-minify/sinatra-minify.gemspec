# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sinatra-minify}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rico Sta. Cruz", "Cyril David", "Sinefunc, Inc."]
  s.date = %q{2010-05-22}
  s.description = %q{sinatra-minify is an extension for Sinatra to compress assets.}
  s.email = %q{info@sinefunc.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    ".gitignore",
     ".rvmrc",
     "LICENSE",
     "README.md",
     "Rakefile",
     "VERSION",
     "lib/sinatra/minify.rb",
     "lib/sinatra/minify/compressor.rb",
     "lib/sinatra/minify/config.rb",
     "lib/sinatra/minify/helpers.rb",
     "lib/sinatra/minify/package.rb",
     "lib/tasks.rake",
     "sinatra-minify.gemspec",
     "test/fixtures/control/style-default-compressed.css",
     "test/fixtures/exampleapp/app.rb",
     "test/fixtures/exampleapp/config/assets-glob_error.yml",
     "test/fixtures/exampleapp/config/assets.yml",
     "test/fixtures/exampleapp/public/css/style-default.css",
     "test/fixtures/exampleapp/public/js/script-1.js",
     "test/fixtures/exampleapp/public/js/script-2.js",
     "test/helper.rb",
     "test/test_minify.rb",
     "vendor/jsmin-1.0.1/HISTORY",
     "vendor/jsmin-1.0.1/lib/jsmin.rb"
  ]
  s.homepage = %q{http://www.github.com/sinefunc/sinatra-minify}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{CSS/JS compressor for Sinatra}
  s.test_files = [
    "test/fixtures/exampleapp/app.rb",
     "test/helper.rb",
     "test/test_minify.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rack-test>, [">= 0"])
    else
      s.add_dependency(%q<rack-test>, [">= 0"])
    end
  else
    s.add_dependency(%q<rack-test>, [">= 0"])
  end
end

