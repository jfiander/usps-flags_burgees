# USPSFlags Burgees

[![Gem Version](https://img.shields.io/gem/v/usps_flags.svg)](https://rubygems.org/gems/usps_flags-burgees)

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

## License

Actual images generated may be registered trademarks of their
respective squadrons.

This project is released under the
[GPLv3](https://raw.github.com/jfiander/usps-flags/master/LICENSE).
