require 'usps_flags'
require 'usps_flags/burgees/config'
require 'usps_flags/burgees/errors'

class USPSFlags::Burgees
  require 'usps_flags/burgees/builtins'
  require 'usps_flags/burgees/customs'

  def self.available
    USPSFlags::Burgees::Builtins.available + USPSFlags::Burgees::Customs.available
  end

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
