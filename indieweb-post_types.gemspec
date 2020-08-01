lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'indieweb/post_types/version'

Gem::Specification.new do |spec|
  spec.name          = 'indieweb-post_types'
  spec.version       = Indieweb::PostTypes::VERSION
  spec.authors       = ['Stephen Rushe']
  spec.email         = ['steve+posttypes@deeden.co.uk']

  spec.summary       = 'IndieWeb Post Type Discovery for Microformats 2 JSON.'
  spec.description   = 'IndieWeb Post Type Discovery for Microformats 2 JSON.'
  spec.homepage      = 'https://code.deeden.co.uk/indieweb-post_types'
  spec.license       = 'MIT'

  spec.metadata = {
    'bug_tracker_uri' => 'https://code.deeden.co.uk/indieweb-post_types/issues',
    'changelog_uri'   => 'https://code.deeden.co.uk/indieweb-post_types/changelog',
    'homepage_uri'    => 'https://code.deeden.co.uk/indieweb-post_types'
  }

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
end
