# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sinarey_cache/version'

Gem::Specification.new do |spec|
  spec.name          = "erb_safe_ext"
  spec.version       = "1.0.3"
  spec.authors       = ["Jeffrey"]
  spec.email         = ["jeffrey6052@163.com"]
  spec.description   = "make ERB default html safe.protect from XSS attack."
  spec.summary       = "wrap the dangerous code with ERB::Util.html_escape()"
  spec.homepage      = "https://github.com/maymay25/erb_safe_ext"
  spec.license       = "MIT"

  spec.files         = ['lib/erb_safe_ext.rb',
                        'lib/erb_safe_ext/sinatra/exception_template.rb',
                        'test/erb_safe_test.rb',
                        'erb_safe_ext.gemspec',
                        'README.md']
end
