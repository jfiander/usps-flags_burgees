require 'bundler/setup'
Bundler.setup
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'usps_flags'
require 'usps_flags/burgees'

# The spec for USPSFlags::Burgees contains an example that checks for
# USPSFlags::Errors::UnknownBurgee
RSpec::Expectations.configuration.on_potential_false_positives = :nothing

RSpec.configure do |config|
  config.before(:suite) do
    $tmp_flags_dir = "tmp/flags"

    USPSFlags::Config.new do |c|
      c.flags_dir = $tmp_flags_dir
    end
  end

  config.after(:suite) do
    ::FileUtils.rm_rf("tmp") if ::Dir.exist?("tmp")
    ::FileUtils.rm_rf(USPSFlags::Config.burgees_dir) if ::Dir.exist?(USPSFlags::Config.burgees_dir)
  end
end
