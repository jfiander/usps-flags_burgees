Gem::Specification.new do |s|
  s.name          = 'usps_flags-burgees'
  s.version       = '0.0.4'
  s.date          = '2017-11-07'
  s.summary       = 'Flag generator for United States Power Squadrons burgees'
  s.description   = 'An extension to the flag image (PNG, SVG) generator for United States Power Squadrons to generate burgees.'
  s.homepage      = 'http://rubygems.org/gems/usps_flags-burgees'
  s.license       = 'GPL-3.0'
  s.authors       = ['Julian Fiander']
  s.email         = 'julian@fiander.one'
  s.require_paths = ['lib', 'spec']
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")

  s.cert_chain    = ['certs/jfiander.pem']
  s.signing_key   = File.expand_path("~/.ssh/usps_flags-private_key.pem") if $0 =~ /gem\z/

  s.required_ruby_version = '~> 2.4'

  s.add_runtime_dependency 'usps_flags', '~> 0.3',  '>= 0.3.6'

  s.add_development_dependency 'rake',      '~> 12.1', '>= 12.1.0'
  s.add_development_dependency 'rspec',     '~> 3.7',  '>= 3.7.0'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 0.4', '>= 0.4.8'
end
