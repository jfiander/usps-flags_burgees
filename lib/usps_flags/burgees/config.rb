# Extension of USPSFlags::Config to allow including custom burgee files.
#
# @private
class USPSFlags::Config
  attr_accessor :burgees_dir

  def initialize
    get_defaults
    get_extension_defaults
    yield self if block_given?
  end

  private
  def get_extension_defaults
    @burgees_dir ||= defined?(::Rails) ? "#{::Rails.root}/app/lib/usps-burgees" : "#{File.dirname(__dir__)}/output"
  end
end
