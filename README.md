# USPSFlags Burgees

[![Gem Version](https://img.shields.io/gem/v/usps_flags-burgees.svg)](https://rubygems.org/gems/usps_flags-burgees)
[![Build Status](https://travis-ci.org/jfiander/usps-flags_burgees.svg)](https://travis-ci.org/jfiander/usps-flags_burgees)
[![Test Coverage](https://api.codeclimate.com/v1/badges/760b824f0edac3316a11/test_coverage)](https://codeclimate.com/github/jfiander/usps-flags_burgees/test_coverage)
[![Maintainability](https://api.codeclimate.com/v1/badges/760b824f0edac3316a11/maintainability)](https://codeclimate.com/github/jfiander/usps-flags_burgees/maintainability)

An extension for [USPSFlags](https://github.com/jfiander/usps-flags) to provide squadron burgees.

## Configuration

```ruby
USPSFlags::Config.new do |config|
  config.burgees_dir = "/path/to/burgees"
end
```

## Usage

```ruby
USPSFlags::Burgees.get(:burgee_name)
```

## Security

This gem is cryptographically signed. To be sure the gem code hasn’t been
tampered with:

Add my public key as a trusted certificate:

```sh
gem cert --add <(curl -Ls https://raw.github.com/jfiander/usps-flags/master/certs/jfiander.pem)
```

Then install the gem securely:

```sh
gem install usps_flags -P HighSecurity
```

## License

Actual images generated may be registered trademarks of their
respective squadrons.

This project is released under the
[GPLv3](https://raw.github.com/jfiander/usps-flags/master/LICENSE).
