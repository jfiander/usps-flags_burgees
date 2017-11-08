# Extension of USPSFlags::Config to allow including custom burgee files.
#
# @private
class USPSFlags::Config
  @@burgees_dir ||= defined?(::Rails) ? "#{::Rails.root}/app/lib/usps-burgees" : "#{File.dirname(__dir__)}/output"

  attr_accessor :burgees_dir

  alias :parent_initialize :initialize
  def initialize
    @burgees_dir = @@burgees_dir
    parent_initialize
    yield self if block_given?
    @@burgees_dir = @burgees_dir
  end

  def self.burgees_dir
    @@burgees_dir
  end
end
