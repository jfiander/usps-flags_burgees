require 'usps_flags'
require 'usps_flags/burgees/config'
require 'usps_flags/burgees/errors'

# Main class for generating burgees.
class USPSFlags::Burgees
  require 'usps_flags/burgees/builtins'
  require 'usps_flags/burgees/customs'

  # List of available burgees.
  def self.available
    USPSFlags::Burgees::Builtins.available + USPSFlags::Burgees::Customs.available
  end

  # Constructor for generating burgees.
  #
  # @example Generate Birmingham's burgee
  #  burgee = USPSFlags::Burgee.new do |b|
  #    b.type = :birmingham
  #    b.ourfile = "/path/to/svg/output.svg"
  #  end
  #
  #  burgee.svg #=> Generates SVG file at "/path/to/svg/output.svg"
  def initialize
    @squadron = nil
    @outfile = nil
    # @width = 3000
    # @height = 2000
    @title = nil
    @generated_at = Time.now.strftime("%Y%m%d.%H%S%z")
    yield self if block_given?
    @title ||= title(@squadron)
  end

  attr_accessor :squadron
  attr_accessor :outfile
  # attr_accessor :width
  # attr_accessor :height
  attr_accessor :title

  # Generates the constructed file as SVG.
  #
  # @return [String] Returns the SVG file output path, or the svg data if no path was specified.
  def svg
    raise USPSFlags::Errors::UnknownBurgee unless USPSFlags::Burgees.available.include?(@squadron)

    @svg = <<~SVG
      #{USPSFlags::Core.headers(title: @title)}
      #{core(@squadron)}
      #{USPSFlags::Core.footer}
    SVG

    USPSFlags::Helpers.output(@svg, outfile: @outfile)
  end

  private
  def core(burgee)
    if custom?(burgee)
      USPSFlags::Burgees::Customs.get(burgee)
    elsif builtin?(burgee)
      USPSFlags::Burgees::Builtins.get(burgee)
    end
  end

  def custom?(burgee)
    USPSFlags::Burgees::Customs.available.include?(burgee)
  end

  def builtin?(burgee)
    USPSFlags::Burgees::Builtins.available.include?(burgee)
  end

  def title(burgee)
    burgee_string = burgee.to_s
    burgee_title = if burgee_string.match(/_/)
      burgee_string.gsub("_", " ").split(" ").map { |word| word.capitalize }.join(" ") + " Burgee"
    else
      "#{burgee_string.capitalize} Burgee"
    end
  end
end
