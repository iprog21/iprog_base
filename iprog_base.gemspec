require_relative "lib/iprog/version"

Gem::Specification.new do |spec|
  spec.name                            = "iprog_base"
  spec.version                         = Iprog::VERSION
  spec.summary                         = "Base service/command class using the Template Method Pattern."
  spec.description                     = "Provides a reusable, extensible base class for service or command objects in Ruby applications, following the Template Method Pattern. Includes lifecycle hooks for parameter handling, static data setup, error checking, data processing, and response filtering. Designed for clean, maintainable, and testable business logic."
  spec.homepage                        = "https://iprogtech.com/"
  spec.authors                         = ["Jayson Presto"]
  spec.email                           = ["jaysonpresto.iprog21@gmail.com"]
  spec.files                           = Dir["lib/**/*"]
  spec.require_paths                   = ["lib"]
  spec.license                         = "MIT"
  spec.metadata["homepage_uri"]        = spec.homepage
  spec.metadata["source_code_uri"]     = "https://github.com/iprog21/iprog_base.git"
  spec.metadata["changelog_uri"]       = "https://github.com/iprog21/iprog_base/blob/master/CHANGELOG.md"
  spec.metadata["code_of_conduct_uri"] = "https://github.com/iprog21/iprog_base/blob/main/CODE_OF_CONDUCT.md"
end
