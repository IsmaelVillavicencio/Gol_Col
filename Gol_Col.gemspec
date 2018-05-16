
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "Gol_Col/version"

Gem::Specification.new do |spec|
  spec.name          = "Gol_Col"
  spec.version       = GolCol::VERSION
  spec.authors       = ["Ismael Villavicencio"]
  spec.email         = ["villavicencioismael@gmail.com"]

  spec.summary       = %q{Conway's Game of Life is awesome gem.}
  spec.homepage      = "https://github.com/IsmaelVillavicencio/Gol_Col"
  spec.license       = "MIT"

  spec.files         = Dir.glob("{bin,lib}/**/*")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^test/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rspec", "~> 3.7"
end
