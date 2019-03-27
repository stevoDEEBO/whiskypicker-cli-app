
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "whisky_picker/version"

Gem::Specification.new do |spec|
  spec.name          = "whisky_picker"
  spec.version       = WhiskyPicker::VERSION
  spec.authors       = ["'Stephen Telesmanic'"]
  spec.email         = ["'steve.telesmanic@gmail.com'"]

  spec.summary       = %q{Scraper for finding whiskies.}
  spec.description   = %q{Whisky Picker gem sorts through whiskies by country and region/type to show name, country of origin, region+/type, proof, customer rating, and description.}
  spec.homepage      = "https://github.com/stevoDEEBO/whiskypicker-cli-app"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'pry', '~> 0'

  spec.add_dependency 'nokogiri', '~> 1.8.5', '>= 1.8.5'
  spec.add_dependency 'colorize', '~> 0.8.1'
end
