# USPSFlags Burgees

[![Gem Version](https://img.shields.io/gem/v/usps_flags-burgees.svg)](https://rubygems.org/gems/usps_flags-burgees)
[![Build Status](https://travis-ci.org/jfiander/usps-flags_burgees.svg)](https://travis-ci.org/jfiander/usps-flags_burgees)
[![Test Coverage](https://api.codeclimate.com/v1/badges/760b824f0edac3316a11/test_coverage)](https://codeclimate.com/github/jfiander/usps-flags_burgees/test_coverage)
[![Maintainability](https://api.codeclimate.com/v1/badges/760b824f0edac3316a11/maintainability)](https://codeclimate.com/github/jfiander/usps-flags_burgees/maintainability)

![Burgees](https://img.shields.io/badge/burgees_included-1-blue.svg)

An extension for [USPSFlags](https://github.com/jfiander/usps-flags) to provide squadron burgees.

## Configuration

```ruby
USPSFlags.configure do |config|
  config.burgees_dir = "/path/to/burgees"
end
```

## Usage

```ruby
USPSFlags::Burgees.get(:burgee_name)
```

## License

Actual images generated may be registered trademarks of their
respective squadrons.

This project is released under the
[GPLv3](https://raw.github.com/jfiander/usps-flags-burgees/master/LICENSE).
