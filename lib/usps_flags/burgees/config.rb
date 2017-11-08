# Extension of USPSFlags::Config to allow including custom burgee files.
#
# @private
class USPSFlags::Config
  @@burgees_dir ||= defined?(::Rails) ? "#{::Rails.root}/app/lib/usps-burgees" : "#{File.dirname(__dir__)}/output"

  @@flags_dir ||= USPSFlags::Config.flags_dir
  @@reset ||= USPSFlags::Config.reset
  @@use_larger_tridents ||= USPSFlags::Config.use_larger_tridents

  attr_accessor :burgees_dir

  alias :parent_initialize :initialize
  def initialize
    @burgees_dir = @@burgees_dir
    parent_initialize do |c|
      c.flags_dir = @@flags_dir
      c.reset = @@reset
      c.use_larger_tridents = @@use_larger_tridents
    end
    yield self if block_given?
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
