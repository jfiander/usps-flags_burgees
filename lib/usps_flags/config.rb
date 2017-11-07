class USPSFlags::Config
  @@burgees_dir ||= defined?(::Rails) ? "#{::Rails.root}/app/lib/usps_flags-burgees" : "#{File.dirname(__dir__)}/output"

  attr_accessor :burgees_dir

  def initialize
    @burgees_dir = @@burgees_dir
    super
    @@burgees_dir = @burgees_dir
  end
end
