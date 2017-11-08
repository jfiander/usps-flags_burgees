# Extension of USPSFlags::Config to allow including custom burgee files.
#
# @private
class USPSFlags::Config
  @@burgees_dir ||= defined?(::Rails) ? "#{::Rails.root}/app/lib/usps-burgees" : "#{File.dirname(__dir__)}/output"

  attr_accessor :burgees_dir

  alias :parent_initialize :initialize
  def initialize
    @burgees_dir = @@burgees_dir
    parent_initialize do |c|
      c.flags_dir = USPSFlags::Config.flags_dir
      c.reset = USPSFlags::Config.reset
      c.use_larger_tridents = USPSFlags::Config.use_larger_tridents
    end
    yield self if block_given? # This appears to be overwriting the parent variables with defaults
    @@burgees_dir = @burgees_dir
  end

  def self.burgees_dir
    burgees_path = if defined?(::Rails)
      "#{::Rails.root}/app/lib/usps-burgees"
    else
      @@burgees_dir
    end
    ::FileUtils.mkdir_p(burgees_path)
    burgees_path
  end
end
