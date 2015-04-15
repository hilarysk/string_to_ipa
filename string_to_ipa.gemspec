# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'string_to_ipa/version'

Gem::Specification.new do |spec|
  spec.name          = "string_to_ipa"
  spec.version       = StringToIpa::VERSION
  spec.authors       = ["Hilary Stohs-Krause"]
  spec.email         = ["hilarysk@gmail.com"]
  
  spec.summary       = %q{A minimalist gem that converts a string to the International Phonetic Alphabet.}
  spec.description   = %q{This gem relies on a modified version of the open-source Carnegie Mellon University Pronouncing Dictionary (converting words to the International Phonetic Alphabet (IPA) instead of Arpabet).}
  spec.homepage      = "https://github.com/hilarysk/string_to_ipa"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_dependency "sqlite3"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  
end
